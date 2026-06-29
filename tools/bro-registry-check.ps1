<#
  bro-registry-check.ps1 — READ-ONLY registry validator (clean-build Phase 3, §8 / B4)
  EN: Validates memory/_own/registry.json: schema_version + entry_schema present, projects is an array, and (clean
      build) empty. If entries exist, checks each carries the required fields and no project_path sits inside
      another project's memory (B4). Read-only; writes nothing.
  HY: Ստուգում է registry.json-ը՝ schema_version + entry_schema, projects = array, (մաքուր build) դատարկ։ Entry-ների
      դեպքում՝ required field-եր + ոչ մի project_path ուրիշ project-ի memory-ի մեջ (B4)։ Read-only; ոչինչ չի գրում։
  Exit: 0=GREEN 1=YELLOW 2=RED.
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$problems = @(); $warn = @()
function Chk([bool]$c,[string]$ok,[string]$bad,[switch]$W){ if($c){"  [OK]   $ok"} elseif($W){"  [WARN] $bad";$script:warn+=$bad} else {"  [FAIL] $bad";$script:problems+=$bad} }

"bro-registry-check - READ-ONLY"
$reg=$null; $ok=$false
try { $reg = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json; $ok=$true } catch {}
Chk $ok "registry.json valid JSON" "registry.json INVALID/missing"
if ($ok) {
  Chk (("$($reg.schema_version)") -ne '') "schema_version = $($reg.schema_version)" "schema_version missing"
  Chk ($null -ne $reg.entry_schema) "entry_schema present" "entry_schema missing"
  $projects = @($reg.projects)
  Chk ($null -ne $reg.projects) "projects is present (count=$($projects.Count))" "projects key missing"
  "  [OK]   registry has $($projects.Count) registered project(s) (metadata only)"
  foreach ($p in $projects) {
    foreach ($k in @('project_id','project_path','memory_scope','status')) {
      Chk ($null -ne $p.$k) "entry $($p.project_id): field $k present" "entry missing field $k"
    }
    $pl = ("$($p.project_path)" -replace '/','\').ToLower()
    Chk (-not ($pl -match '\\(ep|db|gaa|gaahex|ip)\\bro\\memory')) "entry $($p.project_id): path not inside another project's memory" "entry $($p.project_id): path inside another project memory (B4 violation)"
  }
}
$status='GREEN'; $code=0
if ($problems.Count -gt 0){$status='RED';$code=2} elseif($warn.Count -gt 0){$status='YELLOW';$code=1}
"RESULT: $status  (problems=$($problems.Count), warnings=$($warn.Count))"
"NOTE: read-only - no files changed."
exit $code
