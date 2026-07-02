<#
  bro-show-health.ps1 — READ-ONLY palette backing for SHOW HEALTH (clean-build Phase 1)
  EN: Prints the generated health-dashboard snapshot. Writes nothing, changes nothing.
  HY: Տպում է գեներացված health-dashboard snapshot-ը։ Ոչինչ չի գրում/փոխում։
  Exit: 0 OK · 2 snapshot missing.
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')   # run from BRO_HOME
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'
$path = 'memory/_own/health-dashboard.md'
if (-not (Test-Path $path)) { "SHOW HEALTH: health-dashboard.md MISSING / ԲԱՑԱԿԱՅՈՒՄ Է ($path)"; exit 2 }
"SHOW HEALTH (read-only / միայն կարդալ) — source / աղբյուր: $path"
"----------------------------------------------------------------"
Get-Content -Raw $path
"----------------------------------------------------------------"
"NOTE / ՆՇՈՒՄ: read-only — no files changed / միայն կարդալ. Regenerate with / վերագեներացրու bro-health.ps1 (Phase 2)."
exit 0
