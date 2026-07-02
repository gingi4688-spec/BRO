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
  SAFETY / FAIL POLICY (topist): fail-OPEN ONLY on un-parseable harness input (never brick a session). FAIL-CLOSED
          where it matters — a recognized critical command (release/promote/register/install/update-spine) or a real
          `git push` WITHOUT an explicit approval flag is DENIED by default (default-deny on critical). Approval =
          env BRO_GEV_APPROVED=1 OR the literal token in the command. Does NOT touch git commit/add/status or generic
          file ops. Allow=0, Deny=2.
#>
try {
  $raw = [Console]::In.ReadToEnd()
  if (-not $raw) { exit 0 }
  $j = $raw | ConvertFrom-Json
  $tool = "$($j.tool_name)"
  if ($tool -ne 'Bash' -and $tool -ne 'PowerShell') { exit 0 }
  $cmd = "$($j.tool_input.command)"
  if (-not $cmd) { exit 0 }

  # R-1 scrub: remove heredoc bodies, then double-quoted, then single-quoted strings, so critical words / the
  # approval token inside a commit message / prose / -m "..." cannot be mistaken for a command OR an approval.
  $scrub = $cmd
  $scrub = [regex]::Replace($scrub, "(?s)<<-?\s*['""]?(\w+)['""]?.*?\r?\n\1\b", ' ')
  $scrub = [regex]::Replace($scrub, '"[^"]*"', ' ')
  $scrub = [regex]::Replace($scrub, "'[^']*'", ' ')

  # approval: the session env var, OR the token on the SCRUBBED command — a token inside a quoted commit message /
  # prose was scrubbed away and must NOT self-approve (that was the bypass). Works for both `BRO_GEV_APPROVED=1 git
  # push` (bash) and `$env:BRO_GEV_APPROVED=1; ...` (pwsh), since both survive the scrub outside quotes.
  $approved = ($env:BRO_GEV_APPROVED -eq '1') -or ($scrub -match 'BRO_GEV_APPROVED=1')
  if ($approved) { exit 0 }

  # scan the bodies of -c / -Command / -e wrappers (bash -c "git push", node -e "...git push...") that the
  # quote-scrub just removed, so a wrapped/quoted push is still seen.
  $wrapperBodies = (([regex]::Matches($cmd, '(?is)(?:-c|-Command|-e)\s+(["''])(.*?)\1') | ForEach-Object { $_.Groups[2].Value }) -join "`n")

  # 1) real git push: `push` as a git SUBCOMMAND — NOT the `--push` flag, NOT `git remote set-url --push`.
  #    `(?<!-)` drops the flag; the raw check catches `git "push"`; the wrapper scan catches `bash -c "git push"`.
  $pushRe = '(?im)\bgit\b[^\n;|&]*?\s(?<!-)push\b'
  $isPush = ($scrub -match $pushRe) -or ($wrapperBodies -match $pushRe) -or ($cmd -match '(?i)\bgit\b\s+["'']?push\b')
  # 2) actual execution of a critical script (via -File, or at a command position) - NOT a mere path argument
  $crit = 'bro-(release|promote|register|install|update-spine|new-project|wire-root|cross-grant|schedule)\.ps1'
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
  $hbPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_HOOKBLOCKS_PATH) { $env:BRO_HOOKBLOCKS_PATH } else { Join-Path $broHome 'memory\_own\hook-blocks.md' }
  try { Add-Content -Path $hbPath -Value $entry -Encoding utf8 } catch {}
  [Console]::Error.WriteLine("DENIED by critical-command-gate: $which requires explicit Gev approval (BRO_GEV_APPROVED=1).")
  exit 2
} catch { exit 0 }
