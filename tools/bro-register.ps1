<#
  bro-register.ps1 — REGISTER PROJECT (DRY-RUN ONLY, clean-build Phase 3, §8 / B4 / D0)
  EN: Rollout command in DRY mode: shows the registry entry it WOULD write (metadata only) and EXECUTES NOTHING.
      Refuses a project_path that sits inside another project's memory or inside BRO_HOME (B4). The registry stays
      empty (projects:[]). Real execution is a LATER, Gev-gated Rollout step — NOT enabled in the clean build.
  HY: Rollout command DRY mode-ում՝ ցույց է տալիս registry entry-ն, որ ԿԳՐԵՐ (միայն metadata) ու ՈՉԻՆՉ ՉԻ ԿԱՏԱՐՈՒՄ։
      Մերժում է ուրիշ project-ի memory-ի մեջ / BRO_HOME-ի մեջ ընկած path (B4)։ Registry-ն մնում է դատարկ։ Real
      execution-ը հետագա Gev-gated Rollout է — մաքուր build-ում ՄԻԱՑՎԱԾ ՉԷ։
  Exit: 0 dry-preview OK · 2 missing inputs · 3 refused (B4 violation).
#>
param(
  [string]$ProjectId = '',
  [string]$ProjectPath = '',
  [string]$MemoryScope = '',
  [string]$Authority = 'ProjectBro',
  [switch]$Yes
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$broHome = (Get-Location).Path

"REGISTER PROJECT - DRY-RUN (clean build) - executes nothing"
if (-not $ProjectId -or -not $ProjectPath) {
  "  usage: bro-register.ps1 -ProjectId <id> -ProjectPath <abs-path> [-MemoryScope <id>_only]"
  "  (DRY preview requires at least -ProjectId and -ProjectPath)"
  exit 2
}
if (-not $MemoryScope) { $MemoryScope = "${ProjectId}_only" }

# B4 validation (refuse even in dry): no path inside another project's memory, none inside BRO_HOME
$pl = ($ProjectPath -replace '/','\').ToLower()
$refuse = ''
if ($pl -match '\\(ep|db|gaa|gaahex|ip)\\bro\\memory') { $refuse = 'path is inside another project''s memory (B4/L8)' }
elseif ($pl.StartsWith(($broHome.ToLower().TrimEnd('\') + '\'))) { $refuse = 'path is inside BRO_HOME (a project must live in its own root)' }

"  preview - registry entry that WOULD be written (metadata only):"
"    project_id:            $ProjectId"
"    project_path:          $ProjectPath"
"    memory_scope:          $MemoryScope"
"    authority:             $Authority"
"    spine_version_expected: <pulled at install>"
"    status:                REGISTERED"
"  files_affected (real run): memory/_own/registry.json (metadata only); NO project content"

if ($refuse) {
  "  REFUSED (B4): $refuse"
  "  result: NOTHING written; registry unchanged; no project folder touched."
  exit 3
}
if ($Yes) { "  (YES received)" }
"  DRY-RUN: nothing executed. registry.json unchanged (projects:[] preserved). No project folder touched."
"  next: real REGISTER is a later Gev-gated Rollout step (requires BRO_GEV_APPROVED=1 + Gev command)."
exit 0
