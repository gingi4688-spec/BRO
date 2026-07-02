<#
  bro-docs.ps1 — STANDARD_PROJECT_DOCS_PACK governed master: browse + select-don't-copy delivery · Phase 1 (§7 / L0)
  EN: The master lives ONCE in tools/templates/standard-docs-pack/ (SuperBro-governed, versioned). This tool lets you
        -List                          browse the universe (the PACK_INDEX catalog), read-only.
        -List -Section 09              list one section's files, read-only.
        -Deliver -ProjectId X -Sections "00,01,08,09"   deliver ONLY the chosen sections into <project>\docs\ (select-
                                       don't-copy; never the whole universe). DRY default; real needs -Execute -Yes
                                       BRO_GEV_APPROVED=1. Existing <project>\docs\<section> is backed up first (nothing lost).
      It never copies the whole pack into a project, and never touches a project's sealed brain or app source.
  HY: Master-ը մեկ անգամ՝ tools/templates/standard-docs-pack/-ում (SuperBro-governed, versioned)։ -List՝ browse (read-only);
      -Deliver՝ ՄԻԱՅՆ ընտրած section-ները project-ի docs\-ում (select-don't-copy)։ DRY default; real = -Execute -Yes
      BRO_GEV_APPROVED=1; գոյություն ունեցող docs\<section>-ը backup-վում է առաջ։ Երբեք ամբողջ universe-ը, երբեք brain/app։
  Exit: 0 ok · 2 inputs · 3 refused (gates) · 4 not registered / master missing · 5 nothing matched.
#>
param(
  [switch]$List,
  [string]$Section = '',
  [switch]$Deliver,
  [string]$ProjectId = '',
  [string]$ProjectPath = '',
  [string]$Sections = '',
  [string]$RegistryPath = '',
  [switch]$Yes,
  [switch]$Execute
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
$master = 'tools/templates/standard-docs-pack'
if (-not (Test-Path $master)) { "  ERROR: docs-pack master missing at $master (bring it in first)."; exit 4 }

function Get-SectionDirs { Get-ChildItem $master -Directory | Where-Object { $_.Name -match '^\d\d_' } | Sort-Object Name }
function Resolve-Section([string]$num) { Get-SectionDirs | Where-Object { $_.Name -match ("^" + ([regex]::Escape($num.Trim().PadLeft(2,'0'))) + "_") } | Select-Object -First 1 }

# ---------------- LIST (read-only) ----------------
if ($List -or (-not $Deliver)) {
  if ($Section) {
    $d = Resolve-Section $Section
    if (-not $d) { "  no section matches '$Section'. Use -List to see all."; exit 5 }
    "SECTION $($d.Name)"
    foreach ($f in Get-ChildItem $d.FullName -File -Filter *.md | Sort-Object Name) { "   - $($f.Name)" }
    exit 0
  }
  $idx = Join-Path $master '00_MASTER/PACK_INDEX.md'
  if (Test-Path $idx) { Get-Content -Raw $idx } else {
    "STANDARD_PROJECT_DOCS_PACK - sections:"
    foreach ($d in Get-SectionDirs) { "   {0}  ({1} docs)" -f $d.Name, (@(Get-ChildItem $d.FullName -File -Filter *.md)).Count }
  }
  ""; "  Deliver a lean selection:  bro-docs.ps1 -Deliver -ProjectId <id> -Sections ""00,01,08,09"" [-Execute -Yes]"
  exit 0
}

# ---------------- DELIVER (select-don't-copy; gated) ----------------
if (-not $ProjectId) { "  usage: bro-docs.ps1 -Deliver -ProjectId <id> -Sections ""00,01,08"" [-Execute -Yes]"; exit 2 }
if (-not $Sections)  { "  REFUSED: -Sections is required (select-don't-copy: name the lean subset, never the whole universe)."; exit 2 }

$regFile = if (($env:BRO_TEST_MODE -eq '1') -and $RegistryPath) { $RegistryPath } else { 'memory/_own/registry.json' }
$reg = $null; try { $reg = Get-Content -Raw $regFile | ConvertFrom-Json } catch {}
$entry = if ($reg) { @($reg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId } | Select-Object -First 1 } else { $null }
if (-not $entry) { "  REFUSED: project '$ProjectId' is not registered."; exit 4 }
if (-not $ProjectPath) { $ProjectPath = "$($entry.project_path)" }
$docsDir = Join-Path $ProjectPath 'docs'

$wanted = @(); $unmatched = @()
foreach ($s in ($Sections -split ',')) { $d = Resolve-Section $s; if ($d) { $wanted += $d } else { $unmatched += $s.Trim() } }
$wanted = @($wanted | Sort-Object Name -Unique)

"DELIVER DOCS / ՀԱՆՁՆԵԼ ՓԱՍՏԱԹՂԹԵՐ - " + $(if ($Execute) { 'REAL mode / ԻՐԱԿԱՆ' } else { 'DRY-RUN (preview) / ՉՈՐ ԱՆՑՈՒՄ' })
"  project: $ProjectId   ->   $docsDir"
"  selected sections ($($wanted.Count)):"
foreach ($d in $wanted) { "    + $($d.Name)  ($(@(Get-ChildItem $d.FullName -File -Filter *.md).Count) docs)" }
if ($unmatched.Count) { "  WARNING: no section matched: $($unmatched -join ', ')" }
if ($wanted.Count -eq 0) { "  REFUSED: nothing matched -Sections '$Sections'. Use -List."; exit 5 }

if (-not $Execute) { "  DRY-RUN: nothing copied. Real delivery backs up any existing docs\<section> then copies the selected templates."; exit 0 }
if (-not $Yes) { "  REFUSED: real delivery requires -Yes."; exit 3 }
if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real delivery requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }

try {
  if (-not (Test-Path $docsDir)) { New-Item -ItemType Directory -Force $docsDir | Out-Null }
  $ts = Get-Date -Format "yyyyMMdd-HHmmss"
  $delivered = 0
  foreach ($d in $wanted) {
    $dst = Join-Path $docsDir $d.Name
    if (Test-Path $dst) {
      $bak = Join-Path $docsDir ("_before\docs-$ts\" + $d.Name)
      New-Item -ItemType Directory -Force (Split-Path $bak -Parent) | Out-Null
      Copy-Item $dst $bak -Recurse -Force
      "    backed up existing $($d.Name) -> docs\_before\docs-$ts\"
    }
    Copy-Item $d.FullName $docsDir -Recurse -Force
    $delivered += @(Get-ChildItem $dst -File -Filter *.md -ErrorAction SilentlyContinue).Count
    "    delivered $($d.Name)"
  }
  # log into the project's selection control file (append; create if missing)
  $sel = Join-Path $docsDir 'PROJECT_DOCS_SELECTION.md'
  $logLine = "- $ts delivered sections: " + (($wanted | ForEach-Object { $_.Name }) -join ', ')
  if (Test-Path $sel) { Add-Content -Path $sel -Value $logLine -Encoding utf8 }
  "  DELIVERED $($wanted.Count) section(s), $delivered doc file(s) into $docsDir. Selection logged."
  "  NEXT: the project Bro fills the selected docs (FILL_ORDER order) and prunes any it does not need."
  exit 0
} catch { "  ERROR during delivery: $($_.Exception.Message)"; exit 4 }
