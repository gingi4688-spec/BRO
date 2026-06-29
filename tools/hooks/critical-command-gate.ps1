<#
  critical-command-gate.ps1 — PreToolUse hook (matcher: Bash|PowerShell) · clean-build Phase 2 (§8 / §8A / D0)
  EN: Blocks Gev-gated critical commands unless an explicit approval flag is present. Gated set:
      - `git push` (push = critical action for the governance repo, §8A) — including --force/-f.
      - invoking a critical SuperBro script (bro-release / bro-promote / bro-register / bro-install /
        bro-update-spine) without approval.
      Approval flag = env BRO_GEV_APPROVED=1 OR the literal token BRO_GEV_APPROVED=1 in the command.
  HY: Block Gev-gated critical command-ները առանց բացահայտ approval flag-ի։ Gated՝ `git push` (push = critical,
      §8A), ու critical SuperBro script-երի invocation առանց approval։ Flag = env BRO_GEV_APPROVED=1 կամ token-ը command-ում։
  SAFETY: fail-OPEN on error (exit 0); deny only on a confirmed gated command without approval. Allow=0, Deny=2.
          Does NOT touch git commit/add/status or generic file ops — narrow by design.
#>
try {
  $raw = [Console]::In.ReadToEnd()
  if (-not $raw) { exit 0 }
  $j = $raw | ConvertFrom-Json
  $tool = "$($j.tool_name)"
  if ($tool -ne 'Bash' -and $tool -ne 'PowerShell') { exit 0 }
  $cmd = "$($j.tool_input.command)"
  if (-not $cmd) { exit 0 }

  $approved = ($env:BRO_GEV_APPROVED -eq '1') -or ($cmd -match 'BRO_GEV_APPROVED=1')
  if ($approved) { exit 0 }

  $isPush = $cmd -match '(?i)\bgit\b[^\n;|&]*\bpush\b'
  $isCriticalScript = $cmd -match '(?i)bro-(release|promote|register|install|update-spine)\.ps1'
  if (-not ($isPush -or $isCriticalScript)) { exit 0 }

  $which = if ($isPush) { 'git push (push = Gev-gated critical action, §8A)' } else { 'critical SuperBro script invocation' }
  $broHome = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
  $ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
  $sid = if ($j.session_id) { "$($j.session_id)" } else { 'n/a' }
  $entry = @(
    "",
    "## BLOCK - critical-command-gate",
    "``````txt",
    "timestamp: $ts",
    "actor: hook",
    "session_id: $sid",
    "action: CRITICAL_COMMAND_BLOCKED",
    "target: $($cmd.Substring(0, [Math]::Min(160, $cmd.Length)))",
    "source_command: $tool tool",
    "authority: hook",
    "result: BLOCKED",
    "reason: $which requires explicit Gev approval (set BRO_GEV_APPROVED=1)",
    "files_changed: none",
    "``````"
  )
  try { Add-Content -Path (Join-Path $broHome 'memory\_own\hook-blocks.md') -Value $entry -Encoding utf8 } catch {}
  [Console]::Error.WriteLine("DENIED by critical-command-gate: $which requires explicit Gev approval (BRO_GEV_APPROVED=1).")
  exit 2
} catch { exit 0 }
