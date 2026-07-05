<#
  bro-ui-smoke.ps1 — L3 UI runtime smoke FOUNDATION (weekly / on-demand) (Phase 8c) · READ-ONLY
  EN: The honest weekly UI-capability smoke. It does NOT run in the daily deterministic path and NEVER fabricates a
      runtime GREEN (L18). Default = report the wired recipe + whether the reference sandbox is available; status is
      YELLOW "NOT RUN (on-demand)" unless a real Playwright run has produced evidence. Running the real smoke means
      re-executing the proven slice's recipe (npx playwright test) in the external sandbox and reading its evidence.
  HY: Ազնիվ weekly UI smoke։ Չի վազում daily path-ում ու ԵՐԲԵՔ չի կեղծ-GREEN (L18)։ Default՝ ցույց է տալիս recipe-ն ու
      sandbox-ի առկայությունը. status = YELLOW «NOT RUN (on-demand)» քանի դեռ իրական Playwright evidence չկա։
  Exit: 0 (informational foundation; a real GREEN requires an actual runtime evidence artifact, never this stub alone).
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..\..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}

$evidence = 'memory/_evidence/EVIDENCE_LEDGER.md'
$recipe   = '_core/production_os/ui/verification/UI_VERIFICATION_CHECKLIST.md'
$uiProven = (Test-Path $evidence) -and ((Get-Content -Raw $evidence) -match 'UISLICE-001')

"bro-ui-smoke - L3 UI runtime smoke FOUNDATION (weekly / on-demand) / weekly UI smoke"
"  wired recipe:        $recipe"
"  reference evidence:  $evidence (UISLICE-001 PROVEN: $uiProven)"
"  how to run for real: in the external sandbox — npx tsc --noEmit; npm run lint; npm run build;"
"                       npx playwright test  (states x viewports + axe) -> ../slice-evidence/"
"  daily path:          NOT run (deterministic/free daily path excludes Playwright)"
"  status:              YELLOW — NOT RUN (on-demand). A real UI-capability GREEN requires an actual runtime"
"                       evidence artifact (Playwright/axe/screenshots), NEVER this stub alone (L18)."
"RESULT: YELLOW (on-demand smoke not run now; honest — no faked runtime GREEN)"
exit 0
