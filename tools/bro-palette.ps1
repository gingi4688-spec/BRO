<#
  bro-palette.ps1 — Guided Command Palette runner (clean-build Phase 1 + Phase 3 dry rollout, §6B / D10 / OD-4)
  EN: SuperBro's operator-facing control surface. Menu -> preview -> explicit YES -> run.
      READ-ONLY (CLEAN-BUILD) commands execute via named, explicit dispatch (NO arbitrary execution).
      PHASE-3-DRY rollout commands (REGISTER/INSTALL/UPDATE) dispatch to their DRY backing on YES and EXECUTE NOTHING.
      Other CRITICAL / not-yet-available commands are preview-wired but EXECUTION-GATED (refuse even on YES).
  HY: SuperBro-ի operator-control մակերեսը։ Menu -> preview -> բացահայտ YES -> run։
      READ-ONLY-ները՝ explicit dispatch; PHASE-3-DRY rollout-ները՝ dry backing (ոչինչ չեն կատարում); մնացած critical-ները gated։
  Usage:
    pwsh ./tools/bro-palette.ps1                          # interactive menu (for Gev)
    pwsh ./tools/bro-palette.ps1 -Command "SHOW HEALTH"   # run one command, non-interactive
    pwsh ./tools/bro-palette.ps1 -Command "RELEASE SPINE" -Confirm YES   # critical -> refuse (gated)
    pwsh ./tools/bro-palette.ps1 -Command "REGISTER PROJECT" -Confirm YES # PHASE-3-DRY -> dry backing (nothing executed)
  Exit: 0 OK/handled · 2 unknown command · 3 backing missing.
  NOTE: display text flows to stdout; the exit code is carried in $script:ExitCode (no assignment-capture).
        Avoid PowerShell read-only automatic vars ($home, $pid) for locals.
#>
param(
  [string]$Command = '',
  [string]$Confirm = ''
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$script:ExitCode = 0

$libPath = 'tools/command-library.json'
if (-not (Test-Path $libPath)) { Write-Output 'PALETTE: command-library.json MISSING'; exit 3 }
$lib = Get-Content -Raw $libPath | ConvertFrom-Json
$commands = @($lib.commands)

function Get-Entry([string]$name) {
  return $commands | Where-Object { $_.name -ieq $name.Trim() } | Select-Object -First 1
}

function Show-Help {
  Write-Output ''
  Write-Output 'COMMAND LIBRARY - what is safe to run now (clean build)'
  Write-Output '  category   requires_gev  availability   name'
  foreach ($c in $commands) {
    Write-Output ("  {0,-9}  {1,-12}  {2,-13}  {3}" -f $c.category, ([string]$c.requires_gev), $c.availability, $c.name)
  }
  Write-Output ''
  Write-Output 'Read-only commands run after a light confirm. Critical commands always require preview + YES (+ Gev authority).'
  Write-Output 'PHASE-3-DRY rollout commands run their DRY backing (execute nothing). Full catalog: _core/COMMAND_LIBRARY.md.'
}

function Show-Banner {
  $mf = $null; try { $mf = Get-Content -Raw 'bro.manifest.json' | ConvertFrom-Json } catch {}
  $ver = if ($mf) { $mf.spine_version } else { '?' }
  Write-Output ''
  Write-Output ("SuperBro ready - BRO_HOME: {0} - spine {1} - mode: READ-ONLY - cross-project: OFF" -f (Get-Location).Path, $ver)
  Write-Output 'Choose a command (type the name or number):'
  Write-Output ''
  Write-Output '  READ-ONLY (live)'
  $i = 0
  foreach ($c in $commands) { $i++; if ($c.category -eq 'READ-ONLY' -and $c.availability -eq 'CLEAN-BUILD') { Write-Output ("   [{0,2}] {1}" -f $i, $c.name) } }
  Write-Output '  CRITICAL / FUTURE - preview + YES (+ Gev authority); rollout (PHASE-3-DRY) runs dry, others gated'
  $i = 0
  foreach ($c in $commands) { $i++; if (-not ($c.category -eq 'READ-ONLY' -and $c.availability -eq 'CLEAN-BUILD')) { Write-Output ("   [{0,2}] {1}   ({2})" -f $i, $c.name, $c.availability) } }
  Write-Output ''
  Write-Output '  Type a command name, [?] HELP, or EXIT.'
}

function Invoke-ReadOnly($entry) {
  switch ($entry.name.ToUpper()) {
    'HELP'          { Show-Help; $script:ExitCode = 0 }
    'SHOW COMMANDS' { Show-Help; $script:ExitCode = 0 }
    'SHOW REGISTRY' { & pwsh -NoProfile -File 'tools/bro-show-registry.ps1'; $script:ExitCode = $LASTEXITCODE }
    'SHOW HEALTH'   { & pwsh -NoProfile -File 'tools/bro-show-health.ps1';   $script:ExitCode = $LASTEXITCODE }
    'RUN DOCTOR'    { & pwsh -NoProfile -File 'tools/bro-doctor.ps1';         $script:ExitCode = $LASTEXITCODE }
    'EXIT'          { Write-Output 'Leaving palette. Bye.'; $script:ExitCode = 0 }
    default         { Write-Output ("PALETTE: '{0}' has no read-only backing wired." -f $entry.name); $script:ExitCode = 2 }
  }
}

function Show-Preview($entry) {
  Write-Output ''
  Write-Output ("PREVIEW - {0}" -f $entry.name)
  Write-Output ("  Action:        {0}" -f $entry.purpose_en)
  Write-Output ("  Category:      {0}  -  Criticality: {1}  -  Requires Gev: {2}" -f $entry.category, $entry.criticality, $entry.requires_gev)
  Write-Output ("  Mode:          {0}  -  Files: {1}" -f $entry.mode, $entry.files_affected)
  Write-Output ("  Availability:  {0}" -f $entry.availability)
  Write-Output ("  Consequence:   {0}" -f $entry.preview_en)
  Write-Output '  >> Type YES to attempt - anything else cancels.'
}

function Invoke-DryRollout($entry, [bool]$interactive) {
  Write-Output ''
  Write-Output 'DRY-RUN dispatch (clean build) - the rollout command EXECUTES NOTHING:'
  switch ($entry.name.ToUpper()) {
    'REGISTER PROJECT' {
      if ($interactive) { $projId = Read-Host '  project_id'; $projPath = Read-Host '  project_path'; & pwsh -NoProfile -File 'tools/bro-register.ps1' -ProjectId $projId -ProjectPath $projPath -Yes }
      else { & pwsh -NoProfile -File 'tools/bro-register.ps1' }
    }
    'INSTALL PROJECT BRO' {
      if ($interactive) { $projId = Read-Host '  project_id'; $projPath = Read-Host '  project_path'; & pwsh -NoProfile -File 'tools/bro-install.ps1' -ProjectId $projId -ProjectPath $projPath -Yes }
      else { & pwsh -NoProfile -File 'tools/bro-install.ps1' }
    }
    'UPDATE PROJECT BRO SPINE' {
      if ($interactive) { $projId = Read-Host '  project_id'; & pwsh -NoProfile -File 'tools/bro-update-spine.ps1' -ProjectId $projId -Yes }
      else { & pwsh -NoProfile -File 'tools/bro-update-spine.ps1' }
    }
    default { Write-Output '  (no dry backing wired)' }
  }
  $script:ExitCode = 0
}

function Invoke-Critical($entry, [string]$answer, [bool]$interactive) {
  Show-Preview $entry
  if ($answer.Trim().ToUpper() -ne 'YES') {
    Write-Output ''
    Write-Output 'CANCELLED - no YES given. Nothing executed.'
    $script:ExitCode = 0
    return
  }
  if ($entry.availability -eq 'PHASE-3-DRY') {
    Invoke-DryRollout $entry $interactive
    return
  }
  $gevNote = if ($entry.requires_gev) { ' and it requires explicit Gev authority' } else { '' }
  Write-Output ''
  Write-Output ("REFUSED - execution gated. '{0}' is not runnable in the clean build." -f $entry.name)
  Write-Output ("  reason:    availability={0}; its backing system is not built yet{1}." -f $entry.availability, $gevNote)
  Write-Output '  result:    NOTHING EXECUTED - no files changed - no project touched'
  Write-Output '  next safe: RUN DOCTOR (read-only)'
  $script:ExitCode = 0
}

# ---- non-interactive single command ----
if ($Command -ne '') {
  $name = $Command
  if ($name.Trim() -eq '?') { $name = 'HELP' }
  $entry = Get-Entry $name
  if ($null -eq $entry) { Write-Output ("PALETTE: unknown command '{0}'. Try HELP." -f $Command); exit 2 }
  if ($entry.category -eq 'READ-ONLY' -and $entry.availability -eq 'CLEAN-BUILD') { Invoke-ReadOnly $entry }
  else { Invoke-Critical $entry $Confirm $false }
  exit $script:ExitCode
}

# ---- interactive menu loop (for Gev) ----
while ($true) {
  Show-Banner
  $choice = Read-Host 'Gev'
  if ($null -eq $choice) { break }
  $choice = $choice.Trim()
  if ($choice -eq '') { continue }
  if ($choice -eq '?') { $choice = 'HELP' }
  if ($choice -match '^\d+$') {
    $idx = [int]$choice - 1
    if ($idx -ge 0 -and $idx -lt $commands.Count) { $choice = $commands[$idx].name } else { Write-Output 'Invalid number.'; continue }
  }
  $entry = Get-Entry $choice
  if ($null -eq $entry) { Write-Output ("Unknown command '{0}'. Type ? for HELP." -f $choice); continue }
  if ($entry.name -ieq 'EXIT') { Write-Output 'Leaving palette. Bye.'; break }
  if ($entry.category -eq 'READ-ONLY' -and $entry.availability -eq 'CLEAN-BUILD') {
    Invoke-ReadOnly $entry
  } else {
    $ans = Read-Host 'Type YES to attempt'
    Invoke-Critical $entry $ans $true
  }
}
exit $script:ExitCode
