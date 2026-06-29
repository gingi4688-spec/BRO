<#
  preflight-printer.ps1 — SessionStart hook · clean-build Phase 2 (§11 refinement #4)
  EN: Prints the per-session pre-flight banner: current project · allowed memory · forbidden paths ·
      spine version · critical-needs-Gev · cross-project OFF. Read-only; never blocks. Exit 0 always.
  HY: Տպում է session-ի pre-flight banner-ը՝ project · allowed memory · forbidden paths · spine version ·
      critical-needs-Gev · cross-project OFF։ Read-only; երբեք չի block անում։ Exit 0 միշտ։
#>
try {
  $broHome = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
  $ver = '?'; $phase = '?'
  try { $mf = Get-Content -Raw (Join-Path $broHome 'bro.manifest.json') | ConvertFrom-Json; $ver = $mf.spine_version; $phase = $mf.phase } catch {}
  Write-Output "==================== SuperBro pre-flight ===================="
  Write-Output ("  project:        _super (SuperBro)   ·   phase: {0}" -f $phase)
  Write-Output ("  BRO_HOME:       {0}" -f $broHome)
  Write-Output ("  allowed memory: memory/_own (registry + evidence logs only)")
  Write-Output ("  forbidden:      another project's memory · memory/supermemory/** · memory/_own/secrets/** · outside BRO_HOME")
  Write-Output ("  spine version:  {0}   (live spine at root dirs, OD-6)" -f $ver)
  Write-Output ("  critical:       build/push/migrate/delete/release/promote/lock require explicit Gev command (D0/§8)")
  Write-Output ("  cross-project:  OFF (opens only by explicit Gev command, §9)")
  Write-Output ("  evidence logs:  append-only (tools/bro-log.ps1); never hand-edited (§13A)")
  Write-Output "============================================================="
  exit 0
} catch { exit 0 }
