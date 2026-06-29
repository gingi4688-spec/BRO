<#
  bro-install.ps1 — INSTALL PROJECT BRO (DRY default · gated real mode, Phase 3 + Gate-3/6, §7 / §6A Flow 2 / D0)
  EN: Default = DRY preview (creates nothing). Real install requires -Execute AND -Yes AND BRO_GEV_APPROVED=1,
      and the project must be REGISTERED. Real install creates ONLY <ProjectPath>\bro\ (fresh, empty sealed
      memory), fills the manifest from the template, PULLS the named spine release into <ProjectPath>\bro\spine,
      VERIFIES every hash against the release manifest, STAMPS spine_version, and writes health.report.md.
      It NEVER touches <ProjectPath>\memory or any existing project file outside \bro\. No adopt, migrate, or mirror.
  HY: Default = DRY preview։ Real install-ը պահանջում է -Execute + -Yes + BRO_GEV_APPROVED=1 ու REGISTERED project։
      Ստեղծում է ՄԻԱՅՆ <ProjectPath>\bro\ (fresh, դատարկ sealed memory), manifest template-ից, pull release ->
      verify ամ. hash -> stamp -> health.report.md։ ԵՐԲԵՔ չի դիպչում <ProjectPath>\memory-ին։
  Exit: 0 ok · 2 inputs · 3 refused · 4 not registered / release missing · 5 verify fail · 6 write/exists error.
#>
param(
  [string]$ProjectId = '',
  [string]$ProjectPath = '',
  [string]$Version = 'v1.0.0',
  [switch]$Yes,
  [switch]$Execute
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')

if (-not $ProjectId -or -not $ProjectPath) {
  "INSTALL PROJECT BRO - usage: bro-install.ps1 -ProjectId <id> -ProjectPath <abs> -Version v<ver> [-Execute -Yes]"
  exit 2
}
$broDir   = Join-Path $ProjectPath 'bro'
$relDir   = Join-Path (Join-Path 'spine\RELEASES' $Version) ''
$relMfPath= Join-Path $relDir 'release.manifest.json'

"INSTALL PROJECT BRO - " + $(if ($Execute) { 'REAL mode' } else { 'DRY-RUN (preview)' })
"  project:  $ProjectId   path: $ProjectPath   release: $Version"
"  creates:  $broDir\ { spine/ memory/(fresh,empty) logs/ bro.manifest.json health.report.md }"
"  NEVER touches: $ProjectPath\memory  (existing project files outside \bro\)"

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

  "  INSTALLED $ProjectId at $broDir (spine pulled $Version, VERIFIED $(@($relMf.files).Count) files, stamped)."
  "  created: $broDir\spine\  $broDir\memory\MEMORY.md  $broDir\logs\  $broDir\bro.manifest.json  $broDir\health.report.md"
  exit 0
} catch {
  "  ERROR during install: $($_.Exception.Message)"
  exit 6
}
