<#
  bro-release.ps1 — cut a spine release (Phase 4 + Gate-4, §6A Flow 2 / §9 / OD-6)
  EN: Builds a versioned, hash-verified spine release (release.manifest.json + payload/ + sha256.txt) from the live
      spine dirs (_core, skills, self, roster). CRITICAL, Gev-gated.
      Modes: -Sandbox <dir> = TEST cut into a sandbox; -Execute -Yes (+ BRO_GEV_APPROVED=1) = REAL cut into
      spine/RELEASES/<version>/ (this LIFTS the OD-5 deferral for an explicitly approved cut). Default = preview only.
  HY: Կառուցում է versioned, hash-verified spine release՝ live spine-ից։ CRITICAL, Gev-gated։ -Sandbox = TEST;
      -Execute -Yes + BRO_GEV_APPROVED=1 = REAL cut spine/RELEASES/<version>/ (OD-5 deferral-ը բարձրացված)։
  Exit: 0 ok · 2 bad args · 3 refused (no approval / already cut).
#>
param([string]$Version = '', [string]$Sandbox = '', [switch]$Yes, [switch]$Execute)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$broHome = (Get-Location).Path
$spineDirs = @('_core','skills','self','roster')

if (-not $Version) { "bro-release: -Version required (e.g. -Version v1.0.0)"; exit 2 }

if ($Sandbox) {
  $dest = Join-Path $Sandbox $Version; $mode = 'SANDBOX'
} elseif ($Execute) {
  if (-not $Yes) { "bro-release: REFUSED - real cut requires -Yes."; exit 3 }
  if ($env:BRO_GEV_APPROVED -ne '1') { "bro-release: REFUSED - real cut requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }
  $dest = Join-Path 'spine\RELEASES' $Version; $mode = 'RELEASE'
  if (Test-Path $dest) { "bro-release: REFUSED - $dest already exists (not overwriting)."; exit 3 }
} else {
  "bro-release: preview only. Use -Sandbox <dir> to TEST, or -Execute -Yes (+ BRO_GEV_APPROVED=1) for a real cut."
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
  cut_by = 'Bro'; authority = 'Gev-command'; notes = "spine release cut from the live spine ($($files.Count) files)"
}
($manifest | ConvertTo-Json -Depth 6) | Set-Content (Join-Path $dest 'release.manifest.json') -Encoding utf8
$shaLines = @("# release $Version  rollup=$rollup") + ($files | ForEach-Object { "$($_.sha256)  $($_.path)" })
Set-Content (Join-Path $dest 'sha256.txt') -Value $shaLines -Encoding utf8

"bro-release: $mode cut '$Version' -> $dest"
"  files: $($files.Count) · rollup_sha256: $($rollup.Substring(0,16))..."
if ($mode -eq 'RELEASE') { "  spine/RELEASES/$Version/ created (OD-5 deferral lifted for this approved cut)." }
exit 0
