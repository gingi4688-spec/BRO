<#
  bro-show-registry.ps1 — READ-ONLY palette backing for SHOW REGISTRY (clean-build Phase 1)
  EN: Prints memory/_own/registry.json (metadata only, B4/L8). Writes nothing, changes nothing.
  HY: Տպում է memory/_own/registry.json (միայն metadata, B4/L8)։ Ոչինչ չի գրում/փոխում։
  Exit: 0 OK · 2 registry missing/invalid.
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')   # run from BRO_HOME
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
$path = 'memory/_own/registry.json'
if (-not (Test-Path $path)) { "SHOW REGISTRY: registry.json MISSING / ԲԱՑԱԿԱՅՈՒՄ Է ($path)"; exit 2 }
try { $reg = Get-Content -Raw $path | ConvertFrom-Json } catch { "SHOW REGISTRY: registry.json INVALID JSON / ԱՆՎԱՎԵՐ JSON"; exit 2 }
"SHOW REGISTRY (read-only / միայն կարդալ) — BRO_HOME: $((Get-Location).Path)"
"  schema_version / սխեմայի տարբերակ: $($reg.schema_version)"
$projects = @($reg.projects)
"  registered projects / գրանցված պրոյեկտներ: $($projects.Count)"
if ($projects.Count -eq 0) {
  "  (none / չկա — clean build; projects are added later via REGISTER PROJECT, Gev-gated / պրոյեկտները ավելացվում են հետո՝ REGISTER PROJECT-ով)"
} else {
  foreach ($p in $projects) {
    "   - $($p.project_id) | path=$($p.project_path) | scope=$($p.memory_scope) | status=$($p.status)"
  }
}
"NOTE / ՆՇՈՒՄ: read-only — no files changed / միայն կարդալ, ոչ մի ֆայլ չի փոխվել։"
exit 0
