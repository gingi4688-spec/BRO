<#
  bro-taste-check.ps1 — L4 Gev-taste health (deterministic parts) (Phase 8d) · READ-ONLY
  EN: The DETERMINISTIC subset of L4 (daily-safe): (1) the Gev Taste Engine example banks are FILLED (GOOD ≥3, BAD ≥3
      = Mode-B fuel present); (2) the taste eval cases exist; (3) failure-LEARNING is populated + no repeated mistake
      recurs unaddressed (NEVER_REPEAT rules exist, REPAIR_PATTERNS present, FAILURE_LEDGER has entries, and no single
      FL "What failed" root recurs 2+ times). The QUALITY grading (answer/design/decision hits Gev's standard) is
      LLM-graded, weekly/on-demand — reported, never faked GREEN (L18).
  HY: L4-ի DETERMINISTIC ենթաբազմությունը (daily)՝ GOOD/BAD banks լցված, taste cases կան, failure-learning populated +
      կրկնվող սխալ չկա։ QUALITY grading-ը LLM-ով (weekly), չի կեղծ-GREEN։
  Exit: 0 GREEN · 2 RED (empty taste banks / repeated unaddressed mistake).
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..\..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$fail = @()
function Count($path, $pattern) { if (-not (Test-Path $path)) { return 0 }; ([regex]$pattern).Matches((Get-Content -Raw $path)).Count }

$good = Count 'self/gev_standard/GOOD_EXAMPLES.md' '(?m)^## G-\d+'
$bad  = Count 'self/gev_standard/BAD_EXAMPLES.md'  '(?m)^## B-\d+'
if ($good -lt 3) { $fail += "GOOD_EXAMPLES underfilled ($good < 3)" }
if ($bad  -lt 3) { $fail += "BAD_EXAMPLES underfilled ($bad < 3)" }
if (-not (Test-Path 'evals/cases/taste.cases.md')) { $fail += 'taste eval cases missing' }

# failure-learning populated
$nr  = Count 'memory/_failures/NEVER_REPEAT.md'    '(?m)^-\s*\*\*NR-\d+'
$rp  = Count 'memory/_failures/REPAIR_PATTERNS.md' '(?m)^## RP-\d+'
$fl  = Count 'memory/_failures/FAILURE_LEDGER.md'  '(?m)^## FL-\d+'
if ($nr -lt 1) { $fail += 'NEVER_REPEAT has no NR rules' }
if ($rp -lt 1) { $fail += 'REPAIR_PATTERNS empty' }
if ($fl -lt 1) { $fail += 'FAILURE_LEDGER empty' }

# repeated-mistake heuristic (deterministic): the same FL "What failed:" text appearing 2+ times
$repeated = @()
if (Test-Path 'memory/_failures/FAILURE_LEDGER.md') {
  $whats = ([regex]'(?m)^\-?\s*\*\*What(?: failed)?:\*\*\s*(.+)$').Matches((Get-Content -Raw 'memory/_failures/FAILURE_LEDGER.md')) | ForEach-Object { $_.Groups[1].Value.Trim().ToLower() }
  $repeated = @($whats | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Name.Substring(0,[Math]::Min(50,$_.Name.Length)) })
}
if ($repeated.Count) { $fail += "repeated FL root cause(s): $($repeated -join ' | ')" }

"bro-taste-check - L4 Gev-taste health (deterministic) / L4 ճաշակ (deterministic)"
"  taste banks:        GOOD=$good BAD=$bad  ->  $(if($good -ge 3 -and $bad -ge 3){'FILLED'}else{'UNDERFILLED'})"
"  taste eval cases:   $(if(Test-Path 'evals/cases/taste.cases.md'){'present'}else{'MISSING'})"
"  failure-learning:   NR=$nr RP=$rp FL=$fl  ->  $(if($nr -and $rp -and $fl){'populated'}else{'INCOMPLETE'})"
"  repeated mistakes:  $($repeated.Count)  ->  $(if($repeated.Count){'RECURRING'}else{'none'})"
"  quality grading:    ON-DEMAND (weekly, LLM) — reported, never faked GREEN (L18)"
if ($fail.Count) { $fail | ForEach-Object { "  [FAIL] $_" }; "RESULT: RED (taste banks / failure-learning / repeated mistake)"; exit 2 }
"RESULT: GREEN (taste banks filled; cases present; failure-learning populated; no repeated mistake; LLM grading on-demand)"
exit 0
