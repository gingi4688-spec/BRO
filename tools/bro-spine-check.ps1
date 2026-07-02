<#
  bro-spine-check.ps1 — READ-ONLY spine integrity check (clean-build Phase 2, §6 / OD-6 / OD-5)
  EN: Verifies the live spine is present at BRO_HOME root dirs (OD-6), key spine content exists, the manifest
      carries a spine_version, and spine/RELEASES is empty (OD-5, no cut). Read-only; writes nothing.
  HY: Ստուգում է live spine-ը root-ում (OD-6), key spine content, manifest spine_version, ու RELEASES դատարկ (OD-5)։
  Exit: 0=GREEN 1=YELLOW 2=RED 3=CRITICAL.
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
$problems = @(); $warn = @()
function Chk([bool]$c,[string]$ok,[string]$bad,[switch]$W){ if($c){"  [OK]   $ok"} elseif($W){"  [WARN] $bad";$script:warn+=$bad} else {"  [FAIL] $bad";$script:problems+=$bad} }

"bro-spine-check - READ-ONLY / միայն կարդալ — spine-ի ամբողջականություն"
"[A] Live spine at BRO_HOME root (OD-6)"
foreach ($d in @('_core','skills','self','roster')) { Chk (Test-Path $d -PathType Container) "live spine dir: $d/" "missing spine dir: $d/" }

"[B] Key spine content present"
foreach ($f in @('_core/laws/00_inviolable.md','_core/laws/05_memory_isolation.md','self/persona.md','skills')) {
  Chk (Test-Path $f) "present: $f" "missing key spine item: $f"
}

"[C] Manifest spine_version"
$mf = $null; try { $mf = Get-Content -Raw 'bro.manifest.json' | ConvertFrom-Json } catch {}
Chk ($null -ne $mf) "manifest readable" "manifest unreadable"
if ($mf) { Chk (("$($mf.spine_version)") -match '^v\d') "spine_version = $($mf.spine_version)" "spine_version missing/odd" }

"[D] RELEASES well-formed"
$relStray = @(Get-ChildItem 'spine/RELEASES' -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne '.gitkeep' })
Chk ($relStray.Count -eq 0) "no stray files in spine/RELEASES" "stray files in RELEASES: $($relStray.Count)"
$relDirsS = @(Get-ChildItem 'spine/RELEASES' -Directory -ErrorAction SilentlyContinue)
$relBadS = @($relDirsS | Where-Object { -not (Test-Path (Join-Path $_.FullName 'release.manifest.json')) })
Chk ($relBadS.Count -eq 0) "RELEASES dirs well-formed ($($relDirsS.Count) release(s))" "malformed release dirs: $($relBadS.Count)"

$status='GREEN'; $code=0
if ($problems.Count -gt 0){$status='RED';$code=2} elseif($warn.Count -gt 0){$status='YELLOW';$code=1}
"RESULT: $status  (problems=$($problems.Count), warnings=$($warn.Count))"
"NOTE / ՆՇՈՒՄ: read-only - no files changed / միայն կարդալ, ոչ մի ֆայլ չի փոխվել։"
exit $code
