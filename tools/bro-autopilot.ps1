<#
  bro-autopilot.ps1 — Main-Bro daily autopilot orchestrator (Gev: run every 11:00, don't wait for me)
  FLOW (unattended): self-check -> safe self-fix -> dispatch each project's PENDING planned work -> briefing + notify.
    - IDEMPOTENT: "already done" is tracked INSIDE each plan (a task is pending only while unchecked "- [ ]"); a
      project with nothing unchecked is a no-op, so re-runs never redo finished work.
    - ISOLATION-safe (L8/B4): SuperBro does NOT read a project's internals. In Live mode it LAUNCHES a bounded agent
      INSIDE the project (its own sealed boundary) to do its OWN next task + commit. SuperBro reads only its OWN plan.
    - NEVER pushes: every commit stays LOCAL for Gev to review + token-push (push = Gev-gated, D0). This is the one
      human checkpoint Gev kept — nothing goes public without his token; git keeps everything (nothing lost).
    - SELF-CHECK GATE: if Bro's own self-check is RED, dispatch is HALTED (don't build project work on a broken base).
  MODES:
    -Mode Observe (DEFAULT, SAFE) = decide + report only; launches nothing, changes nothing (except the gitignored briefing).
    -Mode Live                    = actually dispatch. Default Live = headless `claude -p` per project (unattended).
    -Windows (with -Mode Live)    = open a VS Code window per project instead (watch mode).
    -Notify                       = OS alert on a RED self-check (best-effort).
  Exit: 0 ok · 3 self-check RED (dispatch halted).
#>
[CmdletBinding()]
param(
  [ValidateSet('Observe','Live')][string]$Mode = 'Observe',
  [switch]$Windows,
  [switch]$Notify
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$broHome = (Get-Location).Path
$stamp = Get-Date -Format 'yyyy-MM-ddTHH:mm:sszzz'
$date  = Get-Date -Format 'yyyy-MM-dd'
$brief = @("# Bro autopilot briefing — $stamp", "", "mode: $Mode")

# 1) self-check (Bro's own integrity) --------------------------------------------------------------
$sa = & pwsh -NoProfile -File 'tools/bro-selfaudit.ps1' -Quick -Log 2>&1
$verdictLine = (@($sa | ForEach-Object { "$_" -replace "\x1b\[[0-9;]*m", '' } | Where-Object { $_ -match '^OVERALL:' }) | Select-Object -Last 1)
$isRed = "$verdictLine" -match 'OVERALL:\s*RED'
$brief += "", "## self-check", "  $verdictLine"

if ($isRed) {
  $brief += "", "## DISPATCH HALTED", "  Bro's own self-check is RED — fix Bro before dispatching project work."
  if ($Notify) { try { & msg.exe * "/TIME:180" "Bro autopilot HALTED: self-check RED. Open Bro -> RUN SELF-AUDIT." 2>$null } catch {} }
  $brief -join "`r`n" | Set-Content -Path "logs\autopilot-briefing-$date.md" -Encoding utf8
  Write-Host ($brief -join "`n")
  exit 3
}

# 2) safe self-fix (narrow allowlist; reversible; logged) -------------------------------------------
# Only trivially-safe hygiene is auto-fixed; anything else is REPORTED, never guessed. Observe = report only.
$wouldFix = @()
foreach ($d in @('memory/_quarantine','spine/RELEASES','change-requests','_before','logs')) {
  $gk = Join-Path $d '.gitkeep'
  if ((Test-Path $d) -and -not (Test-Path $gk)) { $wouldFix += "restore $gk (tracked-empty dir lost its .gitkeep)" }
}
if ($Mode -eq 'Live' -and $wouldFix.Count) {
  foreach ($d in @('memory/_quarantine','spine/RELEASES','change-requests','_before','logs')) {
    $gk = Join-Path $d '.gitkeep'; if ((Test-Path $d) -and -not (Test-Path $gk)) { New-Item -ItemType File $gk | Out-Null }
  }
}
$brief += "", "## self-fix ($(if ($Mode -eq 'Live') { 'applied' } else { 'would apply' }))"
if ($wouldFix.Count) { $wouldFix | ForEach-Object { $brief += "  - $_" } } else { $brief += "  (nothing to fix)" }

# 3) dispatch per INSTALLED project ----------------------------------------------------------------
# Isolation-safe: launch each project's OWN agent to consult its OWN bro/AUTOPILOT-PLAN.md and do its next pending
# task + commit (no push). SuperBro never reads project internals.
$reg = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json
$targets = @($reg.projects | Where-Object { "$($_.status)" -eq 'INSTALLED' })
$brief += "", "## dispatch — INSTALLED projects: $($targets.Count)"
# Live dispatch goes through tools/bro-dispatch.ps1 = the BOUNDED profile (acceptEdits + git allowlist, push/rm
# denied AND hook-blocked). Each project's own Bro works on a branch, commits locally, never pushes.
$dispatchTool = Join-Path $broHome 'tools\bro-dispatch.ps1'
foreach ($p in $targets) {
  $pjid = "$($p.project_id)"; $pp = ("$($p.project_path)") -replace '/', '\'
  if (-not (Test-Path $pp)) { $brief += "  - ${pjid}: SKIP (path missing: $pp)"; continue }
  if ($Mode -eq 'Live') {
    try {
      if ($Windows) { Start-Process 'code' -ArgumentList "-n `"$pp`"" -ErrorAction Stop; $brief += "  - ${pjid}: opened VS Code window (watch mode)" }
      else { Start-Process 'pwsh' -ArgumentList '-NoProfile','-File',$dispatchTool,'-ProjectPath',$pp -WindowStyle Hidden -ErrorAction Stop; $brief += "  - ${pjid}: dispatched headless BOUNDED (own branch; commit; no push)" }
    } catch { $brief += "  - ${pjid}: dispatch FAILED ($($_.Exception.Message))" }
  } else {
    $brief += "  - ${pjid} [$pp]: WOULD dispatch BOUNDED (Observe — launched nothing)"
  }
}

# 4) Bro's OWN planned work (SuperBro's own boundary) ----------------------------------------------
$broPlan = Join-Path $broHome 'AUTOPILOT-PLAN.md'
if (Test-Path $broPlan) {
  $pending = @(Get-Content $broPlan | Where-Object { $_ -match '^\s*-\s*\[ \]' })
  $brief += "", "## Bro's own plan", "  pending items: $($pending.Count)"
  $pending | Select-Object -First 6 | ForEach-Object { $brief += "  $($_.Trim())" }
} else {
  $brief += "", "## Bro's own plan", "  (no AUTOPILOT-PLAN.md yet — nothing queued for Bro itself)"
}

# 5) briefing + notify (NEVER push) ----------------------------------------------------------------
$brief += "", "## push", "  NOTHING pushed — push stays Gev-token-gated (D0). Review the new local commits, then say 'token' (or: BRO_GEV_APPROVED=1 git push origin main)."
$briefPath = "logs\autopilot-briefing-$date.md"
$brief -join "`r`n" | Set-Content -Path $briefPath -Encoding utf8
Write-Host ($brief -join "`n")
Write-Host ""
Write-Host "briefing -> $briefPath   (mode=$Mode; push=never)"
exit 0
