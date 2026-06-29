<#
  bro-show-registry.ps1 — READ-ONLY palette backing for SHOW REGISTRY (clean-build Phase 1)
  EN: Prints memory/_own/registry.json (metadata only, B4/L8). Writes nothing, changes nothing.
  HY: Տպում է memory/_own/registry.json (միայն metadata, B4/L8)։ Ոչինչ չի գրում/փոխում։
  Exit: 0 OK · 2 registry missing/invalid.
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')   # run from BRO_HOME
$path = 'memory/_own/registry.json'
if (-not (Test-Path $path)) { "SHOW REGISTRY: registry.json MISSING ($path)"; exit 2 }
try { $reg = Get-Content -Raw $path | ConvertFrom-Json } catch { "SHOW REGISTRY: registry.json INVALID JSON"; exit 2 }
"SHOW REGISTRY (read-only) — BRO_HOME: $((Get-Location).Path)"
"  schema_version: $($reg.schema_version)"
$projects = @($reg.projects)
"  registered projects: $($projects.Count)"
if ($projects.Count -eq 0) {
  "  (none — clean build; projects are added later via REGISTER PROJECT, Gev-gated)"
} else {
  foreach ($p in $projects) {
    "   - $($p.project_id) | path=$($p.project_path) | scope=$($p.memory_scope) | status=$($p.status)"
  }
}
"NOTE: read-only — no files changed."
exit 0
