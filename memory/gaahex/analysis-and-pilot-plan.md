# GAAhex — work memory (sealed per L8) / work-ի հիշողություն (կնքված L8-ով)

> EN: Sealed to the GAAhex work only. Never cross-referenced into another work.
> HY: Կնքված միայն GAAhex work-ին։ Երբեք cross-reference ուրիշ work-ի մեջ։
> Started 2026-06-13 (Bro · Gev). Living running-record.

---

## What GAAhex is / Ինչ ա GAAhex-ը

**EN:** Config-driven, multi-tenant ISP operations platform ("the only place of work for a whole ISP").
Small fixed kernel (5 engines) + a configuration layer. Path at `C:\Users\Admin\Desktop\GAAhex`.
Blueprint sibling repo `../GAAhex-Vision/` exists but is NOT pulled in (L3) unless Gev says so.

**HY:** Config-driven, multi-tenant ISP-ի օպերացիոն platform («մի ամբողջ ISP-ի միակ աշխատատեղը»)։
Փոքր fixed kernel (5 engine) + configuration շերտ։ Path՝ `C:\Users\Admin\Desktop\GAAhex`։
Blueprint-ի sibling repo `../GAAhex-Vision/`-ը կա, բայց ՉԻ քաշվում (L3)՝ քանի դեռ Գևը չի ասել։

## Current state (ground-truthed 2026-06-13) / Ընթացիկ վիճակ

**EN:** ~95 models · ~130 routers · 122 migrations · ~185 test files · 2 frontends + design-system · 70 LOCKED
standards + constitution · 827 commits. M0 sealed 2026-06-05; architecture locked 2026-06-06. The 2026-06-04
production-cert NO-GO (27 Critical) is largely remediated (C1–C8): atomic `next_reference_number`, Stripe
currency lock-in, GDPR erasure router, backup scripts committed, deploy-contract fail-closed boot. Security
posture is genuinely strong (RLS done right, runtime RLS-subject check, tenant GUC wiped on checkin,
DB-trigger immutable audit). NOTE: pytest NOT run by Bro; 5 of 27 criticals verified in code, rest from docs.

**HY:** ~95 model · ~130 router · 122 migration · ~185 test ֆայլ · 2 frontend + design-system · 70 LOCKED
standard + constitution · 827 commit։ M0 կնքված 2026-06-05. architecture locked 2026-06-06։ 2026-06-04-ի
production-cert NO-GO-ն (27 critical) մեծ մասամբ remediated ա (C1–C8)։ Security-ն իրոք ուժեղ ա։
ՆՇՈՒՄ՝ pytest-ը Bro-ն չի վազեցրել. 27-ից 5-ը code-ով ստուգված, մնացածը՝ doc-երից։

## Scope decision (Gev, 2026-06-13) / Scope-ի որոշում

**EN:** Goal = GAAhex must FULLY WORK for a real VSOL pilot ISP: order → real internet activation (OLT + RADIUS)
→ full customer lifecycle end to end. Huawei/ZTE OLT drivers were "fantasy" filler → OUT of scope (parked;
deletable later, git keeps history). **VSOL only.** Keeper driver = `vsol_v1600.py` (V1600G1-B, firmware
V1.4.7R) — connect+topology verified on real device `ArmGponOLT2` (10.0.1.3) 2026-06-02. RADIUS + OLT
provisioning ARE in pilot scope.

**HY:** Նպատակ = GAAhex-ը պիտի ՖՈՒԼ աշխատի իրական VSOL-pilot ISP-ի համար՝ order → իրական ինտերնետ-ակտիվացիա
(OLT + RADIUS) → ամբողջ customer lifecycle մինչև վերջ։ Huawei/ZTE driver-ները «ֆանտաստիկա» էին → scope-ից ԴՈՒՐՍ
(park. հետո կարելի ջնջել, git-ը history պահում ա)։ **Մենակ VSOL։** Keeper = `vsol_v1600.py`։

## The gap = physical activation / Բացը = ֆիզիկական ակտիվացիա

**EN:** Lifecycle runs in software (test_loop_e2e + KT-M1-1 green). Missing pieces, ground-truthed:
- **G1** OLT provisioning unwired at the seam — `install_board.activate_service()` flips DB rows but the
  `provision_onu()` call is a commented-out placeholder (~install_board.py:646-649; to confirm line-exact).
- **G2** CPE→OLT resolver missing (which OLT/slot/port/VLAN/line-profile for a given CPE).
- **G3** FreeRADIUS backend = NotImplementedError stubs (authenticate/acct_start/acct_stop/disconnect);
  `IS_PRODUCTION_READY=False`; fail-closed factory gate is real.
- **G4** `vsol_v1600.py` provision_onu/delete_onu/set_vlan/apply_line_profile/optical = PROVISIONAL (5/7
  unverified on hardware). Connect+topology verified.
- **G5** Service lifecycle → RADIUS subscriber create/suspend/resume/terminate not wired (gate exists).
- **G6** Provider go-live config for pilot (RADIUS=freeradius, OLT feature on).

**HY:** Lifecycle-ը software-ով վազում ա. պակասում ա ֆիզիկական ակտիվացիան՝ G1 OLT-provision-ի seam-ը unwired,
G2 CPE→OLT resolver չկա, G3 FreeRADIUS stub, G4 V1600 provisioning PROVISIONAL, G5 service→RADIUS subscriber
չ-wired, G6 go-live config։

## Plan (proposed; awaiting Gev GO) / Պլան (առաջարկ. սպասում Գևի GO-ին)

P0 confirm+scope-lock · P1 wire OLT provisioning seam (G1+G2) · P2 harden V1600 on real box (G4) ·
P3 real FreeRADIUS via pyrad + subscriber lifecycle (G3+G5) · P4 e2e pilot dry-run + KT-M1-3 (real boot) ·
P5 cutover (Gev call). Critical path to "first customer online" = P1+P2+P3.

## Progress / Ընթացք

**P1 — OLT provisioning seam wired (2026-06-13, DONE + verified, uncommitted).**
EN: `backend/app/services/install_board.py` — added `ProvisioningTarget` + `resolve_provisioning_target`
(config-driven: reads splitter Record `data.olt_record_id`/`olt_slot`/`olt_port`/`olt_line_profile`; no
migration) and wired `activate_service` to actually call the vendor driver (`set_vlan` → `provision_onu`)
when OLT provisioning is enabled AND the splitter is mapped to a real (non-mock) OLT. Driver failure rolls
the DB back (existing snapshot) + `SERVICE_ACTIVATION_FAILED` + 502; success emits `SERVICE_ACTIVATED_OLT`
+ CPE payload. Enabled-but-unmapped or mock-only → legacy dev-mode (unchanged). New tests:
`backend/tests/test_install_olt_provision.py` (3). Verified: 109 passed / 1 xfailed across install pipeline
+ loop-e2e + VSOL drivers. NOT committed (Gev waived production-caution but no commit asked yet).
DEFERRED (param-dependent → Monday): persist the `Onu` ledger row (needs OltPort chassis/card/port numbering
from the real box) · product→profile config field + Studio UI · the actual splitter↔OLT-port map DATA.

HY: `install_board.py`-ում ավելացրած `resolve_provisioning_target` (config-driven, migration չկա) + wire արած
`activate_service`-ը՝ իրական driver call (`set_vlan`+`provision_onu`)՝ rollback-ով։ Test-եր՝
`test_install_olt_provision.py`։ Verified՝ 109 passed/1 xfailed։ Committed չէ։ Հետաձգված (Monday)՝ Onu-ledger,
product→profile, իրական splitter↔port map։

## Frontend page system + build-out direction (Gev 2026-06-13) / Frontend-ի էջ-համակարգ

**EN:** New direction (parallel to the pilot): build out the empty/stub pages. How pages work:
`frontend/src/App.tsx` is shell + router; left nav = static `lib/nav-config.ts` `NAV_SECTIONS` (the dynamic
`/api/nav` loader is intentionally OFF). Nav click → `navItemClick`: no viewType → `/module/:id` →
`ModuleStubView` ("not built yet"); `viewType:'entity'` → `/entity/:slug` → **EntityView** (config-driven
generic list/detail — near-zero code per entity); `viewType:'coming-soon'` → **ComingSoonView** (rich
placeholder w/ preview map); else → `/<viewType>` → a dedicated view component. `PageShell` = universal
wrapper (header/KPI/actions/filters/workspace/context zones). TWO ways to build a page: (1) entity-backed →
config (EntityDef/FieldDef + nav wire), minimal code; (2) bespoke → a view component on PageShell + primitives.
EXPLICIT stubs today: **Warehouse** (Operations) + **Projects** (standalone) → ComingSoonView. Thin/shallow
real pages (by line count, worth fleshing): ActivityFeed, CustomersList, Notifications, Coverage,
DispatchBoard, TeamWorkspace, Collections, Settings, SavedViews. The full SPEC §1 nav has 71 modules; the
static nav surfaces a curated ~30 (most real) — the rest are un-surfaced (would be ModuleStub if shown).
NEXT: Gev explains his vision per page; then build. The page SYSTEM is excellent — what's missing is page CONTENT.

**HY:** Նոր ուղղություն (pilot-ին զուգահեռ)՝ դատարկ/stub էջերը կառուցել։ App.tsx = shell+router. nav = static
`nav-config.ts`. Click → entity-slug (config-driven EntityView, գրեթե զրո կոդ) / coming-soon / dedicated view /
module-stub։ PageShell = universal wrapper։ Էջ կառուցելու 2 ձև՝ (1) entity-backed → config. (2) bespoke → view
component PageShell-ի վրա։ Explicit stub-եր՝ **Warehouse + Projects**։ Բարակ էջեր՝ ActivityFeed/CustomersList/
Notifications/Coverage/DispatchBoard/TeamWorkspace/Collections/Settings/SavedViews։ SPEC §1-ը 71 module ա,
static-ը ~30 ա ցույց տալիս։ Հաջորդ՝ Գևը պատմում ա vision-ը ամ էջի, հետո build։ Համակարգը հզոր ա — պակասում ա content-ը։

## Brand meaning + design north star (Gev 2026-06-14) / Brand-ի իմաստ + դիզայնի հյուսիսային աստղ

**EN:** The GAAhex mark = a hexagonal chevron: 6 cobalt cells (the network / modules) converge into 1 gold
hex at the tip (the destination / value). Gev's enrichment: the hexagon is a **perfect working CELL** —
industrious like a **BEEHIVE**; a network of **different modules gathered around ONE purpose**. **GAA = Gev's
family** (the human heart — see self/personalization). Cobalt = the hive doing the work; gold = the one
thing it converges to (value — and at the root, the people it's for). **DIRECTIVE: do NOT embody this
literally** (no hexagon-shaped pages, no forced gold-node gimmick) — carry it as **SPIRIT / north-star.**
North star for every archetype: (1) **hive, not grid** — many cells, one organism, dense-but-ordered;
(2) **one clear purpose per page**, everything orients to it; (3) **cells in relationship via
space/elevation/glow, NOT lines** (→ Aurora Glass, which Gev picked); (4) **gold marks what matters /
the human outcome**, sparing; (5) **forward momentum**. Skin LOCKED = **Aurora Glass**. Archetypes = the
**10** (Cockpit · Index · Record360 · Pipeline · Inbox · Map · Scheduler · Flow · Studio · Document).

**HY:** GAAhex-ի mark = hexagonal chevron՝ 6 cobalt-բջիջ (ցանց/մոդուլներ) converge են անում 1 gold-hex-ի
(destination/value)։ Գևի հարստացում՝ վեցանկյունը **կատարյալ աշխատող ԲՋԻՋ** ա — աշխատասեր ինչպես **ՄԵՂՎԻ
ՓԵԹԱԿ**. ցանց՝ **մեկ նպատակի շուրջ հավաքված տարբեր մոդուլներ**։ **GAA = Գևի ընտանիքը** (մարդկային սիրտը)։
Cobalt = փեթակը, որ աշխատում ա. gold = էն մեկ բանը, ուր converge ա անում (value — արմատում՝ մարդիկ, ում
համար ա)։ **ՀՐԱՀԱՆԳ՝ ՈՉ բառացի մարմնավորում** (ոչ վեցանկյուն-էջեր, ոչ պարտադրված gold-node gimmick) —
կրել որպես **ՈԳԻ**։ Հյուսիսային աստղ ամ archetype-ի՝ (1) **փեթակ, ոչ grid**. (2) **մեկ հստակ purpose ամ
էջի**. (3) **cell-եր relationship-ով՝ space/elevation/glow, ՈՉ գծեր** (→ Aurora Glass). (4) **gold = ինչն ա
կարևոր / մարդկային outcome**, զուսպ. (5) **առաջ-momentum**։ Skin LOCKED = **Aurora Glass**։

## APPROVED look (Gev 2026-06-14 — "մաստեր") / Հաստատված տեսք

**EN:** Chosen design = **`IndexBrandBeast`** (`frontend/src/views/proto/IndexBrandBeast.tsx`, route
`/proto/index-brand-x`) — the **Cobalt & Gold brand, "lit up"**: restrained luxury (**շքեղ ոչ քաղքենի**),
deep cobalt-depth canvas, ONE sparing gold focal **hexagon** (the logo's destination node, calm/static),
whisper-quiet hexagon/hive field, azure = action, slate neutrals, Space Grotesk tabular numerals, quality
via space + restraint (NOT effects). Gev's top praise: "մաստեր". **This SUPERSEDES the earlier Aurora-Glass
lean** — Aurora was the favorite *vibe* exploration; the refined BRAND version is the final pick. The Index
also has the full themed shell (`IndexShell`, theme aurora|brand) for reference. **NEXT:** promote this
Index template into the real `PageShell`; **pilot on ONE real page first (Customers, real API data)**, prove
it, then roll to all entity Index pages (~30). All proto work is under `/proto`, uncommitted.

**HY:** Ընտրված դիզայն = **`IndexBrandBeast`** (`/proto/index-brand-x`) — **Cobalt & Gold brand, «lit up»**՝
զուսպ շքեղություն (**շքեղ ոչ քաղքենի**), խորը cobalt-depth, ՄԵԿ սակավ gold focal **hexagon** (logo-ի
destination-node, հանգիստ), շշուկ hexagon/փեթակ դաշտ, azure = action, slate, Space Grotesk tabular։ Գևի
բարձրագույն գովեստ՝ «մաստեր»։ **Փոխարինում ա Aurora-Glass-ի վաղ թեքումը** (Aurora-ն vibe-exploration էր.
refined BRAND-ը վերջնականն ա)։ **Հաջորդ՝** promote PageShell-ի մեջ. **pilot ՄԵԿ իրական էջի վրա (Customers,
real API)**, ապացուցել, հետո roll բոլոր entity-Index-ներին (~30)։ Proto-ն `/proto`-ի տակ, committed չէ։

## Live pilot — fully wired (2026-06-14) / Live pilot-ը՝ լրիվ wired

**EN:** `frontend/src/views/proto/IndexPage.tsx` (route `/proto/index-live`, slug='customers') is now FULLY
WIRED to the real API, reusing the app's own helpers (no new data engine): row/focal click → `navigate
('/customer/{id}')`; **New** → create modal (def.fields) → `POST /api/customers` (`createRecord`); **search**
→ `?q=` server; **filters + clickable KPI tiles** → filter; **view-switch** (table/cards/board) persisted to
localStorage; **bulk** Message (composer modal; send transport = next wire) · Suspend (`transitionRecord`,
target DERIVED from def.transitions for correct casing) · Export (real `GET /api/{slug}/export?format=csv`,
verified 200) · Clear; **pagination** (`limit`/`offset` + `X-Total-Count`); **refresh**. tsc green; verified
read-only against the running backend (no DB mutation).

**DATA BUG FOUND + FLAGGED (backend, NOT fixed — needs Gev):** the 13 customer records are seeded with
status **`'active'` (lowercase)**, but the customer lifecycle **transitions are UPPERCASE**
(`PROSPECT→ACTIVE`, `ACTIVE→SUSPENDED`, `SUSPENDED→ACTIVE`, `ACTIVE→CHURNED`, `SUSPENDED→CHURNED`), and
`def.statuses` lists lowercase `active/suspended/terminated` (a third, inconsistent set). → the Suspend
transition can't fire (record `'active'` ≠ transition source `'ACTIVE'`). Frontend handles it honestly
(real attempt → graceful toast). Fix = normalize status casing across seed + lifecycle + statuses (backend
seed job), Gev's call — don't silently mutate.

**HY:** `IndexPage.tsx` (`/proto/index-live`) լրիվ wired ա իրական API-ին՝ row→navigate /customer/{id}.
New→create-modal→POST. search ?q=. filters + clickable KPI. view-switch persisted. bulk Message(composer,
send հետո)/Suspend(real transition, target def-ից derived)/Export(real CSV, 200)/Clear. pagination
limit/offset. refresh. tsc green։ **DATA BUG (backend, flag արած, ՉԷ ուղղված)՝** record-եր status=lowercase
`'active'`, transitions=UPPERCASE `ACTIVE→SUSPENDED` → Suspend չի կրակում (case mismatch)։ Ուղղումը = seed-ի
casing normalize (backend), Գևի call։

## Hard audit done (2026-06-14) / Դաժան audit արած

**EN:** Full hard audit → **`docs/audit/HARD-AUDIT-2026-06-14.md`** (seal = PROVISIONAL). Full test run:
**1881 pass · 5 FAIL · 29 ERROR** (portal — `test_portal_support`/`test_remediation_portal`, likely a
portal-auth fixture regression) → **NOT green**. Cores strong (all prior auth/tenant/secret/financial
criticals closed + tested). **REAL BLOCKERS:** (1) **status-vocabulary break** — 3 competing sets; customer
`ACTIVE`/`monitoring` vs lowercase StatusDefs (the live Index bug = a CLASS), order `COMPLETED`∉set, ticket
double-set → entities can't transition; (2) **RLS GAP** — 18 tenant tables with no policy
(feature_flag/tariff_plan/mail_*/radius_session/cpe_binding…) → cross-tenant leak; the parametric RLS test
is false-green (creates the policy in-test); (3) **FIN-1** payment_allocation unit contradiction (app=luma,
trigger `/100` → over-alloc backstop 100× off / likely inert); (4) **OPS-3** docker-compose
`ENVIRONMENT: development` override disables every prod gate; (5) twilio/sendgrid/pyrad not in requirements →
silent mock fallback; (6) legacy comms ungated + rate-limit off; (7) **RADIUS stub + OLT unverified** = no
real internet activation (needs Monday infra + RADIUS host + on-site OLT + ~1 wk). Drift gate RED + no
status-casing rule. **MAP:** weekend = I close the control-plane set (tests · status-collapse · RLS · FIN-1 ·
env · requirements · comms · rate-limit) → re-seal CERTIFIED + add a drift rule so the status class can't
recur; Monday = provisioning (params + hardware). **AWAITING Gev GO** on the remediation batch + the
canonical-status choice (recommend SPEC §7 UPPER_SNAKE). New covenant law **L9** = detailed docs ≤ every 5h.

**HY:** Full hard audit → `docs/audit/HARD-AUDIT-2026-06-14.md` (PROVISIONAL)։ Tests՝ 1881 pass · 5 fail ·
29 error (portal) → green ՉԷ։ Միջուկները ուժեղ։ Blocker-ներ՝ status-vocabulary break (customer/order/ticket),
RLS-անցք 18 աղյուսակ (cross-tenant leak), FIN-1 alloc-unit `/100`, OPS-3 compose ENVIRONMENT override,
requirements-ում twilio/sendgrid/pyrad չկա, comms ungated, RADIUS+OLT՝ ինտերնետ-ակտիվացիա չկա։ MAP՝ weekend
control-plane fix → re-seal. Monday՝ provisioning։ Սպասում Գևի GO + canonical-status choice։

## Open confirms / Բաց հարցեր
1. Pilot OLT model = V1600G1-B? (very likely) — decides keeper driver.
2. Auth model: PPPoE vs IPoE+Option82 — decides RADIUS attrs + OLT VLAN model.
3. Lab access to real OLT + FreeRADIUS host during build (for P2/P3 hardware verification).

## Infrastructure (pilot diagram, partial — 2026-06-13) / Ինֆրակառուցվածք (մասնակի)

**EN:** Admin sent the network topology (full param answers come Monday). Shape:
3× transit (ISP1/2/3) → dual BGP edge (Main Border **CCR** + Backup Edge) → dual core (Core SW1/2) →
**4× CGNAT NAT (MikroTik CCR)** + **6× BNG ("DHCP + Shaper")** → 2 aggregate switches → **6× GPON OLT** →
clients/ONU/ONT. All routing/NAT boxes are **MikroTik CCR** (BNG vendor not labelled — almost certainly
RouterOS too; confirm). Customers are **behind CGNAT** (private IPv4).
KEY REFRAME: the **OLT is L2 GPON access only** (ONU register + line/DBA profile + service VLAN). **IP,
DHCP, auth, and bandwidth (shaper) all live at the BNG.** → Activation has two halves: (1) OLT half
(P1/P2 — VSOL driver) and (2) **BNG/RADIUS half (P3)** — and the RADIUS integration target is the
**MikroTik BNG** (DHCP `use-radius` keyed on Option82), bandwidth via RADIUS `Mikrotik-Rate-Limit` → the
BNG shaper, NOT the OLT DBA. FreeRADIUS must speak MikroTik VSAs + be a RADIUS client on all 6 BNGs.

**HY:** Ադմինը ուղարկեց network-topology-ն (լրիվ params՝ երկուշաբթի)։ Ձև՝ 3 transit → dual BGP edge (CCR) →
dual core → 4 CGNAT (MikroTik CCR) + 6 BNG («DHCP + Shaper») → 2 aggregate switch → 6 GPON OLT → clients։
Ամեն routing/NAT box MikroTik CCR ա. հաճախորդները CGNAT-ի տակ (private IP)։ ԿԱՐԵՎՈՐ REFRAME՝ OLT-ն մենակ
L2 GPON access ա (ONU + line/DBA profile + service VLAN). IP/DHCP/auth/bandwidth ամենը **BNG-ի վրա ա**։ →
Ակտիվացիան երկու կես ա՝ OLT-կես (P1/P2) + **BNG/RADIUS-կես (P3)**, ու RADIUS-ի target-ը **MikroTik BNG-ն ա**
(DHCP use-radius + Option82, bandwidth՝ `Mikrotik-Rate-Limit` → BNG shaper, ՈՉ OLT DBA)։ FreeRADIUS-ը պիտի
MikroTik-VSA խոսի ու 6 BNG-ի RADIUS-client լինի։

**Still pending Monday / Դեռ սպասում ենք երկուշաբթի:** OLT models/firmware/creds · manual ONU runbook +
profile names · splitter↔OLT-port map · exact Option82 circuit-id format · confirm BNG=RouterOS+RADIUS ·
CGNAT/IP pools · suspend mechanism · build access + safe test port.

## Boundaries / Սահմաններ
- Production. No destructive/hard-to-reverse step without Gev confirm (L6).
- Bro cannot verify against real OLT/RADIUS hardware alone — needs the pilot box (Gev-side).

## Weekend remediation — OUTCOMES (2026-06-14) / Արդյունքներ
Executed the HARD-AUDIT map (`GAAhex/docs/audit/HARD-AUDIT-2026-06-14.md` = the canonical live log).
Key truth: **the audit was sharp but over-flagged twice; verify-before-fix caught it.**
- **A** — tests-green gate #1 was a TEST-isolation bug (non-deterministic `select(Tenant).first()` in 44 fixtures across 26 files → demo-tenant mismatch). Fixed → 1915 pass. Also: requirements += twilio/sendgrid/pyrad; compose `ENVIRONMENT` made truly overridable (was a fail-OPEN footgun).
- **B1a (REAL, the pilot blocker)** — customer state machine was DEAD: StatusDef lowercase vs stale UPPER `PROSPECT/CHURNED` transitions = zero overlap. Collapsed customer → SPEC §7 `ACTIVE/SUSPENDED/TERMINATED` (source + boot normalizer overwrites stale graph + migrates records). Dev DB + frontend + 113 tests verified.
- **C (FALSE ALARM)** — "18 unprotected tables" was wrong: 17 already had RLS via migrations (`e7f4a2b9c8d1` backfill the audit missed); only `stripe_webhook_event` lacks it and is **correctly exempt** (cross-tenant dedup + NULL-tenant rows). Fixed the false-green RLS test (exempt ledger + classification guard).
- **D1 (REAL, CRITICAL)** — payment_allocation trigger `÷100` made the prod allocation path **100% broken** (rejected every valid allocation); suite missed it (create_all has no triggers). Migration `fin1allocluma` → luma-to-luma + regression test that installs the trigger.
- **D2** — FOR UPDATE on invoice in all 3 PAID-flip paths (Stripe/alloc/legacy).
- **E1/E2** — deploy-contract now fail-closed on legacy dev comms + rate-limit-off in prod.
- **B2 drift rule** — enforces single-source-of-truth (consistency, all entities) + UPPER_SNAKE (except documented lead/order SST). Caught a real vestigial order transition on first run.
- **Drift-rule debugging lesson (worth remembering):** a status drift TEST that scanned cross-tenant records + used the per-CONNECTION `await s.connection(execution_options={"audit_tenant_filter": False})` LEAKED that option onto the pooled connection → poisoned every later test (12 failed + 128 errors, deterministic). Two fixes: (a) scope the drift test to CONFIG only (StatusDef keys + transition endpoints) for the canonical entities — NOT arbitrary test-created records in a shared DB; (b) use the per-STATEMENT `.execution_options(audit_tenant_filter=False)` form (like routers/auth.py), never the per-connection form, in tests.

## Follow-up closure (2026-06-14, Gev: "still not all done, go do all") / Փակում
Gev reversed the "spare lead/order" call and asked to close everything. All three software follow-ups DONE; full suite **GREEN `1921 passed · 0 failed · 0 errors` (9m09s)**; frontend `tsc --noEmit` clean; dev DB migrated + verified. Nothing committed/pushed (not asked).
- **B1b — lead/order UPPER, NO exception.** Decisive discovery: the FRONTEND canonical (`frontend/src/lib/lifecycle.ts`) ALREADY declared these keys UPPER_SNAKE → backend lowercase was a split-brain deviation, so this is genuine SST alignment, not cosmetics. UPPER-cased across ~40 files via a **count-asserted migration script** (93 ops, each asserted to match — a miss fails loud, never a silent half-migrated gate): seeds, provisioning core (install_board ×7 + router, convert, workflow_engine, order model default, ORDER_INITIAL), AI scorer+agent, KPIs, kanban, 20+ tests. Deliberate KEEPS (verified, must NOT change): nav route `/scheduling`, workitem `kind='installation'`, page-config `{"config":...}`, notify def-keys (`notify_hooks.py` lowercases status at derivation, so `lead.validated_lead` keys stay lowercase). Deterministic `leadorderupper` Alembic migration (record/order/status_def/workflow_def, transform = `UPPER()`), **applied + verified on dev `gaahex` DB** (all UPPER, drift-clean). Drift rule's `_SST_LOWERCASE_ENTITIES` now EMPTY.
- **Lesson — the suite is the safety net for a mechanical rename, but cover the normalizers:** the one full-suite failure was the AI lead-scorer `ai.py` doing `status.strip().lower()` before a `_STATUS_DELTA[UPPER]` lookup → silent 0-delta. Class of bug: anywhere code `.lower()`s a status before comparing to a (now-UPPER) key. Swept all `.lower()`-near-status sites; the only two real ones were `ai.py` score_lead + `routers/ai.py` move_lead (both → `.upper()`). The notify/workflow `.lower()` def-key builders are CORRECT keeps. **tsc caught the mirror bug on the frontend** (`nextOrderStatus` returning lowercase to the transition POST; `_ORDER_CHAIN` needed `: string[]` typing).
- **E1b** — deploy contract now construct-checks the real comms gateways (parity w/ RADIUS): `EMAIL_PROVIDER=smtp`⇒`SMTP_HOST`, `SMS_PROVIDER=twilio`⇒sid+token+from. Closes the silent fall-back-to-dev-no-op gap in `channels.configure_adapters`. +2 gate-fires tests; prod-happy-path fixtures got the creds.
- **OPS-5 (software parts)** — `gaahex_uploads` named volume at `/app/uploads` (real fix: local-disk attachments were lost on container recreate) · DB image-pin guidance (pgdata safety) · `docker-compose.prod.yml` Caddy auto-HTTPS overlay + `Caddyfile` (HSTS/security headers; additive, dev unaffected). Both compose files validate (`docker compose config -q`).
- **Genuinely still open (NOT code-closable):** prod secrets + real TLS domain (Gev-side) · RADIUS-real host + OLT-on-hardware = internet activation (Monday infra + on-site).

## Workspace redesign + design-system (2026-06-15) → see sibling file / Workspace redesign
**EN:** The full Workspace-page redesign + the locked design-system patterns (glass % standard · hex-per-page-type
backgrounds · Widget Registry / role-personalized landing · KPI=4 rule · always-on Needs-You-Now bands · dev
workflow 5173/8099/demo-creds · page-by-page next-steps · lessons) are captured in **`workspace-design-patterns.md`**
(same folder). Workspace page DONE at commit `5c21a3e` (pushed GitLab+GitHub, mirrored `D:\Backups\GAAhex-mirror`);
backend suite GREEN `1921 passed · 0 failed`. That file is the reference for applying the same standard to the
remaining pages.

## System Standard ratified — now LAW (Gev 2026-06-15) → see sibling file / System Standard = ՕՐԵՆՔ
**EN:** Gev ratified `GAAHEX_SYSTEM_STANDARD.md` (canonical at `GAAhex/docs/standards/`) as the **binding
umbrella law for ALL GAAhex UI + code** (§0–§12: zero hardcode · one `gx-` source · shell every page · one
`gx-Modal` in place · no raw IDs · global search · element-matched-to-data · refactor-on-sight ·
replace→verify→delete · quality floor). Apply automatically every session; run §12 before any page is "done".
Full operating note (rule + non-negotiables + method + state) → **`system-standard-law.md`** (same folder).
Doing now: conformance audit §0–§12 → gap report by severity → phased plan (tokens → gx components → shell →
search → page-by-page) → **await Gev GO before executing**. NOT greenfield (mature primitives/page-shell/i18n/
formatters/tokens already exist) → conformance + consolidation.
**HY:** Գևը հաստատեց `GAAHEX_SYSTEM_STANDARD.md`-ը որպես **կապող umbrella օրենք ամբողջ UI+code-ի**։ Ավտոմատ
կիրառել ամ session, §12 «done»-ից առաջ։ Full note → `system-standard-law.md`։ Հիմա՝ audit §0–§12 → gap report →
phased plan → սպասել GO-ին։
**HY:** Workspace-էջի redesign-ն ու կնքված design-system patterns-ը (glass % · hex-per-page · Widget Registry /
role-landing · KPI=4 · always-on bands · dev workflow · page-by-page · դասեր) → `workspace-design-patterns.md`
(նույն folder)։ Workspace էջը ԱՐՎԱԾ՝ commit `5c21a3e` (push GitLab+GitHub, mirror `D:\Backups\GAAhex-mirror`),
suite GREEN 1921 pass։ Էդ ֆայլը reference ա մնացած էջերը նույն ստանդարտով անելու։
