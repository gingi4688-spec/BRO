<#
  forbidden-path-write-guard.ps1 — PreToolUse hook (matcher: Write|Edit) · Phase 2 + R-1 refinement (§11 / B5 / D5)
  EN: Blocks Write/Edit to a forbidden path: (a) memory/supermemory/** (sealed read-only mirror),
      (b) memory/_own/secrets/** (verifier vault), (c) anything OUTSIDE BRO_HOME by default (clean-build zero-touch;
      another project's memory is the named case, B4/L8).
      R-1 REFINEMENT: a NARROW, slug-keyed WHITELIST allows the harness's legitimate, project-scoped paths that
      Claude/Bro need to operate -- THIS project's auto-memory (~/.claude/projects/<slug>/) and THIS project's
      scratchpad (...\Temp\claude\<slug>\). The slug is derived from BRO_HOME, so another project's harness memory
      (e.g. ...-EP) and every EP/DB/GAA/IP project folder remain BLOCKED. Evidence logs (inside BRO_HOME) stay
      protected by log-append-only-guard -- the whitelist only affects OUTSIDE-BRO_HOME paths.
  HY: Block Write/Edit արգելված path-ին՝ supermemory, secrets, կամ BRO_HOME-ից ԴՈՒՐՍ (default)։
      R-1 ՈՒՂՂՈՒՄ՝ NEGH, slug-keyed WHITELIST թույլ է տալիս ԱՅՍ project-ի harness auto-memory-ն ու scratchpad-ը։
      slug-ը BRO_HOME-ից է -> ուրիշ project-ի harness memory-ն ու ամ. EP/DB/GAA/IP folder մնում են BLOCKED։
  SAFETY: fail-OPEN on any internal/parse error (exit 0); deny ONLY on a confirmed forbidden match. Allow=0, Deny=2.
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
  $homePrefix = $broHome.ToLower().TrimEnd('\') + '\'
  $superL  = ($broHome.ToLower().TrimEnd('\') + '\memory\supermemory\')
  $secretL = ($broHome.ToLower().TrimEnd('\') + '\memory\_own\secrets\')

  # R-1 whitelist: THIS project's harness slug, derived from BRO_HOME (portable, D3).
  $slugL = (($broHome.Substring(0,1).ToLower() + $broHome.Substring(1)) -replace ':','-' -replace '\\','-').ToLower()
  $wlMem     = '\.claude\projects\' + $slugL + '\'   # ~/.claude/projects/<slug>/ (harness auto-memory + state)
  $wlScratch = '\temp\claude\'      + $slugL + '\'   # ...\Temp\claude\<slug>\ (scratchpad/temp)
  $whitelisted = $absL.Contains($wlMem) -or $absL.Contains($wlScratch)

  $forbidden = $false; $why = ''
  if ($absL.StartsWith($superL)) { $forbidden = $true; $why = 'write into sealed read-only supermemory mirror (B6)' }
  elseif ($absL.StartsWith($secretL)) { $forbidden = $true; $why = 'write into secrets/verifier vault' }
  elseif (-not $absL.StartsWith($homePrefix)) {
    if ($whitelisted) {
      exit 0   # R-1: legitimate, project-scoped harness-memory / scratchpad write -> allow
    }
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
