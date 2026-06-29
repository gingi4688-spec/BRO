<#
  bro-doctor.ps1 — MINIMAL read-only bootstrap doctor (clean-build Phase 0 scope)
  EN: Verifies the clean SuperBro skeleton + manifest + verify-only authority + _own structure.
      READ-ONLY: writes nothing, changes nothing, moves nothing. Flags only.
  HY: Ստուգում է մաքուր SuperBro skeleton + manifest + verify-only authority + _own structure։
      READ-ONLY: ոչինչ չի գրում/փոխում/տեղափոխում։ Միայն flag։
  Exit: 0=GREEN 1=YELLOW 2=RED 3=CRITICAL. Full audit/drift/skill/spine suite = Phase 2.
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')   # run from BRO_HOME
$script:problems = @(); $script:warn = @()
function Check([bool]$cond, [string]$okmsg, [string]$failmsg, [switch]$Warn) {
  if ($cond) { "  [OK]   $okmsg" }
  elseif ($Warn) { "  [WARN] $failmsg"; $script:warn += $failmsg }
  else { "  [FAIL] $failmsg"; $script:problems += $failmsg }
}
"bro-doctor (Phase 0 minimal) - READ-ONLY"
"BRO_HOME: $((Get-Location).Path)"
""
"[1] Skeleton presence"
$need = @(
  'bro.manifest.json','memory/_own/registry.json','memory/_own/sync-log.md','memory/_own/audit-log.md',
  'memory/_own/release-log.md','memory/_own/failure-registry.md','memory/_own/health-dashboard.md',
  'memory/_own/hook-blocks.md','memory/_own/authority-log.md','memory/_quarantine/.gitkeep',
  'spine/RELEASES/.gitkeep','tools/bro-doctor.ps1','tools/README.md','change-requests/.gitkeep',
  '_before/.gitkeep','logs/.gitkeep'
)
foreach ($f in $need) { Check (Test-Path $f) "$f" "MISSING: $f" }
""
"[2] Manifest valid + required fields"
$mfOk = $false; $mf = $null
try { $mf = Get-Content -Raw 'bro.manifest.json' | ConvertFrom-Json; $mfOk = $true } catch {}
Check $mfOk "bro.manifest.json is valid JSON" "bro.manifest.json INVALID/missing JSON"
if ($mfOk) {
  foreach ($k in @('bro_id','role','project_id','spine_version','memory_scope','authority','status')) {
    Check ($null -ne $mf.$k -and "$($mf.$k)" -ne '') "field $k = $($mf.$k)" "manifest missing field: $k"
  }
  Check ($mf.role -eq 'SuperBro') "role = SuperBro" "role != SuperBro"
  Check ($mf.memory_scope -eq 'own_only') "memory_scope = own_only" "memory_scope != own_only"
}
""
"[3] Authority (verify-only, OD-3)"
$bhOk = $false; $bh = $null
try { $bh = Get-Content -Raw 'bro.home.json' | ConvertFrom-Json; $bhOk = $true } catch {}
Check $bhOk "bro.home.json valid JSON" "bro.home.json INVALID/missing"
if ($bhOk) {
  Check ($bh.authority_status -eq 'current') "authority_status = current" "authority_status != current"
  Check ((($bh.bro_home -replace '/','\').TrimEnd('\')) -ieq ((Get-Location).Path.TrimEnd('\'))) "bro_home matches cwd" "bro_home != cwd (path mismatch -> STOP)"
  Check ($bh.machine_name -ieq $env:COMPUTERNAME) "machine matches" "machine mismatch -> STOP"
}
Check (Test-Path 'memory/_own/secrets/bro-home.verifier.json') "verifier present" "verifier MISSING -> STOP"
""
"[4] _own structure (no stray project content; light Phase-0 check)"
$allowed = @('registry.json','sync-log.md','audit-log.md','release-log.md','failure-registry.md','health-dashboard.md','hook-blocks.md','authority-log.md','cleanup-log.md')
$ownFiles = Get-ChildItem 'memory/_own' -File | Select-Object -ExpandProperty Name
$stray = @($ownFiles | Where-Object { $_ -notin $allowed })
Check ($stray.Count -eq 0) "_own files all known evidence/metadata" "stray files in _own: $($stray -join ', ')"
$ownDirs = Get-ChildItem 'memory/_own' -Directory | Select-Object -ExpandProperty Name
$strayDirs = @($ownDirs | Where-Object { $_ -ne 'secrets' })
Check ($strayDirs.Count -eq 0) "_own dirs = secrets only" "stray dirs in _own: $($strayDirs -join ', ')"
""
"[5] Live spine at root (OD-6) + RELEASES empty (OD-5)"
foreach ($d in @('_core','skills','self','roster')) { Check (Test-Path $d -PathType Container) "live spine dir: $d/" "missing spine dir: $d/" }
$rel = @(Get-ChildItem 'spine/RELEASES' -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne '.gitkeep' })
Check ($rel.Count -eq 0) "spine/RELEASES empty (no cut, OD-5)" "RELEASES not empty (OD-5 violated)"
""
"[6] Phase 1 - Command Palette + Library (read-only)"
$p1files = @('_core/COMMAND_LIBRARY.md','tools/command-library.json','tools/bro-palette.ps1','tools/bro-show-registry.ps1','tools/bro-show-health.ps1')
foreach ($f in $p1files) { Check (Test-Path $f) "$f" "MISSING: $f" }
$libOk = $false; $lib = $null
try { $lib = Get-Content -Raw 'tools/command-library.json' | ConvertFrom-Json; $libOk = $true } catch {}
Check $libOk "command-library.json is valid JSON" "command-library.json INVALID/missing JSON"
if ($libOk) {
  $cmds = @($lib.commands)
  Check ($cmds.Count -ge 5) "library has commands ($($cmds.Count))" "library has too few commands"
  $reqKeys = @('name','category','requires_gev','mode','availability','backing')
  $badSchema = @($cmds | Where-Object { $c = $_; @($reqKeys | Where-Object { $null -eq $c.$_ }).Count -gt 0 })
  Check ($badSchema.Count -eq 0) "every command carries the required schema keys" "schema-incomplete commands: $($badSchema.Count)"
  # read-only live commands must resolve to an existing backing (or 'internal')
  $liveRO = @($cmds | Where-Object { $_.category -eq 'READ-ONLY' -and $_.availability -eq 'CLEAN-BUILD' })
  $unresolved = @($liveRO | Where-Object { $_.backing -ne 'internal' -and -not (Test-Path $_.backing) })
  Check ($unresolved.Count -eq 0) "live read-only commands resolve to a backing script" "unresolved read-only backings: $($unresolved.Count)"
  # no critical command has a live (CLEAN-BUILD) execution path
  $critLive = @($cmds | Where-Object { $_.category -eq 'CRITICAL' -and $_.availability -eq 'CLEAN-BUILD' })
  Check ($critLive.Count -eq 0) "no critical command is live in the clean build (all gated)" "critical commands wrongly live: $($critLive.Count)"
}
""
"[7] Phase 2 - Enforcement + Evidence + Doctor/Audit"
$p2files = @(
  'tools/hooks/forbidden-path-write-guard.ps1','tools/hooks/cross-memory-read-guard.ps1',
  'tools/hooks/critical-command-gate.ps1','tools/hooks/log-append-only-guard.ps1','tools/hooks/preflight-printer.ps1',
  'tools/bro-log.ps1','tools/bro-audit.ps1','tools/bro-health.ps1','tools/bro-spine-check.ps1'
)
foreach ($f in $p2files) { Check (Test-Path $f) "$f" "MISSING: $f" }
$setOk = $false; $set = $null
try { $set = Get-Content -Raw '.claude/settings.json' | ConvertFrom-Json; $setOk = $true } catch {}
Check $setOk ".claude/settings.json is valid JSON" ".claude/settings.json INVALID/missing"
if ($setOk) {
  Check ($null -ne $set.hooks.PreToolUse) "settings.json registers PreToolUse hooks" "no PreToolUse hooks registered"
  Check ($null -ne $set.hooks.SessionStart) "settings.json registers SessionStart hook" "no SessionStart hook registered"
}
Check (Test-Path '.claude/settings.local.json') "settings.local.json preserved (untouched)" "settings.local.json MISSING (must be preserved)"
$crs = @(Get-ChildItem 'change-requests' -File -Filter 'CR-*.md' -ErrorAction SilentlyContinue)
Check ($crs.Count -ge 1) "change-request recorded for hook install ($($crs.Count))" "no change-request file found"
""
"[8] Phase 3 - Registry + Project Bro Template + Rollout Dry-Run"
$p3files = @(
  '_core/PROJECT_BRO_TEMPLATE.md','tools/templates/project-bro/bro.manifest.template.json',
  'tools/templates/project-bro/README.md','tools/templates/project-bro/health.report.template.md',
  'tools/bro-register.ps1','tools/bro-install.ps1','tools/bro-update-spine.ps1','tools/bro-registry-check.ps1'
)
foreach ($f in $p3files) { Check (Test-Path $f) "$f" "MISSING: $f" }
$reg2=$null; $reg2Ok=$false
try { $reg2 = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json; $reg2Ok=$true } catch {}
Check $reg2Ok "registry.json valid JSON" "registry.json INVALID"
if ($reg2Ok) {
  $pc = @($reg2.projects).Count
  Check ($pc -eq 0) "registry EMPTY (clean build: 0 projects)" "registry has $pc entries (clean build expects 0)"
  Check ($null -ne $reg2.entry_schema) "registry entry_schema present" "registry entry_schema missing"
}
# the PHASE-3-DRY rollout commands must have their dry backings present (and stay non-CLEAN-BUILD = gated/dry)
if ($libOk) {
  $dry = @($lib.commands | Where-Object { $_.availability -eq 'PHASE-3-DRY' })
  $dryMissing = @($dry | Where-Object { $_.backing -ne 'GATED' -and -not (Test-Path $_.backing) })
  Check ($dryMissing.Count -eq 0) "PHASE-3-DRY rollout commands have dry backing scripts" "missing dry backings: $($dryMissing.Count)"
}
""
$status = 'GREEN'; $code = 0
if ($script:problems.Count -gt 0) { $status = 'RED'; $code = 2 }
elseif ($script:warn.Count -gt 0) { $status = 'YELLOW'; $code = 1 }
"RESULT: $status  (problems=$($script:problems.Count), warnings=$($script:warn.Count))"
"NOTE: doctor is READ-ONLY - no files changed."
exit $code
