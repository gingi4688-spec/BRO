<#
  cross-memory-read-guard.ps1 (Project Bro template) — PreToolUse hook (matcher: Read) · Phase 2 + PATH-based isolation (§11 / B4 / L8)
  AUTHORED BY SUPERBRO, delivered by bro-install. Enforces memory isolation on Read for a PROJECT Bro (which has no
  registry): its OWN sealed brain is <broHome>\memory (= <project>\bro\memory). ANY other "*\bro\memory" path is a
  DIFFERENT project's sealed brain -> BLOCKED. PATH-based, so it is robust to folder names ("Scout Project", "Menq")
  with no hardcoded slug list. (SuperBro's own copy uses a registry-driven variant to map paths -> project ids.)
  EN: allow reading THIS project's bro\memory; block every other project's bro\memory. Non-memory paths are ignored.
  HY: թույլ է տալիս կարդալ ԱՅՍ project-ի bro\memory-ն; block ամեն ուրիշ project-ի bro\memory։ PATH-based՝ folder-name-
      ից անկախ (ոչ hardcoded slug)։ Ոչ-memory path-երը անտեսվում են։
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

  # A Project Bro has no registry, so isolation is PATH-based: its OWN sealed brain is <broHome>\memory. ANY other
  # "*\bro\memory" path is a DIFFERENT project's sealed brain -> BLOCK. Robust to folder names ("Scout Project"/"Menq"),
  # no hardcoded slug list. (SuperBro uses a registry-driven variant; this template is delivered to project bros only.)
  $ownMem = ($broHome.ToLower().TrimEnd('\') + '\memory')
  if ($absL -notmatch '\\bro\\memory(\\|$)') { exit 0 }                   # not a sealed-memory path at all
  if ($absL -eq $ownMem -or $absL.StartsWith($ownMem + '\')) { exit 0 }   # reading THIS project's OWN brain -> allow

  # otherwise: a read into some OTHER bro's sealed memory -> BLOCK (cross-project, B4/L8)
  $ownScope = try { (Get-Content -Raw (Join-Path $broHome 'bro.manifest.json') | ConvertFrom-Json).memory_scope } catch { 'this project' }
  $reason = "cross-project sealed-memory read blocked (scope '$ownScope' may read ONLY its own bro\memory; target is another project's sealed brain, B4/L8)"
  $ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
  $sid = if ($j.session_id) { "$($j.session_id)" } else { 'n/a' }
  $entry = @(
    "", "## BLOCK - cross-memory-read-guard", "``````txt",
    "timestamp: $ts", "actor: hook", "session_id: $sid",
    "action: CROSS_MEMORY_READ_BLOCKED", "target: $abs", "source_command: Read tool",
    "authority: hook", "result: BLOCKED", "reason: $reason", "files_changed: none", "``````"
  )
  # Project Bro evidence lives under <home>\logs\ (protected by log-append-only-guard); NOT memory\_own\ (SuperBro-only). / Project Bro-ի evidence-ը <home>\logs\-ում է (log-append-only-guard-ով պաշտպանված), ՈՉ memory\_own\ (միայն SuperBro)։
  $hbPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_HOOKBLOCKS_PATH) { $env:BRO_HOOKBLOCKS_PATH } else { Join-Path $broHome 'logs\hook-blocks.md' }
  try { Add-Content -Path $hbPath -Value $entry -Encoding utf8 } catch {}
  [Console]::Error.WriteLine("DENIED by cross-memory-read-guard: $reason -> $abs")
  exit 2
} catch { exit 0 }

