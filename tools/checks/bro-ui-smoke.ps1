<#
  bro-ui-smoke.ps1 — L3 UI runtime smoke (weekly / on-demand) (Phase 8c; v1.4.0 Block 3 automation) · READ-ONLY
  EN: The honest weekly/on-demand UI-capability smoke. It does NOT run in the daily deterministic path and NEVER
      fabricates a runtime GREEN (L18). It reports (1) the wired recipe + reference proof, (2) whether the runtime
      (node/npx) is available to run a real Playwright+axe smoke, and (3) the RECORDED evidence of the last real run
      from memory/_evidence/UI_SMOKE_EVIDENCE.md (it reads evidence, it never invents it). GREEN requires a fresh
      recorded run with all tests PASS and axe 0 serious/critical; no recorded run => YELLOW (NOT RUN) with the exact
      blocker; a recorded FAIL => RED. This stub alone can NEVER issue GREEN — only real Playwright/axe/screenshot
      evidence can.
  HY: Ազնիվ weekly/on-demand UI smoke։ Daily path-ում չի վազում ու ԵՐԲԵՔ չի կեղծ-GREEN (L18)։ Կարդում է recipe-ն,
      runtime-ի (node/npx) առկայությունը, ու վերջին ԻՐԱԿԱՆ run-ի գրանցված evidence-ը (UI_SMOKE_EVIDENCE.md)։ GREEN =
      թարմ run՝ բոլոր test PASS + axe 0 serious. run չկա => YELLOW (blocker-ով). recorded FAIL => RED։
  Exit: 0 GREEN (fresh recorded run, all PASS, axe clean) · 1 YELLOW (not run / no evidence / stale / runtime blocked) · 2 RED (recorded FAIL / axe serious).
#>
[CmdletBinding()]
param([int]$FreshnessDays = 8)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..\..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$today = Get-Date

$evidence = 'memory/_evidence/EVIDENCE_LEDGER.md'
$recipe   = '_core/production_os/ui/verification/UI_VERIFICATION_CHECKLIST.md'
$smokeEv  = 'memory/_evidence/UI_SMOKE_EVIDENCE.md'
$uiProven = (Test-Path $evidence) -and ((Get-Content -Raw $evidence) -match 'UISLICE-001')

# runtime availability (a real smoke needs node + npx + Playwright browsers)
function Have($n){ $null -ne (Get-Command $n -ErrorAction SilentlyContinue) }
$haveNode = Have 'node'; $haveNpx = Have 'npx'
$runtimeReady = $haveNode -and $haveNpx

# recorded real-run evidence (never invented)
$rec = $null
if (Test-Path $smokeEv) {
  $raw = Get-Content -Raw $smokeEv
  $blocks = [regex]::Matches($raw, '(?ms)^##\s+UI SMOKE RUN.*?(?=^##\s+UI SMOKE RUN|\z)')
  if ($blocks.Count -gt 0) {
    $b = $blocks[$blocks.Count-1].Value
    function Field($n){ $m=[regex]::Match($b,"(?im)^-?\s*$n\s*:\s*(.+)$"); if($m.Success){$m.Groups[1].Value.Trim()}else{$null} }
    $dstr=Field 'date'; $tests=Field 'tests'; $pass=Field 'PASS'; $fail=Field 'FAIL'; $axe=Field 'axe_serious'; $verdict=Field 'verdict'
    $age=$null; try { if ($dstr) { $age=($today-[datetime]::Parse($dstr)).Days } } catch {}
    $rec=[pscustomobject]@{ date=$dstr; age=$age; tests=$tests; pass=$pass; fail=$fail; axe=$axe; verdict=$verdict }
  }
}

# aggregate
$status='YELLOW'; $code=1; $why=''
if ($rec -and $rec.verdict) {
  if (("$($rec.fail)" -match '^[1-9]') -or ("$($rec.axe)" -match '^[1-9]')) {
    $status='RED'; $code=2; $why="recorded run has FAIL=$($rec.fail) axe_serious=$($rec.axe) — real UI defect, not GREEN"
  } elseif (($null -ne $rec.age) -and ($rec.age -gt $FreshnessDays)) {
    $status='YELLOW'; $code=1; $why="recorded UI-smoke evidence is STALE ($($rec.age)d > ${FreshnessDays}d) — re-run the weekly smoke"
  } elseif ("$($rec.verdict)" -match '(?i)GREEN' -and "$($rec.fail)" -match '^0') {
    $status='GREEN'; $code=0; $why="recorded run: PASS=$($rec.pass)/$($rec.tests), axe_serious=$($rec.axe), fresh (${FreshnessDays}d window)"
  } else {
    $status='YELLOW'; $code=1; $why="recorded evidence present but verdict not a clean GREEN — see $smokeEv"
  }
} else {
  $status='YELLOW'; $code=1
  $why = if ($runtimeReady) { "NOT RUN: runtime present (node/npx) but no recorded Playwright/axe evidence yet — run the smoke to capture it" }
         else { "NOT RUN + runtime-blocked: node/npx not available to run a Playwright smoke here" }
}

"bro-ui-smoke - L3 UI runtime smoke (weekly / on-demand) / weekly UI smoke"
"  wired recipe:        $recipe"
"  reference proof:     $evidence (UISLICE-001 PROVEN: $uiProven)"
"  runtime available:   node=$haveNode npx=$haveNpx  (a real smoke also needs Playwright browsers installed)"
if ($rec) {
  "  recorded smoke run:  date=$($rec.date) age=$(if($null -ne $rec.age){"$($rec.age)d"}else{'?'}) tests=$($rec.tests) PASS=$($rec.pass) FAIL=$($rec.fail) axe_serious=$($rec.axe) verdict=$($rec.verdict)  (source: $smokeEv)"
} else {
  "  recorded smoke run:  NONE ($smokeEv absent)"
}
"  how to run for real: scaffold/point at a UI, then: npx tsc --noEmit; npm run lint; npm run build; npx playwright test"
"                       (render x states x viewports + axe + keyboard + screenshots); append a '## UI SMOKE RUN' block"
"                       to $smokeEv (date/tests/PASS/FAIL/axe_serious/verdict). This reads it — it never invents GREEN."
"  daily path:          NOT run (the deterministic/free daily path excludes Playwright)."
"  blocker/why:         $why"
"RESULT: $status (UI runtime smoke; $(if($status -eq 'GREEN'){'fresh recorded Playwright/axe evidence, all PASS'}elseif($status -eq 'RED'){'recorded FAIL / axe serious'}else{'not run / no fresh evidence — honest, never faked runtime GREEN (L18)'}))"
exit $code
