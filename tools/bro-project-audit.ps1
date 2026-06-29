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
  Exit: 0=GREEN 1=YELLOW 2=RED 3=REFUSED(mismatch/unknown) 4=BLACK(tamper/evidence-missing).
      BLACK (topist) = a spine payload hash mismatch on the project's pulled spine (tamper/corruption evidence) OR no
      commit evidence for a seal. A commit-bound BLACK-tamper IS logged (it is the finding); a no-commit seal is REFUSED.
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
"  known_limitations: Project Bro enforcement is SuperBro-owned (authored in the template, delivered by governed install; L10) - NOT project-local evolution; guard test-seams hardened behind BRO_TEST_MODE; sealed memory content never read by audit (B4/L8)."

# project doctor verdict (reused, fail-closed)
"[project doctor verdict]"
$docArgs = @('-NoProfile','-File','tools/bro-project-doctor.ps1','-ProjectId',$ProjectId)
if ($RegistryPath) { $docArgs += @('-RegistryPath',$RegistryPath) }
$docOut = & pwsh @docArgs
$docCode = $LASTEXITCODE
($docOut | Where-Object { $_ -match '^RESULT:' } | Select-Object -First 1) | ForEach-Object { "  doctor $_" }

$status = switch ($docCode) { 0 {'GREEN'} 1 {'YELLOW'} 2 {'RED'} default {'RED'} }
$finalCode = $docCode
# BLACK (tamper): any spine payload hash mismatch on the project's pulled spine = tamper/corruption evidence.
if ($htotal -gt 0 -and $hbad -gt 0) { $status='BLACK'; $finalCode=4 }
# commit evidence (no-evidence-no-seal)
$commit = $null; try { $commit = (& git rev-parse --short HEAD 2>$null); if ($commit) { $commit = "$commit".Trim() } } catch {}
if (-not $commit -and $status -ne 'BLACK') { $status='BLACK'; $finalCode=4 }

"================================================================"
"AUDIT RESULT: $status  (hashes $hok/$htotal · doctor exit $docCode)"
"NOTE: read-only evidence audit - flags only; sealed memory content never read."
""
"SEAL (project-audit evidence) / SEAL (project-audit-ի evidence)"
"  commit:        $(if($commit){$commit}else{'n/a (NO EVIDENCE)'})"
"  scope:         project $ProjectId ($ppath) - metadata + manifest + spine hashes ONLY"
"  commands:      tools/bro-project-audit.ps1 -ProjectId $ProjectId  (+ bro-project-doctor)"
"  exit:          $finalCode ($status)"
"  changed_files: none (read-only)"
"  touched_paths: $broDir\bro.manifest.json, $broDir\spine\* (hash), registry (READ ONLY); NEVER $ppath\memory"
"  version-bound: spine_version=$($mf.spine_version) (registry expected $expVer)"
"  limitations:   metadata/hash-level; sealed project memory content NEVER read (B4/L8); enforcement is SuperBro-owned (L10), not project-local evolution."
"  GREEN does NOT mean: the project's sealed memory is correct, its code works, or a spine update is unneeded - ONLY that registry<->manifest agree, spine payload hashes verify, and isolation posture holds at THIS commit."
if (-not $commit) { ""; "RESULT: BLACK  (no commit evidence - seal REFUSED)" }

if ($Log) {
  if (-not $commit) {
    "(NO-EVIDENCE-NO-SEAL: no commit - refusing to write a project-audit seal)"
  } else {
    & pwsh -NoProfile -File 'tools/bro-log.ps1' -Log 'audit-log' -Heading "PROJECT_AUDIT ($ProjectId) commit=$commit" -Event 'PROJECT_AUDIT' -Action 'READ_ONLY_AUDIT' -Target "project $ProjectId ($ppath)" -Result $status -Source 'tools/bro-project-audit.ps1' -Authority 'Bro' -FilesChanged 'none' -Notes "scope=$($mf.memory_scope) status=$($mf.status) spine=$($mf.spine_version) hashes=$hok/$htotal commit=$commit" | Out-Null
    "(audit-log entry appended)"
  }
}
exit $finalCode
