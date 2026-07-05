<#
  bro-behavior-eval.ps1 — L2 behavioral eval harness (Phase 8d) · READ-ONLY
  EN: Two modes. DEFAULT (validate): confirm the behavioral eval cases exist and are well-formed (each with
      BEHAVIOR/PROMPT/EXPECTED/PASS/FAIL). This is DETERMINISTIC and can be GREEN — it proves the harness + cases are
      real. -Run (grade): would grade Bro's actual responses with an LLM; there is NO model wired in the script
      environment, so it honestly reports YELLOW (LLM-blocked) — NEVER a fake GREEN (L18). Behavioral grading is
      weekly/on-demand and is kept OUT of the daily deterministic path.
  HY: DEFAULT (validate)՝ case-երը well-formed են -> DETERMINISTIC GREEN (harness+cases իրական են)։ -Run (grade)՝ LLM
      չկա script env-ում -> ազնիվ YELLOW (LLM-blocked), ոչ երբեք կեղծ GREEN (L18)։ Weekly/on-demand, ոչ daily։
  Exit: 0 GREEN (cases well-formed) · 1 YELLOW (-Run: LLM-blocked) · 2 RED (cases missing/malformed).
#>
param([switch]$Run)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..\..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$casesFile = 'evals/cases/behavioral.cases.md'

if (-not (Test-Path $casesFile)) { "bro-behavior-eval: RESULT: RED (cases file missing: $casesFile)"; exit 2 }
$txt = Get-Content -Raw $casesFile
$caseNames = ([regex]'(?m)^## CASE:\s*(.+)$').Matches($txt) | ForEach-Object { $_.Groups[1].Value.Trim() }
$malformed = @()
foreach ($m in ([regex]'(?ms)^## CASE:\s*(.+?)(?=^## CASE:|\z)').Matches($txt)) {
  $name = ($m.Groups[1].Value -split "`n")[0].Trim(); $body = $m.Groups[1].Value
  foreach ($sec in @('BEHAVIOR','PROMPT','EXPECTED','PASS','FAIL')) { if ($body -notmatch "(?m)^-?\s*$sec") { $malformed += "$name (missing $sec)" } }
}

"bro-behavior-eval - L2 behavioral eval harness / L2 վարքագծային eval"
"  cases file:   $casesFile"
"  cases found:  $($caseNames.Count)  ($($caseNames -join ', '))"
"  well-formed:  $(if($malformed.Count){"NO -> $($malformed -join '; ')"}else{'YES (all have BEHAVIOR/PROMPT/EXPECTED/PASS/FAIL)'})"

if ($malformed.Count -gt 0) { "RESULT: RED (malformed eval cases)"; exit 2 }

if ($Run) {
  "  grading:      LLM run requested — NO model is wired in the script environment."
  "  to grade:     run each case's PROMPT through Bro in a session and score against PASS/FAIL (weekly/on-demand)."
  "RESULT: YELLOW (LLM-blocked — behavioral grading not run here; honest, no faked GREEN)"
  exit 1
}
"  grading:      ON-DEMAND (weekly) — NOT in the daily deterministic path; a real behavioral GREEN needs an LLM run."
"RESULT: GREEN (harness + $($caseNames.Count) eval cases present and well-formed; LLM grading on-demand)"
exit 0
