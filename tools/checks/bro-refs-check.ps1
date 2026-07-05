<#
  bro-refs-check.ps1 — L1 doc hygiene: broken file links + duplicate law ids + stale TODO (Phase 8a) · READ-ONLY
  EN: Scans governance/doc markdown (_core, self, skills, docs, root) for: (1) broken relative FILE links
      [text](path.ext) whose target does not exist; (2) duplicate law-id DEFINITIONS (^L<n> —) across law files;
      (3) stale TODO/FIXME (informational; the intentional `<pending>` law slots are NOT counted);
      (4) orphan/dead-doc detection (informational): a governance/doc .md that no other scanned .md links to.
      Excludes spine/RELEASES (snapshots), _before, logs, memory (wikilink slugs), skills/reference/armenian (lexicon).
      Orphan-scan is informational (never flips RESULT to RED) and excludes entry points + skills/ (protocol-loaded).
  HY: Scan՝ կոտրված file-link, կրկնվող law-id, stale TODO, orphan/dead-doc (informational)։
  Exit: 0 clean · 2 problems (broken links or duplicate law ids).
#>
$ErrorActionPreference = 'Stop'
Set-Location -Path (Join-Path $PSScriptRoot '..\..')
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$home_ = (Get-Location).Path

$scanDirs = @('_core','self','skills','docs')
$excl = @('\spine\releases\','\_before\','\logs\','\memory\','\skills\reference\armenian\')
$mdFiles = @()
foreach ($d in $scanDirs) { if (Test-Path $d) { $mdFiles += Get-ChildItem $d -Recurse -File -Filter *.md } }
$mdFiles += Get-ChildItem . -File -Filter *.md
$mdFiles = @($mdFiles | Where-Object { $lp = $_.FullName.ToLower(); -not (@($excl | Where-Object { $lp.Contains($_) }).Count) })

# (1) broken relative FILE links (only file-like targets with an extension; skip http/#/mailto/wikilinks)
$broken = @()
$rx = [regex]'\]\(([^)]+)\)'
foreach ($f in $mdFiles) {
  $dir = $f.Directory.FullName
  foreach ($m in $rx.Matches([System.IO.File]::ReadAllText($f.FullName))) {
    $tgt = $m.Groups[1].Value.Trim()
    if ($tgt -match '^(https?:|mailto:|#)' -or $tgt -match '://') { continue }
    $tgt = ($tgt -split '#')[0]
    if (-not $tgt -or ($tgt -notmatch '\.[A-Za-z0-9]{1,5}$')) { continue }
    $resolved = if ($tgt.StartsWith('/')) { Join-Path $home_ ($tgt.TrimStart('/')) } else { Join-Path $dir $tgt }
    if (-not (Test-Path $resolved)) {
      $broken += ("{0} -> {1}" -f (($f.FullName.Substring($home_.Length).TrimStart('\')) -replace '\\','/'), $tgt)
    }
  }
}

# (2) duplicate law-id definitions (^L<n> —) across _core/laws files
$defs = @{}
Get-ChildItem '_core/laws' -File -Filter *.md -ErrorAction SilentlyContinue | ForEach-Object {
  $lf = $_.Name
  foreach ($m in ([regex]'(?m)^L(\d+)\s+—').Matches([System.IO.File]::ReadAllText($_.FullName))) {
    $n = $m.Groups[1].Value
    if (-not $defs.ContainsKey($n)) { $defs[$n] = @() }
    if ($defs[$n] -notcontains $lf) { $defs[$n] += $lf }
  }
}
$dupLaws = @($defs.GetEnumerator() | Where-Object { $_.Value.Count -gt 1 } | ForEach-Object { "L$($_.Key) in $($_.Value -join ', ')" })

# (3) stale TODO/FIXME (informational)
$todo = 0
foreach ($f in $mdFiles) { $todo += ([regex]'\b(TODO|FIXME)\b').Matches([System.IO.File]::ReadAllText($f.FullName)).Count }

# (4) orphan/dead-doc detection (informational): a governance/doc .md whose FILENAME is mentioned by NO other scanned
#     .md — via markdown link, backtick code-path, OR bare text. Basename match is deliberately conservative: it avoids
#     false positives on docs referenced through the repo's backtick-path house style (e.g. `self/persona.md`, "read
#     every file in /_core/laws/"), which a [](link)-only scan would wrongly flag. A true orphan = nothing references it
#     by name anywhere. Candidates exclude entry points (README/index/CLAUDE/AGENTS/MEMORY), repo-root standalone docs,
#     and skills/ (protocol-loaded). Informational only — never flips RESULT to RED (a standalone doc is not a defect).
$texts = @{}
foreach ($f in $mdFiles) { $texts[$f.FullName] = ([System.IO.File]::ReadAllText($f.FullName)).ToLower() }
$entryNames = @('readme.md','index.md','claude.md','agents.md','memory.md')
$orphans = @()
foreach ($f in $mdFiles) {
  if ($entryNames -contains $f.Name.ToLower()) { continue }
  if ($f.Directory.FullName.TrimEnd('\') -ieq $home_.TrimEnd('\')) { continue }   # repo-root standalone docs = entry points
  if (($f.FullName.ToLower()) -match '\\skills\\|\\_core\\laws\\') { continue }    # protocol-loaded wholesale (skills loader / "read every file in /_core/laws/"), not md-linked
  $base = $f.Name.ToLower(); $mentioned = $false
  foreach ($k in $texts.Keys) { if ($k -ne $f.FullName -and $texts[$k].Contains($base)) { $mentioned = $true; break } }
  if (-not $mentioned) { $orphans += (($f.FullName.Substring($home_.Length).TrimStart('\')) -replace '\\','/') }
}

"bro-refs-check - doc hygiene / doc հիգիենա  (scanned $($mdFiles.Count) md files)"
"  broken file links:      $($broken.Count)"; $broken | Select-Object -First 25 | ForEach-Object { "     $_" }
"  duplicate law-id defs:  $($dupLaws.Count)"; $dupLaws | ForEach-Object { "     $_" }
"  stale TODO/FIXME:       $todo (informational)"
"  orphan/dead-doc scan:   $($orphans.Count) (informational; _core/self/docs .md linked from no other .md; excl. entry points, root docs, skills/ protocol-loaded)"
$orphans | Select-Object -First 25 | ForEach-Object { "     $_" }
if ($broken.Count -gt 0 -or $dupLaws.Count -gt 0) { "RESULT: RED (broken links or duplicate law ids)"; exit 2 }
"RESULT: GREEN (no broken file links, no duplicate law ids; TODO=$todo info; orphan-scan=$($orphans.Count) info)"
exit 0
