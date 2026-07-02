<#
  bro-hookpin.ps1 — tamper DETECTION for SuperBro's OWN enforcement hooks (finding H).
  EN: SuperBro's 5-hook wall (forbidden-path-write-guard, cross-memory-read-guard, critical-command-gate,
      log-append-only-guard, preflight-printer) is what enforces the laws — but nothing verified those hooks
      themselves were unmodified (project-doctor only checks a PROJECT's hooks vs the template). This pins their
      SHA-256 and DETECTS any unexpected change. Detection, NOT prevention (D0: Bro audits, never self-rules) —
      a legit hook edit must RE-PIN in the SAME commit, otherwise -Verify (and bro-audit/beast) flag the drift.
      -Verify (default, read-only): exit 0 = all match · 2 = drift/missing/unpinned · 3 = pin file missing.
      -Update (Gev-gated, BRO_GEV_APPROVED=1): regenerate the pin from the CURRENT hooks.
  HY: SuperBro-ի 5-hook պատը օրենքներ է կիրառում, բայց ոչինչ չէր ստուգում հենց այդ hook-երը անփոփոխ են (project-
      doctor-ը միայն PROJECT-ի hook-երն է template-ի դեմ ստուգում)։ Սա pin է անում նրանց SHA-256-ը ու ԴԵՏԵԿՏ անում
      ցանկացած անսպաս փոփոխ։ Դետեկցիա, ՈՉ prevention (D0)։ Legit hook edit-ը պիտի RE-PIN լինի ՆՈՒՅՆ commit-ում,
      այլապես -Verify-ը (ու bro-audit/beast-ը) drift է flag անում։
  Exit: 0=match/updated · 2=drift · 3=pin missing / -Update without approval.
#>
param([switch]$Verify, [switch]$Update)
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..')
$hookDir = 'tools/hooks'
$pinFile = 'tools/hooks/hooks.sha256'

$hooks = @(Get-ChildItem $hookDir -File -Filter *.ps1 -ErrorAction SilentlyContinue | Sort-Object Name)
function Get-CurHashes {
  $h = [ordered]@{}
  foreach ($f in $hooks) { $h[$f.Name] = (Get-FileHash $f.FullName -Algorithm SHA256).Hash.ToLower() }
  return $h
}

# ---------------- -Update (Gev-gated) ----------------
if ($Update) {
  if ($env:BRO_GEV_APPROVED -ne '1') {
    [Console]::Error.WriteLine("bro-hookpin -Update REFUSED: needs BRO_GEV_APPROVED=1 (it re-pins an enforcement artifact).")
    exit 3
  }
  $cur = Get-CurHashes
  $lines = @(
    '# hooks.sha256 - pinned SHA-256 of SuperBro''s OWN enforcement hooks (tamper DETECTION, finding H).',
    '# Regenerate ONLY via: BRO_GEV_APPROVED=1 pwsh tools/bro-hookpin.ps1 -Update  (in the SAME commit as a legit hook edit).',
    '# A hook changed without re-pinning here = tamper DRIFT, flagged by bro-hookpin -Verify + bro-audit + beast.'
  )
  foreach ($k in $cur.Keys) { $lines += ('{0}  {1}' -f $cur[$k], $k) }
  Set-Content -Path $pinFile -Value $lines -Encoding utf8
  "bro-hookpin: re-pinned $($cur.Count) hook(s) -> $pinFile"
  foreach ($k in $cur.Keys) { "  $($cur[$k].Substring(0,12))..  $k" }
  exit 0
}

# ---------------- -Verify (default, read-only) ----------------
if (-not (Test-Path $pinFile)) {
  [Console]::Error.WriteLine("bro-hookpin: pin file MISSING ($pinFile). Create it: BRO_GEV_APPROVED=1 pwsh tools/bro-hookpin.ps1 -Update")
  exit 3
}
$pin = @{}
foreach ($ln in (Get-Content $pinFile)) {
  if ($ln -match '^\s*#' -or $ln -notmatch '\S') { continue }
  $parts = $ln -split '\s+', 2
  if ($parts.Count -eq 2) { $pin[$parts[1].Trim()] = $parts[0].Trim().ToLower() }
}
$cur = Get-CurHashes
$drift = @(); $missing = @(); $unpinned = @()
foreach ($k in $pin.Keys)  { if (-not $cur.Contains($k)) { $missing += $k } elseif ($cur[$k] -ne $pin[$k]) { $drift += $k } }
foreach ($k in $cur.Keys)  { if (-not $pin.Contains($k)) { $unpinned += $k } }

"bro-hookpin -Verify - $($cur.Count) live hook(s) vs $($pin.Count) pinned"
foreach ($k in $cur.Keys) {
  $mark = if ($pin.Contains($k) -and $cur[$k] -eq $pin[$k]) { 'OK      ' } elseif (-not $pin.Contains($k)) { 'UNPINNED' } else { 'DRIFT   ' }
  "  [$mark] $k"
}
$bad = $drift.Count + $missing.Count + $unpinned.Count
if ($bad -eq 0) { ""; "RESULT: GREEN - all hooks match the pin (no tamper detected)"; exit 0 }
""
"RESULT: RED - tamper/drift detected  (drift=[$($drift -join ',')] missing=[$($missing -join ',')] unpinned=[$($unpinned -join ',')])"
"  A legitimate hook edit must re-pin IN THE SAME COMMIT: BRO_GEV_APPROVED=1 pwsh tools/bro-hookpin.ps1 -Update"
exit 2
