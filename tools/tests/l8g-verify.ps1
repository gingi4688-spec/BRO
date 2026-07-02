<#
  l8g-verify.ps1 — verification test for the L8-G Gev-authorized cross-project grant (Main Bro).
  Run on Gev's "go" (needs his DIRECT approval — this validates a self-modification of the wall).
  Proves: default-deny stays · grant opens ONLY for Main Bro · expired=inert · project Bros never cross ·
          tool refuses without BRO_GEV_APPROVED=1 · revoke re-seals. Uses BRO_TEST_MODE seams (no real files touched).
  PASS => all GREEN. Then: bro-beast-check.ps1 GREEN => commit + push (BRO_GEV_APPROVED=1).
#>
$ErrorActionPreference = 'Stop'
$bro   = 'c:\Users\Admin\Desktop\Bro'
$guard = Join-Path $bro 'tools\hooks\cross-memory-read-guard.ps1'
$tool  = Join-Path $bro 'tools\bro-cross-grant.ps1'
$td    = Join-Path $env:TEMP 'l8g-test'
if (Test-Path $td) { Remove-Item -Recurse -Force $td }
New-Item -ItemType Directory -Force $td | Out-Null

$pP = Join-Path $td 'testp'; $qP = Join-Path $td 'testq'
$reg = Join-Path $td 'registry.json'
@{ projects = @(
    @{ project_id='TESTP'; project_path=$pP; status='INSTALLED' },
    @{ project_id='TESTQ'; project_path=$qP; status='INSTALLED' }
) } | ConvertTo-Json -Depth 6 | Set-Content $reg -Encoding utf8
$pBrain = Join-Path $pP 'bro\memory\brain.md'
$qBrain = Join-Path $qP 'bro\memory\brain.md'

$grants = Join-Path $td 'grants.json'
$hb     = Join-Path $td 'hb.md'
function Set-Grants($arr) { @{ grants=$arr } | ConvertTo-Json -Depth 8 | Set-Content $grants -Encoding utf8 }

$env:BRO_TEST_MODE='1'; $env:BRO_REGISTRY_PATH=$reg; $env:BRO_CROSS_GRANTS_PATH=$grants; $env:BRO_HOOKBLOCKS_PATH=$hb
$future = (Get-Date).AddHours(1).ToString("yyyy-MM-ddTHH:mm:sszzz")
$past   = (Get-Date).AddHours(-1).ToString("yyyy-MM-ddTHH:mm:sszzz")

function ReadGuard($scope, $target) {
  $env:BRO_SCOPE = $scope
  $json = @{ tool_name='Read'; tool_input=@{ file_path=$target }; session_id='t' } | ConvertTo-Json -Compress
  $json | pwsh -NoProfile -File $guard *> $null
  return $LASTEXITCODE
}
function Check($name, $got, $want) {
  $ok = ($got -eq $want); $tag = if ($ok) { 'PASS' } else { 'FAIL' }
  Write-Host ("  [{0}] {1}  (exit={2}, want={3})" -f $tag, $name, $got, $want)
  return $ok
}

$all = $true
Write-Host "== READ-GUARD (0=allow, 2=deny) =="
Set-Grants @()
$all = (Check 'Main Bro, NO grant -> DENY'                (ReadGuard 'own_only' $pBrain) 2) -and $all
Set-Grants @(@{ project_id='TESTP'; scope='read'; task='t'; expires_at=$future })
$all = (Check 'Main Bro, VALID read grant -> ALLOW'       (ReadGuard 'own_only' $pBrain) 0) -and $all
Set-Grants @(@{ project_id='TESTP'; scope='read'; task='t'; expires_at=$past })
$all = (Check 'Main Bro, EXPIRED grant -> DENY'           (ReadGuard 'own_only' $pBrain) 2) -and $all
Set-Grants @(@{ project_id='TESTP'; scope='read-write'; task='t'; expires_at=$future })
$all = (Check 'Main Bro, read-write grant -> ALLOW read'  (ReadGuard 'own_only' $pBrain) 0) -and $all
$all = (Check 'Main Bro, grant TESTP but read TESTQ -> DENY' (ReadGuard 'own_only' $qBrain) 2) -and $all
Set-Grants @(@{ project_id='TESTQ'; scope='read'; task='t'; expires_at=$future })
$all = (Check 'Project Bro TESTP + grant for TESTQ -> DENY' (ReadGuard 'testp_only' $qBrain) 2) -and $all
$all = (Check 'Project Bro TESTP reads OWN -> ALLOW'      (ReadGuard 'testp_only' $pBrain) 0) -and $all

Write-Host "== GRANT TOOL (0 ok, 3 no-approval, 4 not-registered) =="
$env:BRO_GEV_APPROVED=$null
& pwsh -NoProfile -File $tool -Grant -ProjectId TESTP -Task 'x' *> $null
$all = (Check 'tool -Grant WITHOUT approval -> REFUSE'    $LASTEXITCODE 3) -and $all
$env:BRO_GEV_APPROVED='1'
& pwsh -NoProfile -File $tool -Grant -ProjectId NOPE -Task 'x' *> $null
$all = (Check 'tool -Grant unregistered -> exit 4'       $LASTEXITCODE 4) -and $all
Set-Grants @()
& pwsh -NoProfile -File $tool -Grant -ProjectId TESTP -Scope read -Task 'genesis re-review' -Hours 2 *> $null
$all = (Check 'tool -Grant valid -> exit 0'              $LASTEXITCODE 0) -and $all
$gc = (Get-Content -Raw $grants | ConvertFrom-Json).grants.Count
$all = (Check 'grant persisted (count=1)'                $gc 1) -and $all
$all = (Check 'Main Bro reads TESTP after tool-grant -> ALLOW' (ReadGuard 'own_only' $pBrain) 0) -and $all
& pwsh -NoProfile -File $tool -Revoke -ProjectId TESTP *> $null
$gc2 = (Get-Content -Raw $grants | ConvertFrom-Json).grants.Count
$all = (Check 'tool -Revoke -> count=0'                  $gc2 0) -and $all
$all = (Check 'Main Bro reads TESTP after revoke -> DENY' (ReadGuard 'own_only' $pBrain) 2) -and $all

Write-Host ""
Write-Host ("RESULT: " + $(if ($all) { 'ALL GREEN' } else { 'SOME FAILED' }))
Remove-Item -Recurse -Force $td -ErrorAction SilentlyContinue
if (-not $all) { exit 1 }
