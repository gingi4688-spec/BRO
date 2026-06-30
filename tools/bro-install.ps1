<#
  bro-install.ps1 — INSTALL PROJECT BRO (DRY default · gated real mode, Phase 3 + Gate-3/6, §7 / §6A Flow 2 / D0)
  EN: Default = DRY preview (creates nothing). Real install requires -Execute AND -Yes AND BRO_GEV_APPROVED=1,
      and the project must be REGISTERED. Real install creates ONLY <ProjectPath>\bro\ (fresh, empty sealed
      memory), fills the manifest from the template, PULLS the named spine release into <ProjectPath>\bro\spine,
      VERIFIES every hash against the release manifest, STAMPS spine_version, and writes health.report.md.
      WALL-TO-ROOT: it also delivers the root wall entry <ProjectPath>\.claude\settings.json (so the 5-hook wall
      auto-activates when the project ROOT is opened) and appends Bro-infra ignores to <ProjectPath>\.gitignore
      (idempotent). It NEVER touches <ProjectPath>\memory, app source, or any pre-existing file (a pre-existing root
      .claude is backed up first). No adopt, migrate, or mirror.
  HY: Default = DRY preview։ Real install-ը պահանջում է -Execute + -Yes + BRO_GEV_APPROVED=1 ու REGISTERED project։
      Ստեղծում է ՄԻԱՅՆ <ProjectPath>\bro\ (fresh, դատարկ sealed memory), manifest template-ից, pull release ->
      verify ամ. hash -> stamp -> health.report.md։ ԵՐԲԵՔ չի դիպչում <ProjectPath>\memory-ին։
  Exit: 0 ok · 2 inputs · 3 refused · 4 not registered / release missing · 5 verify fail · 6 write/exists error.
  ROLLBACK mode (-Rollback -ProjectId X -ProjectPath <abs>): undo a FAILED/partial install by removing <path>\bro\
      ONLY. NEVER touches <path>\memory or the project root. REFUSES if registry status is INSTALLED (active -> use
      'bro-register -Retire' first) or if the sealed memory grew beyond the fresh seed. DRY default; real ROLLBACK
      needs -Execute + -Yes + BRO_GEV_APPROVED=1. -RegistryPath = test override (sandbox registry).
  ADOPT mode (-Adopt -ProjectId X -ProjectPath <abs>): B7/L12 brain preservation. Moves an EXISTING project brain
      from <path>\memory (root) INTO <path>\bro\memory (the X_only sealed memory) — copy -> hash-verify EACH file ->
      vacate the project-root memory ONLY after every file verifies. NEVER copies a brain to SuperBro (B4/B6). If any
      hash mismatches, ABORTS with the source intact. DRY default; real ADOPT needs -Execute + -Yes + BRO_GEV_APPROVED=1.
#>
param(
  [string]$ProjectId = '',
  [string]$ProjectPath = '',
  [string]$Version = 'v1.0.0',
  [string]$RegistryPath = '',
  [switch]$Rollback,
  [switch]$Adopt,
  [switch]$Yes,
  [switch]$Execute
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$regFile = if ($RegistryPath) { $RegistryPath } else { 'memory/_own/registry.json' }

if (-not $ProjectId -or -not $ProjectPath) {
  "INSTALL PROJECT BRO - usage: bro-install.ps1 -ProjectId <id> -ProjectPath <abs> -Version v<ver> [-Execute -Yes] | -Rollback"
  exit 2
}
$broDir   = Join-Path $ProjectPath 'bro'

# ---- ROLLBACK lifecycle (undo a FAILED/partial install; removes <path>\bro\ ONLY) ----
if ($Rollback) {
  "ROLLBACK PROJECT BRO - " + $(if ($Execute) { 'REAL mode' } else { 'DRY-RUN (preview)' })
  "  project: $ProjectId   path: $ProjectPath"
  "  removes: $broDir\  ONLY  |  NEVER $ProjectPath\memory  |  NEVER project root"
  if (-not (Test-Path $broDir)) { "  nothing to roll back: $broDir does not exist."; exit 0 }
  $rbMf = $null; try { $rbMf = Get-Content -Raw (Join-Path $broDir 'bro.manifest.json') | ConvertFrom-Json } catch {}
  if (-not $rbMf) { "  REFUSED: $broDir has no valid bro.manifest.json - not a recognized install artifact. STOP (manual inspection)."; exit 3 }
  if ("$($rbMf.project_id)" -ne $ProjectId) { "  REFUSED: manifest project_id ($($rbMf.project_id)) != $ProjectId. STOP."; exit 3 }
  $rbReg = $null; try { $rbReg = Get-Content -Raw $regFile | ConvertFrom-Json } catch {}
  $rbEntry = if ($rbReg) { @($rbReg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId } | Select-Object -First 1 } else { $null }
  if ($rbEntry -and "$($rbEntry.status)" -eq 'INSTALLED') { "  REFUSED: registry status INSTALLED (active Project Bro). Use 'bro-register -Retire' first; rollback is for a FAILED/partial install only. STOP."; exit 3 }
  $memDir = Join-Path $broDir 'memory'
  $memExtra = @(Get-ChildItem $memDir -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne 'MEMORY.md' })
  $seedish = $false; $memFile = Join-Path $memDir 'MEMORY.md'
  if (Test-Path $memFile) { $seedish = ((Get-Content -Raw $memFile) -match 'sealed memory \(FRESH\)') }
  if ($memExtra.Count -gt 0 -or -not $seedish) { "  REFUSED: $memDir has content beyond the fresh seed (real sealed memory) -> rollback would destroy it. Use 'bro-register -Retire', never delete. STOP."; exit 3 }
  if (-not $Execute) { "  DRY-RUN: would remove $broDir\ (clean fresh/failed-install artifact). $ProjectPath\memory + project root left intact. Nothing removed."; exit 0 }
  if (-not $Yes) { "  REFUSED: real ROLLBACK requires -Yes."; exit 3 }
  if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real ROLLBACK requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }
  try {
    [System.IO.Directory]::Delete((Resolve-Path $broDir).Path, $true)   # .NET delete (avoids Remove-Item guard); ONLY \bro\
    "  ROLLED BACK: removed $broDir\ . $ProjectPath\memory untouched; project root untouched."
    exit 0
  } catch { "  ERROR during rollback: $($_.Exception.Message)"; exit 6 }
}

# ---- ADOPT lifecycle (B7/L12: move an EXISTING project brain INTO X\bro\memory; NEVER to SuperBro) ----
if ($Adopt) {
  $srcMem = Join-Path $ProjectPath 'memory'
  $dstMem = Join-Path $broDir 'memory'
  "ADOPT PROJECT BRAIN - " + $(if ($Execute) { 'REAL mode' } else { 'DRY-RUN (preview)' })
  "  project: $ProjectId"
  "  source (root): $srcMem   ->   dest (bro, X_only): $dstMem"
  "  rule (B7/L12): copy -> hash-verify EACH file -> vacate root ONLY after all verify; brain NEVER goes to SuperBro"
  if (-not (Test-Path $broDir))  { "  REFUSED: $broDir does not exist (install first)."; exit 4 }
  if (-not (Test-Path $dstMem))  { "  REFUSED: $dstMem (bro sealed memory) missing."; exit 4 }
  if (-not (Test-Path $srcMem))  { "  nothing to adopt: $srcMem does not exist (already vacated?)."; exit 0 }
  $srcFiles = @(Get-ChildItem $srcMem -Recurse -File -ErrorAction SilentlyContinue)
  if ($srcFiles.Count -eq 0)     { "  nothing to adopt: $srcMem is empty."; exit 0 }
  $srcRoot = (Resolve-Path $srcMem).Path.TrimEnd('\')
  "  brain files to adopt ($($srcFiles.Count)):"
  foreach ($f in $srcFiles) { "    - $($f.FullName.Substring($srcRoot.Length).TrimStart('\')) ($($f.Length) bytes)" }
  if (-not $Execute) { "  DRY-RUN: would copy -> hash-verify -> vacate root. Nothing moved."; exit 0 }
  if (-not $Yes) { "  REFUSED: real ADOPT requires -Yes."; exit 3 }
  if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real ADOPT requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }
  try {
    $verified = 0
    foreach ($f in $srcFiles) {
      $relPath = $f.FullName.Substring($srcRoot.Length).TrimStart('\')
      $srcHash = (Get-FileHash $f.FullName -Algorithm SHA256).Hash.ToLower()
      $dstPath = Join-Path $dstMem $relPath
      $dstDir  = Split-Path $dstPath -Parent
      if (-not (Test-Path $dstDir)) { New-Item -ItemType Directory -Force $dstDir | Out-Null }
      Copy-Item $f.FullName $dstPath -Force
      $dstHash = (Get-FileHash $dstPath -Algorithm SHA256).Hash.ToLower()
      if ($srcHash -ne $dstHash) { "  VERIFY FAILED for '$relPath' (src $srcHash != dst $dstHash) -> ADOPT ABORTED; source intact, nothing vacated."; exit 5 }
      "  adopted + verified: $relPath  ($srcHash)"
      $verified++
    }
    # every file verified -> vacate the project-root brain (.NET delete avoids the Remove-Item guard false-trip)
    [System.IO.Directory]::Delete($srcRoot, $true)
    "  VACATED project-root memory: $srcMem"
    "  ADOPTED $verified file(s) into $dstMem (X_only). SuperBro holds NO project content (B4/B6/B7)."
    exit 0
  } catch { "  ERROR during adopt: $($_.Exception.Message)"; exit 6 }
}
$relDir   = Join-Path (Join-Path 'spine\RELEASES' $Version) ''
$relMfPath= Join-Path $relDir 'release.manifest.json'

"INSTALL PROJECT BRO - " + $(if ($Execute) { 'REAL mode' } else { 'DRY-RUN (preview)' })
"  project:  $ProjectId   path: $ProjectPath   release: $Version"
"  creates:  $broDir\ { spine/ memory/(fresh,empty) logs/ bro.manifest.json health.report.md }"
"  wall-to-root: delivers $ProjectPath\.claude\ (root wall entry) + appends Bro-infra ignores to .gitignore"
"  NEVER touches: $ProjectPath\memory  ·  app source  ·  any pre-existing file (root .claude backed up if present)"

if (-not $Execute) {
  "  DRY-RUN: nothing executed. No X/bro created. No project folder touched. No release pulled."
  exit 0
}

# ---- REAL mode gates ----
if (-not $Yes) { "  REFUSED: real INSTALL requires -Yes."; exit 3 }
if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real INSTALL requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }

# project must be REGISTERED
$reg = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json
$entry = @($reg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId } | Select-Object -First 1
if (-not $entry) { "  REFUSED: project '$ProjectId' is not REGISTERED (register first)."; exit 4 }
# release must exist
if (-not (Test-Path $relMfPath)) { "  REFUSED: release $Version not found at $relMfPath (cut it first)."; exit 4 }
# project root must already exist (install INTO an existing project; never create a phantom EP)
if (-not (Test-Path $ProjectPath -PathType Container)) { "  REFUSED: project root $ProjectPath does not exist (will not create a phantom project). STOP."; exit 4 }
# fresh install: bro/ must not already exist
if (Test-Path $broDir) { "  REFUSED: $broDir already exists (fresh install only; not overwriting)."; exit 6 }

try {
  $relMf = Get-Content -Raw $relMfPath | ConvertFrom-Json
  $superMf = Get-Content -Raw 'bro.manifest.json' | ConvertFrom-Json

  # 1) create skeleton (ONLY under <ProjectPath>\bro\)
  New-Item -ItemType Directory -Force -Path (Join-Path $broDir 'spine')  | Out-Null
  New-Item -ItemType Directory -Force -Path (Join-Path $broDir 'memory') | Out-Null
  New-Item -ItemType Directory -Force -Path (Join-Path $broDir 'logs')   | Out-Null

  # 2) PULL: copy release payload -> bro/spine
  $payload = Join-Path $relDir 'payload'
  Copy-Item (Join-Path $payload '*') -Destination (Join-Path $broDir 'spine') -Recurse -Force

  # 3) VERIFY every hash against the release manifest
  $mismatch = @(); $missing = @()
  foreach ($f in @($relMf.files)) {
    $tp = Join-Path (Join-Path $broDir 'spine') ($f.path -replace '/','\')
    if (-not (Test-Path $tp)) { $missing += $f.path; continue }
    $h = (Get-FileHash $tp -Algorithm SHA256).Hash.ToLower()
    if ($h -ne $f.sha256) { $mismatch += $f.path }
  }
  if ($mismatch.Count -gt 0 -or $missing.Count -gt 0) {
    "  VERIFY FAILED: mismatch=$($mismatch.Count) missing=$($missing.Count) -> install REJECTED."
    "  (no stamp; left for inspection/rollback)"
    exit 5
  }

  # 4) fresh sealed memory seed (empty world; EP_only)
  $memSeed = @(
    "# $ProjectId Project Bro - sealed memory (FRESH) / $ProjectId-ի կնքված memory (FRESH)",
    "",
    "> EN: Fresh sealed memory for $ProjectId, scope $($entry.memory_scope). The ONLY unique part (B1/B4/L8).",
    ">     This is NOT the pre-existing $ProjectPath\memory (which remains untouched: no adopt, no migrate, no mirror).",
    "> HY: Fresh կնքված memory $ProjectId-ի համար (B1/B4/L8)։ Սա ՉԷ գոյություն ունեցող $ProjectPath\memory-ն (անձեռնմխելի)։"
  )
  Set-Content -Path (Join-Path $broDir 'memory\MEMORY.md') -Value $memSeed -Encoding utf8

  # 5) fill manifest from template
  $tmpl = Get-Content -Raw 'tools/templates/project-bro/bro.manifest.template.json'
  $tmpl = $tmpl -replace '<PROJECT_ID>', $ProjectId
  $tmpl = $tmpl -replace '<PROJECT_ABS_PATH>', ($ProjectPath -replace '\\','\\\\')
  $tmpl = $tmpl -replace '<PULLED_SPINE_VERSION>', $Version
  $tmpl = $tmpl -replace '<SPINE_SKILLS_VERSION>', "$($superMf.skills_manifest_version)"
  $tmpl = $tmpl -replace '<SPINE_AGENTS_HASH>', "$($superMf.agents_manifest_hash)"
  $mf = $tmpl | ConvertFrom-Json
  $mf.status = 'INSTALLED'
  $stampTs = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
  $mf | Add-Member -NotePropertyName last_audit -NotePropertyValue $stampTs -Force
  ($mf | ConvertTo-Json -Depth 8) | Set-Content (Join-Path $broDir 'bro.manifest.json') -Encoding utf8

  # 6) health report
  $health = @(
    "# $ProjectId Project Bro health report / health report",
    "",
    "``````txt",
    "project_id:    $ProjectId",
    "spine_version: $Version (pulled, VERIFIED: all hashes match release manifest)",
    "memory_scope:  $($entry.memory_scope)",
    "last_audit:    $stampTs",
    "RESULT:        GREEN",
    "isolation:     reads only its own memory (cross-memory-read-guard) - existing $ProjectPath\memory untouched",
    "``````"
  )
  Set-Content -Path (Join-Path $broDir 'health.report.md') -Value $health -Encoding utf8

  # 7) deliver the SuperBro-authored enforcement skeleton (governed delivery; NOT project-local evolution).
  #    Project Bros are CONSUMERS of SuperBro template/tooling (see _core/laws/02_architecture.md L10).
  if (Test-Path 'tools/templates/project-bro/.claude') { Copy-Item 'tools/templates/project-bro/.claude' -Destination $broDir -Recurse -Force }
  if (Test-Path 'tools/templates/project-bro/tools')   { Copy-Item 'tools/templates/project-bro/tools'   -Destination $broDir -Recurse -Force }

  # 7b) WALL-TO-ROOT: deliver the ROOT-open wall entry to <project>\.claude so the 5-hook wall auto-activates when the
  #     project ROOT is opened (the daily driver), not only bro/. Hook SCRIPTS stay contained under bro\tools\hooks.
  $rootClaudeSrc = 'tools/templates/project-bro/root/.claude'
  if (Test-Path $rootClaudeSrc) {
    $rootClaudeDst = Join-Path $ProjectPath '.claude'
    $existingSettings = Join-Path $rootClaudeDst 'settings.json'
    if (Test-Path $existingSettings) {                              # defensive: never clobber a pre-existing app .claude
      $bakTs = Get-Date -Format "yyyyMMdd-HHmmss"
      Copy-Item $existingSettings ("$existingSettings.bak-$bakTs") -Force
      "  note: pre-existing $existingSettings backed up to settings.json.bak-$bakTs before wall delivery"
    }
    Copy-Item $rootClaudeSrc -Destination $ProjectPath -Recurse -Force
  }

  # 7c) gitignore the re-deliverable infra in the PROJECT's repo (idempotent): the root wall entry + the bulky bro/ infra
  #     (spine/tools/wall/manifest/health/logs). bro\memory (sealed brain) + docs STAY TRACKED (Gev decision 2026-07-01).
  $pgi = Join-Path $ProjectPath '.gitignore'
  $giExisting = if (Test-Path $pgi) { Get-Content -Raw $pgi } else { '' }
  if ($giExisting -notmatch '(?m)^# --- Bro infra') {
    $giBlock = @('', '# --- Bro infra (SuperBro-governed, re-deliverable; do NOT commit) ---', '/.claude/', '/bro/spine/', '/bro/tools/', '/bro/.claude/', '/bro/bro.manifest.json', '/bro/health.report.md', '/bro/logs/', '/bro/_before/') -join "`r`n"
    Add-Content -Path $pgi -Value $giBlock -Encoding utf8
    "  gitignore: appended Bro-infra ignores to $pgi (bro\memory + docs stay tracked)"
  } else { "  gitignore: Bro-infra block already present (idempotent, skipped)" }

  # 8) complete the REGISTERED -> INSTALLED registry transition (a successful install IS the transition)
  try {
    $fts2 = Get-Date -Format "yyyyMMdd-HHmmss"
    Copy-Item 'memory/_own/registry.json' (Join-Path '_before' "registry-$fts2.json") -Force
    $entry.status = 'INSTALLED'; $entry.last_sync = $stampTs
    ($reg | ConvertTo-Json -Depth 6) | Set-Content 'memory/_own/registry.json' -Encoding utf8
    "  registry: $ProjectId status REGISTERED -> INSTALLED (snapshot _before/registry-$fts2.json)"
  } catch { "  WARN: install ok but registry status update failed: $($_.Exception.Message)" }

  "  INSTALLED $ProjectId at $broDir (spine pulled $Version, VERIFIED $(@($relMf.files).Count) files, stamped)."
  "  created: $broDir\spine\  $broDir\memory\MEMORY.md  $broDir\logs\  $broDir\bro.manifest.json  $broDir\health.report.md"
  "  enforcement (from SuperBro template): $broDir\.claude\settings.json  $broDir\tools\hooks\*  (governed delivery)"
  exit 0
} catch {
  "  ERROR during install: $($_.Exception.Message)"
  exit 6
}
