# GAAhex — System Standard is LAW (sealed per L8) / System Standard-ը ՕՐԵՆՔ ա

> EN: Sealed to the GAAhex work only. Never cross-referenced into another work.
> HY: Կնքված միայն GAAhex work-ին։ Երբեք cross-reference ուրիշ work-ի մեջ։
> Set by Gev 2026-06-15. STANDING RULE — apply automatically every GAAhex session, not a one-time read.

---

## The rule / Կանոնը
**EN:** Gev ratified **`GAAHEX_SYSTEM_STANDARD.md`** (canonical copy committed at
`GAAhex/docs/standards/GAAHEX_SYSTEM_STANDARD.md`) as the **binding law for ALL GAAhex UI + code**. It is the
umbrella standard — it governs and **supersedes** the per-area docs where they conflict (10 page-shell · 16
status · 17 permission · 21 search · UI_PRIMITIVES · TOKEN_MIGRATION · CONTENT_VOICE · D18 color), and those
remain the detail reference where they agree. **Apply it automatically to every task** — every page, every
component, every change — without being re-asked. Before any page is "done", run its **§12 per-page checklist**.
**HY:** Գևը հաստատեց **`GAAHEX_SYSTEM_STANDARD.md`**-ը (canonical՝ `GAAhex/docs/standards/`) որպես **կապող օրենք
ամբողջ GAAhex UI + code-ի համար**։ Umbrella standard ա — գերակա ա per-area doc-երից conflict-ի դեպքում, համաձայն
լինելու դեպքում դրանք մնում են detail reference։ **Ավտոմատ կիրառիր ամեն task-ի** — ամ էջ, ամ component, ամ
փոփոխություն — առանց նորից հարցնելու։ «Done»-ից առաջ՝ **§12 checklist**։

## Non-negotiables (the spine) / Չբանակցվողները
1. **Apply to EVERY page/component** — nothing exempt (§0.1).
2. **ZERO hardcode** — every color/size/space/string/format/route = token/config/single-source, called from one
   place. No raw hex, no raw px, no inline strings, no copy-pasted constants (§0.2, §2, §8, §9).
3. **One source, one component** — shared things defined once as `gx-*`, imported everywhere; never a 2nd
   bespoke copy (§0.3, §3).
4. **Refactor on sight** — fix violations even when off-task (§0.4).
5. **Replace → verify → DELETE old** — no dead code, no dupes, no commented blocks; repo gets cleaner every
   change, never noisier (§0.5, §11).
6. **Quality floor always** — responsive, visible keyboard focus, reduced-motion, WCAG-AA, without being asked
   (§0.6, §10).
- **Shell** identical every page (top bar · header pattern · KPI strip); header actions search→2ry→1ry, single
  primary rightmost; KPI = 4 equal cards (§1). **Navigation = one `gx-Modal` in place**, links never navigate
  away, URL-addressable, focus-trapped (§7). **No raw IDs/UUIDs in UI** — human refs only (§6). **Global search
  box on every page**, one `/search?q=`, scope chips + match-reason + phone-normalized pg_trgm (§5). **Element
  matched to data shape**, never monotone all-cards/all-tables (§4).

## Working method when executing / Աշխատելու ձև
**EN:** Foundation-first, never blind-rewrite: **tokens (with the §2 naming scheme) → shared `gx-` components →
page shell → global search → then page by page.** Each change: build new → **verify it works** → delete old.
Gev approves the PLAN before any code changes; this file + the audit drive that plan. See sibling
[[workspace-design-patterns]] for the already-shipped Workspace patterns (glass %, hex-per-page, KPI=4, bands)
that must be folded INTO this standard, not contradicted.
**HY:** Foundation-ից, ոչ կույր-rewrite՝ **token-եր (§2 scheme) → shared `gx-` component-եր → page shell →
global search → հետո էջ առ էջ**։ Ամ փոփոխություն՝ նոր → verify → հին-ը ջնջել։ Գևը հաստատում ա ՊԼԱՆԸ նախքան կոդի
փոփոխությունը։

## State / Վիճակ (2026-06-15)
**EN:** Standard ratified + persisted (repo + this memory). Audit DONE (5 parallel read-only agents, evidence-
based). Gap report delivered. NOT greenfield — mature system (primitives/ + page-shell/, lib/i18n.ts, money/time/
humanize formatters, gaahex-tokens.css + D18, backend search router) → work is **conformance + consolidation**.
**Status: phased plan finalized, AWAITING Gev GO before any code change.**
**HY:** Standard հաստատված + պահված։ Audit ԱՐՎԱԾ։ Gap report հանձնված։ Greenfield ՉԷ — conformance + consolidation։
**Վիճակ՝ phased plan finalized, ՍՊԱՍՈՒՄ Գևի GO-ին որևէ կոդ փոխելուց առաջ։**

## Audit headline (what's already strong vs the gaps) / Audit-ի գլխավորը
**Already strong (NOT rot):** ONE real PageShell used by 44 views (header-order + KPI=4 structurally enforced);
single `--gx-` token registry (D19 double-registry resolved + drift-guarded, D18 discipline held); strong search
BACKEND (`backend/app/routers/search.py`); correct modal base exists (`components/Overlay.tsx` + `lib/
useFocusTrap.ts`); HomeView/Workspace registry + DashboardView/charts = §4 exemplars; all 13 existing standards
AGREE with the umbrella (0 conflict, just need a "detail reference" header).
**CRITICAL gaps:** §5 search frontend fully UNWIRED (`crossSearch` in lib/api.ts = dead code, no shell box, no
palette); §7 no single modal (5+ overlay systems) + navigate-away to full pages + detail not URL-addressable;
§8 EN catalog EMPTY (`i18n.ts:15-17` en:{}), ~65 hardcoded toasts + ~138 placeholders; §11 NO lint/type/test
gate + 2 parallel API clients + ~84 raw fetches; §3 duplicated state primitives (LoadingState ×2 etc).
**HIGH:** §6 raw uuid.slice(0,8) in ~60+ sites (literal `entityKey/id` in RecordDrawer.tsx:165), no humanRef;
§2 naming divergence + broken 4px space ladder; §9 formatters bypassed + no phone()/number() + not locale-aware;
§3 `gx-` prefix absent + missing gx-Table/Chip/SearchBox + can() covers <1/3 & defaults OPEN; §10 `--gx-bp-*`
defined but 0 usage + tables don't collapse to cards; §0.5 dead/dup CSS + proto/ shipped; §1 localized shell
leaks (CustomerView KPI, Notifications/Profile actions, legacy ViewHead).

## Decisions LOCKED (Gev 2026-06-15) / Որոշումներ ԿՆՔՎԱԾ
1. **§2 token naming — KEEP shipped `--gx-{role}` scheme, AMEND the standard's §2 examples to match.** No
   codemod rename. Phase 1 fixes only the genuinely-broken 4px space-scale VALUES + tokenizes the ~12 consumer
   hex. (The registry is already single-source + drift-guarded + D18-correct; renaming = pure churn.)
2. **`views/proto/*` (12 files) — DELETE** (per §0.5). Design selection done (IndexBrandBeast); they ship in the
   prod bundle and carry most of the raw hardcode/noise. Remove their `/proto/*` routes in App.tsx too.
3. **§11 wire casing — THIN camelCase boundary at the data layer** (one snake↔camel mapper at the fetch seam;
   components see camelCase). NO backend churn, NO full codegen migration.

## Finalized phased plan (foundation-first) / Վերջնական phased plan
Ph0 Lock-in: "detail reference under umbrella" header on the 13 standards + §12 checklist + lint/drift gate
scaffold. · Ph1 Tokens(§2): amend §2 doc to shipped names, fix 4px space ladder, tokenize ~12 hex. · Ph2 Shared
`gx-` components(§3): collapse duplicated state primitives→one gx-EmptyState/Skeleton/ErrorState/Denied (delete
losers), build gx-Table/Chip/SearchBox/DefinitionList, adopt gx- naming, route every action through one default-
DENY can(), longest-wins sizing. · Ph3 Formatters+i18n+data(§8/§9/§11): EN catalog (AM+EN) + locale-aware
formatters + phone()/number(), unify 2 API clients→one layer + camelCase boundary + migrate raw fetches, stand
up lint/type/test gate. · Ph4 Shell+Nav+HumanRefs(§1/§7/§6): fix shell leaks + kill ViewHead, consolidate 5
overlays→one gx-Modal on Overlay/useFocusTrap, navigate-detail + page-swap → in-place URL-addressable modal,
humanRef() + sequential-number sweep (~60 sites). · Ph5 Search(§5): wire shell gx-SearchBox→/search, scope
chips + match-reason + "Also found in", backend normalized-phone + pg_trgm + multi-interpretation ranking. ·
Ph6 Page-by-page(§4/§10/§12): element-variety (customer cluster + detail modals via gx-DefinitionList),
responsive collapse-to-cards + tokenized breakpoints, run §12 per page, delete dead CSS. Every change:
**replace → verify (tsc + suite + Playwright render) → delete old.**

## Refinements on approval (Gev 2026-06-15) / Ճշտումներ հաստատման պահին
**EN:** Gev APPROVED the plan. Refinements folded in:
- **i18n = trilingual hy · en · ru** (not just AM+EN). Standard §8 + §12 + the index localization note updated;
  CONTENT_VOICE/Localization to follow in Ph3. (Current `lib/i18n.ts` already has hy+ru, en empty → Ph3 fills
  en + completes parity.)
- **Cadence = phase-by-phase with a checkpoint.** At each phase end: **verify + show Gev, THEN** move to next.
  **NO autonomous full-run.** (Bro must stop and report after every phase.)
- **verify-before-delete = explicit law** (§0.5 sharpened): never delete/unwire the old until the new is
  verified working (type-check + tests + render). 
- **New logic ships with tests** (§11 + §12): unit for pure logic, integration for wired; bug fix = regression
  test. Not "done" until tests pass.
- **Design-language doc added to Ph0** → `GAAhex/docs/standards/GAAHEX_DESIGN_LANGUAGE.md` (aesthetic north-star
  companion: hive spirit, restrained luxury, Aurora-Glass, colour soul D18, element philosophy, trilingual
  voice). See sibling [[workspace-design-patterns]].
- **Governance positioning corrected:** the repo already has a Constitution → PRM → 22 Architecture docs → 70
  standards hierarchy (LAW-ST1, `00-standards-index.md` is canonical). The umbrella sits at the STANDARDS layer,
  **subordinate to the Constitution**, consolidating the UI/code standards — NOT above everything.
- **Banner decision:** instead of stamping 13 banners into LOCKED standard files (= §0.3 duplication + touching
  13 locked docs), registered the umbrella + mapping **authoritatively in `00-standards-index.md`** (the
  canonical index). Single-source. Flagged to Gev; he can still request per-file banners.

## Phase 0 — DONE (2026-06-15, docs/governance only, zero code) / Phase 0 ԱՐՎԱԾ
**EN:** Delivered: (1) NEW `GAAHEX_DESIGN_LANGUAGE.md`; (2) umbrella amended — positioning under Constitution
(LAW-ST1), §8 trilingual hy/en/ru, §0.5 verify-before-delete explicit, §11 new-logic-tests + camelCase-boundary
note, §12 checklist updated, design-language pointer; (3) `00-standards-index.md` registers the umbrella +
design-language + §→detail mapping + hy/en/ru localization note. Real lint/type/test GATE deferred to Ph3 (§11)
— Ph0 is governance docs only (existing GOVERNANCE drift tooling stays the enforcement layer for now). NOTHING
committed/pushed (not asked). **AWAITING Gev GO for Phase 1 (Tokens §2).**
**HY:** Phase 0 ԱՐՎԱԾ (docs/governance, զրո կոդ)՝ design-language doc + umbrella amendments + index registration։
Lint/test GATE-ը Ph3-ին։ Committed չէ։ **Սպասում Գևի GO-ին Phase 1-ի (Tokens §2)։**

## Phase 1 — DONE (2026-06-15, Tokens §2) / Phase 1 ԱՐՎԱԾ
**KEY REFRAME (honest, L7):** Gev asked "make color tokens theme-aware/semantic, light mode is coming" — but
`gaahex-tokens.css` is ALREADY 3-tier (Tier1 primitives → Tier2 semantic `--gx-*` re-defined per `[data-theme]`
→ Tier3 composed) WITH a FULL light theme already built (lines 482-576) + wired (App.tsx:280-284 sets
`data-theme` on `<html>`, toggle :624; Studio AppearancePane Dark/Light/Auto). So the token layer already
satisfies theme-aware/semantic. The REAL light-mode risk = COMPONENTS using raw hex that bypass the semantic
layer (they don't track the theme). That's the work done here.
- **Theme-aware token sweep (the real fix):** added Tier-2 `--gx-danger-hover` / `--gx-danger-disabled` /
  `--gx-accent-disabled` in BOTH dark+light blocks, + Tier-1 `--cobalt-grad-deep`/`--cobalt-grad-mid` (login
  gradient). Fixed 11 consumer sites so they track the theme: `_buttons.css` (5: primary/accent/ghost/danger
  hover+disabled — were `#3A3527`/`#EF4D58`/`#3D1B1F`/white-rgba), `_auth.css` (2 logo gradients `#142D4F`/
  `#2E5A9C`), `_section-polish.css` (2 avatar text `#1a1102` → `--gx-text-on-gold`).
- **proto DELETED:** `views/proto/` (12 files) + 10 imports + 11 routes in `App.tsx`. git-tracked → reversible.
  Confirmed only App.tsx imported it (other 2 "proto" hits = comments). 
- **§2 doc amended (decision A):** documented the real 3-tier theme-aware architecture + shipped `--gx-{role}`
  names + real 2px space scale. **FLAGGED (honest):** space scale is NOT a 4px ladder — it's 2px-base
  (`--gx-space-2..8` = 4/6/8/10/12/14/16, -12=24, -16=32) with 3 anomalies (`-9`=40, `-18`=18, `-20`=20). Did
  NOT blindly re-map (would shift every layout — NOT the "low-risk mechanical" Gev assumed); flagged for a
  careful rename-pass if Gev wants it.
- **Verify:** `tsc --noEmit` EXIT=0 (clean — proto removal + token edits broke nothing). No new logic → no new
  tests. Token additions in-file → D19 single-registry drift-compliant. Light-mode visual render PENDING (Vite
  5173 not running; backend 8099 up). Nothing committed/pushed.

## Standard → v1-final + Brand v3.0 is the source (Gev 2026-06-15) / Standard v1-final
**EN:** Gev delivered a **v1-final** standard (saved clean over `GAAHEX_SYSTEM_STANDARD.md`) + a locked visual
sample (`gaahex_design_sample.html`). Big additions: **NEW §2 Design Language** (ISP control-room mood · honeycomb
logo 4-cobalt/2-azure/1-gold · GAAhex=system, tenant shown SEPARATELY · Aurora-Glass = per-page RANDOM hex
scatter + ~51% glass surfaces + ambient glow · Sora typeface · AM+EN+RU font coverage Armenian+Cyrillic+Latin) ·
§0 now 7 directives (new-logic-tests is §0.6) · §4 adds gx-DefinitionList · §13 checklist adds "design language
applied". **Colour/logo/font SOURCE OF TRUTH = `docs/branding/v3.0/`** (`11-figma/tokens/gaahex-tokens.css` +
`import/gaahex-icon-*.svg`). **Visual target = `gaahex_design_sample.html`.** Re-synced `GAAHEX_DESIGN_LANGUAGE.md`
to match. 
- **HONEST brand-gap (shipped frontend tokens ≠ Brand v3.0 / sample target):** font **Sora** vs shipped Space
  Grotesk/IBM Plex (⚠ Sora woff2 NOT in `frontend/public/fonts/`) · semantic colours #34C77B/#F2AE3C/#F0666B/
  #5293F2 vs brand #16A34A/#D97706/#DC2626/#2563EB · space 2px-base vs brand 4px ladder (4/8/16/24) · `--gx-glass`
  /`--gx-logo-cobalt` missing · hex bg static-per-page-SVG vs per-page RANDOM scatter. This is a real
  brand-alignment, not a patch.
- **Phase 1 continued (glass tokens land clean):** added `--gx-glass` (40%) / `--gx-glass-strong` (50%) /
  `--gx-glass-border` (theme-aware dark+light) + Tier-1 `--gx-glass-blur:16px` + `--gx-logo-cobalt` (dark #4E7FC4
  / light #1C3B68). Additive, no consumers changed yet (migrate in component phase). **tsc EXIT=0.**
- **AWAITING Gev decisions:** (1) brand-alignment SEQUENCING — focused pass now (palette→brand values · surfaces
  · 4px ladder · hex-scatter) vs during page work vs skip-global-palette; (2) **Sora font sourcing** (Gev drops
  woff2 / Bro downloads from Google Fonts w/ net / keep Space Grotesk for now). Then GO Phase 2 (gx- components).
- **Still flagged:** 4px ladder remap is NOT low-risk (every `--gx-space-N` consumer shifts) — careful migration,
  not blind. Sample HTML not yet saved in-repo (offered).
**HY:** Standard v1-final (§2 Design Language · brand v3.0 source · sample = visual target)։ Design-language
re-synced։ Phase 1 glass+logo tokens added (theme-aware, tsc=0)։ Brand-gap իրական ա (Sora չկա · palette · 4px
ladder · scatter)։ Սպասում՝ brand-alignment sequencing + Sora sourcing decision, հետո GO Phase 2։

## Brand-Align Pass — DONE + rendered (Gev 2026-06-15) / Brand-Align ԱՐՎԱԾ
**Gev decisions:** focused brand-align pass NOW (before Phase 2); Sora = self-host 3 faces (Sora+Noto AM+Noto Cyr),
Gev drops woff2; light-chrome fix = **tokenized** (`data-theme="dark"` pin), NOT hardcoded; 4px ladder = separate;
glass/surfaces as-is, judge on assembled render.
**Done this pass (all theme-aware, tsc=0, validated via Playwright render dark+light):**
- **Semantic palette → brand/sample values** (gaahex-tokens.css dark+light): success/warning/danger/info
  (#22C55E/#F59E0B/#F05252/#3B82F6 dark · #16A34A/#D97706/#DC2626/#2563EB light); `-soft` → `color-mix` auto-track.
- **Dark+light surfaces → sample** (bg #0B0E14 / surface #15181F / surface-2 #1C2029 dark; bg #EEF1F6 / surface-2
  #F4F5F7 light).
- **Light-chrome fix (tokenized):** `data-theme="dark"` pinned on `<aside className="sb">` (App.tsx) + `<div
  className="login-brand">` → always-dark chrome resolves dark token-map → text readable in light via the SAME
  `--gx-text-1`. Zero hardcode, one scope. **RENDER CONFIRMED:** sidebar nav readable in light. (If chrome palette
  ever differs from dark-map → dedicated `--gx-on-chrome-*` tokens; still no hardcoded light hex.)
- **Glass/logo tokens consumed:** `.card`→`var(--gx-glass)`, `.kpi-tile`/`.wx-stat`→`var(--gx-glass-strong)`, blur
  →`var(--gx-glass-blur)` (`_auth.css`, `primitives.css`, `_addendum.css`). Same values → zero visual change, now
  tokenized (zero-hardcode).
- **Per-page hex-scatter:** NEW `page-shell/HexScatter.tsx` (random faint brand-hued hexagons, unique per page
  mount, `useMemo`; geometry = dynamic-geometry exception, hues tokenized) rendered in PageShell; replaced the
  static per-page-type `--gx-hex-field` background + added a faint `.ps::before` ambient glow.
- **Fonts wired ready** (Sora stack `--gx-font-family` + @font-face×3 unicode-range); `--gx-font-sans/-display`
  still Space Grotesk until the 3 woff2 land → then 1-line flip.
**OPEN / flagged:**
- **6 orphaned brand SVGs** (`public/brand/hex-{registry,pipeline,operations,analytics,communication,configuration}.svg`)
  now UNUSED (scatter replaced them) → delete decision pending (git-tracked). `hex-field-dark/light.svg` still used
  by `_base.css` body backdrop.
- **Sora woff2** (3 files) — awaiting Gev drop into `frontend/public/fonts/`.
- **4px ladder** — separate careful migration (every `--gx-space-N` consumer shifts; not blind).
- **Sample HTML** not yet saved in-repo (offered cleaned copy).
- Vite render servers killed (no orphan). Nothing committed/pushed.
**NEXT:** GO Phase 2 (gx- components) — or micro-tune the assembled look first (scatter density / glass alpha).

## Milestone committed (Gev 2026-06-15) / Milestone commit
**EN:** Brand-align milestone committed to **main** (per repo pattern + Gev's explicit "commit now, don't push"):
**`06f9ed28`** "System Standard v1-final + token foundation + brand-align pass" — 32 files (+792/−2362; proto ×12 +
hex SVGs ×6 deleted). Working tree clean, **NOT pushed**. Also: 6 orphaned brand SVGs grep-verified unreferenced
then deleted (kept hex-field-dark/light); cleaned `gaahex_design_sample.html` saved to `docs/design/` (versioned
visual ref, mojibake fixed, trilingual demo).

## Phase 2 — gx- components (IN PROGRESS) / Phase 2 ընթացքում
**Gev scope:** collapse duplicated state primitives → one source; build gx-Table/Chip/SearchBox/DefinitionList
per §4/§5 (all states empty/loading/error/no-results · uniform sizing longest-wins · default-deny can() ·
copy-as-design). Tokens locked → cosmetics tuned via tokens later, don't block components. Verify+show at phase end.
- **Part A — state consolidation DONE (tsc=0, verify-before-delete honored):** `components/States.tsx` is THE one
  source (78 consumers, kept — §3 "don't rename"). Folded the 2 dupes in: `LoadingState.tsx` (kind API, 2
  consumers) + `NoAccess.tsx` (1 consumer EntityView) → migrated SubscriptionsView/WorkItemsView to `SkeletonRows`
  (+ optional `label`), EntityView to `PermissionDenied` (now accepts `what`+`onBack`, folds NoAccess's back-button
  + i18n copy). **Fixed latent bug:** legacy `LoadingState`/`NoAccess` used `.state`/`.state-*` CSS that was NEVER
  defined → rendered unstyled; now routed through canonical `.ps-empty`. Deleted `LoadingState.tsx` + `NoAccess.tsx`
  (tsc green before+after). Canonical state set = LoadingState · SkeletonRows · EmptyState(→page-shell .ps-empty) ·
  ErrorBanner · PermissionDenied · NotFound; orchestrated by `primitives/LoadShell`.
- **Part B — DONE (tsc=0, render=no-regression):** built 4 primitives in `primitives/` (PascalCase per §3; gx-
  = CSS/token prefix via new `styles/_gx-components.css`, imported in styles.css):
  - **`Table.tsx`** — §5 (the table element) · §6 (cell UUID guard → `humanRef()`) · §7 (`onRowClick` opens a
    caller modal, NEVER navigates; rows keyboard-operable Enter/Space) · all states (loading/error/empty →
    canonical Part-A states) · longest-wins via shared cell/pill tokens.
  - **`Chip.tsx`** — status-only, UPPERCASE, semantic-token tone (neutral/success/warning/danger/info); distinct
    from StatusPill.
  - **`SearchBox.tsx`** — presentational only (wraps Input variant=search); scoped /search behaviour = Phase 5.
  - **`DefinitionList.tsx`** — §5 "a few key-values" semantic `<dl>`.
  - **`can()` → REAL default-deny** (`capabilities.ts`): unknown entity/verb = FALSE; allow-all only via the new
    `'*'` wildcard carried by `FULL_ACCESS = {'*':{…true}}`. **Zero regression** — every `capabilities=FULL_ACCESS`
    default + AuthContext init + 404-fallback still allow-all via `*`; real caps (when E21 lives) default-deny.
    Render confirmed: dashboard actions all still present.
  - **`humanize.ts`** += `humanRef()` + `looksLikeRawId()` (§6 helpers; Table uses them).
  - Exported from `primitives/index.ts`. **Components BUILT + ready; visual ADOPTION across views = Phase 6**
    (building ≠ adopting, per Gev "don't block components") — so they don't appear in the render yet, by design.
  Phase 2 committed **`8e67e609`** (15 files, no push). Vite render server killed (no orphan).

## Phase 3 — i18n + formatters + data-layer + gate (IN PROGRESS) / Phase 3 ընթացքում
**Gev scope/guards:** §8 zero-hardcoded-strings + AM/EN/RU parity · §9 formatters one-place, locale-aware, TESTED
(֏/date/phone()/number(), phone-norm aligned to §5/§6) · unify the 2 API clients → one + thin camelCase boundary
at the data seam · gate must actually enforce lint+format+type+test. Skip demo-adoption (Phase-6 tracer does
in-situ proof, full toolkit, no re-touch). Verify+show at phase end.
- **§9 formatters — DONE (tsc=0, vitest 33/33):** added `lib/i18n.ts` `localeTag()` (DRY locale source: en-US/
  hy-AM/ru-RU from active lang). Made `money.ts` + `time.ts` **locale-aware** (replaced hardcoded `'en-US'` /
  default-locale `toLocale*` with `localeTag()`). New **`lib/format.ts` = the ONE place**: re-exports money/
  date helpers + adds `number()` (locale-aware), `phone()` (Armenian-aware display), `normalizePhone()` (digits-
  only, aligns with §5 search phone-norm). Tests `src/test/format.test.ts` (number/phone/normalize/money) all
  pass.
- **Pre-existing test breakage FIXED (honest):** `HomeView.test.tsx` asserted `getByText(/ME/)` — a leftover
  from the OLD pre-redesign workspace ("WELCOME" → contains "ME"); the redesign (5c21a3e) removed it but vitest
  was never run so it went unnoticed. Replaced with a robust `.ws-grid` presence check (the test's real intent).
  Also passed it `FULL_ACCESS` (was `{}`, now meaningless under default-deny). NOT a regression from my work —
  surfaced by running vitest.
- **Remaining Phase 3:** (1) §8 — fill EN catalog in `i18n.ts` BUNDLED to parity with hy/ru key-set (en is `{}`);
  full per-view string sweep = Phase 6 tracer. (2) Unify clients — `lib/api.ts` (19 raw fetches, no 401) routes
  through `billing.ts` bget/bpost + a new `bfetch` (header/blob/FormData cases) → one client, 401 everywhere +
  a `camelKeys` seam util (opt-in, not blanket — blanket breaks snake_case consumers; Phase-6 adopts). (3) GATE.
- **⚠ GATE DECISION (flagged to Gev):** no eslint/prettier config exists; making the WHOLE legacy codebase pass
  strict lint+format = massive churn. Options: **(A) RATCHET** — gate enforces lint+format on CHANGED files only
  (new code can't regress; legacy grandfathered) + typecheck+test on the whole; matches the repo's GOVERNANCE
  "ratchet philosophy"; real enforcement, no churn [RECOMMENDED]. **(B) BLANKET** — prettier --write + fix lint
  everywhere (huge risky diff). Awaiting Gev.
- **UPDATE — Gev chose A=RATCHET:** gate = lint+format on changed/staged files only (legacy grandfathered +
  cleaned via refactor-on-sight) + typecheck+test GLOBAL; eslint/prettier rules one-source; wire pre-commit + CI
  to actually BLOCK; no blanket reformat.
- **Client-unify DONE (tsc=0, vitest 36/36):** `lib/api.ts` now routes EVERY call through the new
  `billing.bfetch` (single low-level auth'd fetch + `intercept401` → one client surface, 401 everywhere); `login`
  stays raw (pre-auth, a login-401 is the credential check not a session expiry). Added opt-in `camelKeys` seam
  mapper to billing (snake→camel, deep; NEVER blanket — Phase-6 pages opt in) + `src/test/camel.test.ts`.
- **§8 parity DONE (tsc=0, vitest 37/37):** script-built (harvested 1179 `t(key,fallback)` calls from the
  codebase + existing hy/ru) → `i18n.ts` BUNDLED now has **1327 IDENTICAL keys in en/hy/ru** (en=real fallbacks;
  hy/ru = existing translations + English placeholder for gaps — runtime already fell back to English so 0
  regression). `BUNDLED` now exported; `src/test/i18n-parity.test.ts` ENFORCES identical key-sets. Per-view real
  translation sweep = Phase-6 tracer.
- **Remaining Phase 3 = the RATCHET gate only:** eslint/prettier (one-source config) + husky pre-commit +
  lint-staged (changed/staged only) + CI + `gate` script (typecheck+test global). Gev nudge: PROVE it blocks
  (commit a lint-failing changed file → must reject). Then phase-end: tsc + vitest + gate-green + render + show.
  After Phase 3 → Gev wants to revisit "ML" (ask what to do with it).

## Phase 3 — COMPLETE + committed (2026-06-15) / Phase 3 ԱՐՎԱԾ
**Committed `2191b563`** (main, no push; 18 files +7106/−1010). All guards met:
- **§9 formatters** — `lib/format.ts` one-place (locale-aware money/date via `localeTag()`; `number()`/`phone()`/
  `normalizePhone()` aligned to §5 search-norm); tested.
- **§8 i18n parity** — `i18n.ts` BUNDLED = 1327 IDENTICAL keys en/hy/ru (harvested real t() fallbacks); `BUNDLED`
  exported; `i18n-parity.test.ts` ENFORCES it. Per-view real translation = Phase-6.
- **One API client** — `api.ts` → every call via new `billing.bfetch` (single fetch + intercept401 → 401
  everywhere); login raw; opt-in `camelKeys` seam (never blanket) + test. **orgTree(token)** refactor-on-sight
  (backend made `/org-tree` auth-required → token-less orgTree 401-failed login; caught by render, fixed).
- **RATCHET gate** — `eslint.config.js` (flat, one-source) + `.prettierrc.json`; `.husky/pre-commit`→`npm run
  precommit`→lint-staged runs `node …/eslint.js --fix` + `node …/prettier.cjs --write` on STAGED only (the `node
  <binpath>` form fixed a Windows execa ENOENT); `.github/workflows/gate.yml` = typecheck+test GLOBAL + lint/
  format changed-only; `npm run gate`. **PROVEN both ways:** blocks a `no-debugger` commit (eslint error→reject,
  HEAD unchanged) AND passes clean commits (this one — lint-staged formatted touched files).
- **Verify:** tsc=0 · vitest 37/37 · dashboard render = NO regression. Vite killed (no orphan).
- **Lesson:** the render caught a real login-blocking regression (`/org-tree` now needs auth) tsc+vitest missed —
  the runtime/visual check is not optional. 12 npm-audit highs from new dev tooling (dev-only, noted).
**ROADMAP LEFT:** Ph4 (shell+nav+one-gx-Modal+human-refs §1/§6/§7) · Ph5 (global search §5) · Ph6 (page-by-page
tracer — first page proves the full toolkit in-situ). BUT Gev wants to **revisit "ML" first** — ask what he means
(AI lead-scorer `ai.py`? Ask-GAAhex assistant? broader ML feature?) + what he wants done. (Gev phrased it "tell me
what YOU want to do with those" → he wants Bro's proactive recommendation, not just a clarifying question.)

## Dev / verify workflow (durable — so it survives compaction) / Dev workflow
**Frontend dev server (Vite):** `cd frontend && ./node_modules/.bin/vite --port 5174 --host 127.0.0.1` (run
`run_in_background:true`). Frontend calls API at absolute `http://127.0.0.1:8099` (`config.ts`). A stray Vite may
also sit on 5173 — kill duplicates at the end via PowerShell `Get-NetTCPConnection -LocalPort 5173,5174 -State
Listen | %{ Stop-Process -Id $_.OwningProcess -Force }` (no orphan).
**GOTCHA (cost me 2 retries in Ph4):** `npm run dev` ignores the `--host` and binds **localhost:5173 (IPv6 ::1)** →
Playwright at `127.0.0.1:5173` gets `ERR_CONNECTION_REFUSED`. Use `http://localhost:5173` in that case, OR run the
prescribed `vite --port 5174 --host 127.0.0.1`. Also: auth token is **in-memory only** (no localStorage) — a full
`page.goto('/route')` LOGS OUT; navigate client-side via `history.pushState(...) + dispatchEvent(new PopStateEvent('popstate'))`.
**Backend:** dev API on **8099** (health 200). NOTE: `/org-tree` now REQUIRES auth (orgTree(token) fixed in Ph3).
**Render-verify (Playwright, the non-optional runtime check):** a node ESM script (was `…/Temp/gx-render2.mjs`,
recreate if gone) — `chromium.launch()` → `goto http://127.0.0.1:5174` → click `button:has-text("Sign in")`
(demo creds **pre-filled** `admin@demo.isp` / `admin123`) → `waitForFunction` body lost "Continue with SSO" →
wait ~4s for data → for `['dark','light']`: `page.evaluate(t => document.documentElement.setAttribute('data-theme',
t))` + screenshot to `…/Temp/gx-app-<t>.png` → then **Read** the PNG to view. Run with `node <script>` from
`frontend` (resolves playwright). Chromium already installed.
**Gate (Ph3 ratchet) commands:** `cd frontend` then — typecheck `./node_modules/.bin/tsc -p tsconfig.json
--noEmit` · tests `./node_modules/.bin/vitest run --config vitest.config.ts` · lint one file `node
node_modules/eslint/bin/eslint.js <file>` (the **`node <binpath>` form is required on Windows** — bare `eslint`
ENOENTs in Git-Bash via lint-staged's execa) · full `npm run gate` (typecheck+test+lint-changed). Pre-commit hook
auto-runs lint-staged on `git commit` (core.hooksPath=`.husky`, set by frontend `prepare` script); it formats
touched files (prettier --write) + blocks on eslint errors. tsc passing ≠ runtime OK — ALWAYS render-verify a
visual/flow change.
**HY:** Milestone committed `06f9ed28` (main, no push)։ Phase 2 Part A (state consolidation) ԱՐՎԱԾ՝ States.tsx =
one source, 2 dupes folded+deleted, `.state` unstyled-bug ուղղված, tsc=0։ Part B՝ 4 component, հետո verify+show։

## Ph4 — shell + nav + one gx-Modal + human-refs (§1/§6/§7) / Ph4
**COMMITS (main, NO push):** `409df894` Ph4 slices 1-4 (14 files; gate fixed 2 pre-existing eslint errors on the way — AccountsView rules-of-hooks early-returns moved below useMemos, ChannelsView ternary→if/else). `95c52e6d` admin-access bugfix. Still uncommitted: `backend/tests/test_ai.py` (approved cloud-provider tests, separate track — commit on Gev's word).
**ADMIN "no access" BUG — FIXED (`95c52e6d`):** Root cause = `GET /api/me/capabilities` (E21) returns NESTED `{role, can_configure, read_only, entities:{...}}`, but `fetchCapabilities` passed it raw to `can()` which reads TOP-LEVEL keys → pre-Ph2 allow-by-default masked it, Ph2 default-deny turned every check into deny. Also the entities map is built ONLY from EntityDef rows → first-class tables (invoice/service/subscription/account) absent → denied even when present. FIX in `fetchCapabilities` (data seam): admin (`can_configure===true`) → return FULL_ACCESS (`'*'` allow-all); else → flat `data.entities`. 404/err → FULL_ACCESS. Added `test/capabilities.test.ts`. Verified real-admin render (/services gated "New service" visible). **OPEN (related, NOT fixed — note for later):** a NON-admin is still default-denied on first-class entities absent from entity_def (invoice/service/subscription/account) — backend should add entity_def for them or include them in the caps endpoint; UI gating there is currently wrong for non-admins (backend 403 stays the real gate).
**Plan (Gev-approved 2026-06-15):** Slice 1 RecordDrawer→Overlay + §6 header · Slice 2 ConfigureDrawer(+StudioDrawer audit)→Overlay · Slice 3 §1 shell (ChannelsView + ModuleStubView → PageShell; Studio shell EXEMPT, record why) · Slice 4 §6 raw-id sweep (InstallationBoard shortId, Invoices/Helpdesk/Services/Subscriptions uuid fallbacks, modal subtitles) · Slice 5 §7 deep-link `useModalParam` hook + one-modal-at-a-time guard, both in the Overlay/one-source so Ph6 consumes. **Scope call (Gev-accepted):** URL-addressability = pattern + high-traffic now, long tail in Ph6. **Pause after each verify+show; no Ph5 jump.**
**Overlay/one-source facts:** `components/Overlay.tsx` = the single portal primitive (createPortal + `useFocusTrap` + Esc + click-outside via target===currentTarget + body scroll-lock). `components/Modal.tsx` builds on it (owns the ✕, sizes sm/md/lg/xl/fullscreen, `ModalFooterActions`, `confirmDialog`/`ConfirmHost`). `lib/useFocusTrap.ts` does Tab-trap + initial-focus + **focus-RETURN on unmount** + Esc. The drawers (`RecordDrawer`, `modals/ConfigureDrawer`, `primitives/StudioDrawer`) each hand-rolled their own portal/esc/scroll → consolidate onto Overlay.
**Slice 4 DONE (not committed):** §6 raw-id sweep (named high-traffic surfaces; long tail → Ph6 tracer, logged). **entityKey audit fix:** the 3 drawer consumers passed abbreviations — HelpdeskView `TKT`→`ticket`, ServicesView `SVC`→`service`, OrderDetailModal `ORD`→`order` (humanizeEntity now expands → "Ticket"/"Service"/"Order"). **RecordDrawer header REFINED:** `humanRef({id})` → `looksLikeRawId(id) ? humanRef({id}) : id` — because OrderDetailModal passes `order.number` (a human ref) as `id`; raw passes-as-#ref, human number shows as-is. Drawers now get the FULL id (not pre-sliced). **Raw-id → humanRef** across: HelpdeskView (customer col/queue/cust), ServicesView (name/cust×2/title), Invoices(View+Detail) (cust + Invoice-# fallbacks), SubscriptionsView (cust/invoice/cancel-confirm), AccountsView (subtitle), CustomerView (name+subtitle), InstallationBoardView (7 shortId sites → humanRef, `title=` tooltips kept; **deleted the now-dead `shortId` helper** §0.5). tsc=0, prettier clean. Render at Ph4 phase-end (string-display changes, no deletions needing per-slice verify-before-delete except shortId which tsc+usage-grep confirmed dead). **Long tail → Ph6** (customer-tabs/*, customer/TabComponents, CustomerTasksView, ra/OverviewTab, PaymentGateway, MessagesView, MyApprovals, collections/CasesTab, AccountsView holder-option fallbacks, EntityView billing labels). **Slice 5 DONE (not committed — held for Gev's show/approve):** §7 URL-addressable modals + one-modal guard, in the one-source. NEW `lib/useModalParam.ts` (drop-in for `useState<string|null>(null)`; binds modal open-state to a `?key=<id>` query param via `useSearchParams`, replace-mode, null drops it — deep-linkable, Back-closable, no navigate-away). `components/Overlay.tsx` — **one-modal guard = ref-counted body scroll-lock** (engage on first overlay, release on last; fixes stacked-overlay scroll bug). Wired 3 high-traffic detail modals: WorkItems `?item=`, MyTasks `?task=`, Services `?service=` (one-liner swaps). Long-tail adoption (Orders, Helpdesk-refactor-to-hook, etc.) → Ph6. tsc=0, vitest 40/40. **Render-verify 5/5** (open→URL gains ?item, scroll locks; close→param drops, scroll releases; deep-link ?item=<id> opens modal on mount). **Phase-end render** dark+light (Helpdesk drawer, WorkItems modal, Channels shell) clean — `frontend/_pe_*.png` (6, delete at Slice-5 commit).
**Ph4 STATUS: Slices 1–5 ALL DONE + verified. tsc=0 · vitest 40/40.** Committed: 1–4 (`409df894`) + admin fix (`95c52e6d`). UNCOMMITTED (held for show): Slice 5 = `lib/useModalParam.ts`, `components/Overlay.tsx`, `views/WorkItemsView.tsx`, `views/MyTasksView.tsx`, `views/ServicesView.tsx` + (separate) `backend/tests/test_ai.py`.
**§6 LONG-TAIL seen in phase-end render (→ Ph6):** WorkItemDetailModal shows raw "Customer ID" UUID (modal not in Slice 4 named set). Plus the earlier-logged tail (customer-tabs, ra, PaymentGateway, Messages, etc.).
**NEXT after Ph4 commit:** Ph5 (global search §5) or Ph6 (page-by-page tracer) per roadmap — await Gev.

## AI side-track — PAUSED + REVERTED (Gev 2026-06-15) / AI side-track ⏸
**Gev paused it; all Ollama wiring DISCARDED (nothing AI was committed; `.env` never touched — used process env vars).** Reverted: `ai.py` (removed `ollama` entry from `_OPENAI_COMPAT` + docstring line + restored `timeout=30`/`timeout=20`), `config.py` (removed `ai_timeout` field), `tests/test_ai.py` (removed the ollama test). Deleted temp `backend/_gx_agent_test.py`. Killed the 8098 test backend. Grep-confirmed ZERO dangling ollama/qwen/11434/ai_timeout refs. `AI_PROVIDER` ships `none` (unchanged). KEPT (separate, approved cloud-provider work): the mocked provider-path tests + stale-comment fix in test_ai.py + the DECISIONS.md provider-enablement lines. Backend AI tests **20/20**.
**What we LEARNED before pausing (for the revisit):** qwen2.5:14b via Ollama (OpenAI-compat `/v1`) — wiring WORKS (status live, fail-soft live-confirmed). The agent **DID fire a real tool-call from an Armenian command** end-to-end: AM "Ստեղծիր lead…" → `{kind:proposal, action:create_lead, args:{phone✓, source:Referral✓}}`. **Two real findings:** (1) SPEED — the 14B on this hardware (CPU) takes ~100s lean / 150–250s for the grounded prompt → the default 30s gateway timeout falls back to stub; needs a config-driven timeout (~300s) or faster HW/GPU/smaller model. (2) The 14B **missed the Armenian proper NAME** ("Unspecified Name" instead of "Արամ Տեստյան") while nailing phone+source — Armenian NER weakness; the prompt-JSON path may need native function-calling or a stronger model. When revisiting: faster inference + name-extraction are the two things to solve.

**Slice 3 DONE (not committed):** §1 shell. `views/messaging/ChannelsView.tsx` (was hand-rolled `.gx-page-pad`) → `<PageShell type="CONFIGURATION" ... primaryAction={{label:'Add channel',...}}>`. `App.tsx ModuleStubView` (was hand-rolled `.view-head`/`.crumbs`/box) → `<PageShell type="PLACEHOLDER" ...>` (renders coming-soon EmptyState natively). PageShell now imported in App.tsx. tsc=0; ChannelsView prettier'd; App.tsx already prettier-clean (no blanket reformat). **Render-verify 7/7 PASS** (both use `.ps`; Channels header title+primary; placeholder `data-page-type="placeholder"` + coming-soon; old `.gx-page-pad`/`.view-head` gone) + dark/light OK (`_verify_slice3_*`). **Studio-shell §1 EXEMPTION recorded** in DECISIONS.md (Studio = superadmin IDE-like config workspace, own tree+pane nav; confined to `studio/`). **§8 debt flagged:** ChannelsView is fully hardcoded (no `t()`) — shell migrated preserving strings; i18n pass belongs to Ph6 tracer (did NOT half-i18n it). Routes: ChannelsView `/channels`, stub `/module/:id?label=`.

**Slice 2 DONE (not committed):** `modals/ConfigureDrawer.tsx` → `<Overlay backdropClassName="gx-scrim right" className="gx-drawer" style={{width:'min(620px,100vw)',...}} bare>`; deleted its createPortal + hand-rolled backdrop + scroll-lock useEffect + `useFocusTrap` call (Overlay owns all). Width 620 overrides gx-drawer's 520 via `style`. Net visual delta: gains the shared `.gx-scrim` blur, drops its bespoke slide/fade animation (now matches the other kit drawers — flag to Gev; if wanted, add slide/fade to one-source `.gx-drawer`/`.gx-scrim` CSS, affects all overlays incl. Modal). tsc=0, prettier clean. **Render-verify 12/12 PASS** (ARIA, .gx-scrim.right+.gx-drawer, heading "Configure · Webhooks", 620px width holds, focus-trap, scroll-lock on/off, Esc-close, **focus-return to the button trigger**, backdrop-close) + dark/light OK. Temp PNGs `_verify_slice2_{dark,light}.png`.
**StudioDrawer AUDIT (Gev asked):** `primitives/StudioDrawer.tsx` is **ALREADY on Overlay** (the exemplar — `gx-scrim right`+`gx-drawer`+`.drawer-head`, width via style). NOT isolated → **no work, no exemption needed.** Net §0.3 result: all 4 overlay foundations (Modal, RecordDrawer, ConfigureDrawer, StudioDrawer) now sit on the ONE `Overlay` primitive. (Distinct from the Studio *SHELL* §1 exemption — that's Slice 3.)

**Slice 1 DONE (not committed — paused for Gev):** `components/RecordDrawer.tsx` now sits on `<Overlay backdropClassName="gx-scrim right" className="gx-drawer" bare>`; deleted its createPortal/useEffect(esc+scroll)/drawerRef; gained real focus-trap + focus-return it never had. §6: header `{entityKey}/{id}` (raw UUID) → `{humanizeEntity(entityKey)} · {humanRef({id})}`. Only consumer = HelpdeskView. tsc=0, prettier clean. **Render-verify 11/11 PASS** (ARIA dialog+aria-modal, .gx-scrim.right + .gx-drawer right-slide, header "Tkt · #019e9c" no-UUID, focus-trap, scroll-lock on/off, Esc-close, focus-return, backdrop-close) + dark+light screenshots OK. Temp PNGs `frontend/_verify_slice1_{dark,light}.png` (delete at phase-end). **Nit for Slice 4:** HelpdeskView passes entityKey `"Tkt"` → humanizeEntity can't expand → shows "Tkt"; pass `"ticket"`/`"helpdesk_ticket"` for "Ticket".
