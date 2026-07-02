<#
  bro-new-project.ps1 — NEW PROJECT FACTORY (one gated command: born-correct project) · Phase 1 (§7 / §6A / D0 / L8 / L12)
  EN: Scaffolds a brand-new project so it is correct from minute one - no brain in the wrong place, no missing wall
      (the SCOUT/MENQ fumble never repeats). ONE governed flow wrapping the existing tools:
        mkdir <path>  ->  REGISTER (metadata)  ->  INSTALL (bro/ + spine pull/verify + 5-hook wall + ROOT wall + gitignore)
        ->  write CLAUDE.md (the L8 sealed-memory constitution)  ->  seed docs/ intake (docs-pack selection pointer)  ->  READY.
      Default = DRY preview (creates nothing; previews every step incl. the child DRY runs). Real run requires
      -Execute AND -Yes AND BRO_GEV_APPROVED=1. The fresh sealed brain lives in <path>\bro\memory (NEVER in SuperBro).
      ROLLBACK (-Rollback) conservatively undoes a FAILED/partial scaffold: bro-install -Rollback (removes <path>\bro\
      only) + register -Retire; it NEVER deletes app content or a grown brain, and reports anything left for review.
  HY: Կառուցում է բոլորովին նոր project՝ ճիշտ առաջին վայրկյանից (SCOUT/MENQ-ի սխալը չկրկնվի)։ ՄԵԿ governed flow՝
        mkdir -> REGISTER -> INSTALL (bro/ + spine + 5-hook wall + ROOT wall + gitignore) -> CLAUDE.md (L8 constitution)
        -> docs/ intake seed -> READY։ Default = DRY։ Real = -Execute + -Yes + BRO_GEV_APPROVED=1։ Fresh ուղեղը՝
        <path>\bro\memory-ում (ԵՐԲԵՔ SuperBro-ում)։ ROLLBACK-ը conservative undo է failed scaffold-ի, app content չի ջնջում։
  Exit: 0 ok · 2 inputs · 3 refused (gates / dup / non-empty target) · 4 child step failed · 5 verify failed · 6 write error.
#>
param(
  [string]$ProjectId = '',
  [string]$ProjectPath = '',
  [string]$Name = '',
  [string]$Description = '',
  [string]$Version = 'v1.0.0',
  [switch]$Rollback,
  [switch]$Yes,
  [switch]$Execute
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$broHome = (Get-Location).Path

if (-not $ProjectId) { "NEW PROJECT FACTORY - usage: bro-new-project.ps1 -ProjectId <ID> [-ProjectPath <abs>] [-Name <name>] [-Description <text>] [-Execute -Yes] | -Rollback"; exit 2 }
if (-not $Name) { $Name = $ProjectId }
if (-not $ProjectPath) { $ProjectPath = Join-Path (Join-Path $env:USERPROFILE 'Desktop') $ProjectId }
$broDir = Join-Path $ProjectPath 'bro'
$memScope = "${ProjectId}_only"

function Invoke-Child([string]$script, [string[]]$argv, [string]$label) {
  # child stdout -> host (visible), so the ONLY pipeline output of this function is the exit code (clean capture)
  & pwsh -NoProfile -File (Join-Path 'tools' $script) @argv | Out-Host
  $code = $LASTEXITCODE
  if ($code -ne 0) { Write-Host "  STEP FAILED: $label (exit $code)" }
  return $code
}

# ---------------- ROLLBACK ----------------
if ($Rollback) {
  "NEW PROJECT FACTORY - ROLLBACK - " + $(if ($Execute) { 'REAL mode' } else { 'DRY-RUN (preview)' })
  "  project: $ProjectId   path: $ProjectPath"
  "  conservative undo: bro-install -Rollback (removes $broDir\ ONLY) + register -Retire; NEVER deletes app content / grown brain"
  if (-not $Execute) { "  DRY-RUN: nothing undone. Real rollback needs -Execute -Yes BRO_GEV_APPROVED=1."; exit 0 }
  if (-not $Yes) { "  REFUSED: real rollback requires -Yes."; exit 3 }
  if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real rollback requires BRO_GEV_APPROVED=1."; exit 3 }
  $rc = Invoke-Child 'bro-install.ps1'  @('-Rollback','-ProjectId',$ProjectId,'-ProjectPath',$ProjectPath,'-Execute','-Yes') 'bro-install -Rollback'
  if ($rc -ne 0) { "  rollback halted (install rollback refused/failed) - inspect manually; nothing force-deleted."; exit 4 }
  Invoke-Child 'bro-register.ps1' @('-Retire','-ProjectId',$ProjectId,'-Execute','-Yes') 'bro-register -Retire' | Out-Null
  $leftovers = @()
  foreach ($p in @('CLAUDE.md', '.claude', '.gitignore', 'docs')) { if (Test-Path (Join-Path $ProjectPath $p)) { $leftovers += $p } }
  "  ROLLED BACK $ProjectId (bro/ removed, registry retired). Left for your review (NOT auto-deleted): $($leftovers -join ', ')"
  exit 0
}

# ---------------- preflight (DRY + REAL) ----------------
"NEW PROJECT FACTORY - " + $(if ($Execute) { 'REAL mode' } else { 'DRY-RUN (preview)' })
"  project:     $ProjectId  ($Name)"
"  path:        $ProjectPath"
"  scope:       $memScope   release: $Version"
"  description: " + $(if ($Description) { $Description } else { '(none given - recommend one for the CLAUDE.md identity)' })
"  plan:        mkdir -> register -> install (bro/+spine+wall+root-wall+gitignore) -> CLAUDE.md (L8) -> docs/ intake -> READY"

$reg = $null; try { $reg = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json } catch {}
if ($reg -and (@($reg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId })) { "  REFUSED: project id '$ProjectId' already in the registry (pick a new id, or use the existing project). STOP."; exit 3 }
$bhL = $broHome.ToLower().TrimEnd('\') + '\'
if (([System.IO.Path]::GetFullPath($ProjectPath)).ToLower().StartsWith($bhL)) { "  REFUSED: project path is inside BRO_HOME (B4). A project must live outside SuperBro. STOP."; exit 3 }
if (Test-Path $ProjectPath) {
  $contents = @(Get-ChildItem $ProjectPath -Force -ErrorAction SilentlyContinue)
  if ($contents.Count -gt 0) { "  REFUSED: $ProjectPath already exists and is NOT empty ($($contents.Count) item(s)) - the factory will not scaffold over existing content. STOP (use an empty/new folder)."; exit 3 }
}

if (-not $Execute) {
  "  --- DRY child previews ---"
  Invoke-Child 'bro-register.ps1' @('-ProjectId',$ProjectId,'-ProjectPath',$ProjectPath,'-MemoryScope',$memScope) 'register (DRY)' | Out-Null
  Invoke-Child 'bro-install.ps1'  @('-ProjectId',$ProjectId,'-ProjectPath',$ProjectPath,'-Version',$Version) 'install (DRY)' | Out-Null
  "  DRY-RUN: nothing created. Real run: -Execute -Yes BRO_GEV_APPROVED=1."
  exit 0
}

# ---------------- REAL gates ----------------
if (-not $Yes) { "  REFUSED: real scaffold requires -Yes."; exit 3 }
if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real scaffold requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }

try {
  # 1) folder
  if (-not (Test-Path $ProjectPath)) { New-Item -ItemType Directory -Force $ProjectPath | Out-Null; "  created $ProjectPath" }

  # 2) register (metadata only)
  $notes = if ($Description) { "factory-born: $Description" } else { 'factory-born project' }
  $rc = Invoke-Child 'bro-register.ps1' @('-ProjectId',$ProjectId,'-ProjectPath',$ProjectPath,'-MemoryScope',$memScope,'-Notes',$notes,'-Execute','-Yes') 'register'
  if ($rc -ne 0) { "  ABORT: registration failed; nothing else done. (rollback with -Rollback if a partial bro/ exists)"; exit 4 }

  # 3) install (bro/ + spine pull/verify + 5-hook wall + ROOT wall + gitignore)
  $rc = Invoke-Child 'bro-install.ps1' @('-ProjectId',$ProjectId,'-ProjectPath',$ProjectPath,'-Version',$Version,'-Execute','-Yes') 'install'
  if ($rc -ne 0) { "  ABORT: install failed (exit $rc). Use -Rollback to clean the partial bro/. STOP."; exit 4 }

  # 4) CLAUDE.md - the L8 sealed-memory constitution (filled from the governed template)
  $tpl = Get-Content -Raw 'tools/templates/project-bro/root/CLAUDE.md.template'
  $descFill = if ($Description) { $Description } else { "$Name (describe in bro/memory on first session)" }
  $tpl = $tpl -replace '<PROJECT_NAME>', $Name -replace '<PROJECT_ABS_PATH>', $ProjectPath -replace '<PROJECT_DESC>', $descFill -replace '<PROJECT_ID>', $ProjectId
  Set-Content -Path (Join-Path $ProjectPath 'CLAUDE.md') -Value $tpl -Encoding utf8
  "  wrote CLAUDE.md (L8 constitution: identity + sealed-memory + wall + comms)"

  # 4b) AUTOPILOT-PLAN seed - born autopilot-ready with the SAME logic as every bro: the daily autopilot dispatches
  #     this project's Bro BOUNDED (own branch autopilot/continue, local commit, NEVER push; Gev's WIP auto-set-aside
  #     + restored; the only thing reserved for Gev is push). New INSTALLED projects are auto-picked-up; this file
  #     just makes it plan-ready. (The dispatch logic itself lives in the shared spine: bro-dispatch + bro-autopilot.)
  $broSub = Join-Path $ProjectPath 'bro'
  if (Test-Path $broSub) {
    $plan = @(
      "# AUTOPILOT-PLAN - $ProjectId",
      "",
      "> The daily autopilot dispatches this project's Bro (BOUNDED) to do the next unchecked '- [ ]' task here:",
      "> own branch autopilot/continue, local commit, NEVER push. Idempotent (a '- [x]' task never re-runs).",
      "> Gev's pre-existing WIP is auto-set-aside + restored around each run; the ONLY thing reserved for Gev is push.",
      "> Keep tasks small, bounded, verifiable.",
      "",
      "## PENDING",
      "<!-- - [ ] the next bounded thing to build/fix -->",
      "",
      "## DONE",
      "<!-- completed tasks move here with their commit sha -->"
    )
    Set-Content -Path (Join-Path $broSub 'AUTOPILOT-PLAN.md') -Value $plan -Encoding utf8
    "  wrote bro/AUTOPILOT-PLAN.md (autopilot-ready: bounded, auto-stash, own branch, push-only-on-Gev)"
  }

  # 5) docs/ intake seed - the docs-pack selection pointer (the project Bro fills it during intake)
  $docsDir = Join-Path $ProjectPath 'docs'
  if (-not (Test-Path $docsDir)) { New-Item -ItemType Directory -Force $docsDir | Out-Null }
  $intake = @(
    "# $Name - docs intake / selection",
    "",
    "> EN: This project draws its docs from SuperBro's governed STANDARD_PROJECT_DOCS_PACK master (select-don't-copy:",
    ">     a LEAN selection ~15-25 docs, never the whole universe). On the first project session, the Bro runs intake:",
    ">     describe the project -> select the needed sections -> fill them with its skills -> log decisions here.",
    "> HY: Այս project-ը իր docs-ը վերցնում է SuperBro-ի governed STANDARD_PROJECT_DOCS_PACK master-ից (select-don't-copy:",
    ">     LEAN ~15-25 փաստաթուղթ, ոչ ամբողջ universe-ը)։ Առաջին session-ին Bro-ն վարում է intake-ը։",
    "",
    "## Project one-liner",
    $descFill,
    "",
    "## How to run intake (from SuperBro)",
    "- Browse the universe:   bro-docs.ps1 -List   (or -List -Section 09 for one section)",
    "- Deliver the LEAN pick:  bro-docs.ps1 -Deliver -ProjectId $ProjectId -Sections ""00,01,..."" -Execute -Yes BRO_GEV_APPROVED=1",
    "",
    "## Selected docs (fill during intake)",
    "- [ ] (none selected yet - run intake; choose MUST + the CONDITIONAL_MUST that truly apply)",
    "",
    "## Decisions log",
    "- $((Get-Date -Format 'yyyy-MM-dd')) factory-born; intake pending."
  )
  Set-Content -Path (Join-Path $docsDir 'PROJECT_DOCS_SELECTION.md') -Value $intake -Encoding utf8
  "  seeded docs/PROJECT_DOCS_SELECTION.md (intake pointer to the governed docs-pack master)"

  # 6) verify
  $missing = @()
  foreach ($need in @('CLAUDE.md', 'bro\bro.manifest.json', 'bro\memory\MEMORY.md', '.claude\settings.json', 'docs\PROJECT_DOCS_SELECTION.md')) {
    if (-not (Test-Path (Join-Path $ProjectPath $need))) { $missing += $need }
  }
  if ($missing.Count -gt 0) { "  VERIFY FAILED: missing $($missing -join ', '). Inspect; consider -Rollback. STOP."; exit 5 }
  $dc = Invoke-Child 'bro-project-doctor.ps1' @('-ProjectId',$ProjectId) 'project-doctor'
  "  project-doctor: " + $(if ($dc -eq 0) { 'GREEN' } else { "non-zero (exit $dc) - review" })

  # 7) READY
  ""
  "  READY: $Name is born correct."
  "    - sealed brain:  $broDir\memory\  (write memories ONLY here)"
  "    - wall-to-root:  open $ProjectPath as a project root -> the 5-hook wall auto-activates"
  "    - constitution:  $ProjectPath\CLAUDE.md  (L8)"
  "    - intake:        $ProjectPath\docs\PROJECT_DOCS_SELECTION.md"
  "  NEXT: open a NEW window from $ProjectPath - the project Bro greets as $Name's Bro and runs intake."
  exit 0
} catch { "  ERROR during scaffold: $($_.Exception.Message)  (use -Rollback to clean a partial bro/)"; exit 6 }
