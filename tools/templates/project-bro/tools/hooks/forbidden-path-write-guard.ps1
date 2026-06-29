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
  SAFETY: fail-OPEN on any internal/parse error (exit 0); deny ONLY on a confirmed forbidden match. Allow=0, Deny=2.
          Registry source = $env:BRO_REGISTRY_PATH if set (test seam), else memory/_own/registry.json.
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
    if (Test-RegisteredBro $absL $broHome) { exit 0 }             # Gate-2 registered <project>\bro\ exception
    $forbidden = $true
    if ($absL -match '\\(ep|db|gaa|gaahex|ip)\\') { $why = 'write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)' }
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

