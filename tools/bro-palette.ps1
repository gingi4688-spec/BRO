<#
  bro-palette.ps1 — Guided Command Palette runner (§6B / D10 / OD-4)
  EN: SuperBro's operator-facing control surface. Menu -> preview -> explicit YES -> run.
      READ-mode LIVE commands (availability CLEAN-BUILD/PHASE-2/LIVE) execute via named, explicit dispatch (NO
      arbitrary execution); project-scoped read commands prompt for a project_id. WRITE/critical commands are
      preview-wired: ROLLOUT-GATED commands dispatch their DRY backing on YES (execute NOTHING); the palette NEVER
      bypasses a gate (real execution of a critical command requires -Execute -Yes BRO_GEV_APPROVED=1 OUTSIDE the menu).
  HY: SuperBro-ի operator-control մակերեսը։ Menu -> preview -> բացահայտ YES -> run։ READ-live-ները՝ explicit dispatch;
      ROLLOUT-GATED-ները YES-ին DRY backing (ոչինչ չեն կատարում); palette-ը ԵՐԲԵՔ gate չի bypass անում։
  Usage:
    pwsh ./tools/bro-palette.ps1                            # interactive menu (for Gev)
    pwsh ./tools/bro-palette.ps1 -Command "SHOW HEALTH"     # run one read-live command, non-interactive
    pwsh ./tools/bro-palette.ps1 -Command "REGISTER PROJECT" -Confirm YES   # ROLLOUT-GATED -> DRY backing (nothing executed)
    pwsh ./tools/bro-palette.ps1 -Command "RELEASE SPINE" -Confirm YES      # gated -> preview + refuse (no bypass)
  Exit: 0 OK/handled · 2 unknown command · 3 backing missing.
  NOTE: display text flows to stdout; the exit code is carried in $script:ExitCode. Avoid read-only automatic vars.
#>
param(
  [string]$Command = '',
  [string]$Confirm = ''
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
$script:ExitCode = 0

$libPath = 'tools/command-library.json'
if (-not (Test-Path $libPath)) { Write-Output 'PALETTE: command-library.json MISSING'; exit 3 }
$lib = Get-Content -Raw $libPath | ConvertFrom-Json
$commands = @($lib.commands)

# A command is "read-live" (safe to run from the menu) when it READs and is live (CLEAN-BUILD/PHASE-2/LIVE).
function Test-ReadLive($c) { return ($c.mode -eq 'READ') -and ($c.availability -in @('CLEAN-BUILD','PHASE-2','LIVE')) }

function Get-Entry([string]$name) { return $commands | Where-Object { $_.name -ieq $name.Trim() } | Select-Object -First 1 }

function Show-Help {
  Write-Output ''
  Write-Output 'COMMAND LIBRARY - category | requires_gev | availability | name'
  foreach ($c in $commands) {
    Write-Output ("  {0,-9}  {1,-12}  {2,-14}  {3}" -f $c.category, ([string]$c.requires_gev), $c.availability, $c.name)
  }
  Write-Output ''
  Write-Output 'READ-live commands run after a light confirm. WRITE/critical commands always require preview + YES (+ Gev authority).'
  Write-Output 'ROLLOUT-GATED commands run only a DRY backing here (execute nothing); real execution needs explicit Gev-approved flags. Full catalog: _core/COMMAND_LIBRARY.md.'
}

function Show-Banner {
  $mf = $null; try { $mf = Get-Content -Raw 'bro.manifest.json' | ConvertFrom-Json } catch {}
  $ver = if ($mf) { $mf.spine_version } else { '?' }
  Write-Output ''
  Write-Output ("SuperBro ready / պատրաստ - BRO_HOME: {0} - spine {1} - cross-project: OFF" -f (Get-Location).Path, $ver)
  Write-Output 'Choose a command / ընտրիր հրաման (type the name or number / անունը կամ համարը):'
  Write-Output ''
  Write-Output '  READ-live (runs read-only)'
  $i = 0
  foreach ($c in $commands) { $i++; if (Test-ReadLive $c) { Write-Output ("   [{0,2}] {1}   ({2})" -f $i, $c.name, $c.availability) } }
  Write-Output '  WRITE / critical - preview + YES (+ Gev authority); ROLLOUT-GATED runs DRY, others gated (no bypass)'
  $i = 0
  foreach ($c in $commands) { $i++; if (-not (Test-ReadLive $c)) { Write-Output ("   [{0,2}] {1}   ({2})" -f $i, $c.name, $c.availability) } }
  Write-Output ''
  Write-Output '  Type a command name / գրիր հրամանի անունը, [?] HELP, or EXIT.'
}

function Invoke-ReadLive($entry, [bool]$interactive) {
  switch ($entry.name.ToUpper()) {
    'HELP'          { Show-Help; $script:ExitCode = 0 }
    'SHOW COMMANDS' { Show-Help; $script:ExitCode = 0 }
    'SHOW REGISTRY' { & pwsh -NoProfile -File 'tools/bro-show-registry.ps1'; $script:ExitCode = $LASTEXITCODE }
    'SHOW HEALTH'   { & pwsh -NoProfile -File 'tools/bro-show-health.ps1';   $script:ExitCode = $LASTEXITCODE }
    'RUN DOCTOR'    { & pwsh -NoProfile -File 'tools/bro-doctor.ps1';         $script:ExitCode = $LASTEXITCODE }
    'RUN AUDIT'     { & pwsh -NoProfile -File 'tools/bro-audit.ps1';          $script:ExitCode = $LASTEXITCODE }
    'REVIEW QUARANTINE' { & pwsh -NoProfile -File 'tools/bro-audit.ps1';      $script:ExitCode = $LASTEXITCODE }
    'RUN PROJECT AUDIT' {
      if ($interactive) { $pj = Read-Host '  project_id'; & pwsh -NoProfile -File 'tools/bro-project-audit.ps1' -ProjectId $pj; $script:ExitCode = $LASTEXITCODE }
      else { Write-Output '  RUN PROJECT AUDIT is read-only but needs a -ProjectId (use the interactive menu, or tools/bro-project-audit.ps1 -ProjectId X).'; $script:ExitCode = 0 }
    }
    'VERIFY PROJECT BRO' {
      if ($interactive) { $pj = Read-Host '  project_id'; & pwsh -NoProfile -File 'tools/bro-project-doctor.ps1' -ProjectId $pj; $script:ExitCode = $LASTEXITCODE }
      else { Write-Output '  VERIFY PROJECT BRO is read-only but needs a -ProjectId (use the interactive menu, or tools/bro-project-doctor.ps1 -ProjectId X).'; $script:ExitCode = 0 }
    }
    'LIST DOCS PACK' {
      if ($interactive) { $sec = Read-Host '  section number (blank = full catalog)'; if ($sec) { & pwsh -NoProfile -File 'tools/bro-docs.ps1' -List -Section $sec } else { & pwsh -NoProfile -File 'tools/bro-docs.ps1' -List }; $script:ExitCode = $LASTEXITCODE }
      else { & pwsh -NoProfile -File 'tools/bro-docs.ps1' -List; $script:ExitCode = $LASTEXITCODE }
    }
    'RUN SELF-AUDIT'    { & pwsh -NoProfile -File 'tools/bro-selfaudit.ps1';        $script:ExitCode = $LASTEXITCODE }
    'LIST CROSS-GRANTS' { & pwsh -NoProfile -File 'tools/bro-cross-grant.ps1' -List; $script:ExitCode = $LASTEXITCODE }
    'EXIT'          { Write-Output 'Leaving palette. Bye.'; $script:ExitCode = 0 }
    default         { Write-Output ("PALETTE: '{0}' has no read-live backing wired." -f $entry.name); $script:ExitCode = 2 }
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
  Write-Output 'DRY dispatch - the ROLLOUT-GATED command EXECUTES NOTHING here (real execution needs explicit Gev-approved flags):'
  switch ($entry.name.ToUpper()) {
    'REGISTER PROJECT' {
      if ($interactive) { $projId = Read-Host '  project_id'; $projPath = Read-Host '  project_path'; & pwsh -NoProfile -File 'tools/bro-register.ps1' -ProjectId $projId -ProjectPath $projPath }
      else { & pwsh -NoProfile -File 'tools/bro-register.ps1' }
    }
    'INSTALL PROJECT BRO' {
      if ($interactive) { $projId = Read-Host '  project_id'; $projPath = Read-Host '  project_path'; & pwsh -NoProfile -File 'tools/bro-install.ps1' -ProjectId $projId -ProjectPath $projPath }
      else { & pwsh -NoProfile -File 'tools/bro-install.ps1' }
    }
    'UPDATE PROJECT BRO SPINE' {
      if ($interactive) { $projId = Read-Host '  project_id'; & pwsh -NoProfile -File 'tools/bro-update-spine.ps1' -ProjectId $projId }
      else { & pwsh -NoProfile -File 'tools/bro-update-spine.ps1' }
    }
    'ROLLBACK PROJECT BRO' {
      if ($interactive) { $projId = Read-Host '  project_id'; $projPath = Read-Host '  project_path'; & pwsh -NoProfile -File 'tools/bro-install.ps1' -Rollback -ProjectId $projId -ProjectPath $projPath }
      else { Write-Output '  ROLLBACK PROJECT BRO (DRY) needs -ProjectId/-ProjectPath; use the interactive menu.' }
    }
    'RETIRE PROJECT' {
      if ($interactive) { $projId = Read-Host '  project_id'; & pwsh -NoProfile -File 'tools/bro-register.ps1' -Retire -ProjectId $projId }
      else { Write-Output '  RETIRE PROJECT (DRY) needs -ProjectId; use the interactive menu.' }
    }
    'NEW PROJECT' {
      if ($interactive) { $projId = Read-Host '  project_id'; $desc = Read-Host '  description'; & pwsh -NoProfile -File 'tools/bro-new-project.ps1' -ProjectId $projId -Description $desc }
      else { Write-Output '  NEW PROJECT (DRY) needs -ProjectId; use the interactive menu.' }
    }
    'WIRE WALL TO ROOT' {
      if ($interactive) { $projId = Read-Host '  project_id'; & pwsh -NoProfile -File 'tools/bro-wire-root.ps1' -ProjectId $projId }
      else { Write-Output '  WIRE WALL TO ROOT (DRY) needs -ProjectId; use the interactive menu.' }
    }
    'DELIVER DOCS' {
      if ($interactive) { $projId = Read-Host '  project_id'; $secs = Read-Host '  sections (e.g. 00,01,08)'; & pwsh -NoProfile -File 'tools/bro-docs.ps1' -Deliver -ProjectId $projId -Sections $secs }
      else { Write-Output '  DELIVER DOCS (DRY) needs -ProjectId -Sections; use the interactive menu.' }
    }
    'GRANT CROSS-PROJECT ACCESS' {
      Write-Output '  current grants (read-only):'
      & pwsh -NoProfile -File 'tools/bro-cross-grant.ps1' -List
      Write-Output '  To really grant (OUTSIDE the menu, Gev-gated) - the palette runs NOTHING mutating here:'
      Write-Output '    BRO_GEV_APPROVED=1 tools/bro-cross-grant.ps1 -Grant -ProjectId <P> -Scope read -Task "<why>" -Hours <N>'
    }
    'REVOKE CROSS-PROJECT ACCESS' {
      Write-Output '  current grants (read-only):'
      & pwsh -NoProfile -File 'tools/bro-cross-grant.ps1' -List
      Write-Output '  To really revoke (OUTSIDE the menu, Gev-gated) - the palette runs NOTHING mutating here:'
      Write-Output '    BRO_GEV_APPROVED=1 tools/bro-cross-grant.ps1 -Revoke -ProjectId <P>'
    }
    'SCHEDULE SELF-AUDIT' {
      Write-Output '  current schedule (read-only):'
      & pwsh -NoProfile -File 'tools/bro-schedule.ps1' -Status
      Write-Output '  To register/change/remove (OUTSIDE the menu, Gev-gated) - the palette runs NOTHING mutating here:'
      Write-Output '    BRO_GEV_APPROVED=1 tools/bro-schedule.ps1 -Register -Time 11:00'
      Write-Output '    BRO_GEV_APPROVED=1 tools/bro-schedule.ps1 -Remove'
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
  if ($entry.availability -eq 'ROLLOUT-GATED') {
    Invoke-DryRollout $entry $interactive
    return
  }
  $gevNote = if ($entry.requires_gev) { ' and explicit Gev authority (BRO_GEV_APPROVED=1)' } else { '' }
  Write-Output ''
  Write-Output ("GATED - the palette will NOT bypass the gate for '{0}'." -f $entry.name)
  Write-Output ("  reason:    real execution requires its explicit flags{0}; the menu previews only." -f $gevNote)
  Write-Output '  result:    NOTHING EXECUTED - no files changed - no project touched'
  Write-Output '  next safe: RUN DOCTOR / RUN AUDIT (read-only)'
  $script:ExitCode = 0
}

# ---- non-interactive single command ----
if ($Command -ne '') {
  $name = $Command
  if ($name.Trim() -eq '?') { $name = 'HELP' }
  $entry = Get-Entry $name
  if ($null -eq $entry) { Write-Output ("PALETTE: unknown command '{0}'. Try HELP." -f $Command); exit 2 }
  if (Test-ReadLive $entry) { Invoke-ReadLive $entry $false }
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
  if (Test-ReadLive $entry) {
    Invoke-ReadLive $entry $true
  } else {
    $ans = Read-Host 'Type YES to attempt'
    Invoke-Critical $entry $ans $true
  }
}
exit $script:ExitCode
