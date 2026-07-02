<#
  bro-register.ps1 — REGISTER PROJECT (DRY default · gated real mode, Phase 3 + Gate-3, §8 / B4 / D0)
  EN: Default = DRY preview (executes nothing). Real registration requires -Execute AND -Yes AND
      BRO_GEV_APPROVED=1; it writes EXACTLY ONE registry entry (metadata only, B4) after snapshotting the registry.
      Refuses a project_path inside another project's memory or inside BRO_HOME (B4). NEVER copies project content.
  HY: Default = DRY preview (ոչինչ չի կատարում)։ Real register-ը պահանջում է -Execute + -Yes + BRO_GEV_APPROVED=1;
      գրում է ՃԻՇՏ ՄԵԿ registry entry (միայն metadata, B4)՝ registry-ի snapshot-ից հետո։ Մերժում է ուրիշ project-ի
      memory-ի / BRO_HOME-ի մեջ ընկած path։ ԵՐԲԵՔ project content չի պատճենում։
  Exit: 0 ok · 2 missing inputs · 3 refused (B4 / no approval) · 4 write error.
  RETIRE mode (-Retire -ProjectId X): flips registry status -> RETIRED (metadata only; NO file deletion; instance
      left in place). DRY default; real RETIRE needs -Execute + -Yes + BRO_GEV_APPROVED=1. Refuses unknown id or
      already-RETIRED. -RegistryPath = test override (sandbox registry; canonical = memory/_own/registry.json).
#>
param(
  [string]$ProjectId = '',
  [string]$ProjectPath = '',
  [string]$MemoryScope = '',
  [string]$Authority = 'ProjectBro',
  [string]$SpineVersionExpected = 'v1.0.0',
  [string]$Notes = '',
  [string]$RegistryPath = '',
  [switch]$Retire,
  [switch]$Yes,
  [switch]$Execute
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
$broHome = (Get-Location).Path
$regFile = if ($RegistryPath) { $RegistryPath } else { 'memory/_own/registry.json' }

# ---- RETIRE lifecycle (metadata-only status transition; no file deletion) ----
if ($Retire) {
  if (-not $ProjectId) { "RETIRE PROJECT - usage: bro-register.ps1 -Retire -ProjectId <id> [-Execute -Yes]"; exit 2 }
  "RETIRE PROJECT / ԹՈՇԱԿԻ ՀԱՆԵԼ - " + $(if ($Execute) { 'REAL mode / ԻՐԱԿԱՆ' } else { 'DRY-RUN (preview) / ՉՈՐ ԱՆՑՈՒՄ' })
  "  project_id: $ProjectId   registry: $regFile"
  $rreg = $null; try { $rreg = Get-Content -Raw $regFile | ConvertFrom-Json } catch {}
  if (-not $rreg) { "  REFUSED: registry invalid/missing at $regFile."; exit 4 }
  $rentry = @($rreg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId } | Select-Object -First 1
  if (-not $rentry) { "  REFUSED: unknown project_id '$ProjectId' (cannot retire what is not registered)."; exit 3 }
  if ("$($rentry.status)" -eq 'RETIRED') { "  REFUSED: project '$ProjectId' is already RETIRED (no-op)."; exit 3 }
  "  transition: status $($rentry.status) -> RETIRED  (metadata only; NO file deletion; instance left in place)"
  if (-not $Execute) { "  DRY-RUN: nothing written. registry unchanged."; exit 0 }
  if (-not $Yes) { "  REFUSED: real RETIRE requires -Yes."; exit 3 }
  if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real RETIRE requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }
  try {
    if (-not $RegistryPath) { $fts = Get-Date -Format "yyyyMMdd-HHmmss"; Copy-Item $regFile (Join-Path '_before' "registry-$fts.json") -Force }
    foreach ($p in @($rreg.projects)) { if ("$($p.project_id)" -eq $ProjectId) { $p.status = 'RETIRED' } }
    ($rreg | ConvertTo-Json -Depth 6) | Set-Content $regFile -Encoding utf8
    "  RETIRED $ProjectId (status -> RETIRED)$(if(-not $RegistryPath){"; snapshot: _before/registry-$fts.json"})."
    exit 0
  } catch { "  ERROR writing registry: $($_.Exception.Message)"; exit 4 }
}

if (-not $ProjectId -or -not $ProjectPath) {
  "REGISTER PROJECT - usage: bro-register.ps1 -ProjectId <id> -ProjectPath <abs-path> [-Execute -Yes]"
  exit 2
}
if (-not $MemoryScope) { $MemoryScope = "${ProjectId}_only" }

# B4 validation (applies to dry AND real): no path inside another project's memory, none inside BRO_HOME
$pl = ($ProjectPath -replace '/','\').ToLower()
$refuse = ''
if ($pl -match '\\bro\\memory(\\|$)') { $refuse = 'path is inside another project''s sealed memory (B4/L8)' }
elseif ($pl.StartsWith(($broHome.ToLower().TrimEnd('\') + '\'))) { $refuse = 'path is inside BRO_HOME (a project must live in its own root)' }

"REGISTER PROJECT - " + $(if ($Execute) { 'REAL mode' } else { 'DRY-RUN (preview)' })
"  preview - registry entry (metadata only):"
"    project_id:             $ProjectId"
"    project_path:           $ProjectPath"
"    memory_scope:           $MemoryScope"
"    authority:              $Authority"
"    spine_version_expected: $SpineVersionExpected"
"    status:                 REGISTERED"
"  files_affected: memory/_own/registry.json (metadata only); NO project content"

if ($refuse) { "  REFUSED (B4): $refuse"; "  result: NOTHING written; registry unchanged."; exit 3 }

if (-not $Execute) {
  "  DRY-RUN: nothing executed. registry.json unchanged (projects preserved). No project folder touched."
  exit 0
}

# ---- REAL mode gates ----
if (-not $Yes) { "  REFUSED: real REGISTER requires -Yes."; exit 3 }
if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real REGISTER requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }

try {
  $reg = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json
  $existing = @($reg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId }
  if ($existing) { "  REFUSED: project_id '$ProjectId' already registered."; exit 3 }
  # snapshot before critical write (§13A)
  $fts = Get-Date -Format "yyyyMMdd-HHmmss"
  Copy-Item 'memory/_own/registry.json' (Join-Path '_before' "registry-$fts.json") -Force
  $entry = [ordered]@{
    project_id = $ProjectId; project_path = $ProjectPath; memory_scope = $MemoryScope;
    authority = $Authority; spine_version_expected = $SpineVersionExpected; status = 'REGISTERED';
    last_audit = 'n/a'; last_sync = 'n/a'; notes = $Notes
  }
  $projects = @($reg.projects) + (New-Object psobject -Property $entry)
  $reg.projects = $projects
  ($reg | ConvertTo-Json -Depth 6) | Set-Content 'memory/_own/registry.json' -Encoding utf8
  "  WROTE registry entry for $ProjectId (status REGISTERED). snapshot: _before/registry-$fts.json"
  exit 0
} catch {
  "  ERROR writing registry: $($_.Exception.Message)"
  exit 4
}
