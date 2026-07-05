<#
  bro-production-check.ps1 — L3 production health (static, deterministic) (Phase 8c) · READ-ONLY
  EN: Static production-OS health. Checks: (1) production_os engine present; (2) PROVEN/DECLARED label HONESTY —
      UI adapter contract says PROVEN, Code adapter contract says DECLARED (must NOT claim PROVEN), constitution keeps
      UI=PROVEN + Universal/Code=DECLARED; (3) evidence/failure/decision/success ledgers are non-empty with real
      entries; (4) the UI adapter proof is referenced in the evidence ledger. The UI runtime SMOKE is on-demand
      (weekly) via tools/checks/bro-ui-smoke.ps1 — NOT run here and NEVER faked GREEN (L18).
  HY: Static production առողջություն՝ production_os presence · PROVEN/DECLARED պիտակների ազնվություն · ledger freshness
      · UI-proof reference։ UI runtime smoke-ը on-demand է (weekly), այստեղ չի վազում ու երբեք չի կեղծ-GREEN (L18)։
  Exit: 0 GREEN · 2 RED (missing engine, dishonest label, or empty ledger).
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..\..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$fail = @()
function Has($path, $pattern) { (Test-Path $path) -and ((Get-Content -Raw $path) -match $pattern) }

# (1) production_os engine present
foreach ($f in @('_core/production_os/00_EXECUTION_CONSTITUTION.md','_core/production_os/05_EXECUTOR.md','_core/production_os/06_VERIFIER.md','_core/production_os/07_REPAIRER.md','_core/production_os/ui/README.md','_core/production_os/checks/README.md')) {
  if (-not (Test-Path $f)) { $fail += "missing production_os file: $f" }
}

# (2) PROVEN / DECLARED label HONESTY
$uiC = 'skills/frontend-ux-product-design/PRODUCTION_CONTRACT.md'
$cdC = 'skills/software-systems-architecture/PRODUCTION_CONTRACT.md'
if (-not (Has $uiC 'PROVEN'))    { $fail += "UI contract not labeled PROVEN ($uiC)" }
if (-not (Has $cdC 'DECLARED'))  { $fail += "Code contract not labeled DECLARED ($cdC)" }
if (Has $cdC '(?m)STATUS:\s*PROVEN') { $fail += "Code contract dishonestly claims PROVEN (slice-2 pending) — $cdC" }
$const = '_core/production_os/00_EXECUTION_CONSTITUTION.md'
if (-not (Has $const 'UI adapter = PROVEN')) { $fail += "constitution missing 'UI adapter = PROVEN'" }
if (-not (Has $const 'DECLARED'))            { $fail += "constitution missing Universal/Code DECLARED label" }

# (3) ledgers non-empty with REAL entries (not just headers)
if (-not (Has 'memory/_failures/FAILURE_LEDGER.md' 'FL-00')) { $fail += 'FAILURE_LEDGER has no FL-0## entries' }
if (-not (Has 'memory/_evidence/EVIDENCE_LEDGER.md' '(PROVEN|UISLICE)')) { $fail += 'EVIDENCE_LEDGER has no real evidence rows' }
if (-not (Has 'memory/_decisions/DECISION_LEDGER.md' 'D-00')) { $fail += 'DECISION_LEDGER has no D-0## entries' }
if (-not (Has 'memory/_evidence/SUCCESS_METRICS_LEDGER.md' '(UNKNOWN|attempts)')) { $fail += 'SUCCESS_METRICS_LEDGER empty/no honest UNKNOWN' }

# (4) UI adapter proof referenced (independent evidence, L18)
if (-not (Has 'memory/_evidence/EVIDENCE_LEDGER.md' 'UISLICE-001')) { $fail += 'UI adapter proof (UISLICE-001) not referenced in EVIDENCE_LEDGER' }

"bro-production-check - L3 static production health / L3 static production առողջություն"
"  production_os engine:   $(if(($fail | Where-Object {$_ -match 'production_os'}).Count){'MISSING'}else{'present'})"
"  label honesty:          UI=PROVEN, Code=DECLARED, constitution honest  ->  $(if(($fail | Where-Object {$_ -match 'contract|constitution'}).Count){'INCONSISTENT'}else{'OK'})"
"  ledger freshness:       failure/evidence/decision/success  ->  $(if(($fail | Where-Object {$_ -match 'LEDGER'}).Count){'STALE/EMPTY'}else{'OK'})"
"  UI adapter proof (L18): UISLICE-001 referenced  ->  $(if(($fail | Where-Object {$_ -match 'UISLICE'}).Count){'MISSING'}else{'OK'})"
"  UI runtime smoke:       ON-DEMAND (weekly) via tools/checks/bro-ui-smoke.ps1 — NOT run here, never faked GREEN (L18)"
if ($fail.Count) { $fail | ForEach-Object { "  [FAIL] $_" }; "RESULT: RED (production label/ledger/engine problem)"; exit 2 }
"RESULT: GREEN (production_os present; labels honest; ledgers fresh; UI proof referenced; runtime smoke on-demand)"
exit 0
