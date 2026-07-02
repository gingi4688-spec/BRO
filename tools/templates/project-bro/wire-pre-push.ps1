<#
  wire-pre-push.ps1 — install the factory pre-push QUALITY GATE as this repo's git hook. Run AFTER `git init`.
  EN: Writes .git/hooks/pre-push -> invokes bro/pre-push-gate.ps1. Idempotent + LF line endings (git runs hooks via
      sh). The factory auto-runs this when the project is already a git repo; run it yourself after `git init` otherwise.
  HY: Գրում է .git/hooks/pre-push -> կանչում է bro/pre-push-gate.ps1-ը։ Idempotent + LF (git-ը hook-երը sh-ով է վազացնում)։
      Factory-ն ինքը վազացնում է սա, եթե project-ն արդեն git repo է. այլապես վազացրու ինքդ `git init`-ից հետո։
  Exit: 0 wired · 2 not a git repo yet.
#>
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
if (-not (Test-Path (Join-Path $root '.git'))) {
  Write-Host "wire-pre-push: not a git repo yet / դեռ git repo չէ — run 'git init' first, then re-run this."
  exit 2
}
$hooksDir = Join-Path $root '.git\hooks'
New-Item -ItemType Directory -Force $hooksDir | Out-Null
$shim = @'
#!/bin/sh
# Bro factory pre-push quality gate (delivered by bro-new-project). See bro/pre-push-gate.ps1.
root="$(git rev-parse --show-toplevel)"
gate="$root/bro/pre-push-gate.ps1"
[ -f "$gate" ] || exit 0
if command -v pwsh >/dev/null 2>&1; then exec pwsh -NoProfile -File "$gate"
elif command -v powershell >/dev/null 2>&1; then exec powershell -NoProfile -File "$gate"
else echo "pre-push gate: no pwsh/powershell found; skipping."; exit 0; fi
'@
[System.IO.File]::WriteAllText((Join-Path $hooksDir 'pre-push'), ($shim -replace "`r`n", "`n"))
Write-Host "wire-pre-push: installed / տեղադրված .git/hooks/pre-push -> bro/pre-push-gate.ps1 (quality gate active / դարպասը ակտիվ է)."
exit 0
