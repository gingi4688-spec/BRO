<#
  cross-memory-read-guard.ps1 — PreToolUse hook (matcher: Read) · clean-build Phase 2 (§11 / B4 / L8)
  EN: Blocks Read of another project's sealed memory path (cross-project access). In the clean build no
      Project Bro exists, so this proves the mechanism on a project-memory signature; once Project Bros exist
      it blocks reading any other project's memory while scoped to a different project.
  HY: Block ուրիշ project-ի կնքված memory-ի Read (cross-project)։ Մաքուր build-ում project չկա -> ապացուցում է
      մեխանիզմը project-memory signature-ի վրա; Project Bro-ների դեպքում block է ուրիշ project-ի memory կարդալը։
  SAFETY: fail-OPEN on error (exit 0); deny only on a confirmed cross-project memory target. Allow=0, Deny=2.
#>
try {
  $raw = [Console]::In.ReadToEnd()
  if (-not $raw) { exit 0 }
  $j = $raw | ConvertFrom-Json
  $tool = "$($j.tool_name)"
  if ($tool -ne 'Read') { exit 0 }
  $fp = "$($j.tool_input.file_path)"
  if (-not $fp) { exit 0 }
  $broHome = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
  $abs = try { [System.IO.Path]::GetFullPath($fp) } catch { $fp }
  $absL = $abs.ToLower()
  $broHomePrefix = $broHome.ToLower().TrimEnd('\') + '\'

  # Cross-project memory signature: a project dir's bro/memory, OUTSIDE this BRO_HOME.
  $isCrossProjectMemory = ($absL -match '\\(ep|db|gaa|gaahex|ip)\\bro\\memory') -and (-not $absL.StartsWith($broHomePrefix))

  if ($isCrossProjectMemory) {
    $ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
    $sid = if ($j.session_id) { "$($j.session_id)" } else { 'n/a' }
    $entry = @(
      "",
      "## BLOCK - cross-memory-read-guard",
      "``````txt",
      "timestamp: $ts",
      "actor: hook",
      "session_id: $sid",
      "action: CROSS_MEMORY_READ_BLOCKED",
      "target: $abs",
      "source_command: Read tool",
      "authority: hook",
      "result: BLOCKED",
      "reason: cross-project memory read forbidden (B4/L8); a Bro reads only its own project's memory",
      "files_changed: none",
      "``````"
    )
    try { Add-Content -Path (Join-Path $broHome 'memory\_own\hook-blocks.md') -Value $entry -Encoding utf8 } catch {}
    [Console]::Error.WriteLine("DENIED by cross-memory-read-guard: cross-project memory read forbidden (B4/L8) -> $abs")
    exit 2
  }
  exit 0
} catch { exit 0 }
