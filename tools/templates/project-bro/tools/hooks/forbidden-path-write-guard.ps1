<#
  forbidden-path-write-guard.ps1 (Project Bro template) — PreToolUse hook (matcher: Write|Edit) · Phase 2 + R-1 + Gate-2 + wall-to-root (§11 / B5 / D5 / L10)
  AUTHORED BY SUPERBRO, delivered by bro-install (governed; a Project Bro is a CONSUMER of enforcement, never its author).
  Anchored to the PROJECT ROOT (the parent of \bro), so the wall is correct whether Claude Code opens the project ROOT
  (the daily driver) or \bro itself. The whole project root IS the app -> the Project Bro must be free to write it.
  EN: ALLOWED  - anywhere under the project root (the app code), the bro/ sealed brain (<root>\bro\memory, minus the
                 two sealed sub-areas below), and THIS project's harness paths (R-1, slug-keyed to EITHER open-point).
      BLOCKED  - the sealed read-only supermemory mirror (B6) and the secrets/verifier vault; the SuperBro-governed
                 infra the Project Bro consumes but must never self-author or DISABLE (L10): <root>\bro\spine,
                 <root>\bro\tools (incl. these hooks), <root>\bro\.claude, the manifest/health files, AND the root
                 wall entry <root>\.claude; and anything OUTSIDE this project (another project / outside = cross-project,
                 B4/L8). Evidence-log edit/delete stays protected by log-append-only-guard.
      Gate-2   - a REGISTERED project's <path>\bro\ subtree (registry-validated); inert for a Project Bro that holds no
                 local registry, retained for parity.
  HY: ALLOWED՝ project root-ի տակ ամեն ինչ (app-ը), bro/-ի sealed ուղեղը (բացի sealed ենթա-տիրույթներից), այս project-ի
      harness path-երը (R-1, երկու open-point-ի slug-ով)։ BLOCKED՝ supermemory mirror (B6), secrets vault, SuperBro-
      governed infra-ն (spine/tools/.claude/manifest/health + root `\.claude` wall-entry — consumer, ոչ author/disable, L10),
      ու project-ից ԴՈՒՐՍ ամեն ինչ (cross-project, B4/L8)։
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
  $projectRoot = try { (Resolve-Path (Join-Path $broHome '..')).Path } catch { $broHome }   # <project> = parent of \bro
  $abs = try { [System.IO.Path]::GetFullPath($fp) } catch { $fp }
  $absL = $abs.ToLower()
  $homePrefix = $broHome.ToLower().TrimEnd('\') + '\'
  $rootPrefix = $projectRoot.ToLower().TrimEnd('\') + '\'     # the app: the whole project root is legitimate write territory
  $superL  = ($broHome.ToLower().TrimEnd('\') + '\memory\supermemory\')
  $secretL = ($broHome.ToLower().TrimEnd('\') + '\memory\_own\secrets\')

  # SuperBro-governed infra a Project Bro CONSUMES but must never self-author or disable (L10) - protected even though
  # they sit inside the writable project root: the bro/ enforcement skeleton + manifest/health + the ROOT wall entry.
  $infraPrefixes = @(($homePrefix + 'spine\'), ($homePrefix + 'tools\'), ($homePrefix + '.claude\'), ($rootPrefix + '.claude\'))
  $infraFiles    = @(($homePrefix + 'bro.manifest.json'), ($homePrefix + 'health.report.md'))

  # R-1 harness whitelist (slug-keyed to THIS project). Accept BOTH the \bro\-opened slug AND the project-root-opened
  # slug, so THIS project's harness memory/scratchpad stays writable whichever directory Claude Code is opened at.
  function Slug([string]$p) { return ((($p.Substring(0,1).ToLower() + $p.Substring(1)) -replace ':','-' -replace '\\','-').ToLower()) }
  $whitelisted = $false
  foreach ($s in @((Slug $broHome), (Slug $projectRoot))) {
    if ($absL.Contains('\.claude\projects\' + $s + '\') -or $absL.Contains('\temp\claude\' + $s + '\')) { $whitelisted = $true }
  }

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
  elseif (@($infraPrefixes | Where-Object { $absL.StartsWith($_) }).Count -gt 0) { $forbidden = $true; $why = 'write into SuperBro-governed bro/ infra (spine/tools/.claude) or the root wall entry - a Project Bro consumes, never authors or disables, the wall (L10)' }
  elseif ($infraFiles -contains $absL) { $forbidden = $true; $why = 'write into SuperBro-governed manifest/health (governed delivery, L10)' }
  elseif (-not $absL.StartsWith($rootPrefix)) {
    if ($whitelisted) { exit 0 }                                  # R-1 harness whitelist (this project, either open-point)
    if (Test-RegisteredBro $absL $broHome) { exit 0 }             # Gate-2 registered <project>\bro\ exception (inert without a local registry)
    $forbidden = $true
    if ($absL -match '\\(ep|db|gaa|gaahex|ip)\\') { $why = 'write into another project path (cross-project, B4/L8)' }
    else { $why = 'write outside this project (clean-build zero-touch)' }
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
    # Project Bro evidence lives under <home>\logs\ (protected by log-append-only-guard); NOT memory\_own\ (SuperBro-only). / Project Bro-ի evidence-ը <home>\logs\-ում է (log-append-only-guard-ով պաշտպանված), ՈՉ memory\_own\ (միայն SuperBro)։
    $hbPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_HOOKBLOCKS_PATH) { $env:BRO_HOOKBLOCKS_PATH } else { Join-Path $broHome 'logs\hook-blocks.md' }
    try { Add-Content -Path $hbPath -Value $entry -Encoding utf8 } catch {}
    [Console]::Error.WriteLine("DENIED by forbidden-path-write-guard: $why -> $abs")
    exit 2
  }
  exit 0
} catch { exit 0 }

