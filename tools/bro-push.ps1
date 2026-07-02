<#
  bro-push.ps1 — push ANY bro's work with Gev's token (Gev: "all bros push with my token"). Gev-gated.
  EN: The one reusable push path for every bro. It AUTO-STASHES Gev's pre-existing WIP so a project's pre-push gate
      (which refuses a dirty tree) can never block the push, PUSHES the branch, then RESTORES the WIP byte-identical.
      The project's pre-push quality gate (tsc/vitest/pytest) still runs and still protects — a real gate failure is
      reported, NOT silently bypassed. -NoVerify skips the gate ONLY with an explicit recorded reason (Gev's call).
      Requires BRO_GEV_APPROVED=1 (Gev's token), mirrored by the critical-command-gate.
  HY: Բոլոր բռոների ՄԵԿ push-ուղին։ Auto-stash անում է Gev-ի WIP-ը (որ pre-push gate-ը dirty-tree-ի վրա push-ը block չանի),
      push անում branch-ը, հետո byte-identical restore։ Project-ի quality gate-ը (tsc/vitest/pytest) դեռ վազում ա ու
      դեռ պաշտպանում — իրական gate-fail-ը REPORT ա, ոչ լուռ bypass։ -NoVerify = gate-ը շրջանցել ՄԻԱՅՆ գրառված
      պատճառով (Gev-ի call)։ Պահանջում է BRO_GEV_APPROVED=1։
  EXIT: 0 pushed · 2 bad input · 3 refused (no token) · 5 push failed (gate red / remote error — WIP restored).
#>
[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$ProjectPath,
  [string]$Branch = '',
  [string]$Remote = 'origin',
  [switch]$NoVerify,
  [string]$Reason = ''
)
$ErrorActionPreference = 'Stop'
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
function Fail([string]$m, [int]$c) { [Console]::Error.WriteLine($m); exit $c }
if (-not (Test-Path $ProjectPath)) { Fail "bro-push: path not found: $ProjectPath" 2 }
if ($env:BRO_GEV_APPROVED -ne '1') { Fail "bro-push: REFUSED — push is Gev-gated; requires BRO_GEV_APPROVED=1 (Gev's token)." 3 }
if ($NoVerify -and -not $Reason)   { Fail "bro-push: REFUSED — -NoVerify requires -Reason (recorded justification for skipping the pre-push gate)." 2 }

Push-Location $ProjectPath
# SELF-HEAL: if a prior bro-push was KILLED mid-run, Gev's WIP may be left in a "bro-push: pre-push WIP (auto)"
# stash. Restore it now (when the tree is clean, no conflict risk) BEFORE we stash again, so it is never buried/lost.
try {
  $topStash = (& git stash list 2>$null | Select-Object -First 1)
  if (("$topStash" -match 'bro-push: pre-push WIP \(auto\)') -and (@(& git status --porcelain 2>$null).Count -eq 0)) {
    & git stash pop --index 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { Write-Host "bro-push: SELF-HEAL - restored Gev's WIP left stashed by a killed prior run." }
  }
} catch {}
$stashed = $false
try {
  if (-not $Branch) { $Branch = (& git rev-parse --abbrev-ref HEAD 2>$null) }
  if (-not $Branch -or $Branch -eq 'HEAD') { Pop-Location; Fail "bro-push: could not determine a branch to push (detached HEAD?) — pass -Branch." 2 }

  # 1) auto-stash Gev's WIP so the pre-push clean-tree assertion can't block the push; restored in finally.
  if (@(& git status --porcelain 2>$null).Count -gt 0) {
    & git stash push -u -m "bro-push: pre-push WIP (auto)" 2>&1 | Out-Null
    $stashed = ($LASTEXITCODE -eq 0)
    if ($stashed) { Write-Host "bro-push: set aside Gev's WIP (git stash) — will restore after." }
  }

  # 2) push. The project's pre-push gate runs (unless -NoVerify with a reason). Capture output + exit.
  $pushArgs = @('push')
  if ($NoVerify) { $pushArgs += '--no-verify'; Write-Host "bro-push: -NoVerify — SKIPPING the project's pre-push gate. Reason: $Reason" }
  $pushArgs += @($Remote, $Branch)
  Write-Host ("bro-push: git {0}" -f ($pushArgs -join ' '))
  $out = & git @pushArgs 2>&1
  $ok  = ($LASTEXITCODE -eq 0)
  $out | ForEach-Object { Write-Host "  $_" }
}
finally {
  # 3) ALWAYS restore Gev's WIP (byte-identical, staged/unstaged split via --index). Never lost.
  if ($stashed) {
    & git stash pop --index 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { Write-Host "bro-push: restored Gev's WIP." }
    else { & git stash pop 2>&1 | Out-Null; if ($LASTEXITCODE -eq 0) { Write-Host "bro-push: restored WIP (content; index reapply skipped)." } else { Write-Host "bro-push: WIP restore conflict — WIP PRESERVED in git stash (git stash list/pop). Nothing lost." } }
  }
  Pop-Location
}

if ($ok) { Write-Host "bro-push: PUSHED / ՀՐԱՊԱՐԱԿՎԱԾ $Branch -> $Remote."; exit 0 }
else { Write-Host "bro-push: PUSH FAILED / PUSH-Ը ՁԱԽՈՂՎԵՑ — likely the project's pre-push quality gate is RED (tsc/vitest/pytest) or a remote error / հավանաբար pre-push gate-ը RED է կամ remote error. Fix the gate, or re-run with -NoVerify -Reason '<why>' / ուղղիր gate-ը կամ -NoVerify -Reason-ով վազացրու. Gev's WIP is restored / Gev-ի WIP-ը վերականգնված է."; exit 5 }
