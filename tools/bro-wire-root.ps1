<#
  bro-wire-root.ps1 — WIRE WALL TO ROOT (retrofit an INSTALLED Project Bro) · Phase 1 wall-to-root (§11 / L10 / L12)
  EN: Brings an EXISTING installed Project Bro up to the wall-to-root standard, so the 5-hook wall auto-activates when
      the project ROOT is opened (the daily driver), not only when bro/ is opened. It (1) (re)delivers the SuperBro-
      governed hook scripts under <path>\bro\tools\hooks from the template, (2) (re)delivers <path>\bro\.claude (the
      bro/-open variant), (3) wires <path>\.claude (the ROOT-open variant) - CLEAN-COPY if absent, SKIP if the bro wall
      is already present, or MERGE the bro hooks into a pre-existing APP .claude (preserving the app's own hooks +
      permissions), and (4) appends the Bro-infra ignores to the project's .gitignore (idempotent).
      NOTHING LOST: every file it would overwrite/merge is first backed up to <path>\bro\_before\wire-root-<ts>\, the
      bro-governed files are SHA256-verified against their template source (abort on mismatch, backup intact), and a
      merged root .claude is re-parsed as valid JSON carrying BOTH the app's content and the bro wall signature.
      It NEVER touches <path>\bro\memory (sealed brain), <path>\memory, or app source.
  HY: Գոյություն ունեցող installed Project Bro-ն բերում է wall-to-root չափանիշին։ (1) hooks թարմ template-ից,
      (2) bro\.claude, (3) root \.claude՝ CLEAN-COPY եթե չկա / SKIP եթե bro wall-ը արդեն կա / MERGE եթե app-ի սեփական
      .claude-ն է (պահպանելով app-ի hooks+permissions), (4) gitignore (idempotent)։ ՈՉ ՄԻ ԲԱՆ ՉԿՈՐԻ՝ backup
      <path>\bro\_before\wire-root-<ts>\, bro-ֆայլերը SHA256-verify, merged root .claude-ը valid JSON՝ app + bro երկուսն էլ։
  Default = DRY preview (shows the exact diff; changes nothing). Real wire needs -Execute -Yes BRO_GEV_APPROVED=1.
  Exit: 0 ok/idempotent · 2 inputs · 3 refused (gates) · 4 not registered / not installed / no bro · 5 verify fail · 6 write error.
  -RegistryPath = test override (honored only with BRO_TEST_MODE=1; else canonical memory/_own/registry.json).
#>
param(
  [string]$ProjectId = '',
  [string]$ProjectPath = '',
  [string]$RegistryPath = '',
  [switch]$Yes,
  [switch]$Execute
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'

if (-not $ProjectId) { "WIRE WALL TO ROOT / ՊԱՏԸ ROOT-ԻՆ - usage: bro-wire-root.ps1 -ProjectId <id> [-ProjectPath <abs>] [-Execute -Yes]"; exit 2 }

$regFile = if (($env:BRO_TEST_MODE -eq '1') -and $RegistryPath) { $RegistryPath } else { 'memory/_own/registry.json' }
$reg = $null; try { $reg = Get-Content -Raw $regFile | ConvertFrom-Json } catch { "  ERROR: cannot read registry $regFile : $($_.Exception.Message)"; exit 4 }
$entry = @($reg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId } | Select-Object -First 1
if (-not $entry) { "  REFUSED: project '$ProjectId' is not REGISTERED."; exit 4 }
if ("$($entry.status)" -ne 'INSTALLED') { "  REFUSED: project '$ProjectId' status is $($entry.status), not INSTALLED (wire-root retrofits an active install). STOP."; exit 4 }
if (-not $ProjectPath) { $ProjectPath = "$($entry.project_path)" }
$broDir = Join-Path $ProjectPath 'bro'

"WIRE WALL TO ROOT / ՊԱՏԸ ROOT-ԻՆ - " + $(if ($Execute) { 'REAL mode / ԻՐԱԿԱՆ' } else { 'DRY-RUN (preview) / ՉՈՐ ԱՆՑՈՒՄ' })
"  project: $ProjectId   path: $ProjectPath"
if (-not (Test-Path $ProjectPath -PathType Container)) { "  REFUSED: project root $ProjectPath does not exist. STOP."; exit 4 }
if (-not (Test-Path $broDir))  { "  REFUSED: $broDir does not exist (install first). STOP."; exit 4 }
if (-not (Test-Path (Join-Path $broDir 'bro.manifest.json'))) { "  REFUSED: $broDir has no bro.manifest.json (not a recognized install). STOP."; exit 4 }

function Get-Sha256([string]$p) { if (Test-Path $p) { return (Get-FileHash -Path $p -Algorithm SHA256).Hash.ToLower() } else { return '' } }
$BRO_SIG = '/bro/tools/hooks/forbidden-path-write-guard.ps1'   # signature of a wired bro wall inside a root settings.json

# ---- (A) bro-governed hash-copy plan: hooks + bro/.claude (clean overwrite is correct; bro-governed, backed up) ----
$plan = @()
foreach ($h in Get-ChildItem 'tools/templates/project-bro/tools/hooks' -File -Filter *.ps1) {
  $plan += @{ src = $h.FullName; dst = (Join-Path $broDir ("tools\hooks\" + $h.Name)); label = "hook/$($h.Name)" }
}
$broClaudeSrc = 'tools/templates/project-bro/.claude/settings.json'
if (Test-Path $broClaudeSrc) { $plan += @{ src = (Resolve-Path $broClaudeSrc).Path; dst = (Join-Path $broDir '.claude\settings.json'); label = 'bro/.claude/settings.json' } }

$changes = @(); $current = @()
foreach ($it in $plan) { if ((Get-Sha256 $it.src) -eq (Get-Sha256 $it.dst)) { $current += $it.label } else { $changes += $it } }

# ---- (B) ROOT \.claude wiring: classify (absent | bro-present | merge-needed) ----
$rootTmpl = (Resolve-Path 'tools/templates/project-bro/root/.claude/settings.json').Path
$rootDst  = Join-Path $ProjectPath '.claude\settings.json'
$rootMode = 'copy'      # copy | skip | merge
if (Test-Path $rootDst) {
  $rootRaw = Get-Content -Raw $rootDst
  if ($rootRaw -match [regex]::Escape($BRO_SIG)) { $rootMode = 'skip' } else { $rootMode = 'merge' }
}

# ---- (C) gitignore ----
$pgi = Join-Path $ProjectPath '.gitignore'
$giHasBlock = (Test-Path $pgi) -and ((Get-Content -Raw $pgi) -match '(?m)^# --- Bro infra')

$rootDesc = switch ($rootMode) { 'copy' { 'CLEAN-COPY (no root .claude yet)' } 'skip' { 'already has the bro wall (idempotent)' } 'merge' { 'MERGE bro wall into pre-existing APP .claude (preserves app hooks/permissions)' } }
"  bro-governed files: $($plan.Count)   |   need update: $($changes.Count)   |   already current: $($current.Count)"
foreach ($c in $changes) { "    ~ $($c.label)   ($(if(Get-Sha256 $c.dst){(Get-Sha256 $c.dst).Substring(0,8)}else{'(absent)'}) -> $((Get-Sha256 $c.src).Substring(0,8)))" }
"  ROOT \.claude:       $rootDesc"
"  gitignore block:     " + $(if ($giHasBlock) { 'present' } else { 'will append' })

if ($changes.Count -eq 0 -and $rootMode -eq 'skip' -and $giHasBlock) { "  IDEMPOTENT: already wall-to-root current; nothing to do."; exit 0 }

if (-not $Execute) {
  "  DRY-RUN: nothing written. Real wire backs up each change to $broDir\_before\wire-root-<ts>\, delivers/merges, verifies, then appends gitignore."
  exit 0
}

# ---- REAL mode gates ----
if (-not $Yes) { "  REFUSED: real wire requires -Yes."; exit 3 }
if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: real wire requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }

try {
  $ts = Get-Date -Format "yyyyMMdd-HHmmss"
  $backupDir = Join-Path $broDir ("_before\wire-root-$ts")
  New-Item -ItemType Directory -Force $backupDir | Out-Null
  $bakRecord = @("# wire-root backup $ts for $ProjectId", "")

  # 1) BACKUP every destination that exists (NOTHING LOST)
  foreach ($it in $plan) {
    if (Test-Path $it.dst) {
      $safe = ($it.label -replace '[\\/:*?""<>|() ]','_'); Copy-Item $it.dst (Join-Path $backupDir $safe) -Force
      $bakRecord += "$($it.label)  was=$(Get-Sha256 $it.dst)  backup=$safe"
    }
  }
  if (Test-Path $rootDst) { Copy-Item $rootDst (Join-Path $backupDir 'root_.claude_settings.json') -Force; $bakRecord += "ROOT .claude  was=$(Get-Sha256 $rootDst)  backup=root_.claude_settings.json" }
  if (Test-Path $pgi)     { Copy-Item $pgi (Join-Path $backupDir '_gitignore.bak') -Force; $bakRecord += "project .gitignore backed up" }
  Set-Content -Path (Join-Path $backupDir 'BACKUP.md') -Value $bakRecord -Encoding utf8
  "  backed up -> $backupDir"

  # 2) DELIVER bro-governed files (clean overwrite) + VERIFY each against the template source
  foreach ($it in $changes) {
    $dd = Split-Path $it.dst -Parent; if (-not (Test-Path $dd)) { New-Item -ItemType Directory -Force $dd | Out-Null }
    Copy-Item $it.src $it.dst -Force
  }
  $bad = @(); foreach ($it in $changes) { if ((Get-Sha256 $it.dst) -ne (Get-Sha256 $it.src)) { $bad += $it.label } }
  if ($bad.Count -gt 0) { "  VERIFY FAILED: $($bad -join '; ') -> WIRE ABORTED. Backup intact at $backupDir."; exit 5 }
  foreach ($it in $changes) { "  delivered + verified: $($it.label)  ($(Get-Sha256 $it.dst))" }

  # 3) ROOT \.claude wiring
  $rootDir = Split-Path $rootDst -Parent; if (-not (Test-Path $rootDir)) { New-Item -ItemType Directory -Force $rootDir | Out-Null }
  switch ($rootMode) {
    'copy' { Copy-Item $rootTmpl $rootDst -Force; "  root \.claude: CLEAN-COPY delivered" }
    'skip' { "  root \.claude: bro wall already present (left as-is, idempotent)" }
    'merge' {
      $existing = Get-Content -Raw $rootDst | ConvertFrom-Json -AsHashtable
      $tmpl     = Get-Content -Raw $rootTmpl | ConvertFrom-Json -AsHashtable
      if (-not $existing.ContainsKey('hooks') -or $null -eq $existing['hooks']) { $existing['hooks'] = @{} }
      foreach ($key in $tmpl['hooks'].Keys) {
        # build a flat list (avoid the array '+' operator, which throws on a 1-element hashtable array)
        $merged = [System.Collections.Generic.List[object]]::new()
        if ($existing['hooks'].ContainsKey($key)) { foreach ($e in @($existing['hooks'][$key])) { $merged.Add($e) } }  # app entries first (preserved)
        foreach ($t in @($tmpl['hooks'][$key])) { $merged.Add($t) }                                                   # bro wall entries appended
        $existing['hooks'][$key] = $merged.ToArray()
      }
      ($existing | ConvertTo-Json -Depth 20) | Set-Content $rootDst -Encoding utf8
      "  root \.claude: MERGED bro wall into the app's settings (app hooks/permissions preserved)"
    }
  }
  # VERIFY the root settings: valid JSON AND carries the bro wall signature
  $rv = $null; try { $rv = Get-Content -Raw $rootDst | ConvertFrom-Json } catch {}
  if (($null -eq $rv) -or -not ((Get-Content -Raw $rootDst) -match [regex]::Escape($BRO_SIG))) {
    "  VERIFY FAILED: root \.claude is not valid JSON or lacks the bro wall signature -> WIRE INCOMPLETE. Restore from $backupDir."; exit 5
  }
  "  root \.claude verified: valid JSON + bro wall signature present"

  # 4) gitignore Bro-infra block (idempotent append)
  if (-not $giHasBlock) {
    $giBlock = @('', '# --- Bro infra (SuperBro-governed, re-deliverable; do NOT commit) ---', '/.claude/', '/bro/spine/', '/bro/tools/', '/bro/.claude/', '/bro/bro.manifest.json', '/bro/health.report.md', '/bro/logs/', '/bro/_before/') -join "`r`n"
    Add-Content -Path $pgi -Value $giBlock -Encoding utf8
    "  gitignore: appended Bro-infra ignores to $pgi (bro\memory + docs stay tracked)"
  } else { "  gitignore: Bro-infra block already present (idempotent)" }

  "  WIRED $ProjectId to wall-to-root. backup: $backupDir"
  "  next: Gev opens $ProjectPath as a project root to confirm the wall fires + app-write works + sealed-write blocked."
  exit 0
} catch { "  ERROR during wire: $($_.Exception.Message)"; exit 6 }
