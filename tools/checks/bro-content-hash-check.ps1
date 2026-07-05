<#
  bro-content-hash-check.ps1 — L1 CONTENT-hash MATCH check (Phase 8a) · READ-ONLY by default
  EN: Recomputes the CONTENT hash of the spine skills + roster agents and compares it to the manifest's
      skills_manifest_hash / agents_manifest_hash. Closes the format-only false-GREEN — the audit only checks the hash
      is well-formed (^sha256:64), NOT that it matches actual content, so a stale hash passes GREEN today.
      CANONICAL RECIPE (defined here; there was no prior generator): rollup = sha256 over the SORTED
      "relpath:sha256(file)" lines (forward-slash relpaths), rendered as sha256:<64hex>.
        - skills set:  skills/**
        - agents set:  .claude/agents/**
      Default = read-only detect (exit 0 match · 2 mismatch). -Stamp (needs -Execute -Yes + BRO_GEV_APPROVED=1)
      writes the freshly-computed values into bro.manifest.json as the content baseline (snapshot to _before first).
  HY: Վերահաշվում է skills + agents-ի CONTENT hash-ը ու համեմատում manifest-ի հետ. փակում է format-only false-GREEN-ը
      (audit-ը միայն ֆորմատ է ստուգում, ոչ content match)։ -Stamp-ը (Gev-gated) գրում է թարմ baseline-ը manifest-ում։
  Exit: 0 match · 2 mismatch · 3 refused (stamp without approval).
#>
param([switch]$Stamp, [switch]$Yes, [switch]$Execute)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..\..')   # tools/checks/ -> BRO_HOME
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$home_ = (Get-Location).Path

function Get-ContentHash([string[]]$dirs) {
  $lines = @()
  foreach ($d in $dirs) {
    if (-not (Test-Path $d)) { continue }
    Get-ChildItem $d -Recurse -File | ForEach-Object {
      $rel = (Resolve-Path $_.FullName).Path.Substring($home_.Length).TrimStart('\') -replace '\\','/'
      $h = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower()
      $lines += "${rel}:$h"
    }
  }
  $src = ($lines | Sort-Object) -join "`n"
  $sha = [System.Security.Cryptography.SHA256]::Create()
  return 'sha256:' + ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($src))) -replace '-','').ToLower()
}
function Short($s) { if (-not $s) { '(empty)' } else { "$s".Substring(0, [Math]::Min(23, "$s".Length)) + '...' } }

$skillsHash = Get-ContentHash @('skills')
$agentsHash = Get-ContentHash @('.claude/agents')
$mf = Get-Content -Raw 'bro.manifest.json' | ConvertFrom-Json
$skillsOk = ("$($mf.skills_manifest_hash)" -eq $skillsHash)
$agentsOk = ("$($mf.agents_manifest_hash)" -eq $agentsHash)

"bro-content-hash-check - CONTENT match (not format) / CONTENT համընկնում (ոչ format)"
"  skills : computed=$(Short $skillsHash)  manifest=$(Short $mf.skills_manifest_hash)  $(if($skillsOk){'MATCH'}else{'MISMATCH (stale)'})"
"  agents : computed=$(Short $agentsHash)  manifest=$(Short $mf.agents_manifest_hash)  $(if($agentsOk){'MATCH'}else{'MISMATCH (stale)'})"

if ($Stamp) {
  if (-not $Execute -or -not $Yes) { "  REFUSED: -Stamp requires -Execute -Yes."; exit 3 }
  if ($env:BRO_GEV_APPROVED -ne '1') { "  REFUSED: -Stamp requires BRO_GEV_APPROVED=1 (Gev approval)."; exit 3 }
  $fts = Get-Date -Format "yyyyMMdd-HHmmss"
  Copy-Item 'bro.manifest.json' (Join-Path '_before' "manifest-$fts.json") -Force
  $mf.skills_manifest_hash = $skillsHash
  $mf.agents_manifest_hash = $agentsHash
  ($mf | ConvertTo-Json -Depth 8) | Set-Content 'bro.manifest.json' -Encoding utf8
  "  STAMPED content baseline into bro.manifest.json (skills+agents); snapshot _before/manifest-$fts.json"
  exit 0
}

if ($skillsOk -and $agentsOk) { "RESULT: MATCH (content hashes agree with manifest)"; exit 0 }
"RESULT: MISMATCH (manifest hash stale vs content — re-stamp: -Stamp -Execute -Yes + BRO_GEV_APPROVED=1)"
exit 2
