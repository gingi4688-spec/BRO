<#
  bro-update-spine.ps1 — UPDATE PROJECT BRO SPINE (DRY-RUN ONLY, clean-build Phase 3, §6A Flow 2 / D0)
  EN: Rollout command in DRY mode: shows the pull -> verify hashes -> stamp spine_version plan and EXECUTES
      NOTHING. The pull/verify/stamp PROCEDURE itself is built in Phase 4; no Project Bro exists to update yet.
  HY: Rollout command DRY mode-ում՝ ցույց է տալիս pull -> hash verify -> spine_version stamp plan-ը ու ՈՉԻՆՉ ՉԻ
      ԿԱՏԱՐՈՒՄ։ pull/verify/stamp procedure-ը կառուցվում է Phase 4-ում; update անող Project Bro դեռ չկա։
  Exit: 0 dry-preview OK · 2 missing inputs.
#>
param(
  [string]$ProjectId = '',
  [string]$Version = '',
  [switch]$Yes
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')

"UPDATE PROJECT BRO SPINE - DRY-RUN (clean build) - executes nothing"
if (-not $ProjectId) {
  "  usage: bro-update-spine.ps1 -ProjectId <id> [-Version v<ver>]"
  exit 2
}
$verShown = if ($Version) { $Version } else { '<latest approved release>' }
"  preview - pull/verify/stamp plan for project: $ProjectId"
"    1) pull approved spine release $verShown  (availability signal only; never forced, B6)"
"    2) verify hashes against the release manifest (sha256)  -> reject on mismatch"
"    3) stamp spine_version in X/bro/bro.manifest.json"
"  note: the pull/verify/stamp procedure is implemented in Phase 4 (Spine Release / Update System)."
if ($Yes) { "  (YES received)" }
"  DRY-RUN: nothing executed. No release pulled, no hash verified, no manifest stamped. No project touched."
"  next: real UPDATE is a later Gev-gated Rollout step (requires a release + Gev command)."
exit 0
