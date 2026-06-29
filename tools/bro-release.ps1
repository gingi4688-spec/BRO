<#
  bro-release.ps1 — cut a spine release (clean-build Phase 4, §6A Flow 2 / §9 / OD-5 / OD-6)
  EN: Builds a versioned, hash-verified spine release (release.manifest.json + payload/ + sha256.txt) from the live
      spine dirs (_core, skills, self, roster). CRITICAL, Gev-gated (critical-command-gate + BRO_GEV_APPROVED=1).
      OD-5: a real cut into spine/RELEASES/ is DEFERRED -> use -Sandbox <dir> to TEST the mechanism without touching
      spine/RELEASES/ (which stays empty). A real cut requires a separate explicit Gev command (not the clean build).
  HY: Կառուցում է versioned, hash-verified spine release՝ live spine dir-երից։ CRITICAL, Gev-gated։ OD-5՝ real cut-ը
      spine/RELEASES/-ի մեջ ՀԵՏԱՁԳՎԱԾ է -> -Sandbox-ով TEST արա առանց RELEASES դիպչելու (մնում է դատարկ)։
  Exit: 0 OK/preview · 2 bad args · 3 real cut refused (OD-5 deferral).
#>
param([string]$Version = '', [string]$Sandbox = '', [switch]$Execute)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$broHome = (Get-Location).Path
$spineDirs = @('_core','skills','self','roster')

if (-not $Version) { "bro-release: -Version required (e.g. -Version v0.0.0-test)"; exit 2 }

if ($Sandbox) {
  $dest = Join-Path $Sandbox $Version
  $mode = 'SANDBOX'
} elseif ($Execute) {
  "bro-release: OD-5 - the baseline release cut into spine/RELEASES/ is DEFERRED."
  "  A real cut is a separate, explicit Gev command - NOT part of the clean build."
  "  Use -Sandbox <dir> to TEST the mechanism without touching spine/RELEASES/ (it stays empty)."
  exit 3
} else {
  "bro-release: preview only. Use -Sandbox <dir> to TEST, or (deferred, OD-5) a separate Gev command for a real cut."
  "  spine/RELEASES/ stays EMPTY in the clean build."
  exit 0
}

# 1) file list + per-file sha256 over the live spine
$files = @()
foreach ($d in $spineDirs) {
  if (-not (Test-Path $d)) { continue }
  Get-ChildItem $d -Recurse -File | ForEach-Object {
    $rel = (Resolve-Path $_.FullName).Path.Substring($broHome.Length).TrimStart('\') -replace '\\','/'
    $h = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower()
    $files += [pscustomobject]@{ path = $rel; sha256 = $h }
  }
}
# 2) rollup hash over sorted "path:sha256" lines
$rollupSrc = ($files | Sort-Object path | ForEach-Object { "$($_.path):$($_.sha256)" }) -join "`n"
$sha = [System.Security.Cryptography.SHA256]::Create()
$rollup = ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($rollupSrc))) -replace '-','').ToLower()

# 3) write dest: payload/ + release.manifest.json + sha256.txt
New-Item -ItemType Directory -Force -Path (Join-Path $dest 'payload') | Out-Null
foreach ($d in $spineDirs) { if (Test-Path $d) { Copy-Item $d -Destination (Join-Path $dest 'payload') -Recurse -Force } }
$ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
$manifest = [ordered]@{
  schema_version = 'v1'; version = $Version; created_at = $ts; mode = $mode;
  spine_dirs = $spineDirs; files = $files; rollup_sha256 = $rollup;
  cut_by = 'Bro'; authority = 'Gev-command'; notes = 'mechanism test cut (sandbox); OD-5 keeps spine/RELEASES empty'
}
($manifest | ConvertTo-Json -Depth 6) | Set-Content (Join-Path $dest 'release.manifest.json') -Encoding utf8
$shaLines = @("# release $Version  rollup=$rollup") + ($files | ForEach-Object { "$($_.sha256)  $($_.path)" })
Set-Content (Join-Path $dest 'sha256.txt') -Value $shaLines -Encoding utf8

"bro-release: $mode cut '$Version' -> $dest"
"  files: $($files.Count) · rollup_sha256: $($rollup.Substring(0,16))..."
"  NOTE: SANDBOX cut - spine/RELEASES/ untouched (OD-5)."
exit 0
