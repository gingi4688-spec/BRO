<#
  bro-spine-pull.ps1 — pull an approved spine release into a target spine dir, then verify (Phase 4, §6A Flow 2 / B6)
  EN: Copies a release payload into the target spine dir and runs bro-spine-verify. A pull is the BRO's own action
      (availability signal only; never forced, B6). In the clean build no Project Bro exists, so the target is a
      SANDBOX dir (mechanism test). Stamping is a separate step (bro-spine-stamp) done only on VERIFIED.
  HY: Պատճենում է release payload-ը target spine dir-ի մեջ ու վազեցնում bro-spine-verify։ Pull-ը Bro-ի սեփական
      գործողությունն է (availability signal; երբեք forced, B6)։ Մաքուր build-ում target-ը SANDBOX է։ Exit per verify.
#>
param([Parameter(Mandatory=$true)][string]$ReleaseDir, [Parameter(Mandatory=$true)][string]$TargetSpineDir)
$ErrorActionPreference = 'Stop'
$payload = Join-Path $ReleaseDir 'payload'
if (-not (Test-Path $payload)) { "bro-spine-pull: payload missing in $ReleaseDir"; exit 3 }
New-Item -ItemType Directory -Force -Path $TargetSpineDir | Out-Null
Copy-Item (Join-Path $payload '*') -Destination $TargetSpineDir -Recurse -Force
"bro-spine-pull: pulled payload -> $TargetSpineDir ; verifying against manifest..."
& pwsh -NoProfile -File (Join-Path $PSScriptRoot 'bro-spine-verify.ps1') -ReleaseDir $ReleaseDir
exit $LASTEXITCODE
