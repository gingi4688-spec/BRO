<#
  bro-dispatch.ps1 — BOUNDED headless dispatch of a project's OWN Bro (autopilot Live; Gev: "bounded")
  EN: Runs `claude -p` inside <ProjectPath> under a BOUNDED permission profile — explicitly NOT bypassPermissions:
      --permission-mode acceptEdits (auto-accept file edits) + an ALLOWLIST (git add/commit/branch/status/diff/log +
      safe build/test) + a DENYLIST (git push, rm, hard reset/clean). Push is ALSO structurally blocked by the
      project's critical-command-gate hook. The dispatched Bro works on a NEW branch, commits LOCALLY, never pushes;
      Gev reviews + token-pushes. Isolation-safe: this only LAUNCHES the project's own Bro inside its own boundary.
  HY: `claude -p`-ն վազեցնում է <ProjectPath>-ի ներսում BOUNDED permission-ով — ՈՉ bypass. acceptEdits + allowlist
      (git add/commit/branch + safe build) + denylist (push, rm, hard reset)։ Push-ը hook-ն էլ block ա անում։ Bro-ն
      նոր branch-ի վրա, local commit, no push։ Gev-ը review + token-push։
  Params: -ProjectPath <abs> (required) · -Task <string> (default = continue per handoff/plan) ·
          -Foreground (run + wait in THIS console; default = detached hidden window).
  Exit: 0 dispatched/ran · 2 bad input.
#>
[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$ProjectPath,
  [string]$Task = ''
)
$ErrorActionPreference = 'Stop'
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
if (-not (Test-Path $ProjectPath)) { [Console]::Error.WriteLine("bro-dispatch: path not found / ուղին չգտնվեց: $ProjectPath"); exit 2 }

# BOUNDED profile — NOT bypass. Edits auto-accept; only these Bash patterns auto-run; push/rm/hard-reset denied.
$allowed = @(
  'Edit','Write','Read','Grep','Glob',
  'Bash(git status:*)','Bash(git diff:*)','Bash(git log:*)','Bash(git branch:*)',
  'Bash(git checkout:*)','Bash(git switch:*)','Bash(git add:*)','Bash(git commit:*)','Bash(git restore:*)',
  'Bash(npm run:*)','Bash(npm test:*)','Bash(npm ci)','Bash(npm install:*)','Bash(npx:*)','Bash(node:*)','Bash(pnpm:*)','Bash(yarn:*)',
  'Bash(ls:*)','Bash(cat:*)','Bash(pwd)'
)
# git stash denied to the agent so OUR pre-dispatch stash stays stash@{0} (reliable restore). git push denied at the
# tool layer AND structurally neutralised below (pushUrl disabled) so node/npm/aliased/quoted pushes cannot publish.
$denied = @('Bash(git push:*)','Bash(git stash:*)','Bash(rm:*)','Bash(git reset --hard:*)','Bash(git clean:*)')

if (-not $Task) {
  $Task = @'
You are this project's Bro, dispatched to continue the work autonomously (bounded).
1) Read your CLAUDE.md, brain (bro/memory), your handoff, and your AUTOPILOT-PLAN.md (at the repo ROOT or bro/AUTOPILOT-PLAN.md) to see where things stand and what is next.
2) Create/switch to a NEW branch "autopilot/continue" (never commit to main directly).
3) Do the next bounded item(s) from the handoff/plan.
4) Verify your changes (build/test/lint as appropriate).
5) Stage ONLY the files you changed (explicit paths; NEVER "git add -A" / "git add ."), then commit locally with a clear message.
6) DO NOT push — push is Gev-token-gated. Leave commits local on the branch.
7) Work NON-STOP and AUTONOMOUSLY — do NOT ask Gev questions; the ONLY thing reserved for Gev is PUSH. Handle blockers yourself within your bounds; if you truly cannot proceed, commit what you have and stop with a short summary. (Gev's pre-existing WIP is automatically set aside before you start and restored after — you do not need to manage or protect it.)
8) Obey all your laws, including L13 (ZERO hardcode — every design value via a design token, every user-facing string via an i18n/language token).
9) At a natural stopping point, STOP and print a short summary of what you did and what remains.
'@
}

$claudeArgs = @('-p', $Task, '--permission-mode', 'acceptEdits', '--allowedTools') + $allowed + @('--disallowedTools') + $denied

# Runs claude in THIS process (foreground). For parallel/detached use, the CALLER wraps this in Start-Process
# (e.g. the autopilot: Start-Process pwsh -File tools/bro-dispatch.ps1 -ProjectPath <p> -WindowStyle Hidden).
Push-Location $ProjectPath

# SELF-HEAL: a prior dispatch KILLED mid-run (e.g. a tool-timeout) never runs its finally, leaving (a) the push URL
# disabled and (b) Gev's WIP stashed. Detect + heal BEFORE we capture/disable anything below — otherwise this run
# would capture the sentinel as the "original" push URL and faithfully restore the poison. Nothing is ever lost:
# the leftover stash is popped only when the tree is clean (no conflict risk), else flagged as recoverable.
try {
  $curPush = (& git config --get remote.origin.pushurl 2>$null)
  if ("$curPush" -eq 'DISABLED-BY-BRO-DISPATCH-NO-PUSH') {
    & git config --unset-all remote.origin.pushurl 2>&1 | Out-Null
    Write-Host "bro-dispatch: SELF-HEAL - cleared a leftover disabled push URL from a killed prior run."
  }
  $topStash = (& git stash list 2>$null | Select-Object -First 1)
  if ("$topStash" -match 'bro-dispatch: pre-dispatch WIP \(auto\)') {
    if (@(& git status --porcelain 2>$null).Count -eq 0) {
      & git stash pop --index 2>&1 | Out-Null
      if ($LASTEXITCODE -eq 0) { Write-Host "bro-dispatch: SELF-HEAL - restored Gev's WIP left stashed by a killed prior run." }
      else { & git stash pop 2>&1 | Out-Null; Write-Host "bro-dispatch: SELF-HEAL - restored leftover WIP (content; index reapply skipped)." }
    } else {
      Write-Host "bro-dispatch: SELF-HEAL - a prior run's WIP is recoverable in 'git stash' (not auto-popped: tree is dirty). Recover: git stash pop."
    }
  }
} catch {}

$origBranch  = (& git rev-parse --abbrev-ref HEAD 2>$null)
$stashed     = $false
$hadPushUrl  = $false; $origPushUrl = ''
try {
  # STRUCTURAL NO-PUSH: disable this repo's push URL for the whole dispatch, so NO command the agent runs can
  # publish — not `git push`, not a node/npm child process, not a quoted `bash -c "git push"`, not an alias.
  # This is the real "never push" guarantee; it does not depend on command-pattern matching. Restored below.
  try { $origPushUrl = (& git config --get remote.origin.pushurl 2>$null); $hadPushUrl = -not [string]::IsNullOrEmpty("$origPushUrl") } catch {}
  & git remote set-url --push origin 'DISABLED-BY-BRO-DISPATCH-NO-PUSH' 2>&1 | Out-Null

  # Auto-set-aside Gev's pre-existing WIP so it can NEVER block the dispatched Bro's commits (e.g. a prettier
  # pre-commit gate); restore it after. The agent is denied `git stash`, so OUR stash stays stash@{0}. Nothing lost.
  if (@(& git status --porcelain 2>$null).Count -gt 0) {
    & git stash push -u -m "bro-dispatch: pre-dispatch WIP (auto)" 2>&1 | Out-Null
    $stashed = ($LASTEXITCODE -eq 0)
    if ($stashed) { Write-Host "bro-dispatch: set aside pre-existing WIP (git stash) - will restore after." }
  }
  Write-Host "bro-dispatch: BOUNDED Bro in / ՍԱՀՄԱՆԱՓԱԿ Bro-ն $ProjectPath (edits auto; git add/commit/branch allowed; push structurally disabled; stash/rm denied / edit-ը auto, push-ը structural-ապես անջատված, stash/rm արգելված)."
  & claude @claudeArgs
} finally {
  # 1) ALWAYS return to the WIP's home branch — the clean-tree case ALSO leaves us on the agent's branch, which
  #    would otherwise let the next scheduled run execute unreviewed agent code from that checkout.
  if ($origBranch -and $origBranch -ne 'HEAD') {
    & git checkout $origBranch 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) { Write-Host "bro-dispatch: WARN - could not return to '$origBranch' (agent left uncommitted work on its branch); staying put." }
  }
  # 2) Restore Gev's WIP ONLY if we are confirmed back on the home branch (else it would land on the agent branch);
  #    otherwise leave it safely in the stash. --index keeps the staged/unstaged split. WIP is never lost.
  if ($stashed) {
    if ((& git rev-parse --abbrev-ref HEAD 2>$null) -eq $origBranch) {
      & git stash pop --index 2>&1 | Out-Null
      if ($LASTEXITCODE -eq 0) { Write-Host "bro-dispatch: restored pre-existing WIP (git stash pop --index)." }
      else { & git stash pop 2>&1 | Out-Null; if ($LASTEXITCODE -eq 0) { Write-Host "bro-dispatch: restored WIP (content; index reapply skipped)." } else { Write-Host "bro-dispatch: WIP restore conflict - WIP PRESERVED in git stash (git stash list/pop). Nothing lost." } }
    } else { Write-Host "bro-dispatch: not on '$origBranch' - WIP left safely in git stash (recover: git stash list/pop). Nothing lost." }
  }
  # 3) Restore the push URL exactly as it was.
  if ($hadPushUrl) { & git remote set-url --push origin "$origPushUrl" 2>&1 | Out-Null }
  else { & git config --unset-all remote.origin.pushurl 2>&1 | Out-Null }
  Pop-Location
}
exit 0
