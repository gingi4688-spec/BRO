<#
  forbidden-path-write-guard.ps1 — PreToolUse hook (matcher: Write|Edit) · clean-build Phase 2 (§11 / B5 / D5)
  EN: Blocks Write/Edit to a forbidden path: (a) memory/supermemory/** (sealed read-only mirror),
      (b) memory/_own/secrets/** (verifier vault), (c) anything OUTSIDE BRO_HOME (clean-build zero-touch;
      another project's memory is the named case, B4/L8). Allow = exit 0; Deny = stderr message + exit 2.
  HY: Block Write/Edit արգելված path-ին՝ supermemory mirror, secrets vault, կամ BRO_HOME-ից ԴՈՒՐՍ (zero-touch;
      ուրիշ project-ի memory = named case)։ Allow = exit 0; Deny = stderr + exit 2։
  SAFETY: fail-OPEN on any internal/parse error (exit 0) so a malformed input never bricks the session;
          deny ONLY on a confirmed forbidden match. Narrow matcher; SuperBro's own in-home writes pass.
#>
try {
  $raw = [Console]::In.ReadToEnd()
  if (-not $raw) { exit 0 }
  $j = $raw | ConvertFrom-Json
  $tool = "$($j.tool_name)"
  if ($tool -ne 'Write' -and $tool -ne 'Edit') { exit 0 }
  $fp = "$($j.tool_input.file_path)"
  if (-not $fp) { exit 0 }
  $broHome = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
  $abs = try { [System.IO.Path]::GetFullPath($fp) } catch { $fp }
  $absL = $abs.ToLower()
  $broHomePrefix = $broHome.ToLower().TrimEnd('\') + '\'
  $superL = ($broHome.ToLower().TrimEnd('\') + '\memory\supermemory\')
  $secretL = ($broHome.ToLower().TrimEnd('\') + '\memory\_own\secrets\')

  $forbidden = $false; $why = ''
  if ($absL.StartsWith($superL)) { $forbidden = $true; $why = 'write into sealed read-only supermemory mirror (B6)' }
  elseif ($absL.StartsWith($secretL)) { $forbidden = $true; $why = 'write into secrets/verifier vault' }
  elseif (-not $absL.StartsWith($broHomePrefix)) {
    $forbidden = $true
    if ($absL -match '\\(ep|db|gaa|gaahex|ip)\\') { $why = 'write into another project memory (cross-project, B4/L8)' }
    else { $why = 'write outside BRO_HOME (clean-build zero-touch)' }
  }

  if ($forbidden) {
    $ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
    $sid = if ($j.session_id) { "$($j.session_id)" } else { 'n/a' }
    $entry = @(
      "",
      "## BLOCK - forbidden-path-write-guard",
      "``````txt",
      "timestamp: $ts",
      "actor: hook",
      "session_id: $sid",
      "action: WRITE_BLOCKED",
      "target: $abs",
      "source_command: $tool tool",
      "authority: hook",
      "result: BLOCKED",
      "reason: $why",
      "files_changed: none",
      "``````"
    )
    try { Add-Content -Path (Join-Path $broHome 'memory\_own\hook-blocks.md') -Value $entry -Encoding utf8 } catch {}
    [Console]::Error.WriteLine("DENIED by forbidden-path-write-guard: $why -> $abs")
    exit 2
  }
  exit 0
} catch { exit 0 }
