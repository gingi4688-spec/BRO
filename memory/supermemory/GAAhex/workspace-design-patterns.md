# GAAhex — Workspace + design-system patterns (sealed per L8) / Workspace + design patterns (կնքված L8-ով)

> EN: Sealed to the GAAhex work only. Never cross-referenced into another work.
> HY: Կնքված միայն GAAhex work-ին։ Երբեք cross-reference ուրիշ work-ի մեջ։
> Written 2026-06-15 (Bro · Gev) — design-system reference so context survives compact/new-window.
> Sibling running-record: `analysis-and-pilot-plan.md` (same folder). Last frontend checkpoint = commit `5c21a3e`
> (pushed GitLab+GitHub, mirrored `D:\Backups\GAAhex-mirror`; backend suite GREEN 1921 pass).

---

## Why this file / Ինչու ա սա
**EN:** The big frontend decisions (glass %, hex-per-page, widget registry, KPI=4, bands, dev workflow) lived
only in-conversation. Captured here so ANY next session (compact OR fresh window) picks the thread up exactly,
and every new page matches the established standard instead of re-discovering it.
**HY:** Frontend-ի մեծ որոշումները (glass %, hex-per-page, widget registry, KPI=4, bands, dev workflow) մենակ
խոսակցության մեջ էին։ Հոս կնքած ա, որ ՈՐ session էլ լինի (compact թե նոր window), թելը նենց վերցնի, ու ամ նոր
էջ համապատասխանի ստանդարտին՝ նորից չ-discover անելով։

---

## 1) Glass standard (LOCKED) / Glass ստանդարտ
**EN:** Translucent glass cards, applied **project-wide, one standard**:
- **KPI cards (`.kpi-tile`) = surface 50%.** `frontend/src/styles/primitives.css`.
- **Every other card (`.card`) = surface 40%.** `frontend/src/styles/_auth.css`.
- **Bands / chips = glass like KPI cards** (same translucent feel), `backdrop-filter: blur(16px)`.
- Recipe: `background: color-mix(in srgb, var(--gx-surface) N%, transparent); backdrop-filter: blur(16px);`
- History: tried 65% → 50% → final **KPI 50% / everything-else 40%** ("վերջնական ... նույն ստանդարտը").
**HY:** Թափանցիկ glass card-եր, **project-wide, մեկ ստանդարտ**՝ KPI card 50% · մնացած ամ card 40% · band/chip
glass KPI-ի պես · `blur(16px)`։ Recipe՝ `color-mix(in srgb, var(--gx-surface) N%, transparent)`։

## 2) Hex backgrounds — "few big hexagons" (brand-beast) / Hex ֆոներ
**EN:** Brand hex field as page background. Final look = **a few BIG hexagon outlines** (the `IndexBrandBeast`
brand-beast feel), **thicker strokes + gold glow**, **multi-color** using all brand colors
(azure/green/gold/cobalt/violet). Per **page-type** variant.
- **CRITICAL root-cause (don't lose this):** hex must paint on **`.ps`** (PageShell root), NOT `<body>` — the
  `.ps` element paints an opaque `#0A1322` over the body, so a body-level hex is invisible. Header + KPI strip
  are made **transparent** so the hex shows through. (`frontend/src/page-shell/styles.css`.)
- Per-page-type override via **`--gx-hex-field`** token (`gaahex-tokens.css`, dark+light), switched by
  `data-page-type={type.toLowerCase()}` on `.ps`.
- **8 SVGs** in `frontend/public/brand/`: hex-field-dark, hex-field-light, hex-registry, hex-pipeline,
  hex-operations, hex-analytics, hex-communication, hex-configuration (generated via a node script; each color
  has its own glow filter).
- **gitignore trap (fixed):** root `brand/` rule was hiding these SVGs → deployed app would 404. Negation rule
  in `.gitignore` keeps `frontend/public/brand/*` shipping. **Keep that rule.**
**HY:** Brand hex-field որպես ֆոն՝ **մի քանի ՄԵԾ hexagon outline** (brand-beast), **հաստ stroke + gold glow**,
**multi-color** (azure/կանաչ/gold/cobalt/violet), ըստ page-type-ի։ **ԿԱՐԵՎՈՐ root-cause՝** hex-ը պիտի `.ps`-ի
վրա նկարվի, ՈՉ body (`.ps`-ը opaque #0A1322 ա ծածկում)։ Header+KPI թափանցիկ։ 8 SVG `public/brand/`-ում։
gitignore-ի negation rule-ը պահում ա, որ չ-404 անի — **մի ջնջի**։

## 3) Workspace page = role-personalized landing / Workspace = ըստ դերի
**EN:** The Workspace is a **per-user landing — different for everyone** by user/department/position.
- Backend **`/api/me/workspace-role`** resolves **10 canonical roles**: ceo, b2b_am, d2d_agent, retail_agent,
  support_t1, support_t2, field_tech, noc_engineer, billing_spec, general. This is the personalization key.
- **Widget Registry** (`frontend/src/lib/workspace/registry.tsx`): typed catalog, role-default layouts,
  capability-gating via `can(caps, obj, verb)` (caps from `capabilities.ts`,
  `Capabilities=Record<entityKey,{view,create,edit,delete}>`). Helpers: `defaultLayoutFor` / `catalogFor` /
  `resolveWidgets` (+ `loadCustomization`/`saveCustomization`, but see below — end-user customize is OFF).
- **11 widgets, VARIED visual treatments** (Gev: "որ միատոն չլինի"): WMyTickets, WSlaAtRisk, WTeamTickets,
  **WMyTasks=TABLE**, **WMyRouteToday=TIMELINE**, **WMyPipeline=STAGE BARS**, **WCollections=TABLE**,
  WApprovals, **WTeamMembers=AVATAR GRID**, **WOrgHealth=STAT TILES**, WCustomerCalls. Tables show chrome even
  when empty (`wx-empty-cell`).
- **Equal-height widgets**: `.ws-grid` flexbox wrap; `.ws-grid > .card { flex:1 1 340px; height:256px }`;
  scroll inside `.wx-body`. **Full-width bottom card** fills leftover space: `.card.wx-full { flex:1000 1 340px }`
  (used for RecentActivity beside OrgHealth — "տակի դատարկ տեղը քարդ դիր").
- **NO end-user customize** — admin-only via **Studio** (Gev: "չեմ ուզում քասթըմայզ անեն յուզերները"). The
  customize UI was removed from HomeView.
**HY:** Workspace-ը **per-user landing** ա՝ ամեն մարդու ուրիշ (user/department/position)։ Backend
`/api/me/workspace-role` → 10 canonical role։ Widget Registry (`registry.tsx`)՝ typed catalog + role-default +
capability-gate (`can`)։ 11 widget՝ **խառը treatment** (table/tiles/bars/timeline/avatars, ՈՉ միատոն)։
Հավասար բարձրություն (`.ws-grid > .card height:256px` + scroll)։ Full-width տակի card (`.wx-full`)։
**End-user customize ՉԿԱ** — մենակ admin Studio-ով։

## 4) KPI = exactly 4 on EVERY page / KPI = ուղիղ 4 ամ էջում
**EN:** Hard rule (Gev: "all page structure KPI CARDS = 4"). `frontend/src/page-shell/KPIBar.tsx` **caps to 4**
and **pads** with `.ps-kpi-ph` placeholder slots; `data-count="4"`. Per-role KPI sets live in `ROLE_KPIS` map
in `HomeView.tsx` (exactly 4 each).
**HY:** Կոշտ կանոն՝ ամ էջում ուղիղ **4 KPI card**։ KPIBar-ը cap ա անում 4-ի + placeholder-ով padding։ Ըստ-role
KPI-երը՝ `ROLE_KPIS` (HomeView), ամ role 4 հատ։

## 5) Always-on "Needs You Now" bands / Միշտ-վառ band-եր
**EN:** A band per category, **always visible** (Gev: "բենդերը միշտ ունենանք ... եթե 0 ա թող կանաչ լինի ու ասի
0"): green ✓ + "0" when clear, red/amber when action needed. **All band chips equal size = the longest one,
project-wide** (Gev: "the longest is winner — apply to all project") via the CSS trick:
`display:inline-grid; grid-auto-flow:column; grid-auto-columns:1fr; align-self:flex-start` (`.ws-urgent` /
`.ws-urgent-chip`, with backdrop-blur glass). Built in `HomeView.tsx` as the `bands` array (helpers `glassTint`,
`pl` pluralize). Icons used: `AlertTriangle, Shield, Clock, Check`.
**HY:** Category-ի band, **միշտ երևացող**՝ 0-ի դեպքում կանաչ ✓ «0», action-ի դեպքում կարմիր/amber։ **Բոլոր
chip-երը հավասար = ամենաերկարը, project-wide** (inline-grid 1fr trick, `align-self:flex-start`)։ Glass՝ blur։

## 6) Header polish / Header-ի polish
**EN:** Count **beside the title** (`.wx-count`, e.g. "SLA at Risk · 9"), **no icons** in widget heads,
**bigger titles** (`.wx-title` → text-lg = 16px). Tokens in `gaahex-tokens.css`
(text-13=13 / text-md=14 / text-lg=16 / text-xl=18). Reworked head markup = `.wx-head` / `.wx-title` /
`.wx-count` (in `registry.tsx` Widget shell + `_addendum.css`).
**HY:** Count-ը **վերնագրի կողքը** (`.wx-count`), **առանց icon**, **մեծ վերնագրեր** (text-lg=16)։

## 7) Dev workflow (so a fresh session can run it) / Dev workflow
**EN:**
- **Backend**: `ENVIRONMENT=development .venv/Scripts/python.exe -m uvicorn app.main:app --port 8099 --reload`
  (run from `backend/`). `backend/.env` `DATABASE_URL` = gaahex OWNER role @ localhost:5433. Dev DB `gaahex`,
  test DB `gaahex_test`, docker container `gaahex-db`.
- **Frontend**: Vite dev on **5173** (KEEP this one; 5174/5175 were stray, killed). Frontend calls the API at
  **absolute** `http://127.0.0.1:8099` (`frontend/src/config.ts`) — not a relative proxy.
- **Render-verify**: Playwright headless (chromium installed) — log in `admin@demo.isp` / `admin123`, render the
  real dashboard, inspect computed paint-chains. This is how the honeycomb-invisible bug was root-caused.
- **`.env` is gitignored** (dev secrets). NEVER commit/push it. backend `uploads/` also gitignored.
**HY:** Backend՝ 8099 (`ENVIRONMENT=development ... uvicorn ... --reload`), `.env` → OWNER role @5433, DB `gaahex`/
`gaahex_test`, docker `gaahex-db`։ Frontend՝ Vite **5173** (սա պահել), API absolute `http://127.0.0.1:8099`
(`config.ts`)։ Render-verify՝ Playwright headless, login `admin@demo.isp`/`admin123`։ `.env` gitignored — երբեք
չ-commit։

## 8) Key files map / Հիմնական ֆայլերը
- `frontend/src/lib/workspace/registry.tsx` — Widget Registry (catalog, layouts, resolver, Widget shell).
- `frontend/src/views/HomeView.tsx` — role KPIs (`ROLE_KPIS`), `bands` (Needs-You-Now), `RecentActivity`
  full-width card (`useFetch('/api/activity?limit=24')`), no customize UI.
- `frontend/src/styles/_addendum.css` — `.ws-grid`, widget treatments (`.wx-table/.wx-stats/.wx-avatars/`
  `.wx-bars/.wx-timeline/.wx-activity`), `.ws-urgent*` (equal-size chips).
- `frontend/src/styles/_auth.css` — `.card` glass 40%.
- `frontend/src/styles/primitives.css` — `.kpi-tile` glass 50%.
- `frontend/src/page-shell/KPIBar.tsx` — caps to 4 + placeholder pad.
- `frontend/src/page-shell/styles.css` — `.ps` hex background; transparent header/kpis; per-page-type field.
- `frontend/src/styles/gaahex-tokens.css` — `--gx-hex-field` token; font-size scale.
- `frontend/public/brand/*.svg` — 8 hex backgrounds (multi-color + glow).
- `backend/app/routers/activity.py` — global feed fix (`_FEED_EXCLUDE=("user","tenant")`; tenant-scoped grant
  filter via `_has_perm`) so first-class events surface and user-event noise is dropped.

## 9) Page status + next / Էջերի վիճակ + հաջորդ
**EN:** **Workspace page = DONE** (all of the above shipped, commit `5c21a3e`). The system (glass + hex +
KPI=4 + bands + varied widgets) is now the **template to apply page-by-page** to the rest. Gev's model: "Gev
explains his vision per page, then build." NEXT = whichever page Gev points to next; apply this exact standard.
**HY:** **Workspace էջը = ԱՐՎԱԾ** (commit `5c21a3e`)։ Համակարգը (glass+hex+KPI=4+bands+խառը widget) հիմա
**template ա՝ էջ-առ-էջ** կիրառելու մնացածին։ Հաջորդ՝ որ էջ Գևը ցույց տա, նույն ստանդարտով։

## 10) Lessons (don't repeat) / Դասեր
**EN:**
- **Root-cause, don't rewrite.** Gev almost said "delete all design, start from 0" — a Playwright paint-chain
  audit proved the design was healthy; the bug was one opaque `.ps` layer. Evidence beat the rewrite instinct.
- **Render-verify before claiming a visual is done** — computed styles, not assumptions.
- **gitignore can silently break a deploy** — assets hidden by a broad rule 404 in prod. Check negation rules.
- **Don't silently mutate shared dev DB** (a raw `docker exec UPDATE` was correctly DENIED) — fix via the app's
  own code path (e.g. seed self-heal), which is legitimate, idempotent, and reviewable.
**HY:** Root-cause արա, մի rewrite արա (Gev-ը քիչ էր մնում «ջնջի սաղ դիզայնը» ասեր — Playwright-ը ապացուցեց առողջ
ա, bug-ը մեկ opaque `.ps` շերտ էր)։ Render-verify նախքան «արված ա» ասելը։ gitignore-ը կարա լուռ deploy կոտրի։
Shared dev DB-ն լուռ մի mutate արա — app-ի code path-ով (seed self-heal)։
