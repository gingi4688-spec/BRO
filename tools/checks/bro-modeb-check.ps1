<#
  bro-modeb-check.ps1 — Mode-B (Gev-taste) readiness reporter (on-demand) (v1.4.0 Block 4) · READ-ONLY
  EN: Reports whether the Gev Taste Engine has enough REAL Gev-labeled examples to activate Mode-B (taste-tuned).
      Counts: distilled Mode-A fuel (GOOD_EXAMPLES G-###, BAD_EXAMPLES B-###) for context, and Gev-labeled Mode-B
      entries (GX-###, BX-### in self/gev_standard/MODE_B_INTAKE.md). Mode-B activates at >= 15 Gev-labeled entries
      (target 15-20). Honesty gate (L15/L18): every GX/BX entry MUST carry a `gev_said:` field (the real Gev judgement)
      — an entry without it is an invented taste example and is RED (forbidden). This is NOT a daily check; Mode-B
      stays YELLOW (awaiting Gev) below threshold and Bro runs Mode-A. It never fabricates readiness.
  HY: Հաղորդում է՝ բավակա՞ն Gev-labeled օրինակ կա Mode-B ակտիվացնելու (>=15, target 15-20)։ Honesty gate՝ ամեն GX/BX
      entry պիտի ունենա `gev_said:` (իրական Գև-դատողություն), այլապես RED (հորինված է)։ Ոչ daily. շեմից ցածր՝ YELLOW։
  Exit: 0 GREEN (>=15 Gev-labeled, all with gev_said) · 1 YELLOW (< threshold, awaiting Gev) · 2 RED (entry missing gev_said / intake/rubric missing).
#>
[CmdletBinding()]
param([int]$Threshold = 15, [int]$Target = 20)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..\..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$fail = @()
function Count($path, $pattern) { if (-not (Test-Path $path)) { return 0 }; ([regex]$pattern).Matches((Get-Content -Raw $path)).Count }

$goodF = 'self/gev_standard/GOOD_EXAMPLES.md'
$badF  = 'self/gev_standard/BAD_EXAMPLES.md'
$intake= 'self/gev_standard/MODE_B_INTAKE.md'

$distilledGood = Count $goodF '(?m)^##\s*G-\d+'
$distilledBad  = Count $badF  '(?m)^##\s*B-\d+'

if (-not (Test-Path $intake)) { $fail += "MODE_B_INTAKE.md missing (intake template absent)" }
# Count ONLY real entries in the 'Gev-labeled examples' section (excludes the entry-template placeholders above it).
$section = ''
if (Test-Path $intake) {
  $raw = Get-Content -Raw $intake
  $mSec = [regex]::Match($raw, '(?ms)^##\s*Gev-labeled examples.*\z')
  if ($mSec.Success) { $section = $mSec.Value }
}
$gevGood = if ($section) { ([regex]'(?m)^##\s*GX-\d+').Matches($section).Count } else { 0 }
$gevBad  = if ($section) { ([regex]'(?m)^##\s*BX-\d+').Matches($section).Count } else { 0 }
$gevLabeled = $gevGood + $gevBad

# honesty gate: every real GX/BX entry must carry a gev_said: field (the real Gev judgement)
$missingSaid = 0
if ($section) {
  foreach ($m in [regex]::Matches($section, '(?ms)^##\s*(?:GX|BX)-\d+.*?(?=^##\s*(?:GX|BX)-\d+|\z)')) {
    if ($m.Value -notmatch '(?im)^-?\s*gev_said\s*:\s*\S') { $missingSaid++ }
  }
}
# rubric present in intake
if ((Test-Path $intake) -and ((Get-Content -Raw $intake) -notmatch '(?i)Scoring rubric')) { $fail += "MODE_B_INTAKE.md has no scoring rubric section" }
if ($missingSaid -gt 0) { $fail += "$missingSaid Gev-labeled entr(y/ies) missing the gev_said: honesty anchor (invented-taste risk — L15/L18)" }

# aggregate
if ($fail.Count) { $status='RED'; $code=2 }
elseif ($gevLabeled -ge $Threshold) { $status='GREEN'; $code=0 }
else { $status='YELLOW'; $code=1 }

"bro-modeb-check - Mode-B (Gev-taste) readiness / Mode-B պատրաստվածություն"
"  Mode-A fuel (distilled):   GOOD=$distilledGood BAD=$distilledBad  (context only; seeds Mode-A, live now)"
"  Gev-labeled (Mode-B):      GX=$gevGood BX=$gevBad  total=$gevLabeled   (honesty anchor gev_said: $(if($missingSaid){"MISSING on $missingSaid"}else{'present on all'}))"
"  activation threshold:      >= $Threshold Gev-labeled entries (target $Threshold-$Target)"
"  gap to activation:         $([Math]::Max(0, $Threshold - $gevLabeled)) more Gev-labeled example(s) needed"
"  intake template:           $(if(Test-Path $intake){'present'}else{'MISSING'}) ($intake)"
"  Mode in effect:            $(if($status -eq 'GREEN'){'Mode-B ACTIVE (>= threshold; activated 2026-07-05 on Gev go) — Mode-A stays the floor'}else{'Mode-A (professional baseline, live) — Mode-B awaiting Gev'})"
if ($fail.Count) { $fail | ForEach-Object { "  [FAIL] $_" } }
"RESULT: $status ($(if($status -eq 'GREEN'){"Mode-B ready: $gevLabeled Gev-labeled >= $Threshold"}elseif($status -eq 'RED'){'intake/rubric/honesty problem'}else{"awaiting Gev: $gevLabeled/$Threshold Gev-labeled — no invented taste, Mode-A live"}))"
exit $code
