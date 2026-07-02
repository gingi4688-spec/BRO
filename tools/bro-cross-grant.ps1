<#
  bro-cross-grant.ps1 — Main-Bro cross-project ACCESS GRANT manager (L8-G) · Gev-gated
  EN: Creates / lists / revokes the explicit, scoped, time-expiring grants that let the MAIN BRO (SuperBro) cross a
      project's L8 seal — and ONLY the Main Bro, ONLY on Gev's explicit command, ONLY logged. This does NOT remove the
      wall: default stays deny, autonomous crossing stays forbidden, Project Bros stay hard-sealed. A grant authorizes
      REACH (read, or read-write when Gev names it), never contamination. Mutating actions (-Grant / -Revoke) REQUIRE
      BRO_GEV_APPROVED=1 (Gev's explicit approval, mirrored by the critical-command-gate). -List is read-only.
  HY: Ստեղծում / ցուցակում / չեղարկում է explicit, scoped, ժամկետով grant-երը, որ թույլ են տալիս ՄԻԱՅՆ MAIN BRO-ին
      հատել project-ի L8 կնիքը՝ միայն Գևի բացահայտ հրամանով, միայն logged։ Պատը ՉԻ հանվում. default = deny, autonomous
      crossing արգելված, Project Bro-ները կարծր sealed։ Grant = ՀԱՍԱՆԵԼԻՈՒԹՅՈՒՆ (read, կամ read-write երբ Գևն է ասում),
      ոչ երբեք contamination։ -Grant/-Revoke պահանջում են BRO_GEV_APPROVED=1. -List = read-only։
  EXIT: 0 ok · 2 bad input · 3 refused (no Gev approval) · 4 project not registered · 6 write error.
#>
[CmdletBinding()]
param(
  [string]$ProjectId,
  [ValidateSet('read','read-write')][string]$Scope = 'read',
  [string]$Task = '',
  [double]$Hours = 24,
  [switch]$Grant,
  [switch]$Revoke,
  [switch]$List,
  [switch]$Yes
)
$ErrorActionPreference = 'Stop'
$broHome    = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$grantsPath = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_CROSS_GRANTS_PATH) { $env:BRO_CROSS_GRANTS_PATH } else { Join-Path $broHome 'memory\_own\cross-grants.json' }
$regPath    = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_REGISTRY_PATH)     { $env:BRO_REGISTRY_PATH }     else { Join-Path $broHome 'memory\_own\registry.json' }
$logPath    = if (($env:BRO_TEST_MODE -eq '1') -and $env:BRO_HOOKBLOCKS_PATH)   { $env:BRO_HOOKBLOCKS_PATH }   else { Join-Path $broHome 'memory\_own\hook-blocks.md' }
$ts         = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"

# Emit a message to stderr and exit with an explicit code. Uses [Console]::Error rather than Write-Error
# because $ErrorActionPreference='Stop' turns Write-Error into a terminating error that would abort with a
# generic exit 1 BEFORE the intended coded exit is reached (defeating the documented 2/3/4/6 contract).
function Fail([string]$msg, [int]$code) { [Console]::Error.WriteLine($msg); exit $code }

function Load-Grants {
  try { return (Get-Content -Raw $grantsPath | ConvertFrom-Json) } catch { throw "cannot read grants store: $grantsPath" }
}
function Save-Grants($obj) {
  try { ($obj | ConvertTo-Json -Depth 8) | Set-Content -Path $grantsPath -Encoding utf8 }
  catch { Fail "write failed: $grantsPath" 6 }
}
function Log-Grant([string]$action, [string]$detail) {
  $entry = @(
    "", "## $action - bro-cross-grant", "``````txt",
    "timestamp: $ts", "actor: Gev (via Main Bro)", "action: $action",
    "detail: $detail", "authority: Gev (BRO_GEV_APPROVED=1)", "``````"
  )
  try { Add-Content -Path $logPath -Value $entry -Encoding utf8 } catch {}
}
function Now-Grants {
  $g = Load-Grants; $now = Get-Date
  Write-Host "  cross-project grants (Main Bro / L8-G) @ $ts"
  if (-not @($g.grants).Count) { Write-Host "    (none — Main Bro is fully sealed; default-deny)"; return }
  foreach ($gr in @($g.grants)) {
    $exp = try { [datetimeoffset]::Parse("$($gr.expires_at)") } catch { $null }
    $state = if ($exp -and $exp -gt $now) { "ACTIVE (expires $($gr.expires_at))" } else { "EXPIRED (inert)" }
    Write-Host ("    - {0}  scope={1}  {2}  task: {3}" -f $gr.project_id, $gr.scope, $state, $gr.task)
  }
}

# ---- -List : read-only, no gate ----
if ($List -or (-not $Grant -and -not $Revoke)) { Now-Grants; exit 0 }

# ---- mutating actions require Gev's explicit approval ----
if ($env:BRO_GEV_APPROVED -ne '1') {
  Fail "REFUSED: -Grant/-Revoke change the L8 seal — requires Gev's explicit approval (BRO_GEV_APPROVED=1)." 3
}
if (-not $ProjectId) { Fail "REFUSED: -ProjectId required." 2 }
$pidL = $ProjectId.ToLower()

# target must be a REGISTERED project (you cannot grant reach into a non-project)
$targetId = ''
try {
  $reg = Get-Content -Raw $regPath | ConvertFrom-Json
  foreach ($p in @($reg.projects)) { if ("$($p.project_id)".ToLower() -eq $pidL) { $targetId = "$($p.project_id)"; break } }
} catch {}
if (-not $targetId) { Fail "REFUSED: '$ProjectId' is not a REGISTERED project." 4 }

$g = Load-Grants
# always drop any existing grant for this project first (revoke = drop; grant = drop-then-add fresh)
$kept = @($g.grants | Where-Object { "$($_.project_id)".ToLower() -ne $pidL })

if ($Revoke) {
  $g.grants = $kept
  Save-Grants $g
  Log-Grant 'CROSS_GRANT_REVOKED' "project=$targetId"
  Write-Host "  REVOKED cross-grant for $targetId. Main Bro is re-sealed to it."
  exit 0
}

# -Grant : add a fresh scoped, expiring grant
if (-not $Task) { Fail "REFUSED: -Task required (why Gev is authorizing this crossing)." 2 }
$expires = (Get-Date).AddHours($Hours).ToString("yyyy-MM-ddTHH:mm:sszzz")
$new = [pscustomobject]@{
  project_id = $targetId
  scope      = $Scope
  task       = $Task
  granted_by = 'Gev'
  granted_at = $ts
  expires_at = $expires
}
$g.grants = @($kept) + $new
Save-Grants $g
Log-Grant 'CROSS_GRANT_CREATED' "project=$targetId scope=$Scope expires=$expires task=$Task"
Write-Host "  GRANTED: Main Bro may $Scope project '$targetId' until $expires."
Write-Host "  scope=$Scope  task: $Task"
Write-Host "  (logged; auto-expires; revoke early with: bro-cross-grant.ps1 -Revoke -ProjectId $targetId)"
exit 0
