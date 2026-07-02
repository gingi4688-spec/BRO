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
7) Do NOT touch, stage, or commit any pre-existing uncommitted files — they are Gev's WIP; leave them exactly as-is.
8) Obey all your laws, including L13 (ZERO hardcode — every design value via a design token, every user-facing string via an i18n/language token).
9) At a natural stopping point, STOP and print a short summary of what you did and what remains.
'@
}

$claudeArgs = @('-p', $Task, '--permission-mode', 'acceptEdits', '--allowedTools') + $allowed + @('--disallowedTools') + $denied

# Runs claude in THIS process (foreground). For parallel/detached use, the CALLER wraps this in Start-Process
# (e.g. the autopilot: Start-Process pwsh -File tools/bro-dispatch.ps1 -ProjectPath <p> -WindowStyle Hidden).
Push-Location $ProjectPath
try {
  Write-Host "bro-dispatch: BOUNDED Bro in $ProjectPath (edits auto; git add/commit/branch allowed; push+rm denied; NO push)."
  & claude @claudeArgs
} finally { Pop-Location }
exit 0
