<#
  forbidden-path-write-guard.ps1 — PreToolUse hook (matcher: Write|Edit) · Phase 2 + R-1 + Gate-2 (§11 / B5 / D5)
  EN: Blocks Write/Edit to a forbidden path. Allowed by default: nothing outside BRO_HOME, except two NARROW
      exceptions:
        (R-1) THIS project's harness paths (slug-keyed): ~/.claude/projects/<slug>/ and ...\Temp\claude\<slug>\
        (Gate-2) a REGISTERED project's approved install subtree: <project_path>\bro\  ONLY, validated against the
                 registry (status REGISTERED|INSTALLED). NOT the project root, NOT <project_path>\memory, NOT an
                 unregistered project, NOT another project. The registration is the Gev-gated approval.
      Still blocks: memory/supermemory/**, memory/_own/secrets/**, another project's memory, project roots, and any
      other outside-BRO_HOME path. Evidence-log edit/delete stays protected by log-append-only-guard.
  HY: Block Write/Edit արգելված path-ին։ Default-ով՝ ոչինչ BRO_HOME-ից դուրս, բացի երկու ՆԵՂ բացառությունից՝
        (R-1) այս project-ի harness paths (slug-keyed), (Gate-2) REGISTERED project-ի `<path>\bro\` ՄԻԱՅՆ
        (registry-validated; ոչ root, ոչ `\memory`, ոչ unregistered, ոչ ուրիշ project)։
  SAFETY / FAIL POLICY (topist): fail-OPEN ONLY on un-parseable harness input (exit 0 — never brick a session);
          deny ONLY on a confirmed forbidden match. FAIL-CLOSED where it matters: an out-of-BRO_HOME path whose
          registry/bro-exception cannot be validated is treated as FORBIDDEN (deny), not allowed. Test seam:
          $env:BRO_REGISTRY_PATH is honored ONLY when $env:BRO_TEST_MODE=1; in production the override is IGNORED ->
          canonical memory/_own/registry.json. Allow=0, Deny=2.
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

  # R-1 harness whitelist (slug-keyed to THIS project)
  $slugL = (($broHome.Substring(0,1).ToLower() + $broHome.Substring(1)) -replace ':','-' -replace '\\','-').ToLower()
  $wlMem     = '\.claude\projects\' + $slugL + '\'
  $wlScratch = '\temp\claude\'      + $slugL + '\'
  $whitelisted = $absL.Contains($wlMem) -or $absL.Contains($wlScratch)

  # Gate-2 registry-keyed /bro/ exception: allow only a REGISTERED project's <project_path>\bro\ subtree.
  function Test-RegisteredBro([string]$targetL, [string]$bh) {
    # Registry source: canonical by default. The $env:BRO_REGISTRY_PATH override is TEST-ONLY and is honored
    # ONLY when $env:BRO_TEST_MODE='1'. In production (no BRO_TEST_MODE) the override is IGNORED -> canonical registry.
    $regPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_REGISTRY_PATH) { $env:BRO_REGISTRY_PATH } else { Join-Path $bh 'memory\_own\registry.json' }
    try {
      $reg = Get-Content -Raw $regPath | ConvertFrom-Json
      foreach ($p in @($reg.projects)) {
        if ("$($p.status)" -in @('REGISTERED','INSTALLED')) {
          $pbro = ((("$($p.project_path)") -replace '/','\').TrimEnd('\') + '\bro\').ToLower()
          if ($targetL.StartsWith($pbro)) { return $true }
        }
      }
    } catch {}
    return $false
  }

  $forbidden = $false; $why = ''
  if ($absL.StartsWith($superL)) { $forbidden = $true; $why = 'write into sealed read-only supermemory mirror (B6)' }
  elseif ($absL.StartsWith($secretL)) { $forbidden = $true; $why = 'write into secrets/verifier vault' }
  elseif (-not $absL.StartsWith($homePrefix)) {
    if ($whitelisted) { exit 0 }                                  # R-1 harness whitelist
    # Gate-2 allows a registered project's <project>\bro\ subtree — but NEVER <project>\bro\memory\ (the sealed
    # brain). Writing another project's memory is L8 CROSS_PROJECT_CONTAMINATION and stays forbidden even under the
    # bro-exception (reads are already blocked by cross-memory-read-guard; this closes the symmetric WRITE hole).
    if (($absL -notmatch '\\bro\\memory\\') -and (Test-RegisteredBro $absL $broHome)) { exit 0 }
    $forbidden = $true
    if ($absL -match '\\bro\\memory\\')          { $why = 'write into a project sealed brain (<project>\bro\memory) — L8 CROSS_PROJECT_CONTAMINATION, forbidden even under the bro-exception' }
    elseif ($absL -match '\\(ep|db|gaa|gaahex|ip)\\') { $why = 'write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)' }
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
    $hbPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_HOOKBLOCKS_PATH) { $env:BRO_HOOKBLOCKS_PATH } else { Join-Path $broHome 'memory\_own\hook-blocks.md' }
    try { Add-Content -Path $hbPath -Value $entry -Encoding utf8 } catch {}
    [Console]::Error.WriteLine("DENIED by forbidden-path-write-guard: $why -> $abs")
    exit 2
  }
  exit 0
} catch { exit 0 }
