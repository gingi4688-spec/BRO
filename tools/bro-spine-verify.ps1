<#
  bro-spine-verify.ps1 — verify a spine release against its manifest (clean-build Phase 4, §6A Flow 2)
  EN: Recomputes sha256 of every payload file and compares to release.manifest.json; recomputes the rollup.
      REJECTS on any mismatch (the gate against blind copy/sync). Read-only on the release. Exit 0 match / 2 mismatch.
  HY: Վերահաշվում է payload-ի ամ. ֆայլի sha256-ը ու համեմատում release.manifest.json-ի հետ + rollup։ ՄԵՐԺՈՒՄ է
      ամ. mismatch-ի դեպքում (պատը կույր copy/sync-ի դեմ)։ Read-only release-ի վրա։ Exit 0 match / 2 mismatch / 3 missing.
#>
param([Parameter(Mandatory=$true)][string]$ReleaseDir)
$ErrorActionPreference = 'Stop'
$mfPath = Join-Path $ReleaseDir 'release.manifest.json'
if (-not (Test-Path $mfPath)) { "bro-spine-verify: release.manifest.json missing in $ReleaseDir"; exit 3 }
$mf = Get-Content -Raw $mfPath | ConvertFrom-Json
$payload = Join-Path $ReleaseDir 'payload'
$mismatch = @(); $missing = @(); $okCount = 0
foreach ($f in @($mf.files)) {
  $p = Join-Path $payload ($f.path -replace '/','\')
  if (-not (Test-Path $p)) { $missing += $f.path; continue }
  $h = (Get-FileHash $p -Algorithm SHA256).Hash.ToLower()
  if ($h -ne $f.sha256) { $mismatch += $f.path } else { $okCount++ }
}
# rollup recompute
$rollupSrc = (@($mf.files) | Sort-Object path | ForEach-Object { "$($_.path):$($_.sha256)" }) -join "`n"
$sha = [System.Security.Cryptography.SHA256]::Create()
$rollup = ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($rollupSrc))) -replace '-','').ToLower()
$rollupOk = ($rollup -eq "$($mf.rollup_sha256)")

"bro-spine-verify - release $($mf.version) @ $ReleaseDir"
"  files matched: $okCount / $(@($mf.files).Count)"
"  mismatches: $($mismatch.Count)   missing: $($missing.Count)   rollup match: $rollupOk"
if ($mismatch.Count -gt 0) { "  MISMATCH: $($mismatch -join ', ')" }
if ($missing.Count -gt 0)  { "  MISSING:  $($missing -join ', ')" }
if ($mismatch.Count -eq 0 -and $missing.Count -eq 0 -and $rollupOk) {
  "RESULT: VERIFIED (all hashes match)"; exit 0
} else {
  "RESULT: REJECTED (hash mismatch -> release not applied)"; exit 2
}
