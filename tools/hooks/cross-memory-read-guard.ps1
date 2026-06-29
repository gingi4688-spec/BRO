<#
  cross-memory-read-guard.ps1 — PreToolUse hook (matcher: Read) · Phase 2 + Gate-7 scope-aware (§11 / B4 / L8)
  EN: Enforces memory isolation on Read. A Bro may read ONLY its own project's memory; reading ANY other project's
      sealed memory is BLOCKED. The current scope is read from memory_scope in the local bro.manifest.json
      (override: $env:BRO_SCOPE for testing). Rules:
        - scope 'own_only' (SuperBro): block reading ANY project's \bro\memory (it uses sealed mirrors, not direct reads).
        - scope '<X>_only' (Project Bro X): allow reading <X>\bro\memory; block every other project's \bro\memory.
  HY: Կիրառում է memory isolation-ը Read-ի վրա։ Bro-ն կարդում է ՄԻԱՅՆ իր project-ի memory-ն; ուրիշ project-ի կնքված
      memory կարդալը BLOCKED է։ Scope-ը՝ bro.manifest.json-ի memory_scope-ից (override՝ $env:BRO_SCOPE test-ի համար)։
        - 'own_only' (SuperBro)՝ block ամ. project memory · '<X>_only' (Project Bro X)՝ allow X-ի, block մյուսները։
  SAFETY: fail-OPEN on error (exit 0); deny only on a confirmed cross-project memory read. Allow=0, Deny=2.
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

  # Only project sealed-memory paths are in scope for this guard.
  if ($absL -notmatch '\\(ep|db|gaa|gaahex|ip)\\bro\\memory') { exit 0 }
  $targetProj = $Matches[1]

  # current scope: env override (test) else the local manifest's memory_scope
  $scope = if ($env:BRO_SCOPE) { "$($env:BRO_SCOPE)" } else { try { (Get-Content -Raw (Join-Path $broHome 'bro.manifest.json') | ConvertFrom-Json).memory_scope } catch { 'own_only' } }
  $ownProj = if ($scope -ne 'own_only' -and $scope -match '^(.+)_only$') { $Matches[1].ToLower() } else { '' }

  if ($ownProj -and $targetProj -eq $ownProj) { exit 0 }   # a Project Bro reading ITS OWN memory -> allow

  # otherwise: SuperBro reading any project memory, or a Project Bro reading another project's memory -> BLOCK
  $reason = if ($ownProj) { "project Bro '$ownProj' attempted to read project '$targetProj' memory (cross-project, B4/L8)" }
            else { "SuperBro (own_only) attempted a direct project-memory read of '$targetProj' (use a sealed mirror; B4/B6)" }
  $ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
  $sid = if ($j.session_id) { "$($j.session_id)" } else { 'n/a' }
  $entry = @(
    "", "## BLOCK - cross-memory-read-guard", "``````txt",
    "timestamp: $ts", "actor: hook", "session_id: $sid",
    "action: CROSS_MEMORY_READ_BLOCKED", "target: $abs", "source_command: Read tool",
    "authority: hook", "result: BLOCKED", "reason: $reason", "files_changed: none", "``````"
  )
  try { Add-Content -Path (Join-Path $broHome 'memory\_own\hook-blocks.md') -Value $entry -Encoding utf8 } catch {}
  [Console]::Error.WriteLine("DENIED by cross-memory-read-guard: $reason -> $abs")
  exit 2
} catch { exit 0 }
