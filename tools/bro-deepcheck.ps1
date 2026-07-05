<#
  bro-deepcheck.ps1 — L2/L4 DEEP CHECK (weekly / on-demand) · READ-ONLY  (v1.4.0 Block 2)
  EN: The on-demand deep layer that RUNS the L2 behavioral + L4 taste LLM-grading paths. It is kept OUT of the daily
      deterministic path (bro-selfaudit, the 11:00 scheduled task, and bro-selfcheck's default no-flag run) — so daily
      GREEN NEVER depends on an LLM. Honesty (L18): the PowerShell environment has NO LLM API wired, so the AUTOMATED
      in-script grade is YELLOW (LLM-blocked) with the exact blocker named — never a fake GREEN. When a real
      session/human LLM run has recorded evidence in memory/_evidence/DEEPCHECK_EVIDENCE.md, this reads and reports the
      RECORDED verdict (it reports evidence; it never invents it). Stale evidence (> the freshness window) is YELLOW.
  HY: On-demand deep շերտ՝ L2 behavioral + L4 taste LLM-grade։ Daily path-ից ԴՈՒՐՍ (daily GREEN-ը երբեք LLM-ից կախված չէ)։
      PowerShell-ում LLM API չկա -> ավտոմատ grade = YELLOW (LLM-blocked), երբեք կեղծ GREEN (L18)։ Իրական LLM run-ի
      գրանցված evidence-ը (DEEPCHECK_EVIDENCE.md) կարդում ու հաղորդում է ազնիվ. stale evidence = YELLOW։
  Exit: 0 GREEN (fresh recorded LLM evidence, all PASS) · 1 YELLOW (LLM-blocked / no evidence / stale / partial) · 2 RED (cases malformed OR recorded FAIL).
#>
[CmdletBinding()]
param([int]$FreshnessDays = 8)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
Remove-Item env:BRO_GEV_APPROVED -ErrorAction SilentlyContinue   # deep check is read-only; runs token-free
$today = Get-Date

function RunCheck([string]$file, [string[]]$argv) {
  $out = & pwsh -NoProfile -File $file @argv 2>&1
  $ex = $LASTEXITCODE
  $clean = @($out | ForEach-Object { "$_" -replace "\x1b\[[0-9;]*m", '' })
  $res = ($clean | Where-Object { $_ -match '(?i)^(BEAST )?RESULT:' } | Select-Object -Last 1)
  return [pscustomobject]@{ exit=$ex; result=("$res").Trim() }
}

# --- L2 behavioral (grade path) + L4 taste (deterministic + quality note) ---
$behav = RunCheck 'tools/checks/bro-behavior-eval.ps1' @('-Run')   # -Run => YELLOW LLM-blocked in-script (honest)
$taste = RunCheck 'tools/checks/bro-taste-check.ps1' @()           # deterministic subset; quality grade is LLM/on-demand
$behavMalformed = ($behav.exit -eq 2)
$tasteRed       = ($taste.exit -ne 0)

# --- recorded session/human LLM evidence (never invented) ---
$evPath = 'memory/_evidence/DEEPCHECK_EVIDENCE.md'
$rec = $null
if (Test-Path $evPath) {
  $raw = Get-Content -Raw $evPath
  # last '## DEEPCHECK RUN' block wins; parse date / cases / PASS / FAIL / verdict
  $blocks = [regex]::Matches($raw, '(?ms)^##\s+DEEPCHECK RUN.*?(?=^##\s+DEEPCHECK RUN|\z)')
  if ($blocks.Count -gt 0) {
    $b = $blocks[$blocks.Count-1].Value
    function Field($n){ $m=[regex]::Match($b,"(?im)^-?\s*$n\s*:\s*(.+)$"); if($m.Success){$m.Groups[1].Value.Trim()}else{$null} }
    $dstr = Field 'date'; $pass = Field 'PASS'; $fail = Field 'FAIL'; $cases = Field 'cases'; $verdict = Field 'verdict'; $layer = Field 'layer'
    $age = $null; try { if ($dstr) { $age = ($today - [datetime]::Parse($dstr)).Days } } catch {}
    $rec = [pscustomobject]@{ date=$dstr; age=$age; cases=$cases; pass=$pass; fail=$fail; verdict=$verdict; layer=$layer }
  }
}

# --- aggregate ---
$status = 'YELLOW'; $code = 1; $why = ''
if ($behavMalformed -or $tasteRed) {
  $status='RED'; $code=2; $why = 'eval cases malformed OR taste deterministic subset RED — fix before grading'
}
elseif ($rec -and $rec.verdict) {
  if ("$($rec.fail)" -match '^[1-9]') {
    $status='RED'; $code=2; $why = "recorded LLM run has FAIL=$($rec.fail) — a real behavioral/taste finding, not GREEN"
  } elseif (($null -ne $rec.age) -and ($rec.age -gt $FreshnessDays)) {
    $status='YELLOW'; $code=1; $why = "recorded LLM evidence is STALE ($($rec.age)d > ${FreshnessDays}d) — re-run the weekly grade"
  } elseif ("$($rec.verdict)" -match '(?i)GREEN' -and "$($rec.fail)" -match '^0') {
    $status='GREEN'; $code=0; $why = "recorded LLM run: PASS=$($rec.pass)/$($rec.cases), fresh (${FreshnessDays}d window)"
  } else {
    $status='YELLOW'; $code=1; $why = "recorded evidence present but verdict not a clean GREEN — see $evPath"
  }
}
else {
  $status='YELLOW'; $code=1
  $why = 'LLM-blocked: no model/API wired in the PowerShell environment AND no recorded session/human grade evidence yet'
}

"bro-deepcheck - L2/L4 DEEP CHECK (weekly / on-demand) / deep grade (weekly)"
"  scope:            L2 behavioral + L4 taste LLM grading — OUT of the daily deterministic path (daily GREEN never uses it)"
"  L2 behavioral:    $($behav.result)"
"  L4 taste (det):   $($taste.result)"
if ($rec) {
  "  recorded LLM run: date=$($rec.date) age=$(if($null -ne $rec.age){"$($rec.age)d"}else{'?'}) layer=$($rec.layer) PASS=$($rec.pass) FAIL=$($rec.fail) verdict=$($rec.verdict)  (source: $evPath)"
} else {
  "  recorded LLM run: NONE ($evPath absent) — automated in-script grade is LLM-blocked (no API in PowerShell env)"
}
"  how to run real:  session/human runs each eval-case PROMPT through Bro, an INDEPENDENT grader scores vs PASS/FAIL,"
"                    then appends a '## DEEPCHECK RUN' block to $evPath (date/cases/PASS/FAIL/verdict). This reads it."
"  daily path:       UNCHANGED — bro-selfaudit + the 11:00 task + bro-selfcheck(no -Deep) never call this."
"  blocker/why:      $why"
"RESULT: $status (deep L2/L4 grade; $(if($status -eq 'GREEN'){'fresh recorded LLM evidence, all PASS'}elseif($status -eq 'RED'){'malformed cases or recorded FAIL'}else{'LLM-blocked / no fresh evidence — honest, never faked GREEN (L18)'}))"
exit $code
