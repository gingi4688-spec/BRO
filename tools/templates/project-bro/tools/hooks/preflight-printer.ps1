<#
  preflight-printer.ps1 (Project Bro template) — SessionStart hook · clean-build Phase 2 + wall-to-root (§11 refinement #4)
  AUTHORED BY SUPERBRO, delivered by bro-install. Prints the Project Bro's OWN identity (project_id + memory_scope read
  from its bro.manifest.json), so opening the project ROOT shows the right banner - not SuperBro's.
  EN: Prints the per-session pre-flight banner: this project + scope · project root (the writable app) · allowed memory
      (bro\memory) · forbidden paths · spine version · critical-needs-Gev · cross-project OFF. Read-only; never blocks. Exit 0 always.
  HY: Տպում է session-ի pre-flight banner-ը՝ այս project + scope · project root (գրվող app-ը) · allowed memory (bro\memory) ·
      forbidden · spine version · critical-needs-Gev · cross-project OFF։ Read-only; երբեք չի block անում։ Exit 0 միշտ։
#>
try {
  $broHome = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
  $projectRoot = try { (Resolve-Path (Join-Path $broHome '..')).Path } catch { $broHome }
  $projId = '?'; $projScope = '?'; $ver = '?'
  try { $mf = Get-Content -Raw (Join-Path $broHome 'bro.manifest.json') | ConvertFrom-Json; $projId = $mf.project_id; $projScope = $mf.memory_scope; $ver = $mf.spine_version } catch {}
  Write-Output "==================== Project Bro pre-flight ===================="
  Write-Output ("  project:        {0}   ·   scope: {1}" -f $projId, $projScope)
  Write-Output ("  project root:   {0}   (the app - writable)" -f $projectRoot)
  Write-Output ("  bro home:       {0}" -f $broHome)
  Write-Output ("  allowed memory: bro\memory   (this project's sealed brain, {0})" -f $projScope)
  Write-Output ("  forbidden:      another project's memory · bro\memory\supermemory\** · bro\memory\_own\secrets\** · governed infra (bro\spine, bro\tools, .claude, manifest) · outside this project")
  Write-Output ("  spine version:  {0}   (pulled + hash-verified from a SuperBro release)" -f $ver)
  Write-Output ("  critical:       build/push/migrate/delete require explicit Gev command (D0/§8)")
  Write-Output ("  cross-project:  OFF (each project's memory is sealed, L8)")
  Write-Output ("  evidence logs:  bro\logs\ append-only; never hand-edited (§13A)")
  Write-Output "==============================================================="
  exit 0
} catch { exit 0 }

