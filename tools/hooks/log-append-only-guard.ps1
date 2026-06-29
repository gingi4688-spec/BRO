<#
  log-append-only-guard.ps1 — PreToolUse hook (matcher: Write|Edit) · clean-build Phase 2 (§13A / D7)
  EN: Blocks Write/Edit on append-only EVIDENCE logs (they may only be appended by tools/bro-log.ps1, never
      hand-edited/deleted). Layered with forbidden-path-write-guard (intentional defense-in-depth, roadmap C6).
      Evidence set: audit-log, hook-blocks, authority-log, release-log, failure-registry, sync-log (.md).
  HY: Block Write/Edit append-only EVIDENCE log-երի վրա (միայն bro-log.ps1-ով append, ոչ ձեռքով edit/delete)։
      forbidden-path-write-guard-ի հետ layered defense-in-depth (C6)։
  SAFETY: fail-OPEN on error (exit 0); deny only on a confirmed evidence-log target. Allow=0, Deny=2.
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
  $leaf = [System.IO.Path]::GetFileName($abs).ToLower()
  $ownDir = ($broHome.ToLower().TrimEnd('\') + '\memory\_own\')
  $evidence = @('audit-log.md','hook-blocks.md','authority-log.md','release-log.md','failure-registry.md','sync-log.md')

  if ($abs.ToLower().StartsWith($ownDir) -and ($evidence -contains $leaf)) {
    $ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
    $sid = if ($j.session_id) { "$($j.session_id)" } else { 'n/a' }
    $entry = @(
      "",
      "## BLOCK - log-append-only-guard",
      "``````txt",
      "timestamp: $ts",
      "actor: hook",
      "session_id: $sid",
      "action: LOG_EDIT_BLOCKED",
      "target: $abs",
      "source_command: $tool tool",
      "authority: hook",
      "result: BLOCKED",
      "reason: evidence logs are append-only (use tools/bro-log.ps1); edit/delete requires explicit Gev command",
      "files_changed: none",
      "``````"
    )
    $hbPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_HOOKBLOCKS_PATH) { $env:BRO_HOOKBLOCKS_PATH } else { Join-Path $broHome 'memory\_own\hook-blocks.md' }
    try { Add-Content -Path $hbPath -Value $entry -Encoding utf8 } catch {}
    [Console]::Error.WriteLine("DENIED by log-append-only-guard: evidence log is append-only -> $leaf (use tools/bro-log.ps1)")
    exit 2
  }
  exit 0
} catch { exit 0 }
