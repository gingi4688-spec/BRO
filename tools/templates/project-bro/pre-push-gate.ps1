<#
  pre-push-gate.ps1 — factory-delivered pre-push QUALITY GATE (born with every project; gate #1)
  EN: Runs the project's correctness-fast quality suite BEFORE a push; a failure BLOCKS the push (git aborts / bro-push
      reports RED). Language-agnostic + auto-detecting: Node (typecheck/tsc, lint, test) and Python (ruff, pytest). It
      is a NO-OP until the project actually has those scripts/tools — so a fresh factory project pushes freely, and the
      gate auto-activates the moment a real suite exists. Heavy steps (full build) are intentionally NOT run here (keep
      the gate fast); add them to your project if you want. `bro-push -NoVerify -Reason "<why>"` skips it (Gev's call).
      Lives at <project>/bro/pre-push-gate.ps1 and is invoked by .git/hooks/pre-push (wire: bro/wire-pre-push.ps1).
  HY: Վազացնում է project-ի correctness-fast quality suite-ը push-ից ԱՌԱՋ. ձախողումը BLOCK է անում push-ը։ Language-
      agnostic + auto-detect՝ Node (typecheck/tsc, lint, test) ու Python (ruff, pytest)։ NO-OP է, քանի դեռ project-ը
      այդ script/tool-երը չունի — ուստի fresh factory-project-ը ազատ push է անում, ու gate-ը ինքնաակտիվանում է, հենց
      իրական suite հայտնվի։ Ծանր build-ը դիտմամբ ՉԻ վազում այստեղ (gate-ը արագ պահելու)։ `bro-push -NoVerify -Reason`
      շրջանցում է (Գևի call)։
  Exit: 0 pass (or nothing to run) · 1 a check FAILED (push blocked).
#>
$ErrorActionPreference = 'Continue'
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}   # L0: render Armenian, not '???'
# project root = the parent of this bro/ folder
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $root

$ran = @(); $failed = @()
function Have([string]$cmd) { return [bool](Get-Command $cmd -ErrorAction SilentlyContinue) }
function Run-Step([string]$label, [scriptblock]$cmd) {
  Write-Host ("  [gate] {0} ..." -f $label)
  & $cmd 2>&1 | ForEach-Object { Write-Host "        $_" }
  if ($LASTEXITCODE -eq 0) { $script:ran += $label; Write-Host ("  [gate] {0}: PASS / ԱՆՑԱՎ" -f $label) }
  else { $script:failed += $label; Write-Host ("  [gate] {0}: FAIL / ՁԱԽՈՂՎԵՑ (exit $LASTEXITCODE)" -f $label) }
}

Write-Host "pre-push gate / push-ից առաջ որակի դարպաս — $root"

# ---- Node / JS-TS suite (only the scripts that actually exist in package.json) ----
$pkgPath = Join-Path $root 'package.json'
if ((Test-Path $pkgPath) -and (Have 'npm')) {
  $scripts = @{}
  try { $scripts = (Get-Content -Raw $pkgPath | ConvertFrom-Json).scripts } catch {}
  $names = @(); if ($scripts) { $names = @($scripts.PSObject.Properties.Name) }
  if ($names -contains 'typecheck') { Run-Step 'npm run typecheck' { npm run typecheck --silent } }
  elseif (Test-Path (Join-Path $root 'tsconfig.json')) { if (Have 'npx') { Run-Step 'tsc --noEmit' { npx --no-install tsc --noEmit } } }
  if ($names -contains 'lint')      { Run-Step 'npm run lint'      { npm run lint --silent } }
  if ($names -contains 'test')      { Run-Step 'npm test'         { npm test --silent } }
}

# ---- Python suite (ruff + pytest, only if present) ----
$hasPy = (Test-Path (Join-Path $root 'pyproject.toml')) -or (Test-Path (Join-Path $root 'setup.cfg')) -or (Test-Path (Join-Path $root 'requirements.txt'))
if ($hasPy) {
  if (Have 'ruff')   { Run-Step 'ruff check'   { ruff check . } }
  elseif (Have 'python') { $null = & python -c "import ruff" 2>$null; if ($LASTEXITCODE -eq 0) { Run-Step 'python -m ruff' { python -m ruff check . } } }
  if (Have 'pytest') { Run-Step 'pytest -q'    { pytest -q } }
  elseif (Have 'python') { $null = & python -c "import pytest" 2>$null; if ($LASTEXITCODE -eq 0) { Run-Step 'python -m pytest' { python -m pytest -q } } }
}

Write-Host ("--------------------------------------------------------------")
if ($failed.Count -gt 0) {
  Write-Host ("GATE RESULT: BLOCKED — {0} check(s) failed: {1}" -f $failed.Count, ($failed -join ', '))
  Write-Host  "  Դարպասը BLOCK արեց push-ը — ուղղիր վերևի ձախողումը, կամ `bro-push -NoVerify -Reason ""<why>""` (Gev-ի call)։"
  exit 1
}
if ($ran.Count -eq 0) {
  Write-Host "GATE RESULT: PASS (no quality suite detected yet — gate is a no-op until you add lint/typecheck/test or ruff/pytest)"
  Write-Host "  ԱՆՑԱՎ (դեռ quality suite չկա — gate-ը no-op է, քանի դեռ չես ավելացրել)։"
  exit 0
}
Write-Host ("GATE RESULT: PASS / ԱՆՑԱՎ — {0} check(s) green: {1}" -f $ran.Count, ($ran -join ', '))
exit 0
