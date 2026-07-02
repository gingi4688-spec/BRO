<#
  bro-update-spine.ps1 — UPDATE PROJECT BRO SPINE (DRY default · gated real mode, Phase 3 + Gate-3, §6A Flow 2 / B6)
  EN: Default = DRY preview. Real update requires -Execute AND -Yes AND BRO_GEV_APPROVED=1; the project must be
      INSTALLED and the release present. Real update PULLS the release payload into <ProjectPath>\bro\spine,
      VERIFIES every hash, and STAMPS spine_version. A pull is the Bro's own action (never forced, B6).
  HY: Default = DRY preview։ Real update-ը պահանջում է -Execute + -Yes + BRO_GEV_APPROVED=1, INSTALLED project ու
      առկա release։ Pull -> verify ամ. hash -> stamp։ Pull-ը Bro-ի սեփական գործողությունն է (երբեք forced, B6)։
  Exit: 0 ok · 2 inputs · 3 refused · 4 not installed / release missing · 5 verify fail.
#>
param(
  [string]$ProjectId = '',
  [string]$ProjectPath = '',
  [string]$Version = '',
  [switch]$Yes,
  [switch]$Execute
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'

if (-not $ProjectId) { "UPDATE PROJECT BRO SPINE / ԹԱՐՄԱՑՆԵԼ SPINE-Ը - usage: -ProjectId <id> -ProjectPath <abs> -Version v<ver> [-Execute -Yes]"; exit 2 }
$verShown = if ($Version) { $Version } else { '<latest approved release>' }

"UPDATE PROJECT BRO SPINE - " + $(if ($Execute) { 'REAL mode' } else { 'DRY-RUN (preview)' })
"  project: $ProjectId   release: $verShown"
"  plan: pull approved release -> verify hashes (reject on mismatch) -> stamp spine_version (B6: never forced)"

if (-not $Execute) {
  "  DRY-RUN: nothing executed. No release pulled, no hash verified, no manifest stamped."
  exit 0
}

# ---- REAL mode gates ----
if (-not $Yes) { "  REFUSED: real UPDATE requires -Yes."; exit 3 }
if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real UPDATE requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }
if (-not $ProjectPath -or -not $Version) { "  REFUSED: real UPDATE requires -ProjectPath and -Version."; exit 2 }

$broDir = Join-Path $ProjectPath 'bro'
$relDir = Join-Path 'spine\RELEASES' $Version
$relMfPath = Join-Path $relDir 'release.manifest.json'
$reg = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json
$entry = @($reg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId -and "$($_.status)" -eq 'INSTALLED' } | Select-Object -First 1
if (-not $entry) { "  REFUSED: project '$ProjectId' is not INSTALLED."; exit 4 }
if (-not (Test-Path $relMfPath)) { "  REFUSED: release $Version not found."; exit 4 }
if (-not (Test-Path $broDir)) { "  REFUSED: $broDir does not exist."; exit 4 }

$relMf = Get-Content -Raw $relMfPath | ConvertFrom-Json
Copy-Item (Join-Path (Join-Path $relDir 'payload') '*') -Destination (Join-Path $broDir 'spine') -Recurse -Force
$mismatch = @(); $missing = @()
foreach ($f in @($relMf.files)) {
  $tp = Join-Path (Join-Path $broDir 'spine') ($f.path -replace '/','\')
  if (-not (Test-Path $tp)) { $missing += $f.path; continue }
  if ((Get-FileHash $tp -Algorithm SHA256).Hash.ToLower() -ne $f.sha256) { $mismatch += $f.path }
}
if ($mismatch.Count -gt 0 -or $missing.Count -gt 0) { "  VERIFY FAILED: mismatch=$($mismatch.Count) missing=$($missing.Count) -> update REJECTED."; exit 5 }
$mf = Get-Content -Raw (Join-Path $broDir 'bro.manifest.json') | ConvertFrom-Json
$mf.spine_version = $Version
($mf | ConvertTo-Json -Depth 8) | Set-Content (Join-Path $broDir 'bro.manifest.json') -Encoding utf8
"  UPDATED $ProjectId spine -> $Version (VERIFIED $(@($relMf.files).Count) files, stamped)."
exit 0
