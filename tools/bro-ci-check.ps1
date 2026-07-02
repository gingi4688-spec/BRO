<#
  bro-ci-check.ps1 — CI-safe integrity check (repo-only) for GitHub Actions on every push.
  EN: Runs the checks that need ONLY the checked-out repo — NO machine-local bro.home.json, NO project-folder reads,
      NO scheduled-task/registry-machine state. Verifies: JSON validity · spine dirs + law files present ·
      command-library schema (no gate bypass) · latest release hash integrity · no duplicate skill scripts · L10.
      This is the server-side belt-and-suspenders: even if a local check is skipped, GitHub enforces integrity.
  HY: Վազեցնում է միայն checkout արած repo-ից կախված check-երը (ոչ bro.home.json, ոչ project reads)։ JSON validity ·
      spine dirs + laws · command-library schema · release hash · no-duplicate-skills · L10։ Server-side belt-and-suspenders։
  Exit: 0 GREEN · 1 problem(s).
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$script:problems = 0
function Chk($ok, $okMsg, $failMsg) { if ($ok) { "  [OK]   $okMsg" } else { "  [FAIL] $failMsg"; $script:problems++ } }

"bro-ci-check (repo-only integrity)"
""
"[1] JSON validity"
foreach ($j in @('bro.manifest.json','memory/_own/registry.json','tools/command-library.json')) {
  $ok = $false; try { if (Test-Path $j) { Get-Content -Raw $j | ConvertFrom-Json | Out-Null; $ok = $true } } catch {}
  Chk $ok "valid JSON: $j" "INVALID/missing JSON: $j"
}

"[2] Spine dirs + inviolable law files present"
foreach ($d in @('_core','skills','self','roster')) { Chk (Test-Path $d -PathType Container) "spine dir: $d/" "missing spine dir: $d/" }
foreach ($l in @('00_inviolable','01_covenant','02_architecture','03_data','04_security','05_memory_isolation','06_tokens')) {
  Chk (Test-Path "_core/laws/$l.md") "law: $l.md" "missing law file: $l.md"
}

"[3] Command-library schema (no gate bypass)"
$lib = $null; try { $lib = Get-Content -Raw 'tools/command-library.json' | ConvertFrom-Json } catch {}
if ($lib) {
  $cmds = @($lib.commands)
  $reqKeys = @('name','category','requires_gev','mode','availability','backing')
  $badSchema = @($cmds | Where-Object { $c = $_; @($reqKeys | Where-Object { $null -eq $c.$_ }).Count -gt 0 })
  Chk ($badSchema.Count -eq 0) "every command carries the required schema keys" "schema-incomplete commands: $($badSchema.Count)"
  $critClean = @($cmds | Where-Object { $_.category -eq 'CRITICAL' -and $_.availability -eq 'CLEAN-BUILD' })
  Chk ($critClean.Count -eq 0) "no critical command wrongly CLEAN-BUILD" "critical CLEAN-BUILD: $($critClean.Count)"
  $writeNoGev = @($cmds | Where-Object { $_.mode -eq 'WRITE' -and $_.requires_gev -ne $true })
  Chk ($writeNoGev.Count -eq 0) "every WRITE command requires Gev (no gate bypass)" "WRITE missing requires_gev: $(@($writeNoGev | ForEach-Object { $_.name }) -join ', ')"
} else { Chk $false "command-library.json parsed" "command-library.json unreadable" }

"[4] Latest release hash integrity"
$rels = @(Get-ChildItem 'spine/RELEASES' -Directory -ErrorAction SilentlyContinue | Where-Object { Test-Path (Join-Path $_.FullName 'release.manifest.json') } | Sort-Object Name)
if ($rels.Count) {
  $latest = $rels[-1].Name
  & pwsh -NoProfile -File 'tools/bro-spine-verify.ps1' -ReleaseDir "spine/RELEASES/$latest" *> $null
  Chk ($LASTEXITCODE -eq 0) "release $latest hash-verified" "release $latest verify FAILED (exit $LASTEXITCODE)"
} else { Chk $false "at least one well-formed release present" "no releases found" }

"[5] No duplicate skill scripts + L10 present"
$dup = @(Get-ChildItem 'skills' -Recurse -File -Include '*-v2.*','*-copy.*','*-new.*','*-old.*' -ErrorAction SilentlyContinue)
Chk ($dup.Count -eq 0) "no duplicate skill scripts (-v2/-copy/-new/-old)" "duplicate-suffixed skill files: $($dup.Count)"
$l10 = $false; try { $l10 = ((Get-Content -Raw '_core/laws/02_architecture.md') -match 'L10') } catch {}
Chk $l10 "law L10 present (SuperBro-only strengthening)" "L10 missing from 02_architecture.md"

""
if ($script:problems -eq 0) { "CI RESULT: GREEN (repo-only integrity passed)"; exit 0 }
else { "CI RESULT: RED ($($script:problems) problem(s))"; exit 1 }
