<#
  bro-log.ps1 — append-only EVIDENCE writer (clean-build Phase 2, §13A / D7)
  EN: The ONLY sanctioned way to append to an evidence log. Timestamps + session_id are SCRIPT-generated
      (never typed by Bro); no fabricated values (missing -> 'n/a'). Append-only — never edits/deletes.
      Evidence logs are also protected by the log-append-only-guard hook (direct Edit/Write is blocked).
  HY: Evidence log-ին append անելու ՄԻԱԿ սանկցավորված ձևը։ Timestamp + session_id = SCRIPT-generated
      (ոչ Bro-ի ձեռքով); ոչ fabrication (չկա -> 'n/a')։ Append-only — երբեք edit/delete չի անում։
  Exit: 0 OK · 2 bad log name.
#>
param(
  [Parameter(Mandatory=$true)][string]$Log,
  [string]$Heading = 'EVENT',
  [string]$Event = '',
  [string]$Action = '',
  [string]$Target = 'n/a',
  [string]$Result = '',
  [string]$Source = 'n/a',
  [string]$Authority = 'Bro',
  [string]$FilesChanged = 'none',
  [string]$Notes = ''
)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')   # run from BRO_HOME
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0/F1: render Armenian, not '???'

$allowed = @('audit-log','hook-blocks','authority-log','release-log','failure-registry','sync-log')
if ($allowed -notcontains $Log) { "bro-log: unknown log / անհայտ log '$Log' (allowed: $($allowed -join ', '))"; exit 2 }
$path = "memory/_own/$Log.md"
if (-not (Test-Path $path)) { "bro-log: log file missing: $path"; exit 2 }

$ts = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
$sid = if ($env:BRO_SESSION_ID) { $env:BRO_SESSION_ID } else { "BRO-" + (Get-Date -Format "yyyyMMdd-HHmmss") }

$lines = @(
  "",
  "## $Heading",
  "``````txt",
  "timestamp: $ts",
  "actor: Bro",
  "session_id: $sid"
)
if ($Event)  { $lines += "event: $Event" }
if ($Action) { $lines += "action: $Action" }
$lines += @(
  "target: $Target",
  "source_command: $Source",
  "authority: $Authority",
  "result: $Result",
  "files_changed: $FilesChanged"
)
if ($Notes) { $lines += "notes: $Notes" }
$lines += "``````"

Add-Content -Path $path -Value $lines -Encoding utf8
"bro-log: appended to / կցվեց $path (timestamp $ts, session $sid)"
exit 0
