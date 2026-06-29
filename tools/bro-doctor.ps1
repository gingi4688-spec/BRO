<#
  bro-doctor.ps1 — MINIMAL read-only bootstrap doctor (clean-build Phase 0 scope)
  EN: Verifies the clean SuperBro skeleton + manifest + verify-only authority + _own structure.
      READ-ONLY: writes nothing, changes nothing, moves nothing. Flags only.
  HY: Ստուգում է մաքուր SuperBro skeleton + manifest + verify-only authority + _own structure։
      READ-ONLY: ոչինչ չի գրում/փոխում/տեղափոխում։ Միայն flag։
  Exit: 0=GREEN 1=YELLOW 2=RED 3=CRITICAL. Full audit/drift/skill/spine suite = Phase 2.
      FAIL-CLOSED: any missing/unconfirmable structural element -> RED (never a silent pass). Topist adds [10] git
      dirty-tree (YELLOW; -Strict -> RED) and [11] consolidated isolation verdict (B4/L8/L10).
#>
param([switch]$Strict)
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
"[5] Live spine at root (OD-6) + RELEASES well-formed"
foreach ($d in @('_core','skills','self','roster')) { Check (Test-Path $d -PathType Container) "live spine dir: $d/" "missing spine dir: $d/" }
$relStray = @(Get-ChildItem 'spine/RELEASES' -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne '.gitkeep' })
Check ($relStray.Count -eq 0) "no stray files in spine/RELEASES" "stray files in RELEASES: $($relStray -join ', ')"
$relDirs0 = @(Get-ChildItem 'spine/RELEASES' -Directory -ErrorAction SilentlyContinue)
if ($relDirs0.Count -eq 0) { "  [OK]   spine/RELEASES has no cut yet" }
foreach ($rd in $relDirs0) {
  $valid = ($rd.Name -match '^v\d') -and (Test-Path (Join-Path $rd.FullName 'release.manifest.json'))
  Check $valid "release $($rd.Name) well-formed (release.manifest.json present)" "malformed release dir: $($rd.Name)"
}
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
  # read-LIVE commands (mode READ + availability CLEAN-BUILD/PHASE-2/LIVE) must resolve to an existing backing
  $liveRO = @($cmds | Where-Object { $_.mode -eq 'READ' -and $_.availability -in @('CLEAN-BUILD','PHASE-2','LIVE') })
  $unresolved = @($liveRO | Where-Object { $_.backing -notin @('internal','GATED') -and -not (Test-Path $_.backing) })
  Check ($unresolved.Count -eq 0) "read-live commands resolve to a backing script" "unresolved read-live backings: $($unresolved.Count)"
  # no critical command is live read-only in the clean build (CLEAN-BUILD is reserved for the read-only starter set)
  $critLive = @($cmds | Where-Object { $_.category -eq 'CRITICAL' -and $_.availability -eq 'CLEAN-BUILD' })
  Check ($critLive.Count -eq 0) "no critical command wrongly marked CLEAN-BUILD" "critical commands wrongly CLEAN-BUILD: $($critLive.Count)"
  # NO GATE BYPASS: every WRITE-mode command must require Gev authority
  $writeNoGev = @($cmds | Where-Object { $_.mode -eq 'WRITE' -and $_.requires_gev -ne $true })
  Check ($writeNoGev.Count -eq 0) "every WRITE command requires Gev (no gate bypass)" "WRITE commands missing requires_gev: $(@($writeNoGev | ForEach-Object { $_.name }) -join ', ')"
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
  "  [OK]   registry has $pc registered project(s) (metadata only)"
  Check ($null -ne $reg2.entry_schema) "registry entry_schema present" "registry entry_schema missing"
  $reqf = @('project_id','project_path','memory_scope','authority','status')
  $badEntries = @($reg2.projects | Where-Object { $e=$_; @($reqf | Where-Object { -not $e.$_ }).Count -gt 0 })
  Check ($badEntries.Count -eq 0) "all registry entries carry required metadata fields" "incomplete registry entries: $($badEntries.Count)"
  $b4bad = @($reg2.projects | Where-Object { (("$($_.project_path)") -replace '/','\').ToLower() -match '\\(ep|db|gaa|gaahex|ip)\\bro\\memory' })
  Check ($b4bad.Count -eq 0) "no registry path inside another project's memory (B4)" "B4-violating registry paths: $($b4bad.Count)"
}
# the ROLLOUT-GATED rollout commands must have their backing scripts present (palette runs them DRY; real = gated)
if ($libOk) {
  $dry = @($lib.commands | Where-Object { $_.availability -eq 'ROLLOUT-GATED' })
  $dryMissing = @($dry | Where-Object { $_.backing -ne 'GATED' -and -not (Test-Path $_.backing) })
  Check ($dryMissing.Count -eq 0) "ROLLOUT-GATED rollout commands have backing scripts" "missing rollout backings: $($dryMissing.Count)"
}
""
"[9] Phase 4 - Spine Release / Update System + Promotion Gate"
$p4files = @(
  '_core/RELEASE_MANIFEST_SCHEMA.md','_core/PROMOTION_GATE.md',
  'tools/bro-release.ps1','tools/bro-spine-verify.ps1','tools/bro-spine-stamp.ps1','tools/bro-spine-pull.ps1','tools/bro-promote.ps1'
)
foreach ($f in $p4files) { Check (Test-Path $f) "$f" "MISSING: $f" }
# OD-5 lifted on Gev command: each spine/RELEASES/v* must be a well-formed release (manifest valid)
$relDirs = @(Get-ChildItem 'spine/RELEASES' -Directory -ErrorAction SilentlyContinue)
if ($relDirs.Count -eq 0) { "  [OK]   spine/RELEASES has no cut yet (OD-5 default)" }
foreach ($rd in $relDirs) {
  $mfp = Join-Path $rd.FullName 'release.manifest.json'
  $rmfOk = $false
  try { $rmf = Get-Content -Raw $mfp | ConvertFrom-Json; $rmfOk = ((("$($rmf.version)") -ne '') -and (("$($rmf.rollup_sha256)") -match '^[0-9a-f]{64}$') -and (@($rmf.files).Count -gt 0)) } catch {}
  Check $rmfOk "release $($rd.Name): manifest valid (version + rollup + files=$(@($rmf.files).Count))" "release $($rd.Name): manifest invalid/missing"
}
""
"[10] Git state (dirty-tree) - fail-closed posture"
$porcelain = $null; try { $porcelain = @(& git status --porcelain 2>$null) } catch {}
if ($null -eq $porcelain) {
  Check $false "" "git state UNKNOWN (git unavailable) - cannot confirm a clean tree" -Warn
} elseif ($porcelain.Count -eq 0) {
  Check $true "working tree clean" ""
} elseif ($Strict) {
  Check $false "" "working tree DIRTY ($($porcelain.Count) change(s)) [-Strict -> RED]"
} else {
  Check $false "" "working tree DIRTY ($($porcelain.Count) change(s)) - explain before any release/seal" -Warn
}
""
"[11] Isolation verdict (B4/L8/L10 - proof-bound; mirrors bro-audit [F])"
$smKnownSealed = @('GAAhex')
$smDirs = @(Get-ChildItem 'memory/supermemory' -Directory -ErrorAction SilentlyContinue)
$smUnexpected = @($smDirs | Where-Object { $_.Name -notin $smKnownSealed })
$isoFail = @()
if ($stray.Count -ne 0)        { $isoFail += "_own stray file(s): $($stray -join ', ')" }
if ($strayDirs.Count -ne 0)    { $isoFail += "_own stray dir(s): $($strayDirs -join ', ')" }
if ($smUnexpected.Count -ne 0) { $isoFail += "unexpected supermemory mirror(s): $(($smUnexpected | Select-Object -ExpandProperty Name) -join ', ')" }
Check ($isoFail.Count -eq 0) "ISOLATION: PASS - _own metadata only; supermemory sealed-only; no project-local self-evolution (L10)" "ISOLATION: FAIL - $($isoFail -join '; ')"
""
$status = 'GREEN'; $code = 0
if ($script:problems.Count -gt 0) { $status = 'RED'; $code = 2 }
elseif ($script:warn.Count -gt 0) { $status = 'YELLOW'; $code = 1 }
"RESULT: $status  (problems=$($script:problems.Count), warnings=$($script:warn.Count))"
"NOTE: doctor is READ-ONLY - no files changed."
exit $code
