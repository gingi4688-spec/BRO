<#
  bro-allprojects-check.ps1 — L1 all-INSTALLED-project doctor+audit coverage (Phase 8a) · READ-ONLY
  EN: Runs bro-project-doctor + bro-project-audit for EVERY registry project with status INSTALLED (beast checks only
      EP). RETIRED projects (e.g. DB) are excluded. Aggregates one GREEN/RED. Reads only manifest/spine metadata —
      NEVER sealed project memory (the project-audit SEAL enforces this).
  HY: Վազում է ամեն INSTALLED project-ի doctor+audit (ոչ միայն EP)։ RETIRED-ը (DB) բացառված։ Երբեք sealed memory չի կարդում։
  Exit: 0 all GREEN · 2 any INSTALLED project RED.
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..\..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$reg = Get-Content -Raw 'memory/_own/registry.json' | ConvertFrom-Json
$installed = @($reg.projects | Where-Object { "$($_.status)" -eq 'INSTALLED' })

"bro-allprojects-check - all INSTALLED project doctor+audit / բոլոր INSTALLED-ի doctor+audit"
$anyRed = $false
foreach ($p in $installed) {
  $id = "$($p.project_id)"
  & pwsh -NoProfile -File 'tools/bro-project-doctor.ps1' -ProjectId $id *> $null; $dc = $LASTEXITCODE
  & pwsh -NoProfile -File 'tools/bro-project-audit.ps1'  -ProjectId $id *> $null; $ac = $LASTEXITCODE
  $ok = ($dc -eq 0 -and $ac -eq 0)
  if (-not $ok) { $anyRed = $true }
  ("  {0,-6} doctor=exit{1} audit=exit{2}  {3}" -f $id, $dc, $ac, $(if($ok){'GREEN'}else{'RED'}))
}
$retired = @($reg.projects | Where-Object { "$($_.status)" -eq 'RETIRED' } | ForEach-Object { "$($_.project_id)" })
"  excluded (RETIRED): $(if($retired){$retired -join ', '}else{'(none)'})"
if ($anyRed) { "RESULT: RED (>=1 INSTALLED project failed doctor/audit)"; exit 2 }
"RESULT: GREEN (all $($installed.Count) INSTALLED projects pass doctor+audit)"
exit 0
