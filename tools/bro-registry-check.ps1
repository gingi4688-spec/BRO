<#
  bro-registry-check.ps1 — READ-ONLY registry validator (Phase 3 + topist, §8 / B4)
  EN: Validates memory/_own/registry.json (metadata only, never project content). Checks: schema_version +
      entry_schema present; projects is an array; project_id UNIQUE; each entry carries required non-empty fields;
      memory_scope = <project_id>_only; status in the lifecycle enum {REGISTERED,INSTALLED,STALE,RETIRED};
      project_path is ABSOLUTE and not inside another project's memory (B4). The registry may be empty or hold
      entries (no longer assumes a clean-build empty registry). Read-only; writes nothing.
      Status-transition legality (enforced by bro-register/-Retire, noted here): REGISTERED -> INSTALLED -> {STALE,
      RETIRED}; a backward INSTALLED -> REGISTERED happens ONLY via a governed rollback. registry<->manifest mismatch
      is REFUSED at audit time by bro-project-audit (exit 3).
  HY: Ստուգում է registry.json-ը (միայն metadata)՝ schema + entry_schema; projects = array; project_id UNIQUE;
      required non-empty field-եր; memory_scope = <id>_only; status ∈ {REGISTERED,INSTALLED,STALE,RETIRED};
      project_path ABSOLUTE ու ոչ ուրիշ project-ի memory-ի մեջ (B4)։ Registry-ն կարող է դատարկ լինել կամ entry ունենալ։
  Exit: 0=GREEN 1=YELLOW 2=RED.  -RegistryPath = explicit test override (sandbox registry).
#>
param([string]$RegistryPath = '')
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
$regFile = if ($RegistryPath) { $RegistryPath } else { 'memory/_own/registry.json' }
$problems = @(); $warn = @()
function Chk([bool]$c,[string]$ok,[string]$bad,[switch]$W){ if($c){"  [OK]   $ok"} elseif($W){"  [WARN] $bad";$script:warn+=$bad} else {"  [FAIL] $bad";$script:problems+=$bad} }

"bro-registry-check - READ-ONLY / միայն կարդալ ($regFile)"
$reg=$null; $ok=$false
try { $reg = Get-Content -Raw $regFile | ConvertFrom-Json; $ok=$true } catch {}
Chk $ok "registry.json valid JSON" "registry.json INVALID/missing"
if ($ok) {
  Chk (("$($reg.schema_version)") -ne '') "schema_version = $($reg.schema_version)" "schema_version missing"
  Chk ($null -ne $reg.entry_schema) "entry_schema present" "entry_schema missing"
  $projects = @($reg.projects)
  Chk ($null -ne $reg.projects) "projects is present (count=$($projects.Count))" "projects key missing"
  "  [OK]   registry has $($projects.Count) registered project(s) (metadata only)"

  # project_id uniqueness (no duplicate ids across the registry)
  $ids = @($projects | ForEach-Object { "$($_.project_id)".ToLower() })
  $dupIds = @($ids | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Name })
  Chk ($dupIds.Count -eq 0) "project_id values are unique" "DUPLICATE project_id(s): $($dupIds -join ', ')"

  $validStatus = @('REGISTERED','INSTALLED','STALE','RETIRED')
  foreach ($p in $projects) {
    $pjid = "$($p.project_id)"
    foreach ($k in @('project_id','project_path','memory_scope','status')) {
      Chk ($null -ne $p.$k -and "$($p.$k)" -ne '') "entry ${pjid}: field $k present" "entry ${pjid}: missing/empty field $k"
    }
    Chk ("$($p.memory_scope)" -eq "${pjid}_only") "entry ${pjid}: memory_scope = ${pjid}_only" "entry ${pjid}: memory_scope '$($p.memory_scope)' != ${pjid}_only"
    Chk ("$($p.status)" -in $validStatus) "entry ${pjid}: status '$($p.status)' valid" "entry ${pjid}: invalid status '$($p.status)' (allowed: $($validStatus -join '|'))"
    $pp = "$($p.project_path)"
    Chk ($pp -match '^[A-Za-z]:\\') "entry ${pjid}: project_path is absolute" "entry ${pjid}: project_path not absolute: $pp"
    $pl = ($pp -replace '/','\').ToLower()
    Chk (-not ($pl -match '\\bro\\memory(\\|$)')) "entry ${pjid}: path not inside another project's memory (B4)" "entry ${pjid}: path inside another project memory (B4 violation)"
  }
}
$status='GREEN'; $code=0
if ($problems.Count -gt 0){$status='RED';$code=2} elseif($warn.Count -gt 0){$status='YELLOW';$code=1}
"RESULT: $status  (problems=$($problems.Count), warnings=$($warn.Count))"
"NOTE / ՆՇՈՒՄ: read-only - no files changed / միայն կարդալ, ոչ մի ֆայլ չի փոխվել։"
exit $code
