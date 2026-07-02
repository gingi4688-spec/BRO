<#
  bro-project-doctor.ps1 — READ-ONLY project-scoped doctor (Beast Gate-1, §7 / §12)
  EN: Verifies one INSTALLED Project Bro against the registry + its pulled spine release. FAIL-CLOSED: an unknown,
      missing, or mismatched state is RED. Reads only metadata + the manifest + spine payload hashes; it checks the
      project's memory/ folder EXISTENCE only (never its sealed content, B4/L8). Registry source defaults to the
      canonical memory/_own/registry.json; -RegistryPath is an EXPLICIT test parameter (no env bypass).
  HY: Ստուգում է մեկ INSTALLED Project Bro-ն registry-ի + pulled spine release-ի դեմ։ FAIL-CLOSED՝ unknown/missing/
      mismatch = RED։ Կարդում է միայն metadata + manifest + spine hash; project-ի memory/-ի միայն ԳՈՅՈՒԹՅՈՒՆԸ (ոչ
      content, B4/L8)։ Registry-ն default canonical; -RegistryPath = explicit test param (ոչ env bypass)։
  Exit: 0=GREEN 1=YELLOW 2=RED.
#>
param(
  [Parameter(Mandatory=$true)][string]$ProjectId,
  [string]$RegistryPath = '',
  [switch]$AllowMirror
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
$problems = @(); $warn = @()
function Chk([bool]$c,[string]$ok,[string]$bad,[switch]$W){ if($c){"  [OK]   $ok"} elseif($W){"  [WARN] $bad";$script:warn+=$bad} else {"  [FAIL] $bad";$script:problems+=$bad} }

"bro-project-doctor - READ-ONLY / միայն կարդալ - project: $ProjectId"
$regPath = if ($RegistryPath) { $RegistryPath } else { 'memory/_own/registry.json' }

# registry entry (fail-closed: must exist)
$entry = $null
try { $reg = Get-Content -Raw $regPath | ConvertFrom-Json; $entry = @($reg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId } | Select-Object -First 1 } catch {}
Chk ($null -ne $entry) "registry entry for '$ProjectId' found" "no registry entry for '$ProjectId' (fail-closed RED)"
if ($null -eq $entry) {
  "RESULT: RED  (problems=$($problems.Count), warnings=$($warn.Count))"; exit 2
}

$ppath = "$($entry.project_path)"
$broDir = Join-Path $ppath 'bro'
$expScope = "$($entry.memory_scope)"
$expVer = "$($entry.spine_version_expected)"

"[A] project bro skeleton"
Chk (Test-Path $broDir -PathType Container) "bro/ folder exists ($broDir)" "bro/ folder MISSING"
Chk (Test-Path (Join-Path $broDir 'memory') -PathType Container) "memory/ folder exists (scoped; content not read)" "memory/ folder MISSING"
Chk (Test-Path (Join-Path $broDir 'logs') -PathType Container) "logs/ folder exists" "logs/ folder MISSING"
Chk (Test-Path (Join-Path $broDir 'spine') -PathType Container) "spine/ folder exists" "spine/ folder MISSING"
$healthPath = Join-Path $broDir 'health.report.md'
Chk (Test-Path $healthPath) "health.report.md exists" "health.report.md MISSING"

"[B] manifest validity + registry match (fail-closed)"
$mf = $null; $mfOk = $false
try { $mf = Get-Content -Raw (Join-Path $broDir 'bro.manifest.json') | ConvertFrom-Json; $mfOk = $true } catch {}
Chk $mfOk "bro.manifest.json valid JSON" "bro.manifest.json MISSING/invalid"
if ($mfOk) {
  Chk ("$($mf.project_id)" -eq $ProjectId) "manifest project_id = $ProjectId (matches registry)" "project_id mismatch: $($mf.project_id)"
  Chk ("$($mf.memory_scope)" -eq $expScope) "memory_scope = $expScope" "memory_scope mismatch: $($mf.memory_scope) (expected $expScope)"
  Chk ("$($mf.authority)" -eq 'ProjectBro') "authority = ProjectBro" "authority mismatch: $($mf.authority)"
  Chk ("$($mf.status)" -eq 'INSTALLED') "status = INSTALLED" "status mismatch: $($mf.status)"
  Chk ("$($mf.spine_version)" -eq $expVer) "spine_version = $expVer (matches registry expected)" "spine_version mismatch: $($mf.spine_version) (expected $expVer)"
  Chk ("$($entry.status)" -eq 'INSTALLED') "registry status = INSTALLED" "registry status not INSTALLED: $($entry.status)"
}

"[C] spine payload hash verify against release manifest"
$relMfPath = Join-Path (Join-Path 'spine\RELEASES' $expVer) 'release.manifest.json'
if (-not (Test-Path $relMfPath)) {
  Chk $false "" "release manifest for $expVer not found at $relMfPath (cannot verify spine)"
} else {
  $relMf = Get-Content -Raw $relMfPath | ConvertFrom-Json
  $ok=0; $bad=0
  foreach ($e in @($relMf.files)) {
    $tp = Join-Path (Join-Path $broDir 'spine') ("$($e.path)" -replace '/','\')
    if ((Test-Path $tp) -and ((Get-FileHash $tp -Algorithm SHA256).Hash.ToLower() -eq "$($e.sha256)")) { $ok++ } else { $bad++ }
  }
  Chk ($bad -eq 0) "spine payload VERIFIED ($ok/$(@($relMf.files).Count) hashes match)" "spine hash MISMATCH/missing: $bad of $(@($relMf.files).Count)"
}

"[D] isolation / boundary"
$smProj = Join-Path 'memory/supermemory' $ProjectId
$hasMirror = Test-Path $smProj
if ($AllowMirror) { Chk $true "supermemory mirror check skipped (-AllowMirror)" "" }
else { Chk (-not $hasMirror) "no supermemory mirror for $ProjectId (none expected)" "unexpected supermemory mirror: $smProj" }

"[E] no project-local self-evolution (L10 - enforcement is SuperBro-authored only)"
$projHooks = Join-Path $broDir 'tools\hooks'
$tmplHooks = 'tools/templates/project-bro/tools/hooks'
if (-not (Test-Path $projHooks)) {
  Chk $true "no local enforcement present (consumer; governed delivery pending) - NOT self-evolved" ""
} else {
  $tmplFiles = @{}
  foreach ($f in Get-ChildItem $tmplHooks -File -Filter *.ps1 -ErrorAction SilentlyContinue) { $tmplFiles[$f.Name.ToLower()] = (Get-FileHash $f.FullName -Algorithm SHA256).Hash.ToLower() }
  $rogue = @(); $modified = @(); $installedNames = @()
  foreach ($f in Get-ChildItem $projHooks -File -Filter *.ps1 -ErrorAction SilentlyContinue) {
    $n = $f.Name.ToLower(); $installedNames += $n
    if (-not $tmplFiles.ContainsKey($n)) { $rogue += $f.Name }
    elseif ((Get-FileHash $f.FullName -Algorithm SHA256).Hash.ToLower() -ne $tmplFiles[$n]) { $modified += $f.Name }
  }
  Chk ($rogue.Count -eq 0) "no project-authored hooks (all are SuperBro-template originals)" "PROJECT-AUTHORED hook(s) = L10 self-evolution VIOLATION: $($rogue -join ', ')"
  Chk ($modified.Count -eq 0) "no modified governed hooks (template hashes match)" "MODIFIED governed hook(s) = L10 self-evolution VIOLATION: $($modified -join ', ')"
  $behind = @($tmplFiles.Keys | Where-Object { $_ -notin $installedNames })
  if ($behind.Count -gt 0) { "  [INFO] $($behind.Count) template hook(s) not yet delivered (governed update available, not a fault): $($behind -join ', ')" }
}

$status='GREEN'; $code=0
if ($problems.Count -gt 0){$status='RED';$code=2} elseif($warn.Count -gt 0){$status='YELLOW';$code=1}
"RESULT: $status  (problems=$($problems.Count), warnings=$($warn.Count))"
"NOTE / ՆՇՈՒՄ: read-only - no files changed; project sealed memory CONTENT never read / միայն կարդալ, project-ի կնքված memory-ի CONTENT-ը երբեք չի կարդացվում։"
exit $code
