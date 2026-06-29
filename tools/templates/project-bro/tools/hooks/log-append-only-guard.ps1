<#
  log-append-only-guard.ps1 (Project Bro template) — PreToolUse hook (matcher: Write|Edit).
  AUTHORED BY SUPERBRO, delivered by bro-install (governed; L10 — a Project Bro is a CONSUMER, never the source of
  enforcement). Blocks Write/Edit on a Project Bro's append-only EVIDENCE logs under <home>\logs\ (hook-blocks.md,
  local-audit.md, memory-write.md, session.md, action.md, errors.md). Evidence is appended by the Bro's own hooks,
  never hand-edited/deleted; edit/delete requires an explicit Gev command. Layered defense-in-depth with the
  forbidden-path-write-guard (C6).
  FAIL POLICY (topist): fail-OPEN ONLY on un-parseable harness input (never brick a session); deny on a confirmed
  evidence-log target (filename in the evidence set AND inside <home>\logs\). Allow=0, Deny=2.
#>
try {
  $raw = [Console]::In.ReadToEnd(); if (-not $raw) { exit 0 }
  $j = $raw | ConvertFrom-Json
  $tool = "$($j.tool_name)"; if ($tool -ne 'Write' -and $tool -ne 'Edit') { exit 0 }
  $fp = "$($j.tool_input.file_path)"; if (-not $fp) { exit 0 }
  $broHome = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path   # X/bro (when installed) / template root (in repo)
  $abs = try { [System.IO.Path]::GetFullPath($fp) } catch { $fp }
  $leaf = [System.IO.Path]::GetFileName($abs).ToLower()
  $logsDir  = ($broHome.ToLower().TrimEnd('\') + '\logs\')
  $evidence = @('hook-blocks.md','local-audit.md','memory-write.md','session.md','action.md','errors.md')
  if ($abs.ToLower().StartsWith($logsDir) -and ($evidence -contains $leaf)) {
    [Console]::Error.WriteLine("DENIED by log-append-only-guard (Project Bro): evidence log is append-only -> $leaf (edit/delete requires explicit Gev command).")
    exit 2
  }
  exit 0
} catch { exit 0 }
