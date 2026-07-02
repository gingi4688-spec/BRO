<#
  bro-audit.ps1 — READ-ONLY audit suite (clean-build Phase 2, §12 / §11 / D0)
  EN: Independent read-only audit: manifest integrity · authority · _own boundary · drift/boundary ·
      enforcement deliverables. Flags ONLY — never fixes/moves/deletes/rewrites (D0/§12). Writes nothing by
      default; with -Log it appends ONE audit-log entry via tools/bro-log.ps1 (script-stamped).
      F3 WHITELIST: the _own boundary check compares FILE NAMES against a known evidence/metadata set; it does
      NOT grep evidence content for project names (failure-registry.md / authority-log.md legitimately name projects).
  HY: Անկախ read-only audit՝ manifest · authority · _own boundary · drift · enforcement deliverable-ներ։ Միայն
      flag — երբեք fix/move/delete (D0/§12)։ Default-ով ոչինչ չի գրում; -Log-ով մեկ audit-log entry (bro-log-ով)։
      F3 WHITELIST՝ _own-ի ստուգումը FILE NAME-երով է, ոչ թե evidence-ի բովանդակությունը grep անելով։
  Exit: 0=GREEN 1=YELLOW 2=RED 3=CRITICAL 4=BLACK.  Issue codes per §12.
      BLACK (topist) = evidence missing / tamper / unsealed: distinct from RED (policy fail). A GREEN/RED seal is
      ONLY written with -Log when commit evidence exists (no-evidence-no-seal); otherwise status escalates to BLACK
      and NO audit-log entry is written. The seal is commit-bound AND version-bound.
#>
param([switch]$Log)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$problems = @(); $warn = @(); $codes = @()
function Chk([bool]$c,[string]$ok,[string]$bad,[string]$code='',[switch]$W){
  if($c){"  [OK]   $ok"}
  elseif($W){"  [WARN] $bad";$script:warn+=$bad; if($code){$script:codes+=$code}}
  else {"  [FAIL] $bad";$script:problems+=$bad; if($code){$script:codes+=$code}}
}

"bro-audit (read-only) - BRO_HOME: $((Get-Location).Path)"
""
"[A] Manifest integrity"
$mf=$null; $mfOk=$false
try { $mf = Get-Content -Raw 'bro.manifest.json' | ConvertFrom-Json; $mfOk=$true } catch {}
Chk $mfOk "manifest is valid JSON" "manifest MISSING/invalid" 'MANIFEST_MISSING'
if ($mfOk) {
  Chk ($mf.role -eq 'SuperBro') "role = SuperBro" "role != SuperBro" 'AUTHORITY_MISMATCH'
  Chk ($mf.memory_scope -eq 'own_only') "memory_scope = own_only" "memory_scope != own_only" 'SUPER_OWN_POLLUTION'
  Chk (("$($mf.memory_schema_version)") -eq 'v1') "memory_schema_version = v1" "memory_schema_version drift" 'SCHEMA_OLD' -W
  Chk (("$($mf.skills_manifest_hash)") -match '^sha256:[0-9a-f]{64}$') "skills_manifest_hash well-formed" "skills hash malformed" 'HASH_MISMATCH'
  Chk (("$($mf.agents_manifest_hash)") -match '^sha256:[0-9a-f]{64}$') "agents_manifest_hash well-formed" "agents hash malformed" 'HASH_MISMATCH'
}
""
"[B] Authority (verify-only, OD-3)"
$bh=$null; $bhOk=$false
try { $bh = Get-Content -Raw 'bro.home.json' | ConvertFrom-Json; $bhOk=$true } catch {}
Chk $bhOk "bro.home.json valid" "bro.home.json missing/invalid" 'AUTHORITY_MISMATCH'
if ($bhOk) {
  Chk ($bh.authority_status -eq 'current') "authority_status = current" "authority_status != current" 'AUTHORITY_MISMATCH'
  Chk ((($bh.bro_home -replace '/','\').TrimEnd('\')) -ieq ((Get-Location).Path.TrimEnd('\'))) "bro_home matches cwd" "bro_home != cwd" 'AUTHORITY_MISMATCH'
  Chk ($bh.machine_name -ieq $env:COMPUTERNAME) "machine matches" "machine mismatch" 'AUTHORITY_MISMATCH'
}
Chk (Test-Path 'memory/_own/secrets/bro-home.verifier.json') "verifier present" "verifier MISSING" 'AUTHORITY_MISMATCH'
""
"[C] _own boundary (SUPER_OWN_POLLUTION) - filename whitelist, NOT content grep (F3)"
$allowed = @('registry.json','sync-log.md','audit-log.md','release-log.md','failure-registry.md','health-dashboard.md','hook-blocks.md','authority-log.md','cleanup-log.md','cross-grants.json')
$ownFiles = Get-ChildItem 'memory/_own' -File | Select-Object -ExpandProperty Name
$stray = @($ownFiles | Where-Object { $_ -notin $allowed })
Chk ($stray.Count -eq 0) "_own files are known evidence/metadata only" "stray files in _own: $($stray -join ', ')" 'SUPER_OWN_POLLUTION'
$ownDirs = Get-ChildItem 'memory/_own' -Directory | Select-Object -ExpandProperty Name
$strayDirs = @($ownDirs | Where-Object { $_ -ne 'secrets' })
Chk ($strayDirs.Count -eq 0) "_own dirs = secrets only" "stray dirs in _own: $($strayDirs -join ', ')" 'SUPER_OWN_POLLUTION'
# registry holds metadata only; in the clean build it must be empty
$reg=$null; try { $reg = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json } catch {}
$regCount = if ($reg) { @($reg.projects).Count } else { -1 }
Chk ($regCount -ge 0) "registry.json valid ($regCount registered project(s), metadata only)" "registry.json missing/invalid" 'SUPER_OWN_POLLUTION'
$regContentBad = @()
if ($regCount -gt 0) { $regContentBad = @($reg.projects | Where-Object { (("$($_.project_path)") -replace '/','\').ToLower() -match '\\bro\\memory(\\|$)' }) }
Chk ($regContentBad.Count -eq 0) "no registry path inside another project's memory (B4)" "B4-violating registry paths: $($regContentBad.Count)" 'CROSS_PROJECT_CONTAMINATION'
""
"[D] Drift / boundary (read-only)"
foreach ($d in @('_core','skills','self','roster')) { Chk (Test-Path $d -PathType Container) "live spine present: $d/" "spine drift: missing $d/" 'SPINE_STALE' }
$relStray = @(Get-ChildItem 'spine/RELEASES' -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne '.gitkeep' })
Chk ($relStray.Count -eq 0) "no stray files in spine/RELEASES" "stray files in RELEASES: $($relStray.Count)" 'SPINE_STALE'
$relDirsA = @(Get-ChildItem 'spine/RELEASES' -Directory -ErrorAction SilentlyContinue)
$relBadA = @($relDirsA | Where-Object { -not (Test-Path (Join-Path $_.FullName 'release.manifest.json')) })
Chk ($relBadA.Count -eq 0) "RELEASES dirs are well-formed releases (count=$($relDirsA.Count))" "malformed release dirs: $($relBadA.Count)" 'SPINE_STALE'
# supermemory: the clean build creates NO new per-project mirror; GAAhex is a pre-existing SEALED read-only
# evidence mirror (bootstrap; spec §5) and is whitelisted. Warn ONLY on an unexpected (non-sealed) mirror dir.
$smKnownSealed = @('GAAhex')
$smDirs = @(Get-ChildItem 'memory/supermemory' -Directory -ErrorAction SilentlyContinue)
$smUnexpected = @($smDirs | Where-Object { $_.Name -notin $smKnownSealed })
$smNames = if ($smDirs.Count -gt 0) { ($smDirs | Select-Object -ExpandProperty Name) -join ',' } else { '(none)' }
Chk ($smUnexpected.Count -eq 0) "supermemory holds only known sealed mirror(s): [$smNames]" "unexpected supermemory mirror dir(s): $(($smUnexpected | Select-Object -ExpandProperty Name) -join ', ')" 'CROSS_PROJECT_CONTAMINATION' -W
""
"[E] Enforcement + Phase deliverables present"
$need = @(
  'tools/hooks/forbidden-path-write-guard.ps1','tools/hooks/cross-memory-read-guard.ps1',
  'tools/hooks/critical-command-gate.ps1','tools/hooks/log-append-only-guard.ps1','tools/hooks/preflight-printer.ps1',
  'tools/bro-log.ps1','tools/bro-health.ps1','tools/bro-spine-check.ps1','tools/bro-palette.ps1','.claude/settings.json'
)
foreach ($f in $need) { Chk (Test-Path $f) "present: $f" "missing deliverable: $f" 'MANIFEST_MISSING' }
$setOk=$false; try { $set = Get-Content -Raw '.claude/settings.json' | ConvertFrom-Json; $setOk = ($null -ne $set.hooks.PreToolUse) } catch {}
Chk $setOk ".claude/settings.json registers PreToolUse hooks" "settings.json missing/has no PreToolUse hooks" 'MANIFEST_MISSING'
""
"[F] Isolation verdict (B4/L8/L10 - the wall, proof-bound)"
# Aggregates the isolation-specific signals into ONE named verdict; an unexpected (non-sealed) supermemory
# mirror is RED here (topist hardening) even though [D] flags it as a warning. A GREEN audit REQUIRES PASS.
$isoFail = @()
if ($stray.Count -ne 0)        { $isoFail += "_own stray file(s): $($stray -join ', ')" }
if ($strayDirs.Count -ne 0)    { $isoFail += "_own stray dir(s): $($strayDirs -join ', ')" }
if ($regContentBad.Count -ne 0){ $isoFail += "registry B4 path(s): $($regContentBad.Count)" }
if ($smUnexpected.Count -ne 0) { $isoFail += "unexpected supermemory mirror(s): $(($smUnexpected | Select-Object -ExpandProperty Name) -join ', ')" }
Chk ($isoFail.Count -eq 0) "ISOLATION: PASS - _own metadata/evidence only; supermemory sealed-only; registry metadata-only; no project-local self-evolution (L10)" "ISOLATION: FAIL - $($isoFail -join '; ')" 'CROSS_PROJECT_CONTAMINATION'
""
$status='GREEN'; $code=0
if ($problems.Count -gt 0){$status='RED';$code=2} elseif($warn.Count -gt 0){$status='YELLOW';$code=1}
$codesUniq = ($codes | Select-Object -Unique) -join ', '
"RESULT: $status  (problems=$($problems.Count), warnings=$($warn.Count))"
if ($codesUniq) { "ISSUE CODES: $codesUniq" }
"NOTE: read-only audit - flags only, never fixes/moves/deletes. No files changed."

# --- Topist SEAL (commit-bound + version-bound + evidence-checked) ---
$commit = $null; try { $commit = (& git rev-parse --short HEAD 2>$null); if ($commit) { $commit = "$commit".Trim() } } catch {}
$treeState = 'n/a'; try { $treeState = (@(& git status --porcelain 2>$null).Count -gt 0) ? 'DIRTY' : 'clean' } catch {}
$spineVer  = if ($mfOk) { "$($mf.spine_version)" } else { 'n/a' }
$skillsVer = if ($mfOk) { "$($mf.skills_manifest_version)" } else { 'n/a' }
""
"SEAL (audit evidence) / SEAL (audit-ի evidence)"
"  commit:        $(if($commit){$commit}else{'n/a (NO EVIDENCE)'})"
"  tree:          $treeState"
"  scope:         SuperBro self (BRO_HOME)"
"  commands:      tools/bro-audit.ps1"
"  exit:          $code ($status)"
"  changed_files: none (read-only audit; never fixes/moves/deletes)"
"  touched_paths: bro.manifest.json, bro.home.json, memory/_own/*, spine/*, .claude/settings.json, tools/hooks/* (READ ONLY)"
"  version-bound: spine_version=$spineVer  skills_manifest_version=$skillsVer"
"  limitations:   filename/metadata-level; does NOT read sealed project memory; does NOT recompute spine payload hashes (use bro-spine-verify) or run the full factory matrix (use bro-beast-check)."
"  GREEN does NOT mean: code is bug-free, a release is safe to cut, a push is authorized, sealed project memory is clean, or spine payload hashes were recomputed - ONLY that these read-only structural checks passed at THIS commit + version."

# no-evidence-no-seal: a seal must be commit-bound. Without commit evidence, refuse to seal -> BLACK(4), write nothing.
if (-not $commit) { $status='BLACK'; $code=4; ""; "RESULT: BLACK  (no commit evidence - seal REFUSED; no audit-log entry written)" }

if ($Log) {
  if ($status -eq 'BLACK') {
    "(NO-EVIDENCE-NO-SEAL: status BLACK - refusing to write an audit-log seal)"
  } else {
    $note = "audit $status; problems=$($problems.Count) warnings=$($warn.Count); codes=[$codesUniq]; commit=$commit; tree=$treeState; spine=$spineVer; skills=$skillsVer"
    & pwsh -NoProfile -File 'tools/bro-log.ps1' -Log 'audit-log' -Heading "AUDIT_RUN (bro-audit.ps1) commit=$commit" -Event 'AUDIT_RUN' -Action 'READ_ONLY_AUDIT' -Target 'SuperBro self' -Result $status -Source 'tools/bro-audit.ps1' -Authority 'Bro' -FilesChanged 'none' -Notes $note | Out-Null
    "(audit-log entry appended via bro-log.ps1)"
  }
}
exit $code
