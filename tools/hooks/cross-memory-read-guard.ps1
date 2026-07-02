<#
  cross-memory-read-guard.ps1 — PreToolUse hook (matcher: Read) · Phase 2 + Gate-7 scope-aware (§11 / B4 / L8)
  EN: Enforces memory isolation on Read. A Bro may read ONLY its own project's memory; reading ANY other project's
      sealed memory is BLOCKED. The TARGET project is resolved by REGISTRY path (robust to folder names like
      "Scout Project"/"Menq"; not a hardcoded slug list); SuperBro's own Desktop\Bro\memory is not a registered
      project, so it is never in scope. Own scope is read from memory_scope in bro.manifest.json (override: $env:BRO_SCOPE
      in test mode). Rules:
        - scope 'own_only' (SuperBro): block reading ANY registered project's \bro\memory (it uses sealed mirrors).
        - scope '<X>_only' (Project Bro X): allow reading X's \bro\memory; block every other registered project's.
  HY: Կիրառում է memory isolation-ը Read-ի վրա։ Bro-ն կարդում է ՄԻԱՅՆ իր project-ի memory-ն; ուրիշ project-ի կնքված
      memory կարդալը BLOCKED է։ Scope-ը՝ bro.manifest.json-ի memory_scope-ից (override՝ $env:BRO_SCOPE test-ի համար)։
        - 'own_only' (SuperBro)՝ block ամ. project memory · '<X>_only' (Project Bro X)՝ allow X-ի, block մյուսները։
  SAFETY / FAIL POLICY (topist): fail-OPEN ONLY on un-parseable harness input (never brick a session); deny on a
          confirmed cross-project memory read. FAIL-CLOSED default: if memory_scope cannot be determined, it defaults
          to 'own_only' — the MOST restrictive scope (blocks reading ANY project memory). $env:BRO_SCOPE override is
          honored ONLY when $env:BRO_TEST_MODE=1; in production it is IGNORED -> manifest. Allow=0, Deny=2.
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

  # Identify the target project by REGISTRY path (robust to folder names like "Scout Project"/"Menq"; NOT a hardcoded
  # slug list). SuperBro's own memory (Desktop\Bro\memory) is NOT a registered project, so it is never in scope here.
  # Registry source: canonical by default; $env:BRO_REGISTRY_PATH honored ONLY when $env:BRO_TEST_MODE=1.
  $regPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_REGISTRY_PATH) { $env:BRO_REGISTRY_PATH } else { Join-Path $broHome 'memory\_own\registry.json' }
  $targetProj = ''
  try {
    $reg = Get-Content -Raw $regPath | ConvertFrom-Json
    foreach ($p in @($reg.projects)) {
      $pmem = ((("$($p.project_path)") -replace '/','\').TrimEnd('\') + '\bro\memory').ToLower()
      if ($absL -eq $pmem -or $absL.StartsWith($pmem + '\')) { $targetProj = "$($p.project_id)".ToLower(); break }
    }
  } catch {}
  if (-not $targetProj) { exit 0 }   # not a registered project's sealed memory -> not in scope for this guard

  # current scope: the local manifest's memory_scope by default. The $env:BRO_SCOPE override is TEST-ONLY and is
  # honored ONLY when $env:BRO_TEST_MODE='1'. In production (no BRO_TEST_MODE) the override is IGNORED -> manifest.
  $scope = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_SCOPE) { "$($env:BRO_SCOPE)" } else { try { (Get-Content -Raw (Join-Path $broHome 'bro.manifest.json') | ConvertFrom-Json).memory_scope } catch { 'own_only' } }
  $ownProj = if ($scope -ne 'own_only' -and $scope -match '^(.+)_only$') { $Matches[1].ToLower() } else { '' }

  if ($ownProj -and $targetProj -eq $ownProj) { exit 0 }   # a Project Bro reading ITS OWN memory -> allow

  # --- L8-G: Gev-authorized grant override. The MAIN BRO ONLY (scope own_only => $ownProj empty) may cross a seal
  #     under an explicit, scoped, NON-EXPIRED, LOGGED Gev grant. Default-deny stays; autonomous crossing forbidden;
  #     Project Bros ($ownProj set) NEVER take this path. Grants live in SuperBro's own memory/_own/cross-grants.json
  #     (created only via bro-cross-grant.ps1 with BRO_GEV_APPROVED=1). Test seam: BRO_CROSS_GRANTS_PATH when TEST_MODE. ---
  if (-not $ownProj) {
    $grantsPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_CROSS_GRANTS_PATH) { $env:BRO_CROSS_GRANTS_PATH } else { Join-Path $broHome 'memory\_own\cross-grants.json' }
    try {
      $grants = Get-Content -Raw $grantsPath | ConvertFrom-Json
      foreach ($gr in @($grants.grants)) {
        if ("$($gr.project_id)".ToLower() -eq $targetProj -and ("$($gr.scope)" -in @('read','read-write'))) {
          $exp = try { [datetimeoffset]::Parse("$($gr.expires_at)") } catch { $null }
          if ($exp -and $exp -gt (Get-Date)) {
            $gts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
            $gsid = if ($j.session_id) { "$($j.session_id)" } else { 'n/a' }
            $gentry = @(
              "", "## AUTHORIZED - cross-memory-read-guard (L8-G Gev grant)", "``````txt",
              "timestamp: $gts", "actor: hook", "session_id: $gsid",
              "action: AUTHORIZED_CROSS_MEMORY_READ", "target: $abs", "source_command: Read tool",
              "authority: Gev grant ($($gr.scope), expires $($gr.expires_at))", "result: ALLOWED",
              "reason: Main Bro read of '$targetProj' under explicit Gev grant - task: $($gr.task)", "files_changed: none", "``````"
            )
            $ghb = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_HOOKBLOCKS_PATH) { $env:BRO_HOOKBLOCKS_PATH } else { Join-Path $broHome 'memory\_own\hook-blocks.md' }
            try { Add-Content -Path $ghb -Value $gentry -Encoding utf8 } catch {}
            exit 0
          }
        }
      }
    } catch {}
  }

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
  $hbPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_HOOKBLOCKS_PATH) { $env:BRO_HOOKBLOCKS_PATH } else { Join-Path $broHome 'memory\_own\hook-blocks.md' }
  try { Add-Content -Path $hbPath -Value $entry -Encoding utf8 } catch {}
  [Console]::Error.WriteLine("DENIED by cross-memory-read-guard: $reason -> $abs")
  exit 2
} catch { exit 0 }
