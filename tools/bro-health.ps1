<#
  bro-health.ps1 — generate the health-dashboard snapshot (clean-build Phase 2, §2 / §14)
  EN: Runs the read-only doctor, captures its RESULT + exit, and (re)writes memory/_own/health-dashboard.md.
      The dashboard is a GENERATED snapshot (overwrite each run), NOT an append-only evidence log, so it is not
      under the append-only guard. This script writes ONLY the snapshot file. Bilingual header (L0).
  HY: Վազեցնում է read-only doctor-ը, վերցնում RESULT + exit, ու (վեր)գրում memory/_own/health-dashboard.md։
      Dashboard-ը գեներացված snapshot է (ամ. run-ին overwrite), ՈՉ append-only evidence — guard-ի տակ չէ։
  Exit: 0 OK · mirrors no failure (snapshot always written).
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')

$ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
$phase = '?'; try { $phase = (Get-Content -Raw 'bro.manifest.json' | ConvertFrom-Json).phase } catch {}

# capture doctor result (read-only)
$docOut = & pwsh -NoProfile -File 'tools/bro-doctor.ps1'
$docCode = $LASTEXITCODE
$docResult = ($docOut | Where-Object { $_ -match '^RESULT:' } | Select-Object -First 1)
if (-not $docResult) { $docResult = "RESULT: (unknown)" }

# capture audit result (read-only, no -Log so it writes nothing)
$audOut = & pwsh -NoProfile -File 'tools/bro-audit.ps1'
$audResult = ($audOut | Where-Object { $_ -match '^RESULT:' } | Select-Object -First 1)
if (-not $audResult) { $audResult = "RESULT: (unknown)" }

$lines = @(
  "# Health Dashboard (snapshot) / Health Dashboard (snapshot)",
  "",
  "> **EN:** Generated read-only snapshot (NOT a live service, §2). Source: tools/bro-health.ps1 (runs bro-doctor + bro-audit, read-only).",
  "> **HY:** Գեներացված read-only snapshot (ոչ live service, §2)։ Աղբյուր՝ tools/bro-health.ps1 (bro-doctor + bro-audit, read-only)։",
  "",
  "``````txt",
  "last_run: $ts",
  "phase:    $phase",
  "doctor:   $docResult (exit=$docCode)",
  "audit:    $audResult",
  "authority: current (verify-only; no passphrase prompt)",
  "enforcement: 5 structural hooks installed in .claude/settings.json (forbidden-path-write, cross-memory-read,",
  "             critical-command-gate, log-append-only, SessionStart preflight); evidence logs append-only.",
  "scope:    clean SuperBro - no project touch, no Project Bro, no real registration, no Discovery Bank move,",
  "          no migration, no release cut, no push.",
  "``````"
)
[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path 'memory/_own/health-dashboard.md'), ($lines -join "`r`n") + "`r`n")
"bro-health: snapshot written (last_run $ts, phase $phase). doctor exit=$docCode."
exit 0
