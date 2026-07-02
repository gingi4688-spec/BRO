<#
  preflight-printer.ps1 — SessionStart hook · clean-build Phase 2 (§11 refinement #4)
  EN: Prints the per-session pre-flight banner: current project · allowed memory · forbidden paths ·
      spine version · critical-needs-Gev · cross-project OFF. Read-only; never blocks. Exit 0 always.
  HY: Տպում է session-ի pre-flight banner-ը՝ project · allowed memory · forbidden paths · spine version ·
      critical-needs-Gev · cross-project OFF։ Read-only; երբեք չի block անում։ Exit 0 միշտ։
#>
try {
  $broHome = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
  $ver = '?'; $phase = '?'
  try { $mf = Get-Content -Raw (Join-Path $broHome 'bro.manifest.json') | ConvertFrom-Json; $ver = $mf.spine_version; $phase = $mf.phase } catch {}
  Write-Output "==================== SuperBro pre-flight ===================="
  Write-Output ("  project:        _super (SuperBro)   ·   phase: {0}" -f $phase)
  Write-Output ("  BRO_HOME:       {0}" -f $broHome)
  Write-Output ("  allowed memory: memory/_own (registry + evidence logs only)")
  Write-Output ("  forbidden:      another project's memory · memory/supermemory/** · memory/_own/secrets/** · outside BRO_HOME")
  Write-Output ("  spine version:  {0}   (live spine at root dirs, OD-6)" -f $ver)
  Write-Output ("  critical:       build/push/migrate/delete/release/promote/lock require explicit Gev command (D0/§8)")
  Write-Output ("  cross-project:  OFF (opens only by explicit Gev command, §9)")
  Write-Output ("  evidence logs:  append-only (tools/bro-log.ps1); never hand-edited (§13A)")

  # --- auto self-audit (quick, read-only): the Main Bro proves its integrity EVERY session -
  #     this is agenda #3 scheduled at the session-open cadence (the cadence that matters for a repo
  #     that only changes when Bro is in use). Best-effort; never blocks the session. ---
  try {
    $sa = & pwsh -NoProfile -File (Join-Path $broHome 'tools\bro-selfaudit.ps1') -Quick 2>&1
    $overall = @($sa | ForEach-Object { "$_" -replace "\x1b\[[0-9;]*m", '' } | Where-Object { $_ -match '^OVERALL:' }) | Select-Object -Last 1
    if ($overall) {
      Write-Output ("  self-audit:     {0}" -f $overall.Trim())
      Write-Output ("                  (auto quick = doctor + audit; full doctor+audit+beast: RUN SELF-AUDIT)")
    }
  } catch {}

  # --- last DAILY self-audit (the unattended 11:00 heartbeat): surface its verdict; flag RED or stale loudly ---
  try {
    $hb = Join-Path $broHome 'logs\selfaudit-heartbeat.log'
    if (Test-Path $hb) {
      $last = @(Get-Content $hb | Where-Object { $_ -match '\S' })[-1]
      if ($last) {
        $dv  = if ($last -match '\s(GREEN|YELLOW|RED)\s') { $matches[1] } else { '?' }
        $dts = ($last -split '\s+')[0]
        $stale = $false; try { $stale = ((Get-Date) - [datetimeoffset]::Parse($dts).LocalDateTime).TotalHours -gt 26 } catch {}
        $flag = if ($dv -eq 'RED') { '  <== ATTENTION: RED' } elseif ($stale) { '  <== STALE (>26h): check the 11:00 task' } else { '' }
        Write-Output ("  last daily:     {0}   [{1}]{2}" -f $dv, $dts, $flag)
      }
    }
  } catch {}

  # --- front door: the guided palette is the daily entry - no command memorizing (agenda #2) ---
  try {
    $lib = Get-Content -Raw (Join-Path $broHome 'tools\command-library.json') | ConvertFrom-Json
    $ro  = @($lib.commands | Where-Object { $_.mode -eq 'READ' -and $_.availability -in @('CLEAN-BUILD','PHASE-2','LIVE') -and $_.name -notin @('HELP','EXIT') } | ForEach-Object { $_.name })
    Write-Output "  FRONT DOOR:     pwsh tools/bro-palette.ps1   (menu -> preview -> YES; nothing critical without Gev)"
    if ($ro.Count) { Write-Output ("  read-live now:  {0}" -f ($ro -join '  ·  ')) }
  } catch {}

  Write-Output "============================================================="
  exit 0
} catch { exit 0 }
