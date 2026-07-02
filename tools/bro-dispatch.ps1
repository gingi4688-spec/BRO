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
if (-not (Test-Path $ProjectPath)) { [Console]::Error.WriteLine("bro-dispatch: path not found: $ProjectPath"); exit 2 }

# BOUNDED profile — NOT bypass. Edits auto-accept; only these Bash patterns auto-run; push/rm/hard-reset denied.
$allowed = @(
  'Edit','Write','Read','Grep','Glob',
  'Bash(git status:*)','Bash(git diff:*)','Bash(git log:*)','Bash(git branch:*)',
  'Bash(git checkout:*)','Bash(git switch:*)','Bash(git add:*)','Bash(git commit:*)','Bash(git restore:*)','Bash(git stash:*)',
  'Bash(npm run:*)','Bash(npm test:*)','Bash(npm ci)','Bash(npm install:*)','Bash(npx:*)','Bash(node:*)','Bash(pnpm:*)','Bash(yarn:*)',
  'Bash(ls:*)','Bash(cat:*)','Bash(pwd)'
)
$denied = @('Bash(git push:*)','Bash(rm:*)','Bash(git reset --hard:*)','Bash(git clean:*)')

if (-not $Task) {
  $Task = @'
You are this project's Bro, dispatched to continue the work autonomously (bounded).
1) Read your CLAUDE.md, brain (bro/memory), and your handoff / bro/AUTOPILOT-PLAN.md to see where the project stands and what is next.
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
$origBranch = (& git rev-parse --abbrev-ref HEAD 2>$null)
$stashed = $false
try {
  # Auto-set-aside Gev's pre-existing WIP so it can NEVER block the dispatched Bro's commits (e.g. a prettier
  # pre-commit gate), then restore it byte-identical after. Nothing lost; Gev is NEVER asked; the Bro's branch
  # stays pure (no WIP mixed in). This is the "all automatic, only push on Gev" rule made structural.
  if (@(& git status --porcelain 2>$null).Count -gt 0) {
    & git stash push -u -m "bro-dispatch: pre-dispatch WIP (auto)" 2>&1 | Out-Null
    $stashed = ($LASTEXITCODE -eq 0)
    if ($stashed) { Write-Host "bro-dispatch: set aside pre-existing WIP (git stash) - will restore after." }
  }
  Write-Host "bro-dispatch: BOUNDED Bro in $ProjectPath (edits auto; git add/commit/branch allowed; push+rm denied; NO push)."
  & claude @claudeArgs
} finally {
  if ($stashed) {
    if ($origBranch) { & git checkout $origBranch 2>&1 | Out-Null }   # return to the WIP's home branch
    & git stash pop 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { Write-Host "bro-dispatch: restored pre-existing WIP (git stash pop)." }
    else { Write-Host "bro-dispatch: WIP restore hit a conflict - WIP is PRESERVED in git stash (recover: git stash list/pop). Nothing lost." }
  }
  Pop-Location
}
exit 0
