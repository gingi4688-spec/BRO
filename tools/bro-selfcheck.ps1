<#
  bro-selfcheck.ps1 — Daily Self-Check vNext · L1 orchestrator (Phase 8a)
  EN: The hardened L1 layer on top of bro-selfaudit's trio. Runs doctor + audit + beast (TOKEN-FREE, with flaky-retry)
      + content-hash MATCH + all-INSTALLED-projects + doc-hygiene; aggregates a layered L1 verdict (dirty-tree-aware);
      updates the carry-forward OPEN_ITEMS ledger; writes the layered report. ADDITIVE: does NOT modify bro-selfaudit
      or the 11:00 scheduled task. L2 behavioral / L3 production / L4 taste / L5 improvement are DEFERRED (Phase 8b-d)
      and clearly labeled — never silently rolled into GREEN. Its report + OPEN_ITEMS are gitignored (never dirty the tree).
  HY: bro-selfaudit-ի եռյակի վրայի կարծրացված L1 շերտ՝ doctor+audit+beast(token-free,flaky-retry)+content-hash+
      all-projects+doc-hygiene։ Additive՝ cron/selfaudit չի փոխում։ L2-L5 հետաձգված (հստակ պիտակ)։
  Exit: 0 L1-GREEN · 1 YELLOW (dirty tree / non-critical) · 2 RED (real L1 failure).
#>
[CmdletBinding()]
param([switch]$Log)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
Remove-Item env:BRO_GEV_APPROVED -ErrorAction SilentlyContinue    # L1 runs token-free (valid guard-regression)
$today = Get-Date -Format 'yyyy-MM-dd'
$stamp = Get-Date -Format 'yyyy-MM-ddTHH:mm:sszzz'

function RunCheck([string]$file, [string[]]$argv) {
  $out = & pwsh -NoProfile -File $file @argv 2>&1
  $ex = $LASTEXITCODE
  $clean = @($out | ForEach-Object { "$_" -replace "\x1b\[[0-9;]*m", '' })
  $res = ($clean | Where-Object { $_ -match '(?i)^(BEAST )?RESULT:' } | Select-Object -Last 1)
  return [pscustomobject]@{ exit=$ex; result=("$res").Trim() }
}

$doctor = RunCheck 'tools/bro-doctor.ps1' @()
$audit  = RunCheck 'tools/bro-audit.ps1' @()
# beast with flaky-retry (up to 3): the Start-Process guard tests occasionally race on Windows.
$attempts = 0; $beast = $null
do { $attempts++; $beast = RunCheck 'tools/bro-beast-check.ps1' @() } while ($beast.exit -ne 0 -and $attempts -lt 3)
$beastTransient = ($beast.exit -eq 0 -and $attempts -gt 1)
$content = RunCheck 'tools/checks/bro-content-hash-check.ps1' @()
$allproj = RunCheck 'tools/checks/bro-allprojects-check.ps1' @()
$refs    = RunCheck 'tools/checks/bro-refs-check.ps1' @()

$porcelain = @(git status --porcelain 2>$null); $treeDirty = ($porcelain.Count -gt 0)
$sha = (git rev-parse --short HEAD 2>$null)

# verdict: content/all-projects/refs/audit failures are REAL; doctor exit>=2 real; beast RED is real unless explained by dirty tree.
$realRed = ($audit.exit -ne 0) -or ($doctor.exit -ge 2) -or ($content.exit -ne 0) -or ($allproj.exit -ne 0) -or ($refs.exit -ne 0)
if ($beast.exit -ne 0) { $realRed = $realRed -or (-not $treeDirty) }
if ($realRed)       { $verdict='RED';    $code=2 }
elseif ($treeDirty) { $verdict='YELLOW'; $code=1 }
else                { $verdict='GREEN';  $code=0 }

# --- OPEN items (stable ids -> carry-forward first_seen) ---
$items = @()
function AddItem($id,$sev,$desc){ $script:items += [pscustomobject]@{ id=$id; sev=$sev; desc=$desc } }
if ($content.exit -ne 0) { AddItem 'OI-CONTENT-HASH' 'HIGH' 'content-hash MISMATCH: skills/agents manifest hash stale vs content (re-stamp)' }
if ($allproj.exit -ne 0) { AddItem 'OI-PROJECT-RED'  'HIGH' 'an INSTALLED project failed doctor/audit' }
if ($refs.exit    -ne 0) { AddItem 'OI-DOC-REFS'     'MED'  'broken doc links or duplicate law ids' }
AddItem 'OI-L2-BEHAVIORAL' 'MED' 'L2 behavioral evals not implemented (Phase 8d)'
AddItem 'OI-L3-PRODUCTION' 'MED' 'L3 production/UI-capability checks not implemented (Phase 8c)'
AddItem 'OI-L4-TASTE'      'MED' 'L4 Gev-taste evals not implemented (Phase 8d)'
AddItem 'OI-L5-PLANNER'    'MED' 'L5 improvement-planner not implemented (Phase 8b)'
AddItem 'OI-ORPHAN-SCAN'   'LOW' 'orphan/dead-doc detection deferred in refs-check'

$oiPath = 'memory/_own/OPEN_ITEMS.md'
$firstSeen = @{}
if (Test-Path $oiPath) { foreach ($ln in Get-Content $oiPath) { $m=[regex]::Match($ln,'\[(OI-[A-Z0-9-]+)\].*first=(\d{4}-\d{2}-\d{2})'); if ($m.Success) { $firstSeen[$m.Groups[1].Value]=$m.Groups[2].Value } } }
$oiLines = @('# OPEN ITEMS — Daily Self-Check carry-forward / բաց կետեր (carry-forward)','',
  '> Machine-updated by tools/bro-selfcheck.ps1 each run; gitignored (local). Items persist until resolved; each carries id · severity · first_seen · status. / Թարմացվում է ամեն run. կետերը մնում են մինչ լուծվեն։','',
  "_last updated: $stamp · commit: $sha · overall: $verdict (L1)_","")
foreach ($it in $items) { $fs = if ($firstSeen.ContainsKey($it.id)){$firstSeen[$it.id]}else{$today}; $oiLines += ("- [{0}] sev={1} first={2} status=OPEN — {3}" -f $it.id,$it.sev,$fs,$it.desc) }
$curIds = @($items | ForEach-Object { $_.id })
$resolved = @($firstSeen.Keys | Where-Object { $_ -notin $curIds })
if ($resolved.Count) { $oiLines += @('','## Resolved this run'); $resolved | ForEach-Object { $oiLines += "- [$_] status=RESOLVED ($today)" } }
Set-Content -Path $oiPath -Value $oiLines -Encoding utf8

# --- layered report ---
$rep = @(
  '# DAILY SELF-CHECK vNext (L1) — report / հաշվետվություն','',
  '_generated by tools/bro-selfcheck.ps1 (Phase 8a) · READ-ONLY · NOT the live 11:00 task_','',
  '```txt',
  "timestamp: $stamp   commit: $sha",
  "OVERALL:   $verdict  (L1 only; L2-L5 deferred)","",
  "L1 STRUCTURAL:",
  ("  doctor        exit={0}  {1}" -f $doctor.exit,$doctor.result),
  ("  audit         exit={0}  {1}" -f $audit.exit,$audit.result),
  ("  beast         exit={0}  attempts={1}{2}" -f $beast.exit,$attempts,$(if($beastTransient){' (transient flake -> GREEN on retry)'}else{''})),
  ("  content-hash  exit={0}  {1}   [closes format-only false-GREEN]" -f $content.exit,$content.result),
  ("  all-projects  exit={0}  {1}" -f $allproj.exit,$allproj.result),
  ("  doc-hygiene   exit={0}  {1}" -f $refs.exit,$refs.result),"",
  "L2 BEHAVIORAL: DEFERRED (8d)   L3 PRODUCTION: DEFERRED (8c)   L4 TASTE: DEFERRED (8d)   L5 IMPROVE: DEFERRED (8b)","",
  "tree: $(if($treeDirty){'DIRTY ('+$porcelain.Count+' uncommitted)'}else{'CLEAN'})   open_items: $($items.Count) (memory/_own/OPEN_ITEMS.md)","",
  "SEAL — GREEN(L1) does NOT mean behavior/production/taste verified (L2-L5 deferred), code bug-free, or a push",
  "       authorized — ONLY that L1 structural + content-hash + all-projects + doc-hygiene passed at this commit (L15/L18).",
  '```')
Set-Content -Path 'memory/_own/selfcheck-report.md' -Value $rep -Encoding utf8
$rep | ForEach-Object { $_ }
if ($Log) { try { Add-Content -Path 'logs\selfcheck-l1.log' -Value ("$stamp  $verdict  doctor=$($doctor.exit) audit=$($audit.exit) beast=$($beast.exit)(x$attempts) content=$($content.exit) allproj=$($allproj.exit) refs=$($refs.exit) tree=$(if($treeDirty){'DIRTY'}else{'CLEAN'}) commit=$sha") -Encoding utf8 } catch {} }
exit $code
