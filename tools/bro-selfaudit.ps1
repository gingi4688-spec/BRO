<#
  bro-selfaudit.ps1 — Main-Bro continuous self-audit aggregator (READ-ONLY) · agenda #3
  EN: ONE command that runs the read-only integrity trio — doctor + audit + beast (full factory regression) —
      captures each verdict + exit, and prints ONE consolidated GREEN/YELLOW/RED so the Main Bro continuously
      proves its own integrity. Delegates only to read-only checks; changes nothing itself.
      DIRTY-TREE-AWARE: uncommitted work is YELLOW (work-in-progress), never a false RED — a beast/doctor failure
      caused SOLELY by a dirty tree is not an integrity defect.
  HY: ՄԵԿ հրաման, որ վազեցնում է read-only integrity եռյակը՝ doctor + audit + beast, հավաքում ամեն verdict + exit,
      ու տպում ՄԵԿ consolidated GREEN/YELLOW/RED, որ Main Bro-ն շարունակ ապացուցի իր ամբողջականությունը։ Միայն
      read-only; ինքը ոչինչ չի փոխում։ DIRTY-TREE-AWARE՝ չկոմիտ արած աշխատանքը YELLOW է, ոչ երբեք false RED։
  Usage:  pwsh ./tools/bro-selfaudit.ps1            # full: doctor + audit + beast
          pwsh ./tools/bro-selfaudit.ps1 -Quick     # fast: doctor + audit only (skip beast)
  Exit:   0 GREEN · 1 YELLOW (healthy, tree dirty) · 2 RED (real integrity failure).
#>
[CmdletBinding()]
param([switch]$Quick, [switch]$Log, [switch]$Notify)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
# L0/F1: emit UTF-8 so the bilingual (Armenian) output renders instead of '???' on legacy-codepage consoles.
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}

function Invoke-Check([string]$file, [string[]]$argv) {
  # Run a read-only check, return @{ exit; summary } — summary = its RESULT/BEAST RESULT line (ANSI-stripped).
  $out = & pwsh -NoProfile -File $file @argv 2>&1
  $ex  = $LASTEXITCODE
  $clean = @($out | ForEach-Object { "$_" -replace "\x1b\[[0-9;]*m", '' })
  $sum = ($clean | Where-Object { $_ -match '(?i)^(BEAST )?RESULT:' } | Select-Object -Last 1)
  $failed = ($clean | Where-Object { $_ -match '(?i)^FAILED:' } | Select-Object -Last 1)
  return [pscustomobject]@{ exit = $ex; summary = ("$sum").Trim(); failed = ("$failed").Trim(); raw = $clean }
}

# tree state (read-only) — dirty = uncommitted work in the governance repo
$porcelain = @(git status --porcelain 2>$null)
$treeDirty = ($porcelain.Count -gt 0)

Write-Host ""
Write-Host "bro-selfaudit — Main Bro continuous integrity (READ-ONLY)"
Write-Host "                Գլխավոր Bro-ի շարունակական ամբողջականություն (READ-ONLY)"
Write-Host ("  BRO_HOME: {0}" -f (Get-Location).Path)
Write-Host ("  scope:    {0}" -f $(if ($Quick) { 'doctor + audit (quick / արագ)' } else { 'doctor + audit + beast (full / լրիվ)' }))
Write-Host ("--------------------------------------------------------------")

$doctor = Invoke-Check 'tools/bro-doctor.ps1' @()
Write-Host ("  doctor        exit={0}   {1}" -f $doctor.exit, $doctor.summary)

$audit = Invoke-Check 'tools/bro-audit.ps1' @()
Write-Host ("  audit         exit={0}   {1}" -f $audit.exit, $audit.summary)

$beast = $null
if (-not $Quick) {
  $beast = Invoke-Check 'tools/bro-beast-check.ps1' @()
  Write-Host ("  beast         exit={0}   {1}" -f $beast.exit, $beast.summary)
  if ($beast.exit -ne 0 -and $beast.failed) { Write-Host ("                {0}" -f $beast.failed) }
}

Write-Host ("  tree          {0}" -f $(if ($treeDirty) { "DIRTY / ԿԵՂՏՈՏ ($($porcelain.Count) uncommitted)" } else { 'CLEAN / ՄԱՔՈՒՐ' }))
Write-Host ("--------------------------------------------------------------")

# --- verdict policy ---
# A failure is a REAL integrity defect unless it is explained solely by a dirty tree.
$doctorReal = ($doctor.exit -ge 2)                 # exit 1 = warnings-only (dirty tree) => not real
$auditReal  = ($audit.exit -ne 0)                  # audit ignores tree state; any non-zero is real
$beastReal  = $false
if ($beast -and $beast.exit -ne 0) {
  # beast fails 'git state' + 'SuperBro doctor' purely from a dirty tree; anything else is a real failure
  $names = @()
  if ($beast.failed) { $names = ($beast.failed -replace '(?i)^FAILED:\s*', '') -split '\s*;\s*' | ForEach-Object { $_.Trim() } | Where-Object { $_ } }
  $extra = @($names | Where-Object { $_ -notmatch 'git state' -and $_ -notmatch 'SuperBro doctor' })
  $beastReal = -not ($treeDirty -and $extra.Count -eq 0)
}

if ($doctorReal -or $auditReal -or $beastReal) { $verdict = 'RED';    $code = 2; $msgEn = 'real integrity failure. Investigate the failing check above (NOT a dirty-tree artifact).'; $msgHy = 'իրական ամբողջականության ձախողում։ Հետազոտիր վերևի ձախողվող check-ը (ՈՉ dirty-tree artifact)։' }
elseif ($treeDirty)                            { $verdict = 'YELLOW'; $code = 1; $msgEn = 'Bro is structurally healthy; uncommitted work in the tree (commit to reach GREEN).'; $msgHy = 'Bro-ն կառուցվածքային առողջ է. tree-ում չկոմիտ արած աշխատանք կա (commit արա՝ GREEN-ի հասնելու համար)։' }
else                                           { $verdict = 'GREEN';  $code = 0; $msgEn = 'Main Bro proves its own integrity (clean tree, all checks pass).'; $msgHy = 'Գլխավոր Bro-ն ապացուցում է իր ամբողջականությունը (մաքուր tree, բոլոր check-երն անցնում են)։' }

Write-Host ("OVERALL: {0} — {1}" -f $verdict, $msgEn)
Write-Host ("                 {0}" -f $msgHy)
$stamp = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"

# -Log: append ONE timestamped verdict line to logs/selfaudit-heartbeat.log (gitignored via *.log, so it never
# dirties the tree). Used by the scheduled daily heartbeat (tools/bro-schedule.ps1). Best-effort; never fails the run.
if ($Log) {
  try {
    $sha   = (git rev-parse --short HEAD 2>$null)
    $bpart = if ($beast) { "beast=$($beast.exit)" } else { 'beast=skip' }
    $line  = "$stamp  $verdict  doctor=$($doctor.exit) audit=$($audit.exit) $bpart tree=$(if ($treeDirty) { 'DIRTY' } else { 'CLEAN' }) commit=$sha"
    Add-Content -Path (Join-Path (Get-Location) 'logs\selfaudit-heartbeat.log') -Value $line -Encoding utf8
  } catch {}
}

# -Notify: on a REAL integrity failure (RED) only, proactively alert Gev at the OS level (best-effort; for the
# unattended daily 11:00 task). YELLOW = dirty tree = normal work-in-progress and does NOT alert. The reliable
# channel is the session-open front door, which always surfaces the last daily verdict.
if ($Notify -and $verdict -eq 'RED') {
  $alert = "Bro self-audit RED @ ${stamp}: integrity failure / ամբողջականության ձախողում. Open Bro and run RUN SELF-AUDIT."
  try { & msg.exe * "/TIME:180" $alert 2>$null } catch {}
}
exit $code
