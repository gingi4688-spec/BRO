<#
  bro-spine-stamp.ps1 — stamp spine_version into a (Project Bro) manifest after a verified pull (Phase 4, §6A Flow 2)
  EN: After a release is VERIFIED, write spine_version = <version> into the target bro.manifest.json. Operates on the
      target manifest only (in the clean build that target is a SANDBOX manifest copy; no Project Bro exists). Exit 0 OK.
  HY: VERIFIED release-ից հետո գրում է spine_version = <version> target bro.manifest.json-ի մեջ։ Մաքուր build-ում
      target-ը SANDBOX manifest copy է (Project Bro չկա)։ Exit 0 OK / 2 bad args/target.
#>
param([Parameter(Mandatory=$true)][string]$ManifestPath, [Parameter(Mandatory=$true)][string]$Version)
$ErrorActionPreference = 'Stop'
if (-not (Test-Path $ManifestPath)) { "bro-spine-stamp: manifest not found: $ManifestPath"; exit 2 }
try { $mf = Get-Content -Raw $ManifestPath | ConvertFrom-Json } catch { "bro-spine-stamp: invalid JSON: $ManifestPath"; exit 2 }
$old = "$($mf.spine_version)"
$mf | Add-Member -NotePropertyName spine_version -NotePropertyValue $Version -Force
$ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
$mf | Add-Member -NotePropertyName last_spine_stamp -NotePropertyValue $ts -Force
($mf | ConvertTo-Json -Depth 8) | Set-Content $ManifestPath -Encoding utf8
"bro-spine-stamp: $ManifestPath  spine_version $old -> $Version  (stamped $ts)"
exit 0
