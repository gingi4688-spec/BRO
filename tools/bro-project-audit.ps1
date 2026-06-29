<#
  bro-project-audit.ps1 — READ-ONLY evidence-backed project audit (Beast Gate-2, §12)
  EN: Independent, evidence-backed audit of one Project Bro. REFUSES (exit 3) if the manifest and the registry
      disagree on project_id / memory_scope / status. Otherwise emits an evidence report (registry status, manifest
      values, spine version, hash-verify result, memory-scope result, isolation posture, touched-path boundaries,
      known limitations) and reflects the project doctor's verdict. Reads metadata + manifest + spine hashes only;
      never the project's sealed memory content. Registry source = canonical; -RegistryPath = explicit test param.
  HY: Անկախ, evidence-backed audit մեկ Project Bro-ի։ ՄԵՐԺՈՒՄ է (exit 3) եթե manifest-ն ու registry-ն չհամընկնեն
      project_id/scope/status-ով։ Այլապես՝ evidence report + project doctor-ի verdict։ Կարդում է միայն metadata +
      manifest + spine hash; երբեք sealed memory content։
  Exit: 0=GREEN 1=YELLOW 2=RED 3=REFUSED(mismatch/unknown).
#>
param([Parameter(Mandatory=$true)][string]$ProjectId, [string]$RegistryPath = '', [switch]$Log)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$regPath = if ($RegistryPath) { $RegistryPath } else { 'memory/_own/registry.json' }

"bro-project-audit - READ-ONLY - project: $ProjectId"
"================================================================"

# registry entry (refuse if unknown)
$entry = $null
try { $reg = Get-Content -Raw $regPath | ConvertFrom-Json; $entry = @($reg.projects) | Where-Object { "$($_.project_id)" -eq $ProjectId } | Select-Object -First 1 } catch {}
if ($null -eq $entry) { "REFUSED: no registry entry for '$ProjectId' (unknown project)."; exit 3 }
$ppath = "$($entry.project_path)"; $broDir = Join-Path $ppath 'bro'

# manifest
$mf = $null
try { $mf = Get-Content -Raw (Join-Path $broDir 'bro.manifest.json') | ConvertFrom-Json } catch {}
if ($null -eq $mf) { "REFUSED: bro.manifest.json missing/invalid at $broDir."; exit 3 }

# REFUSE on manifest <-> registry mismatch
$mismatch = @()
if ("$($mf.project_id)"   -ne $ProjectId)               { $mismatch += "project_id ($($mf.project_id) vs $ProjectId)" }
if ("$($mf.memory_scope)" -ne "$($entry.memory_scope)") { $mismatch += "memory_scope ($($mf.memory_scope) vs $($entry.memory_scope))" }
if ("$($mf.status)"       -ne "$($entry.status)")        { $mismatch += "status ($($mf.status) vs $($entry.status))" }
if ($mismatch.Count -gt 0) { "REFUSED: manifest<->registry mismatch: $($mismatch -join '; ')."; exit 3 }

# spine hash verify
$expVer = "$($entry.spine_version_expected)"
$relMfPath = Join-Path (Join-Path 'spine\RELEASES' $expVer) 'release.manifest.json'
$hok=0; $hbad=0; $htotal=0
if (Test-Path $relMfPath) {
  $relMf = Get-Content -Raw $relMfPath | ConvertFrom-Json; $htotal = @($relMf.files).Count
  foreach ($e in @($relMf.files)) { $tp = Join-Path (Join-Path $broDir 'spine') ("$($e.path)" -replace '/','\'); if ((Test-Path $tp) -and ((Get-FileHash $tp -Algorithm SHA256).Hash.ToLower() -eq "$($e.sha256)")) { $hok++ } else { $hbad++ } }
}

# evidence report
"[evidence]"
"  project_id:        $($mf.project_id)"
"  project_path:      $ppath"
"  registry_status:   $($entry.status)"
"  manifest:          scope=$($mf.memory_scope) authority=$($mf.authority) status=$($mf.status) spine=$($mf.spine_version)"
"  spine_version:     $($mf.spine_version)  (registry expected: $expVer)"
"  hash_verification: $hok/$htotal match (mismatch/missing=$hbad)"
"  memory_scope:      $($mf.memory_scope)  ->  $(if("$($mf.memory_scope)" -eq 'EP_only' -or "$($mf.memory_scope)" -match '_only$'){'scoped (OK)'}else{'UNSCOPED (FLAG)'})"
$rg = 'tools/hooks/cross-memory-read-guard.ps1'
$scopeAware = (Test-Path $rg) -and ((Get-Content -Raw $rg) -match 'memory_scope' -and (Get-Content -Raw $rg) -match 'targetProj')
"  isolation_guard:   scope-aware cross-memory-read-guard present=$scopeAware (a Bro reads only its own scope's memory; live block proof in beast-regression)"
"  touched_boundaries: writable surface = $broDir\  ONLY  |  $ppath\memory NOT writable  |  project root NOT writable (registry grants only \bro\)"
"  known_limitations: EP/bro own enforcement hooks land in Beast Gate 3; guard test-seams hardened in Beast Gate 4; sealed memory content never read by audit (B4/L8)."

# project doctor verdict (reused, fail-closed)
"[project doctor verdict]"
$docArgs = @('-NoProfile','-File','tools/bro-project-doctor.ps1','-ProjectId',$ProjectId)
if ($RegistryPath) { $docArgs += @('-RegistryPath',$RegistryPath) }
$docOut = & pwsh @docArgs
$docCode = $LASTEXITCODE
($docOut | Where-Object { $_ -match '^RESULT:' } | Select-Object -First 1) | ForEach-Object { "  doctor $_" }

$status = switch ($docCode) { 0 {'GREEN'} 1 {'YELLOW'} 2 {'RED'} default {'RED'} }
"================================================================"
"AUDIT RESULT: $status  (hashes $hok/$htotal · doctor exit $docCode)"
"NOTE: read-only evidence audit - flags only; sealed memory content never read."
if ($Log) {
  & pwsh -NoProfile -File 'tools/bro-log.ps1' -Log 'audit-log' -Heading "PROJECT_AUDIT ($ProjectId)" -Event 'PROJECT_AUDIT' -Action 'READ_ONLY_AUDIT' -Target "project $ProjectId ($ppath)" -Result $status -Source 'tools/bro-project-audit.ps1' -Authority 'Bro' -FilesChanged 'none' -Notes "scope=$($mf.memory_scope) status=$($mf.status) spine=$($mf.spine_version) hashes=$hok/$htotal" | Out-Null
  "(audit-log entry appended)"
}
exit $docCode
