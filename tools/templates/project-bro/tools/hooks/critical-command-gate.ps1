<#
  critical-command-gate.ps1 — PreToolUse hook (matcher: Bash|PowerShell) · Phase 2 + R-1 refinement (§8 / §8A / D0)
  EN: Blocks Gev-gated critical commands unless an explicit approval flag is present. Gated set:
        - a real `git push` (push = critical action for the governance repo, §8A), and
        - actual EXECUTION of a critical SuperBro script (bro-release / bro-promote / bro-register / bro-install /
          bro-update-spine) via `pwsh -File ...` or a direct command-position invocation.
      Approval flag = env BRO_GEV_APPROVED=1 OR the literal token BRO_GEV_APPROVED=1 in the command.
      R-1 REFINEMENT: detection runs on a SCRUBBED copy of the command with heredoc bodies and quoted strings
      removed, and is anchored to actual command tokens / execution. So a critical word inside a commit message,
      prose, comment, or a file-path argument (e.g. `git add tools/bro-register.ps1`) NO LONGER false-blocks.
  HY: Block Gev-gated critical command-ները առանց approval flag-ի՝ real `git push` ու critical SuperBro script-ի
      ԻՐԱԿԱՆ ԿԱՏԱՐՈՒՄ։ R-1 ՈՒՂՂՈՒՄ՝ detection-ը scrubbed command-ի վրա է (heredoc + quoted string հանված) ու
      anchored է actual command token-ին -> commit-message/prose/path-ում critical բառը այլևս չի false-block անում։
  SAFETY: fail-OPEN on error (exit 0); deny only on a confirmed gated command without approval. Allow=0, Deny=2.
          Does NOT touch git commit/add/status or generic file ops.
#>
try {
  $raw = [Console]::In.ReadToEnd()
  if (-not $raw) { exit 0 }
  $j = $raw | ConvertFrom-Json
  $tool = "$($j.tool_name)"
  if ($tool -ne 'Bash' -and $tool -ne 'PowerShell') { exit 0 }
  $cmd = "$($j.tool_input.command)"
  if (-not $cmd) { exit 0 }

  # approval check on the RAW command (the env-prefix token is not inside a string)
  $approved = ($env:BRO_GEV_APPROVED -eq '1') -or ($cmd -match 'BRO_GEV_APPROVED=1')
  if ($approved) { exit 0 }

  # R-1 scrub: remove heredoc bodies, then double-quoted, then single-quoted strings,
  # so critical words inside commit messages / prose / -m "..." cannot be mistaken for commands.
  $scrub = $cmd
  $scrub = [regex]::Replace($scrub, "(?s)<<-?\s*['""]?(\w+)['""]?.*?\r?\n\1\b", ' ')
  $scrub = [regex]::Replace($scrub, '"[^"]*"', ' ')
  $scrub = [regex]::Replace($scrub, "'[^']*'", ' ')

  # 1) real git push (anchored: a git ... push command segment, no separator between)
  $isPush = $scrub -match '(?i)\bgit\b[^\n;|&]*\bpush\b'
  # 2) actual execution of a critical script (via -File, or at a command position) - NOT a mere path argument
  $crit = 'bro-(release|promote|register|install|update-spine|new-project|wire-root)\.ps1'
  $execViaFile = $scrub -match ("(?i)-File\b[^\n;|&]*\b" + $crit)
  $execAtStart = $scrub -match ("(?im)(^|[;&|]|&&|\|\|)\s*&?\s*(\.?[\\/])?(tools[\\/])?" + $crit)
  $isCriticalScript = $execViaFile -or $execAtStart

  if (-not ($isPush -or $isCriticalScript)) { exit 0 }

  $which = if ($isPush) { 'git push (push = Gev-gated critical action, §8A)' } else { 'critical SuperBro script execution' }
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
  # Project Bro evidence lives under <home>\logs\ (protected by log-append-only-guard); NOT memory\_own\ (SuperBro-only). / Project Bro-ի evidence-ը <home>\logs\-ում է (log-append-only-guard-ով պաշտպանված), ՈՉ memory\_own\ (միայն SuperBro)։
  $hbPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_HOOKBLOCKS_PATH) { $env:BRO_HOOKBLOCKS_PATH } else { Join-Path $broHome 'logs\hook-blocks.md' }
  try { Add-Content -Path $hbPath -Value $entry -Encoding utf8 } catch {}
  [Console]::Error.WriteLine("DENIED by critical-command-gate: $which requires explicit Gev approval (BRO_GEV_APPROVED=1).")
  exit 2
} catch { exit 0 }

