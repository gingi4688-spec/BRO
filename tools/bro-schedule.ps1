<#
  bro-schedule.ps1 — register / status / remove the Main-Bro daily self-audit heartbeat (Windows Scheduled Task) · Gev-gated
  EN: -Register creates a DAILY Scheduled Task 'BroSelfAudit' at -Time that runs the FULL self-audit
      (doctor + audit + beast) and appends a one-line verdict to logs/selfaudit-heartbeat.log (gitignored via
      *.log, so the heartbeat NEVER dirties the tree). Runs as the CURRENT user with Interactive logon (no stored
      password, no admin) and StartWhenAvailable (catches up if the PC was off at the scheduled time). -Status is
      read-only. -Register/-Remove change the machine's task store => require BRO_GEV_APPROVED=1 (Gev's explicit
      command), mirrored by the critical-command-gate.
  HY: -Register ստեղծում է ամենօրյա 'BroSelfAudit' task -Time-ին, որ վազում է full self-audit ու գրում մեկ տող
      logs/selfaudit-heartbeat.log-ում (gitignored՝ tree-ն երբեք չի կեղտոտում)։ Վազում է current user-ով,
      Interactive logon (ոչ password, ոչ admin), StartWhenAvailable։ -Status = read-only։ -Register/-Remove =>
      BRO_GEV_APPROVED=1 (Գևի բացահայտ հրաման, mirror-ված critical-command-gate-ով)։
  EXIT: 0 ok · 2 bad input · 3 refused (no Gev approval) · 5 scheduler error.
#>
[CmdletBinding()]
param(
  [string]$Time = '11:00',
  [switch]$Register,
  [switch]$Remove,
  [switch]$Status
)
$ErrorActionPreference = 'Stop'
$broHome  = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$taskName = 'BroSelfAudit'
function Fail([string]$m, [int]$c) { [Console]::Error.WriteLine($m); exit $c }

function Show-Status {
  try {
    $t = Get-ScheduledTask -TaskName $taskName -ErrorAction Stop
    $info = Get-ScheduledTaskInfo -TaskName $taskName -ErrorAction SilentlyContinue
    $trig = @($t.Triggers)[0]
    Write-Host "  BroSelfAudit scheduled task: PRESENT"
    Write-Host ("    state:     {0}" -f $t.State)
    if ($trig) { Write-Host ("    starts:    {0}" -f $trig.StartBoundary) }
    if ($info) {
      Write-Host ("    last run:  {0}  (result {1})" -f $info.LastRunTime, $info.LastTaskResult)
      Write-Host ("    next run:  {0}" -f $info.NextRunTime)
    }
    Write-Host  "    log:       logs/selfaudit-heartbeat.log"
  } catch {
    Write-Host "  BroSelfAudit scheduled task: NOT registered.  (register: bro-schedule.ps1 -Register -Time 11:00, BRO_GEV_APPROVED=1)"
  }
}

# ---- -Status : read-only, no gate ----
if ($Status -or (-not $Register -and -not $Remove)) { Show-Status; exit 0 }

# ---- mutating actions require Gev's explicit approval ----
if ($env:BRO_GEV_APPROVED -ne '1') {
  Fail "REFUSED: -Register/-Remove change the machine task store — requires Gev's explicit approval (BRO_GEV_APPROVED=1)." 3
}

if ($Remove) {
  try {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false -ErrorAction Stop
    Write-Host "  REMOVED scheduled task 'BroSelfAudit'. The daily heartbeat is off."
    exit 0
  } catch { Fail "scheduler error (remove): $($_.Exception.Message)" 5 }
}

# ---- -Register : create/refresh the daily task ----
if ($Time -notmatch '^\d{1,2}:\d{2}$') { Fail "REFUSED: -Time must be HH:mm 24h (e.g. 11:00), got '$Time'." 2 }
$pwsh = (Get-Command pwsh -ErrorAction SilentlyContinue).Source
if (-not $pwsh) { $pwsh = (Get-Command powershell -ErrorAction SilentlyContinue).Source }
if (-not $pwsh) { Fail "scheduler error: no pwsh/powershell on PATH to run the task." 5 }
$script = Join-Path $broHome 'tools\bro-selfaudit.ps1'
try {
  $action  = New-ScheduledTaskAction -Execute $pwsh -Argument ("-NoProfile -File `"$script`" -Log -Notify") -WorkingDirectory $broHome
  $trigger = New-ScheduledTaskTrigger -Daily -At $Time
  $set     = New-ScheduledTaskSettingsSet -StartWhenAvailable -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan -Minutes 10)
  $prin    = New-ScheduledTaskPrincipal -UserId ("{0}\{1}" -f $env:USERDOMAIN, $env:USERNAME) -LogonType Interactive -RunLevel Limited
  Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $set -Principal $prin `
    -Description "Bro Main-Bro daily self-audit heartbeat (doctor + audit + beast); verdict -> logs/selfaudit-heartbeat.log" -Force | Out-Null
  Write-Host ("  REGISTERED daily scheduled task 'BroSelfAudit' at {0} (current user, runs when logged on)." -f $Time)
  Write-Host ("  action:  {0} -NoProfile -File `"{1}`" -Log -Notify" -f $pwsh, $script)
  Write-Host  "  log:     logs/selfaudit-heartbeat.log (gitignored — never dirties the tree)"
  Write-Host  "  manage:  bro-schedule.ps1 -Status   |   -Remove (BRO_GEV_APPROVED=1)"
  exit 0
} catch { Fail "scheduler error (register): $($_.Exception.Message)" 5 }
