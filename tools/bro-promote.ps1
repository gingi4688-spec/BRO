<#
  bro-promote.ps1 — Promotion Gate: the only path a project lesson becomes spine (Phase 4, §10 / failure-registry #1)
  EN: Decides whether a candidate lesson may proceed to a spine release. BLOCKS (a) unapproved candidates (no Gev
      approval) and (b) project-specific candidates (anything naming a project / path / instance fact -> altitude
      violation). Only a GENERIC, domain-agnostic rule with explicit Gev approval PASSES. Clean build: PASS is DRY -
      it does NOT write to the spine (no spine content is written in the clean build). This is the structural answer
      to the founding altitude-drift failure (instance content treated as framework).
  HY: Որոշում է՝ candidate lesson-ը կարո՞ղ է անցնել spine release։ BLOCK՝ (ա) unapproved, (բ) project-specific
      (project/path/instance fact -> altitude violation)։ Միայն GENERIC + Gev-approved-ը PASS։ Մաքուր build-ում PASS-ը
      DRY է (ոչ spine write)։
  Exit: 0 PASS (dry) · 2 bad args · 3 BLOCKED.
#>
param([string]$Lesson = '', [switch]$GevApproved)
$ErrorActionPreference = 'Stop'
if (-not $Lesson) { "bro-promote: -Lesson '<candidate rule>' required"; exit 2 }

"PROMOTION GATE - candidate: `"$Lesson`""
# 1) approval layer
if (-not $GevApproved) {
  "  [1] approval:  MISSING -> BLOCKED (unapproved; promotion requires explicit Gev approval)"
  "RESULT: BLOCKED (unapproved). Nothing entered the spine."
  exit 3
}
"  [1] approval:  Gev-approved"
# 2) altitude layer - reject any project-specific signal (case-sensitive project ids + path/instance signatures)
$projSig = $Lesson -cmatch '\b(EP|DB|GAA|GAAhex|IP)\b'
$pathSig = $Lesson -match '(?i)(project_id|[A-Za-z]:\\|/bro/memory|\\bro\\memory)'
if ($projSig -or $pathSig) {
  $why = if ($projSig) { 'names a project (EP/DB/GAA/GAAhex/IP)' } else { 'carries a project path / instance fact' }
  "  [2] altitude:  PROJECT-SPECIFIC ($why) -> BLOCKED (altitude violation; no project fact enters the spine)"
  "RESULT: BLOCKED (project-specific). Nothing entered the spine."
  exit 3
}
"  [2] altitude:  generic / domain-agnostic"
"  [3] verdict:   PASS (dry) - would proceed to a spine release via bro-release.ps1 (CRITICAL, Gev-gated, logged)"
"RESULT: PASSED (dry). Clean build: NOT written to the spine. A real promotion is a separate Gev-gated, logged action."
exit 0
