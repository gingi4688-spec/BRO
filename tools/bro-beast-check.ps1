<#
  bro-beast-check.ps1 — BEAST regression matrix: one runner for the whole factory (Beast Gate-5)
  EN: Runs every critical check and aggregates a single GREEN/YELLOW/RED verdict with evidence. Components:
      git state · SuperBro doctor · audit · spine-check · registry-check · project doctor EP · project audit EP ·
      release verify (v1.0.0) · guard regression · isolation proof · no-secret/pre-push dry check ·
      law L10 · no-duplicate-skills · no-Project-Bro-self-evolution · idempotency (topist additions).
      Read-only except that the live guard regression appends append-only hook-block evidence (by design).
      Exit: 0=GREEN (all pass) · 2=RED (any fail).
  HY: Մեկ runner ամ. critical check-ի համար՝ aggregate GREEN/YELLOW/RED evidence-ով։ Read-only, բացի որ guard
      regression-ը append է անում append-only hook-block evidence (by design)։ Exit՝ 0=GREEN · 2=RED։
#>
param([string]$ProjectId = 'EP')
$ErrorActionPreference = 'Continue'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$rows = @()
function Rec($name,$ok,$ev){ $script:rows += [pscustomobject]@{ name=$name; ok=[bool]$ok; ev=$ev } }
function ScriptOk($name,$file,$argv){ & pwsh -NoProfile -File $file @argv *> $null; Rec $name ($LASTEXITCODE -eq 0) "exit=$LASTEXITCODE" }

"bro-beast-check - factory regression matrix"
"================================================================"

# 1) git state
$head=(git rev-parse HEAD).Trim(); $orig=(git rev-parse origin/main).Trim(); $dirty=@(git status --porcelain)
$ahead=(git rev-list --count origin/main..HEAD).Trim()
Rec 'git state (tree clean + branch main)' (((@($dirty).Count -eq 0)) -and ((git rev-parse --abbrev-ref HEAD).Trim() -eq 'main')) "HEAD=$($head.Substring(0,7)) origin=$($orig.Substring(0,7)) ahead=$ahead tree=$(if(@($dirty).Count){'dirty'}else{'clean'})"

# 2-7) SuperBro + project scripts
ScriptOk 'SuperBro doctor'   'tools/bro-doctor.ps1' @()
ScriptOk 'SuperBro audit'    'tools/bro-audit.ps1' @()
ScriptOk 'spine-check'       'tools/bro-spine-check.ps1' @()
ScriptOk 'registry-check'    'tools/bro-registry-check.ps1' @()
ScriptOk "project doctor $ProjectId" 'tools/bro-project-doctor.ps1' @('-ProjectId',$ProjectId)
ScriptOk "project audit $ProjectId"  'tools/bro-project-audit.ps1' @('-ProjectId',$ProjectId)

# 8) release verify
& pwsh -NoProfile -File 'tools/bro-spine-verify.ps1' -ReleaseDir 'spine/RELEASES/v1.0.0' *> $null
Rec 'release v1.0.0 verify' ($LASTEXITCODE -eq 0) "exit=$LASTEXITCODE"

# 9-10) guard regression + isolation (live, via cmd stdin redirect)
$tmp = Join-Path $env:TEMP ('beast-' + (New-Guid).ToString('N').Substring(0,8))
New-Item -ItemType Directory -Force $tmp | Out-Null
function PL($o,$n){ ($o | ConvertTo-Json -Depth 6 -Compress) | Set-Content (Join-Path $tmp $n) -Encoding utf8; return (Join-Path $tmp $n) }
function GX($hook,$payload,$extraEnv){
  # run a guard with the payload file as stdin (reliable via Start-Process -RedirectStandardInput).
  # test-mode redirects block evidence to a temp file so the canonical hook-blocks.md stays clean.
  $env:BRO_TEST_MODE = '1'; $env:BRO_HOOKBLOCKS_PATH = (Join-Path $tmp 'hb.md')
  if ($extraEnv) { foreach($k in $extraEnv.Keys){ Set-Item "env:$k" $extraEnv[$k] } }
  $o = Join-Path $tmp 'o.txt'; $e = Join-Path $tmp 'e.txt'
  $proc = Start-Process -FilePath 'pwsh' -ArgumentList @('-NoProfile','-File',$hook) -RedirectStandardInput $payload -RedirectStandardOutput $o -RedirectStandardError $e -Wait -PassThru -WindowStyle Hidden
  $code = $proc.ExitCode
  Remove-Item env:BRO_TEST_MODE,env:BRO_HOOKBLOCKS_PATH -ErrorAction SilentlyContinue
  if ($extraEnv) { foreach($k in $extraEnv.Keys){ Remove-Item "env:$k" -ErrorAction SilentlyContinue } }
  return $code
}
$WG='tools/hooks/forbidden-path-write-guard.ps1'; $RG='tools/hooks/cross-memory-read-guard.ps1'; $CG='tools/hooks/critical-command-gate.ps1'; $LG='tools/hooks/log-append-only-guard.ps1'
$pWriteDB = PL @{tool_name='Write';tool_input=@{file_path='C:\Users\Admin\Desktop\DB\bro\x.md';content='x'}} 'wdb.json'
$pWriteOk = PL @{tool_name='Write';tool_input=@{file_path='C:\Users\Admin\Desktop\Bro\tools\x.ps1';content='x'}} 'wok.json'
$pLogEdit = PL @{tool_name='Edit';tool_input=@{file_path='C:\Users\Admin\Desktop\Bro\memory\_own\audit-log.md'}} 'le.json'
$pPush    = PL @{tool_name='Bash';tool_input=@{command='git push origin main'}} 'push.json'
$pPushOk  = PL @{tool_name='Bash';tool_input=@{command='BRO_GEV_APPROVED=1 git push origin main'}} 'pushok.json'
$pReadEP  = PL @{tool_name='Read';tool_input=@{file_path='C:\Users\Admin\Desktop\EP\bro\memory\MEMORY.md'}} 'rep.json'

Rec 'guard: cross-project write BLOCK'  ((GX $WG $pWriteDB) -eq 2) 'DB write'
Rec 'guard: in-home write ALLOW'        ((GX $WG $pWriteOk) -eq 0) 'tools write'
Rec 'guard: evidence-log edit BLOCK'    ((GX $LG $pLogEdit) -eq 2) 'audit-log edit'
Rec 'guard: unapproved push BLOCK'      ((GX $CG $pPush)    -eq 2) 'git push'
Rec 'guard: approved push ALLOW'        ((GX $CG $pPushOk)  -eq 0) 'git push + token'
Rec 'isolation: SuperBro read EP mem BLOCK' ((GX $RG $pReadEP) -eq 2) 'own_only scope'
Rec 'isolation: EP-scope read own ALLOW' ((GX $RG $pReadEP @{BRO_TEST_MODE='1';BRO_SCOPE='EP_only'}) -eq 0) 'test-mode EP scope'
try { Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue } catch {}

# 11) no-secret / pre-push dry check (unpushed diff)
$diffFiles = @(git diff --name-only origin/main..HEAD)
$secretHit = @($diffFiles | Where-Object { $_ -match '(?i)bro\.home\.json|verifier|secrets/' })
$epPathHit = @($diffFiles | Where-Object { $_ -match '(?i)(^|/)(EP|DB|GAA|GAAhex|IP)/' })
Rec 'no secret files in unpushed diff' ($secretHit.Count -eq 0) "secret-files=$($secretHit.Count)"
Rec 'no project-folder paths in diff'  ($epPathHit.Count -eq 0) "project-paths=$($epPathHit.Count) (EP/bro is outside repo)"

# 12) law L10 present (SuperBro-only strengthening)
$l10txt = ''; try { $l10txt = Get-Content -Raw '_core/laws/02_architecture.md' } catch {}
$l10ok = ($l10txt -match '\bL10\b') -and ($l10txt -match '(?i)only superbro strengthens')
Rec 'law L10 present (SuperBro-only strengthening)' $l10ok 'architecture L10'

# 13) no duplicate skill scripts (no -v2/-copy/-new/-old/-bak siblings)
$dupSkill = @(Get-ChildItem 'tools' -File -Filter '*.ps1' -ErrorAction SilentlyContinue | Where-Object { $_.BaseName -match '(?i)(-v\d+|-copy|-new|-old|-bak|-2)$' })
Rec 'no duplicate skill scripts (no -v2/-copy/-new/-old)' ($dupSkill.Count -eq 0) "dup-suffixed=$($dupSkill.Count)"

# 14) no Project Bro self-evolution: an INSTALLED project may carry ONLY SuperBro-template hooks (L10)
$selfEvo = @()
try {
  $regB = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json
  $tmplNames = @(Get-ChildItem 'tools/templates/project-bro/tools/hooks' -File -Filter *.ps1 -ErrorAction SilentlyContinue | ForEach-Object { $_.Name.ToLower() })
  foreach ($p in @($regB.projects | Where-Object { "$($_.status)" -eq 'INSTALLED' })) {
    $ph = Join-Path "$($p.project_path)" 'bro\tools\hooks'
    if (Test-Path $ph) { foreach ($f in Get-ChildItem $ph -File -Filter *.ps1 -ErrorAction SilentlyContinue) { if ($f.Name.ToLower() -notin $tmplNames) { $selfEvo += "$($p.project_id):$($f.Name)" } } }
  }
} catch {}
Rec 'no Project Bro self-evolution (only template hooks)' ($selfEvo.Count -eq 0) "rogue-hooks=$($selfEvo.Count)"

# 15) idempotency: read-only checks mutate no tracked file (run twice, compare working tree)
$treeBefore = (@(git status --porcelain) -join "`n")
& pwsh -NoProfile -File 'tools/bro-doctor.ps1' *> $null
& pwsh -NoProfile -File 'tools/bro-audit.ps1' *> $null
& pwsh -NoProfile -File 'tools/bro-registry-check.ps1' *> $null
$treeAfter = (@(git status --porcelain) -join "`n")
Rec 'idempotency: read-only checks mutate no tracked file' ($treeBefore -eq $treeAfter) 'doctor+audit+registry-check re-run'

# render + verdict
""
foreach($r in $rows){ "{0}  {1,-40}  {2}" -f $(if($r.ok){'[OK]  '}else{'[FAIL]'}), $r.name, $r.ev }
$fails = @($rows | Where-Object { -not $_.ok })
""
$status = if ($fails.Count -eq 0) { 'GREEN' } else { 'RED' }
"BEAST RESULT: $status  ($($rows.Count) checks, $($fails.Count) failed)"
if ($fails.Count -gt 0) { "FAILED: $((($fails|ForEach-Object{$_.name}) -join '; '))" }
exit $(if($fails.Count -eq 0){0}else{2})
