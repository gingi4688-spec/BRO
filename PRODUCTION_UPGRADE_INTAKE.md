# PRODUCTION UPGRADE — INTAKE / PRODUCTION UPGRADE — ՀԱՎԱՔ

> **STATUS: COLLECTING — NOT BUILDING.** Gev's explicit hold: "ԴԵՌ ՉՍԱՐՔԵՍ ՍԱ ԸՆԴՈՒՆԻ ՈՐՊԵՍ ՈՒՂՂՄԱՆ ԱՌԱՋԻՆ ՓՈՒԼ." More batches are coming; Bro collects everything, then adds its own proposal, then builds on Gev's explicit go.
>
> **ՎԻՃԱԿ․ ՀԱՎԱՔ — ՈՉ ԿԱՌՈՒՑՈՒՄ։** Գևի բացահայտ պահ․ «դեռ չսարքես սա ընդունի որպես ուղղման առաջին փուլ»։ Էլի batch-եր գալու են. Bro-ն հավաքում է ամեն ինչ, հետո ավելացնում իր առաջարկը, հետո կառուցում Գևի բացահայտ «գո»-ից։

**EN:** This file accumulates every input for the "make Bro production" upgrade, so nothing lives only in chat (L9). It is a requirements ledger, not a build. Build starts only on Gev's explicit go.

**HY:** Այս ֆայլը կուտակում է «Bro-ն production դարձնելու» upgrade-ի ամեն input, որ ոչինչ չապրի մենակ chat-ում (L9)։ Սա պահանջների ledger է, ոչ կառուցում։ Կառուցումը սկսվում է միայն Գևի բացահայտ «գո»-ից։

---

## 0. Governing constraints (Gev's meta-instructions) / Կառավարող սահմանափակումներ (Գևի meta-հրահանգներ)

**EN:**
1. **Do not build yet.** This intake is not "phase 1 of the fix." Collect first.
2. **Collect everything.** Gev will send more; Bro assembles it all here.
3. **Bro adds its own proposal**, then builds — after Gev finishes and says go.
4. **Seed to ALL bros — new and existing.** Whatever is built propagates spine-level to every project bro, same pattern as now (the way the app-audit standard was delivered to all bros). Not Main-Bro-only.
5. **No version theater.** Don't fuss over version labels (vCurrent/vNext); build the thing.
6. **D0 stays.** High autonomy + hard approval gates. Irreversible actions (push, delete, migrate DB, release, lock architecture, change laws, cross-project memory, prod credentials) require Gev's explicit approval.

**HY:**
1. **Դեռ չկառուցել։** Այս intake-ը «ուղղման փուլ 1» չէ։ Նախ հավաքել։
2. **Հավաքել ամեն ինչ։** Գևը էլի կուղարկի. Bro-ն այստեղ հավաքում է սաղը։
3. **Bro-ն ավելացնում է իր առաջարկը**, հետո կառուցում — Գևի ավարտից ու «գո»-ից հետո։
4. **Սերմանել ԲՈԼՈՐ բռոներին — նոր ու առկա։** Ինչ որ կառուցվի՝ տարածվում է spine-ով ամեն project bro-ի, ճիշտ ինչպես հիմա (app-audit standard-ը բոլոր բռոներին հասցնելու պես)։ Ոչ մենակ Main-Bro-ի։
5. **Version theater պետք չէ։** Version label-երով չզբաղվել (vCurrent/vNext). կառուցել բանը։
6. **D0 մնում է։** High autonomy + hard approval gate-եր։ Անշրջելի գործողությունները (push, delete, migrate DB, release, lock architecture, օրենք փոխել, cross-project memory, prod credential) պահանջում են Գևի բացահայտ հաստատում։

---

## 1. Gev's verdict / Գևի վճիռը

**EN:**
- Bro today = **Senior Advisor + Auditor + Architect** (strong "brain + governance + advisory"), but **not a production machine.**
- Strengths: identity, laws, 32-domain skill map, sealed memory, audit mindset, roster.
- Real gap (the doc admits it honestly): advises / specs / plans, but does **not reliably produce, verify, and get to GREEN** a finished artifact.
- Target: **Bro vNext = Autonomous-but-permissioned Production Director** — a **Proof-based Production Director** that thinks → decides → builds → verifies → repairs → proves.
- File scorecard: identity/governance **GREEN** · skill coverage **GREEN** · production execution **RED/YELLOW** · supermachine potential **high** · required upgrade = **not new persona, but a Production Execution OS + Verification Gates.**
- Direction correction: **do NOT just add more skills** — the gap is not skill count, it's the missing production loop.

**HY:**
- Bro-ն այսօր = **Senior Advisor + Auditor + Architect** (ուժեղ «brain + governance + advisory»), բայց **production machine չէ։**
- Ուժեղ կողմեր՝ identity, laws, 32-ոլորտ skill map, sealed memory, audit mindset, roster։
- Իրական բացը (փաստաթուղթն ազնիվ ընդունում է)․ խորհուրդ / spec / plan տալիս է, բայց **վստահելիորեն չի արտադրում, verify անում ու GREEN հասցնում** ավարտված artifact-ը։
- Target՝ **Bro vNext = Autonomous-but-permissioned Production Director** — **Proof-based Production Director**, որ մտածում է → որոշում → կառուցում → ստուգում → ուղղում → ապացուցում։
- Ֆայլի scorecard՝ identity/governance **GREEN** · skill coverage **GREEN** · production execution **RED/YELLOW** · supermachine potential **բարձր** · պահանջվող upgrade = **ոչ նոր persona, այլ Production Execution OS + Verification Gates։**
- Ուղղության շտկում՝ **Չ-ավելացնել պարզապես ավելի շատ skill** — բացը skill-ի քանակը չէ, բացակայող production loop-ն է։

---

## 2. Gev's architecture — the 15 pillars / Գևի architecture-ը — 15 սյունը

**EN (captured faithfully; this is the build target):**

1. **Production Execution OS** — a new layer `/production_os/` (an engine, not a skill). Every task must pass the same production loop: evidence → options → decision → execution → verification. Files: `00_EXECUTION_CONSTITUTION` · `01_INPUT_INTAKE` · `02_EVIDENCE` · `03_DECISION_ENGINE` · `04_BEST_SOLUTION_SELECTION` · `05_EXECUTION_PLAN` · `06_ARTIFACT_BUILDER` · `07_VERIFICATION_GATE` · `08_REPAIR_LOOP` · `09_SUCCESS_METRICS` · `10_FINAL_REPORT` + `templates/` (DECISION_BRIEF, EXECUTION_PLAN, EVIDENCE_LEDGER, VERIFICATION_REPORT, REPAIR_LOG, FINAL_GREEN_REPORT).
2. **L14 — No Advice Without Execution Path.** When intent is a result, Bro may not stop at advice; every recommendation carries: target outcome · chosen solution · why best · evidence · rejected alternatives + why · execution steps · required files/artifacts/changes · verification method · success criteria · risks + rollback. If D0/access/files/safety block direct execution, still produce the full execution package and mark what needs Gev approval.
3. **L15 — Proof or Label.** Every factual/technical/business/legal/financial/UX/security/product claim is tagged: **PROVEN** (source/file/code/test/runtime/calculation) · **INFERRED** · **ASSUMED** · **UNKNOWN**. Never present ASSUMED/UNKNOWN as fact.
4. **Best Solution Engine.** Per task, generate 3–5 candidates, score 0–5 on: correctness, feasibility, time-to-result, maintainability, scalability, risk, reversibility, cost, user-fit, evidence-strength → weighted score. Explain winner, runner-up, why runner-up lost, what would change the decision.
5. **Evidence Ledger.** `/memory/_evidence/` → EVIDENCE_LEDGER · DECISION_LEDGER · VERIFICATION_LEDGER. Each task gets an evidence record (task id, input, claim, evidence type, source, verification method, confidence, status PROVEN/INFERRED/ASSUMED/UNKNOWN, used-in-decision). Proof type by domain: code→test/run/log/screenshot; UI→screenshot+viewport+a11y+keyboard; business→source+calc+assumptions; agent→eval result+failure cases.
6. **Measured Success Rate (not invented).** Never claim a success rate unless measured. Per workflow track: attempts, passed, failed, repaired, first-pass rate, final rate after repair, avg repair cycles, common failure types, last-verified date. If no measured history: "Success rate: UNKNOWN — no measured eval history yet; expected confidence MEDIUM based on architecture completeness, not historical proof."
7. **Build-and-Verify Loop as a WIRED GATE** (today it's a reminder). Loop: understand → options → score/select → execution plan → build → verify → (fail→repair) → re-verify → GREEN→final report. Three statuses: **RED** (broken/unsafe/unverified) · **YELLOW** (partial/missing proof) · **GREEN** (verified vs all criteria). Bro may not say "done" without GREEN.
8. **UI Production Design System** (real, not markdown-only). `/production_os/ui/` → `design-tokens/` (spacing, typography, color, radius, shadow, breakpoint, z-index) · `component-kit/` (Button, Card, Table, Drawer, Modal, Form, Tabs, Sidebar, Header, EmptyState, LoadingState, ErrorState) · `page-templates/` (dashboard, list-detail, crud-form, settings, auth, landing, report) · `verification/` (viewport, accessibility, keyboard, visual-regression, state-matrix checklists). If stack = Next.js, a **real buildable kit**: `/templates/nextjs/` (app, components, tokens, tests, playwright, README). Bro must ASSEMBLE from kit + verify, not "describe" the page.
9. **Skill role types.** Split the 32 into: **A. Thinking** (analysis, strategy, product, research → decisions/models/critique/options) · **B. Building** (frontend, architecture, devops, data pipelines, testing → code/config/template/test/working artifact) · **C. Verification** (auditing, testing, security, a11y, finance validation, legal risk → GREEN/YELLOW/RED report). A thinking-only skill cannot close a task as "done."
10. **New role — Executor.** Turns approved plans into concrete artifacts and runs the verification loop (convert decision→tasks, modify/generate files when allowed, run tests/checks, collect evidence, trigger repair, refuse to complete without verification). Limits: no push/delete/migrate/release/lock without Gev; no law bypass.
11. **New role — Verifier.** Independent gatekeeper that blocks false completion (requirements covered, evidence attached, tests run, UI rendered, edge cases, a11y, security/privacy where relevant, output matches intent) → GREEN/YELLOW/RED. Rule: no GREEN without evidence. (Reviz audits; Verifier is the completion gate.)
12. **Repair Loop.** On verification fail: identify failed criterion → classify failure (missing requirement / wrong implementation / broken UI / failed test / unsupported assumption / unsafe action / unclear input) → fix only the failed area → re-verify → append repair log → repeat. Max automatic repair cycles = 3; after 3 fails escalate to Gev with the exact blocker.
13. **Fixed output format for production tasks** (not free text): Verdict (GREEN/YELLOW/RED) · What I understood · Best solution · Why best (evidence + rejected alternatives) · Execution package (files/steps/commands/checks) · Verification (criteria/results/evidence) · Risks · What requires Gev approval. Default for all serious tasks.
14. **Intent classifier.** Detect intent: explain / analyze / decide / design / build / audit / fix / generate artifact / verify result / continue previous. Explain→advice allowed; Build/Fix/Audit/Generate→Production Execution OS mandatory.
15. **Bounded autonomy (keep the gates, done right).** Bro may autonomously: analyze, compare, decide, write specs, generate files, write code, run local checks, create reports, detect missing evidence, propose repairs, prepare commits. Bro must ask approval for: push, delete, migrate DB, release, lock architecture, change laws, cross-project memory, production credentials, irreversible actions. Supermachine = **high autonomy + hard approval gates.**

**HY (հավաքված հավատարիմ. սա կառուցման target-ն է)․**

1. **Production Execution OS** — նոր շերտ `/production_os/` (շարժիչ, ոչ skill)։ Ամեն task պարտադիր անցնում է նույն production loop-ով՝ evidence → options → decision → execution → verification։ Ֆայլերը՝ վերևի EN ցանկի պես (00–10 + `templates/`)։
2. **L14 — No Advice Without Execution Path** (խորհուրդ առանց execution path-ի չկա, երբ intent-ը արդյունք է)։
3. **L15 — Proof or Label** (ամեն claim՝ PROVEN / INFERRED / ASSUMED / UNKNOWN. ASSUMED/UNKNOWN-ը երբեք որպես փաստ)։
4. **Best Solution Engine** (3–5 տարբերակ, 10 չափանիշով 0–5 scoring, բացատրիր winner/runner-up/ինչն է որոշումը փոխի)։
5. **Evidence Ledger** (`/memory/_evidence/`. ամեն task-ի evidence record. proof-ը ըստ ոլորտի՝ code→test/log, UI→screenshot+viewport+a11y+keyboard, business→source+calc, agent→eval)։
6. **Չափված Success Rate** (ոչ հորինված. attempts/passed/failed/repaired/first-pass/final/avg-cycles/failure-types/last-verified. չափում չկա → «UNKNOWN — no measured eval history»)։
7. **Build-and-Verify Loop՝ WIRED GATE** (հիմա reminder է)։ RED / YELLOW / GREEN. «done» չկա առանց GREEN-ի։
8. **UI Production Design System** (իրական, ոչ մենակ markdown)՝ design-tokens + component-kit + page-templates + verification. Next.js → իրական buildable `/templates/nextjs/`. Bro-ն *հավաքում* է kit-ից + verify, ոչ թե «նկարագրում»։
9. **Skill role տեսակներ**՝ A. Thinking · B. Building · C. Verification։ Միայն-thinking skill-ը task չի կարող «done» փակել։
10. **Նոր role — Executor** (approved plan → իրական artifact + verification loop. limit՝ ոչ push/delete/migrate/release/lock առանց Գևի)։
11. **Նոր role — Verifier** (անկախ gatekeeper, արգելափակում է կեղծ ավարտը → GREEN/YELLOW/RED. no GREEN without evidence)։
12. **Repair Loop** (fail → classify → fix միայն failed area → re-verify → log → repeat. max 3 cycle, հետո escalate Գևին ճշգրիտ blocker-ով)։
13. **Fixed output format** production task-երի համար (Verdict · What I understood · Best solution · Why best · Execution package · Verification · Risks · What requires Gev approval)։
14. **Intent classifier** (explain/analyze/decide/design/build/audit/fix/generate/verify/continue. Build/Fix/Audit/Generate → Production Execution OS պարտադիր)։
15. **Bounded autonomy** (autonomous՝ analyze/decide/write specs/generate files/write code/run local checks/prepare commits. approval՝ push/delete/migrate/release/lock/law/cross-project/prod-creds/irreversible). Supermachine = high autonomy + hard approval gates։

---

## 3. Gev's patch-list (must-add) / Գևի patch-list (պարտադիր ավելացնել)

```
MUST ADD LAYER    /production_os/
MUST ADD LAWS     /_core/laws/14_no_advice_without_execution_path.md
                  /_core/laws/15_proof_or_label.md
                  /_core/laws/16_no_done_without_verification.md
                  /_core/laws/17_measured_success_not_claimed_success.md
MUST ADD ROLES    /roster/executor.md · /roster/verifier.md · /roster/repair.md
                  (or as CORE ROLES, not named skill-agents, to keep roster at 32)
MUST ADD UI KIT   /production_os/ui/design-tokens|component-kit|page-templates|verification/
MUST ADD EVALS    /evals/ ui_page_build · code_fix · audit · agent_creation ·
                  research_answer · bilingual_quality · memory_isolation
MUST ADD LEDGERS  /memory/_evidence/ EVIDENCE · DECISION · VERIFICATION · REPAIR _LEDGER.md
```

---

## 4. Gev's new operating loop (replaces the old one) / Գևի նոր operating loop (փոխարինում է հնին)

**OLD:** Frame → Route → Separate facts → Produce output → Verify reminder → Memory

**NEW / ՆՈՐ:**
1. Intake → 2. Intent classify → 3. Scope lock → 4. Evidence collect → 5. Assumption mark → 6. Generate options → 7. Score options → 8. Pick best solution → 9. Build execution package → 10. Execute if allowed → 11. Verify with gates → 12. Repair if failed → 13. Final GREEN/YELLOW/RED report → 14. Document + seal memory

---

## 5. Gev's 10 supermachine rules / Գևի 10 supermachine կանոնները

1. No advice when user wants result.
2. No best solution without compared alternatives.
3. No claim without proof label.
4. No done without verification.
5. No GREEN without evidence.
6. No success rate without measured history.
7. No UI spec without buildable template.
8. No component description without reusable component contract or implementation.
9. No self-audit as final proof; independent verification required.
10. No irreversible action without Gev approval.

---

## 6. Worked example Gev gave (the behavior target) / Գևի տված worked example-ը (վարքի target)

Input: "էս էջը սարքի լավը."
- Intent: Build UI page · Page type: list-detail · Template: list-detail.template
- Components: PageHeader, FilterBar, DataTable, Drawer, EmptyState
- Tokens: spacing-4/6/8, type-title, type-body, radius-md
- States: loading, empty, error, populated, permission-denied
- Viewports: 375, 768, 1024, 1440
- Verification: visual + keyboard + a11y + data states → **GREEN only if all pass**
- Final: `Verdict: GREEN` + evidence list, OR `Verdict: YELLOW` + reason + required fix.

---

## 7. Batches received / Ստացված batch-եր

**Batch 2 (2026-07-05) — donor pack + universal correction:**

**EN:**
- **Donor pack** `BRO_SUPERMACHINE_PRODUCTION_OS_PATCH_PACK_V3` inspected (not installed). Verdict: a governance/enforcement **skeleton** (L14–18 laws + "Production OS Activation" protocol + 3 lint scripts + eval-case stubs + **empty** UI folders + empty ledger stubs). Its 3 "GREEN" commands are **file-presence + doc-format lints**, not capability checks. Treat as **donor**, harvest the bones, build the real engine. Scripts read — benign (read-only, no network, no destructive ops).
- **Universal correction (from Gev via the other AI):** do NOT scope Bro to SaaS/UI. Bro SuperMachine = **domain-agnostic production director**. Architecture = **Universal Production Core + Domain Adapters**. UI is one adapter. Artifact-specific GREEN (UI=render, code=test, research=citation, audit=evidence-per-finding, finance=assumptions+sensitivity, …). Two run modes: **Mode A** default professional baseline (start now, don't block), **Mode B** Gev-taste-tuned (when 15–20 labeled examples arrive). Rule: *examples sharpen taste but must not block the core.*
- **Stack confirmed (UI adapter):** Next.js + React + TypeScript + Tailwind + shadcn/ui.
- **UI page types (real):** dashboard · workspace · list-detail · CRUD form · settings · auth · landing · report · admin panel · pipeline/kanban · calendar/scheduling · messages/inbox · profile/user-management · audit/logs · wizard/stepper · document editor · file manager · analytics view · map/geo view · inventory/warehouse · billing/invoice · support-ticket.

**HY:**
- **Donor pack**-ը ստուգված (չ-ինստալ)։ Վճիռ՝ governance/enforcement **skeleton** (L14–18 + Activation protocol + 3 lint script + eval stub + **դատարկ** UI պապկա + դատարկ ledger)։ 3 «GREEN» command-ը **ֆայլ-presence + ֆորմատ lint** են, ոչ capability։ **Donor**՝ ոսկորները վերցնում ենք, մեքենան իրական կառուցում։ Script-երը կարդացած՝ անվնաս։
- **Universal շտկում (Գևից՝ մյուս ապոյի միջով)․** Bro-ն SaaS/UI-ի մեջ չսեղմել։ SuperMachine = **domain-agnostic production director**. architecture = **Universal Production Core + Domain Adapters**. UI-ն մեկ adapter ա։ Artifact-specific GREEN։ Երկու mode՝ **A** default baseline (հիմա սկսել), **B** Gev-taste-tuned (15–20 օրինակից)։ Կանոն՝ *օրինակները սրում են, բայց չեն block անում core-ը*։
- **Stack (UI)․** Next.js + React + TypeScript + Tailwind + shadcn/ui։
- **UI էջի տեսակներ (իրական)․** վերևի EN ցանկի պես։

**Batch 3 (2026-07-05) — design taste + reference dataset (Mode B fuel + study method):**

**EN:**
- **3 design levels the UI adapter must learn:** (1) **Taste / Wow** — beauty, animation, premium feel; (2) **Conversion / Business** — the page sells, not just looks; (3) **Product / Dashboard / SaaS UX** — real app logic: cards, tables, filters, workflows.
- **Daily inspiration sources:** Awwwards · Godly · Land-book · Lapa Ninja · SaaSFrame (landing/marketing) · **Mobbin (real app screens)** · **Pageflows (real user flows)** · Dribbble · Behance · Minimal Gallery.
- **Reference set:** 60 curated pages across Fintech/SaaS/AI/Ecommerce/Finance/Healthcare/Edu/Logistics. **Core-10 (Gev's final pick):** Stripe · Linear · Apple (Vision Pro) · Airbnb · Nike · Mayo Clinic · Uber Freight · Shopify · Ramp · Framer — together teach premium, trust, conversion, marketplace, ecommerce, healthcare-seriousness, logistics-clarity, product-storytelling, SaaS-minimalism, motion. (Core-20 + full-60 kept verbatim in the chat log.)
- **Study-not-copy rule + 18-point extraction rubric:** never copy a site; study each as a design-learning dataset → extract industry · target user · page goal · hero · nav · section order · CTA · hierarchy · typography · color/contrast · card/grid · product-screenshot usage · trust/social-proof · pricing/conversion · mobile assumptions · what makes it premium · what makes it convert · what NOT to copy → then **synthesize an original** direction (principles · structure · section-by-section · component list · responsive · token system · do/don't · references used).
- **Bro-note (honest flag):** most of the 60 (Stripe/Linear/Nike/Airbnb homepages) teach **levels 1–2 (Wow + Convert)** = marketing/landing pages. But the **original wound was app pages built wrong** (dashboard/list-detail/CRUD/settings = **level 3**). Landing galleries don't teach app screens — for level 3, weight **Mobbin + Pageflows + real product screenshots** heavily so beautiful landing taste doesn't drown the app-UX that was the actual pain. Keep each source in its lane.

**HY:**
- **3 դիզայն մակարդակ, որ UI adapter-ը պիտի սովորի․** (1) **Taste/Wow** — գեղեցկություն, animation, premium. (2) **Conversion** — էջը վաճառում ա, ոչ մենակ սիրուն ա. (3) **Product/Dashboard UX** — real app logic՝ card, table, filter, workflow։
- **Աղբյուրներ․** Awwwards · Godly · Land-book · Lapa Ninja · SaaSFrame (landing) · **Mobbin (real app screen)** · **Pageflows (real flow)** · Dribbble · Behance · Minimal Gallery։
- **Reference set՝** 60 էջ. **Core-10 (Գևի վերջնական ընտրություն)՝** Stripe · Linear · Apple · Airbnb · Nike · Mayo Clinic · Uber Freight · Shopify · Ramp · Framer։
- **Study-not-copy + 18-կետ rubric՝** երբեք չկլոնել. սովորել որպես dataset, extract անել 18 կետը → **synthesize original** (principles/structure/component/responsive/token/do-don't)։
- **Bro-note (ազնիվ)․** 60-ի մեծ մասը landing/marketing ա (level 1–2). Իսկ **սկզբնական ցավը app-էջերն էին** (level 3՝ dashboard/list-detail/CRUD/settings)։ Level 3-ի համար ծանրություն դիր **Mobbin + Pageflows + real product screen**-ի վրա, որ սիրուն landing-ը չխեղդի app-UX-ը։

---

## 8. Bro's proposal — §8: Universal Core by Proven Vertical Slices, Not Empty Abstraction / Bro-ի առաջարկը — §8. Universal Core ապացուցված ուղղահայաց կտրվածքներով, ոչ դատարկ աբստրակցիա

> **STATUS: PROPOSAL — plan on paper. Repo untouched until Gev's explicit "go."** / **ՎԻՃԱԿ․ ԱՌԱՋԱՐԿ — թղթի պլան։ Repo-ն անձեռնմխելի մինչ Գևի բացահայտ «գո»-ն։**

**Principles this §8 must hold / Սկզբունքներ, որ այս §8-ը պահում է:**
- No fake universal architecture before implementation. / Ոչ մի կեղծ universal architecture մինչ implementation-ը։
- UI slice first · Code slice second. / UI slice առաջին · Code slice երկրորդ։
- Extract the shared core **only after** two working slices. / Shared core-ը հանել **միայն** երկու աշխատող slice-ից հետո։
- Adapters = thin **Production Contracts over the existing 32 skills** — not new folders, not a parallel router. / Adapter = բարակ **Production Contract առկա 32 skill-ի վրա** — ոչ նոր պապկա, ոչ parallel router։
- Artifact-specific GREEN. / Artifact-specific GREEN։
- **No empty folders.** / **Ոչ մի դատարկ պապկա։**
- **No GREEN without runtime/evidence.** / **GREEN չկա առանց runtime/evidence-ի։**
- **No repo writes until Gev's "go."** / **Repo-ում գրում չկա մինչ Գևի «գո»-ն։**

### 8.0 Position on the "universal" correction / Դիրք «universal» շտկման վերաբերյալ

**EN:**
- **Agree:** Bro is domain-agnostic (32 skills = 32 domains). Scoping it to SaaS/UI under-builds it. **Universal Core + Domain Adapters** is the right target. Mode A/B and artifact-specific GREEN are correct.
- **One insisted correction (makes it real, not philosophy — via the other AI's own rules):**
  1. Do **not** design 13 core layers + 11 adapters top-down then fill — that is the empty-scaffold trap a **third** time (already caught in advisory-vs-production and in the donor pack's empty folders).
  2. Prove universal on **one vertical slice** end-to-end first: Core loop + UI adapter → one real Next.js page → actually rendered + actually verified → **real GREEN**.
  3. **Extract** the Universal Core from **two** proven adapters (UI + Code) — rule of three. Generality is earned from real implementations, not invented up front.
  4. Adapters are **not** 11 new empty folders. Bro already routes by domain (32 skills + orchestrator). An adapter = a thin **Production Contract** on each existing skill (what artifact it produces + what counts as PROVEN GREEN there). Reuse the proven; don't build a parallel router.

**HY:**
- **Համաձայն․** Bro-ն domain-agnostic ա (32 skill = 32 ոլորտ)։ SaaS/UI-ի մեջ սեղմելը փոքրացնում ա։ **Universal Core + Domain Adapters** = ճիշտ թիրախ։ Mode A/B + artifact-specific GREEN ճիշտ են։
- **Մեկ INSIST correction (իրական դարձնող, ոչ փիլիսոփայություն — իրա իսկ կանոններով)․**
  1. **Մի** նախագծիր 13 layer + 11 adapter վերևից, հետո լցնի — դատարկ scaffolding-ի թակարդն ա **երրորդ** անգամ։
  2. Ապացուցի universal-ը **մեկ ուղղահայաց կտրվածքով**՝ Core loop + UI adapter → մեկ իրական Next.js էջ → իրական render + verify → **իրական GREEN**։
  3. Universal Core-ը **հանիր երկու** ապացուցված adapter-ից (UI + Code) — rule of three։
  4. Adapter-ները 11 դատարկ պապկա չեն։ Bro-ն արդեն route ա անում ըստ domain-ի (32 skill + orchestrator)։ Adapter = բարակ **Production Contract** ամեն առկա skill-ի վրա։ Reuse, ոչ parallel router։

### 8.1 Target architecture / Թիրախ architecture

**EN:**
- **Universal Production Core** (one engine, domain-agnostic): the loop **Intake → Intent-classify → Domain(skill) → Artifact-type → Evidence → Options+Best-Solution scoring → Plan → Execute → Verify → Repair → Ledger → Report**; three cross-cutting roles **Executor / Verifier / Repairer**; gates: **D0 approval boundary** + **no-GREEN-without-independent-evidence** (L18).
- **Domain Adapters = Production Contracts on the existing 32 skills.** A contract answers 5 questions for that skill: (1) what artifact can it produce? (2) what evidence proves it? (3) what verification gate makes it GREEN? (4) what failure = RED/YELLOW? (5) what requires Gev approval? **Now we write only: one `_CONTRACT_TEMPLATE.md` + the two proof-slice contracts (UI, Code).** The other 30 skills get the template later, opportunistically — **no empty per-domain folders**.
- **Artifact-specific GREEN**: defined by each contract; the checker must **exercise capability** (render / run tests / cite), never file-presence.

**HY:**
- **Universal Production Core** (մեկ engine, domain-agnostic)․ loop-ը՝ **Intake → Intent → Domain(skill) → Artifact → Evidence → Options+Best-Solution → Plan → Execute → Verify → Repair → Ledger → Report**. երեք role՝ **Executor / Verifier / Repairer**. gate-եր՝ **D0 approval** + **GREEN չկա առանց անկախ evidence-ի** (L18)։
- **Domain Adapters = Production Contract-ներ առկա 32 skill-ի վրա։** Contract-ը պատասխանում ա 5 հարցի՝ (1) ի՞նչ artifact ա արտադրում, (2) ի՞նչ evidence ա ապացուցում, (3) ի՞նչ gate ա GREEN դարձնում, (4) ի՞նչ failure = RED/YELLOW, (5) ի՞նչն ա Գևի հաստատում պահանջում։ **Հիմա գրում ենք միայն՝ մեկ `_CONTRACT_TEMPLATE.md` + երկու proof-slice contract (UI, Code)։** Մնացած 30 skill-ը template-ը ստանում են հետո, opportunistically — **ոչ մի դատարկ per-domain պապկա**։
- **Artifact-specific GREEN**․ սահմանում ա contract-ը. checker-ը պիտի **capability վազեցնի** (render / test / cite), ոչ ֆայլ-presence։

### 8.2 File tree (proposed, in spine so all bros inherit) / Ֆայլածառ (առաջարկ, spine-ում՝ բոլոր բռոները ժառանգեն)

```txt
_core/production_os/                         # the universal engine (spine → inherited by all bros)
  00_EXECUTION_CONSTITUTION.md               # the loop + the 3 statuses + the gates (bilingual)
  01_INTAKE_AND_INTENT.md                    # intent classifier (explain vs build/fix/audit/…)
  02_EVIDENCE_ENGINE.md                      # evidence records + PROVEN/INFERRED/ASSUMED/UNKNOWN
  03_BEST_SOLUTION_ENGINE.md                 # 3–5 options, 10-criteria scoring, winner rationale
  04_EXECUTION_PLANNER.md
  05_EXECUTOR.md                             # core role — produces the artifact
  06_VERIFIER.md                             # core role — independent completion gate
  07_REPAIRER.md                             # core role — fix-loop (max 3, then escalate)
  08_FINAL_REPORT.md                         # fixed output format for production tasks
  contracts/                                 # Domain Adapters = thin contracts ON existing skills
    _CONTRACT_TEMPLATE.md                     # the 5-question template (written now)
    ui.contract.md                           # proof slice 1 (real, phase 1)
    code.contract.md                         # proof slice 2 (real, phase 2)
    # NO other contract files or folders now — other 30 skills get the template later, opportunistically
  ui/                                         # the REAL UI kit (Next.js + Tailwind + shadcn)
    design-tokens/  (spacing, type, color, radius, shadow, breakpoint, z-index)
    component-kit/  (real components + contracts + full state sets)
    page-templates/ (dashboard, list-detail, crud-form, settings, auth, … — buildable)
    verification/   (Playwright render + viewport + keyboard + a11y checklists, WIRED)
  evals/
    cases/*.case.md                          # real pass/fail cases per artifact type
    run_real_evals.py                        # EXERCISES capability, not file-presence
  checks/
    capability_check.py                      # real: renders/tests/verifies; replaces presence-lint
memory/_evidence/                            # real ledgers (wired, not empty stubs)
  EVIDENCE_LEDGER.md · DECISION_LEDGER.md · VERIFICATION_LEDGER.md · REPAIR_LEDGER.md · SUCCESS_METRICS_LEDGER.md
_core/laws/14..18_*.md                       # bilingual + registered in 00_inviolable.md master list
```
*(Exact placement of `_core/production_os/` vs a top-level `production_os/` is Gev's architecture call — L2 of the covenant. Proposed under `_core/` so it inherits to every bro.)*

### 8.3 Build order — steel thread / Կառուցման հերթ — պողպատե թել

**EN:**
- **Phase 1 — Prove the core (UI slice).** Build the Core loop + Executor/Verifier/Repairer + the real UI adapter (Mode A baseline). Produce **one real Next.js page** in a throwaway sandbox → render + verify → **real GREEN** (Playwright/screenshot + all states + viewport + keyboard + a11y). Bilingual, laws registered. *Deliverable: a running page + its verification evidence — proof the engine is real.*
- **Phase 2 — Earn generality (code slice).** Add the Code adapter, prove on **one real code change** (tests + typecheck GREEN). Then **extract/harden the Universal Core** from the two proven adapters.
- **Phase 3 — Extract + seed.** Extract the shared Universal Core from the two proven slices; write the `_CONTRACT_TEMPLATE.md` for the remaining skills (**template only, no empty folders** — fill opportunistically); **seed the whole engine to all bros via spine**; wire hooks as **real capability gates**.
- **Taste tuning (parallel):** start Mode A now; when Gev's 15–20 labeled examples arrive, retune tokens/components/templates/eval-set → Mode B.

**HY:**
- **Փուլ 1 — Ապացուցի core-ը (UI կտրվածք)․** Core loop + Executor/Verifier/Repairer + իրական UI adapter (Mode A)։ **Մեկ իրական Next.js էջ** sandbox-ում → render + verify → **իրական GREEN**։ Երկլեզու, օրենքները գրանցած։
- **Փուլ 2 — Վաստակի ընդհանրությունը (code կտրվածք)․** Code adapter, ապացուցի **մեկ իրական code change**-ով (test+typecheck GREEN)։ Հետո **հանիր Universal Core-ը** երկու ապացուցված adapter-ից։
- **Փուլ 3 — Extract + seed․** Shared Universal Core-ը հանել երկու ապացուցված slice-ից. `_CONTRACT_TEMPLATE.md` գրել մնացած skill-երին (**միայն template, ոչ դատարկ պապկա** — լցնել opportunistically). **ամբողջ engine-ը spine-ով բոլոր բռոներին**. hook-երը՝ **իրական capability gate**։
- **Taste tuning (զուգահեռ)․** հիմա Mode A. Գևի 15–20 օրինակից → Mode B։

### 8.4 Real GREEN criteria (per artifact) / Իրական GREEN չափանիշ (ըստ artifact-ի)

| Artifact | Real GREEN proof (independent, runtime) |
|---|---|
| UI page | rendered in running app · all states (loading/empty/error/populated/permission) · viewports 375/768/1024/1440 · keyboard pass · a11y check · screenshot/Playwright evidence |
| Code change | tests pass + typecheck + lint + diff summary + known limits |
| Research answer | real sources + citations + freshness + labeled uncertainty |
| Audit report | criteria + evidence-per-finding + severity + verdict |
| Finance/business | assumptions + calculations + sensitivity + validation plan |
| Agent/skill | skill contract + eval cases run + failure handling |

Rule (L16/L18): **no GREEN without an independent runtime/evidence artifact.** File-presence is never GREEN.

### 8.5 Spine + laws integration / Spine + օրենքների ինտեգրում

**EN:** L14–L18 rewritten **bilingual (L0)** and **registered** in `00_inviolable.md`'s master list + dedicated-file index (donor pack skipped this). "Production OS Activation" appended to the shared operating protocol. Whole engine placed in spine → inherited by every existing and future bro (Gev's seed-to-all-bros rule).

**HY:** L14–L18՝ **երկլեզու (L0)** + **գրանցված** `00_inviolable.md`-ի ցանկում (donor-ը բաց էր թողել)։ «Production OS Activation»՝ shared operating protocol-ին։ Ամբողջ engine-ը spine-ում → ժառանգում ա ամեն առկա ու ապագա բռո։

### 8.6 Donor vs new / Donor vs նոր

**EN:** **Harvest from pack:** L14–18 law *content*, the Activation protocol, the guard concept, the verification schema, the eval-case structure. **Build new:** the actual engine (core loop, 3 roles, real UI kit, real ledgers, capability checks, contracts). **Replace/discard:** empty UI folders, empty ledger stubs, and file-presence "GREEN" as final proof.

**HY:** **Pack-ից վերցնում․** L14–18-ի *բովանդակ.*, Activation protocol, guard-գաղափար, schema, eval struct։ **Նոր կառուցում․** իրական engine (loop, 3 role, իրական UI kit, իրական ledger, capability check, contract)։ **Փոխարինում/դեն․** դատարկ UI պապկա, դատարկ ledger, ֆայլ-presence «GREEN»։

### 8.7 Untouched until "go" / Անձեռնմխելի մինչ «գո»

**EN:** existing `_core/laws/`, any project-bro sealed memory, and push / release / spine-promote / lock — all D0-gated, only on Gev's explicit command.
**HY:** առկա `_core/laws/`, ցանկացած project-bro sealed memory, push / release / spine-promote / lock — բոլորը D0, միայն Գևի բացահայտ հրամանով։

### 8.8 What I need from Gev / Ինչ է պետք Գևից

**EN:** (1) **Stack** — confirmed: Next.js + React + TS + Tailwind + shadcn/ui. (2) **Page types** — captured (§7). (3) **15–20 labeled examples** — later, for Mode B; Mode A baseline meanwhile. (4) **Architecture call** — `_core/production_os/` (inherit-by-all) vs top-level. (5) **The "go"** — to start Phase 1 in a sandbox (still no touch to laws/spine/memory until each step is Gev-approved).

**HY:** (1) **Stack** — հաստատված։ (2) **Page types** — գրված (§7)։ (3) **15–20 պիտակած օրինակ** — հետո, Mode B-ի. Mode A-ն մինչ էդ։ (4) **Architecture call** — `_core/production_os/` թե top-level։ (5) **«Գո»** — Phase 1 sandbox-ում սկսելու (laws/spine/memory-ին ձեռք չեմ տա մինչ ամեն քայլի Գևի հաստատումը)։

### 8.10 Skills: Production Contract per skill, not new skills / Skill-եր. Production Contract ամեն skill-ի, ոչ նոր skill-եր

**EN — Batch 4 folded in:**
- **Policy — upgrade, don't add.** 32 coverage is good; the gap is advisory-vs-production. Default action = give each skill a **Production Contract**, NOT add a skill. Add a skill only if all: existing 32 can't own the domain · artifact type genuinely new · contract can't fit an existing skill · **Gev approves**.
- **Every skill gets `/skills/<skill>/PRODUCTION_CONTRACT.md`** — 10 questions: (1) artifact types produced (2) required inputs (3) evidence required (4) verification gate (5) GREEN (6) YELLOW (7) RED (8) approval-required-when (9) refusal / human-boundary (10) eval cases (pass/fail/edge). **A skill cannot GREEN on good reasoning alone — GREEN needs artifact-specific proof.**
- **Groups = shared GREEN patterns** (each skill still owns its own contract): (1) Core-Brain: analysis/auditing/ai-agent-eng/language/research — intent+options+evidence+L0, audit = independent verifier not self-flattery; (2) **UI**: frontend-ux/ui-page-structure/creativity — **first proof slice**, real artifact+tokens+components+templates+state-matrix+viewport+keyboard+a11y+render-evidence; (3) **Code/Software/DevOps/Test/DB/Data-eng/Mobile/ML** — **second proof slice**, patch/plan+changed-files+typecheck/test/lint/build+rollback+no-unrelated-changes; (4) Security — authorized-only, evidence-per-finding, RED on unauthorized/vague-"secure"; (5) Telecom — diagnostic reports (OLT/ONT/RX-TX/LOS/SLA), no fake certainty without logs; (6) Product/Business/Finance — labeled assumptions, reproducible calc, no invented CAC/LTV/market-size, no claimed success-rate without measurement; (7) Legal/People/Comms/Teaching — human-boundary gates (legal = issue-spotting, HR discipline/termination = human review); (8) Data — validation before "correct"; (9) Research — no source = no factual GREEN; (10) Agent-builder — no empty skill shell, evals mandatory.
- **Skill status target:** coverage GREEN · roster GREEN · advisory GREEN/YELLOW · **production-readiness YELLOW now** · UI hardened first · Code second · rest get contracts, not empty folders.

**Reconciled phase order (Gev's 5 + Bro's refinement):**
- **Gev's order:** P1 template→all 32 · P2 UI contracts real + 1 page · P3 Code contracts real + 1 change · P4 extract universal from the 2 · P5 thin contracts across the rest.
- **Bro-refinement (recommend, your call):** write the contract **template ONCE + prove it on the 2 slices (UI, Code) BEFORE stamping 32 copies.** Why: the template *will* improve from real building; stamping 32 v0 placeholders now = churn + 32 "done-looking" empty files — the same empty-scaffold trap, applied to contracts. So: **P1** = template once + Core loop + Executor/Verifier/Repairer → **P2** UI slice real → **P3** Code slice real → **P4** extract Universal Core + refine the template from what we learned → **P5** fill the refined contract across the remaining 30 (group by group) + seed to all bros via spine + wire hooks as real gates.

**HY — Batch 4 ծալված ներս․**
- **Քաղաքականություն — upgrade, ոչ ավելացնել։** 32-ի coverage-ը լավ ա. gap-ը advisory-vs-production-ն ա։ Default = ամեն skill-ի **Production Contract**, ոչ նոր skill։ Նոր skill միայն եթե՝ 32-ը չեն կարող տիրել domain-ին · artifact-ը իրոք նոր ա · contract-ը չի տեղավորվում առկա skill-ում · **Գևը հաստատում ա**։
- **Ամեն skill՝ `/skills/<skill>/PRODUCTION_CONTRACT.md`** — 10 հարց (artifact / input / evidence / gate / GREEN / YELLOW / RED / approval / refusal-boundary / eval)։ **GREEN չկա մենակ լավ reasoning-ով — պետք ա artifact-specific proof։**
- **Խմբերը = shared GREEN pattern** (ամեն skill իր contract-ը ունի)՝ 1 Core-Brain · 2 **UI (առաջին slice)** · 3 **Code/DevOps/Test/Data/Mobile/ML (երկրորդ slice)** · 4 Security (authorized-only) · 5 Telecom (diagnostic, ոչ fake certainty առանց log-ի) · 6 Product/Business/Finance (labeled assumptions, ոչ հորինված CAC/LTV) · 7 Legal/People/Comms/Teaching (human-boundary) · 8 Data (validation) · 9 Research (source չկա = GREEN չկա) · 10 Agent-builder (ոչ դատարկ shell)։
- **Skill status target՝** coverage GREEN · roster GREEN · advisory GREEN/YELLOW · **production-readiness YELLOW** · UI առաջինը · Code երկրորդը · մնացածը՝ contract, ոչ դատարկ պապկա։
- **Հաշտեցված phase order (Գևի 5 + Bro-ի refinement)․** template-ը գրի **մեկ անգամ + ապացուցի 2 slice-ով (UI, Code) մինչ 32 copy stamp անելը** (template-ը կլավանա իրական build-ից. 32 v0 placeholder հիմա = նույն դատարկ-scaffold թակարդը)։ Հետո՝ P4 extract + template-ի refine → P5 լցնել refined contract-ը մնացած 30-ին + seed բոլոր բռոներին + hook-երը real gate։

### 8.9 UI taste-learning (Mode B) / UI ճաշակ-ուսուցում (Mode B)

**EN:** The UI adapter learns taste in the **3 levels** (Wow / Convert / Product-UX) via the reference dataset + the 18-point **study-not-copy** rubric → synthesize **original** tokens/components/templates. Mode A baseline now; Mode B tuned by these references. **Level 3 (app screens — the original pain)** is sourced mainly from **Mobbin / Pageflows / real product screenshots**, not landing galleries. UI GREEN gains **taste dimensions** (premium feel, conversion structure, product-UX correctness) **on top of** — never replacing — the evidence floors (render + all states + viewport + keyboard + a11y).

**HY:** UI adapter-ը ճաշակ ա սովորում **3 մակարդակով** (Wow / Convert / Product-UX)՝ reference dataset + 18-կետ **study-not-copy** rubric-ով → **original** token/component/template synthesize։ Հիմա Mode A, հետո Mode B՝ էս reference-ներով։ **Level 3 (app-էջեր — սկզբնական ցավը)**՝ հիմնականում **Mobbin / Pageflows / real product screen**-ից, ոչ landing gallery-ից։ UI GREEN-ը ստանում ա **taste dimension** (premium, conversion, product-UX) evidence-հատակների **վրայից** (render + բոլոր state + viewport + keyboard + a11y), երբեք դրանք չփոխարինելով։

## 9. Final execution plan — 12 organs → matrix + first proof slice / Վերջնական execution plan — 12 օրգան → matrix + առաջին proof slice

> Executable, not motivational. Repo untouched until Gev's "go". / Կիրառելի, ոչ մոտիվացիոն։ Repo-ն անձեռնմխելի մինչ Գևի «գո»-ն։

### 9.A The 12-organ matrix / 12-օրգանի matrix

| # | Organ | Existing? | Missing (real, not paper) | Build file(s) — no empty folders | Proof (command / evidence) | Status |
|---|---|---|---|---|---|---|
| 1 | Gev Taste Engine | partial (scattered in `self/personalization.md` + `gev-*` memories + batch-3 refs) | consolidated engine w/ GOOD/BAD examples | `self/gev_standard/{GOOD_EXAMPLES,BAD_EXAMPLES,DESIGN_TASTE,ANSWER_TASTE,ARCHITECTURE_TASTE,DECISION_STYLE}.md` | ≥3 GOOD + ≥3 BAD filled; UI verifier reads it | YELLOW |
| 2 | UI vertical slice proof | no | one real rendered+verified page | sandbox `nextjs-sandbox/` | `next build` + `tsc` + `eslint` + Playwright(states×viewports+keyboard) + axe + screenshots | RED |
| 3 | Code vertical slice proof | no | one real change+tests | sandbox `code-sandbox/` | `tsc` + `test` + `lint` + diff | RED |
| 4 | PRODUCTION_CONTRACT / skill | no | template + 2 filled | `skills/_PRODUCTION_CONTRACT_TEMPLATE.md` + `skills/{frontend-ux-product-design,ui-page-structure-design,software-systems-architecture}/PRODUCTION_CONTRACT.md` | template + UI+Code contracts gate the 2 slices | RED |
| 5 | Executor / Verifier / Repairer | partial (`auditing` ≈ verify mindset) | wired roles in the loop | `production_os/{05_EXECUTOR,06_VERIFIER,07_REPAIRER}.md` | slice runs through all 3 w/ logged verdict | RED |
| 6 | Evidence Ledger | no (donor stubs empty) | real ledger + real entry | `memory/_evidence/EVIDENCE_LEDGER.md` | slice evidence recorded w/ PROVEN/INFERRED/ASSUMED/UNKNOWN | RED |
| 7 | Failure Memory | no | ledger + real entry | `memory/_failures/{FAILURE_LEDGER,REPAIR_PATTERNS,NEVER_REPEAT}.md` | ≥1 real failure→repair from building the slice | RED |
| 8 | Anti-Flattery Guard | partial (persona + demonstrated this session) | law + verifier check | `_core/laws/19_no_agreement_without_check.md` | law registered + check runs | YELLOW |
| 9 | Decision Memory | partial (this intake IS one) | structured ADR store | `memory/_decisions/{DECISION_LEDGER,REJECTED_OPTIONS,ADR}.md` | this session's key decisions recorded | YELLOW |
| 10 | Output Quality Gate (+freshness) | partial (donor guard + final-report fmt + verify-not-claim behavior) | wired smart-verbosity gate | `production_os/08_FINAL_REPORT.md` + `production_os/checks/quality_gate.py` | serious task→full struct, simple→short; changeable facts→fresh-verify; applied to slice | YELLOW |
| 11 | Mode System | partial (`agents/orchestrator` routes by domain) | intent→mode auto-entry | `production_os/01_INTAKE_AND_INTENT.md` (modes) | intent classified → correct mode on slice | YELLOW |
| 12 | Safe Self-Improvement | partial (D0 already bounds; this session is an instance) | formal bounded loop | `production_os/SELF_IMPROVEMENT.md` | detect→proposal→go→apply→record cycle logged | YELLOW |

*First UI slice makes organs 1, 2, 4, 5, 6, 7, 10 actually work = **7 of 12** in one proof.* / *Առաջին UI slice-ը իրական աշխատեցնում է 1, 2, 4, 5, 6, 7, 10 = **12-ից 7**-ը մեկ ապացույցում։*

### 9.1 What is already covered / Ինչ արդեն ունենք
**EN:** 32 skills (advisory) · laws (L0/covenant/L8/L13/D0) · persona + anti-flattery *behavior* · `analysis-primary` (intent framing) · `auditing` (independent-verify mindset) · sealed memory + self-audit · freshness discipline (verify-not-claim) · this intake = a decision record. Harvestable from the donor pack: L14–18 drafts, Activation protocol, guard concept, eval-case structure, schema.
**HY:** 32 skill (advisory) · օրենքներ (L0/covenant/L8/L13/D0) · persona + anti-flattery *վարք* · `analysis-primary` · `auditing` · sealed memory + self-audit · freshness discipline · այս intake = որոշման գրառում։ Donor-ից վերցվող՝ L14–18, Activation protocol, guard, eval struct, schema։

### 9.2 What is missing (real, not paper) / Ինչ իրականում պակասում է
**EN:** the 7 RED: structured Taste Engine · UI slice proof · Code slice proof · filled contracts · wired Executor/Verifier/Repairer · real Evidence Ledger · Failure Memory. Then wire the 5 YELLOW (quality gate, modes, self-improve loop, anti-flattery *law*, decision memory).
**HY:** 7 RED-ը՝ structured Taste Engine · UI slice · Code slice · լցված contract · wired Executor/Verifier/Repairer · իրական Evidence Ledger · Failure Memory։ Հետո՝ 5 YELLOW-ի wiring։

### 9.3 Build order (no empty scaffolding) / Կառուցման հերթ (ոչ դատարկ scaffold)
**EN:** S0 this plan→go · S1 Taste Engine seed (real examples, open slots) · S2 Failure+Evidence+Decision memory skeleton (filled with THIS session) · S3 contract template + UI+Code contracts · **S4 UI slice (sandbox)→GREEN** · S5 Code slice (sandbox)→GREEN · S6 extract Universal Core + wire Executor/Verifier/Repairer/Gate/Modes/Self-improve from the 2 proven slices · S7 anti-flattery + freshness as laws · S8 seed to all bros via spine. Every repo/spine/law/memory write is Gev-gated.
**HY:** S0 պլան→գո · S1 Taste Engine seed · S2 Failure+Evidence+Decision memory · S3 contract template + UI+Code · **S4 UI slice (sandbox)→GREEN** · S5 Code slice→GREEN · S6 extract Universal Core + wire · S7 anti-flattery+freshness օրենքներ · S8 seed բոլոր բռոներին։ Ամեն repo/spine/law/memory գրում = Գևի gate։

### 9.4 First proof slice / Առաջին proof slice
**EN:** **UI vertical slice** — one real **list-detail** page (Next.js + TS + Tailwind + shadcn), built from tokens + approved components + template, in a **sandbox** (not the repo). **Commands:** `next build` · `tsc --noEmit` · `eslint` · Playwright (5 states × viewports 375/768/1024/1440 + keyboard path) · axe a11y. **Evidence:** build/typecheck/lint output + Playwright pass + axe report + screenshots → Evidence Ledger; Verifier issues GREEN/YELLOW/RED; any fix → Failure Memory.
**HY:** **UI ուղղահայաց slice** — մեկ իրական **list-detail** էջ (Next.js+TS+Tailwind+shadcn), token+approved component+template-ից, **sandbox**-ում (ոչ repo)։ **Command:** `next build` · `tsc` · `eslint` · Playwright (5 state × 4 viewport + keyboard) · axe։ **Evidence:** output-ներ + Playwright + axe + screenshot → Evidence Ledger. Verifier → GREEN/YELLOW/RED. fix → Failure Memory։

### 9.5 Files to add/change / Ֆայլեր
```txt
# SANDBOX (no repo write, produces the proof) / SANDBOX (repo-ի գրում չկա)
scratchpad/nextjs-sandbox/  app/(list-detail page) · components/* · tokens/* · tests/playwright/* · axe report · screenshots/
scratchpad/slice-evidence/  EVIDENCE.md · VERIFICATION_REPORT.md · FAILURE_LOG.md

# INTO THE REPO — ONLY ON "GO" / REPO-Ի ՄԵՋ — ՄԻԱՅՆ «ԳՈ»-ից
self/gev_standard/{GOOD_EXAMPLES,BAD_EXAMPLES,DESIGN_TASTE,ANSWER_TASTE,ARCHITECTURE_TASTE,DECISION_STYLE}.md
memory/_evidence/EVIDENCE_LEDGER.md · memory/_failures/{FAILURE_LEDGER,REPAIR_PATTERNS,NEVER_REPEAT}.md · memory/_decisions/{DECISION_LEDGER,REJECTED_OPTIONS,ADR}.md
skills/_PRODUCTION_CONTRACT_TEMPLATE.md · skills/{frontend-ux-product-design,ui-page-structure-design}/PRODUCTION_CONTRACT.md
_core/production_os/{00_EXECUTION_CONSTITUTION,01_INTAKE_AND_INTENT,05_EXECUTOR,06_VERIFIER,07_REPAIRER,08_FINAL_REPORT}.md + ui/(real tokens/components/templates)
_core/laws/{14..18}_*.md (bilingualized+registered) · _core/laws/19_no_agreement_without_check.md
```
No empty folders — every path above ships with real content or it is not created. / Ոչ մի դատարկ պապկա։

### 9.6 GREEN / YELLOW / RED
**EN:** **GREEN** = page renders + all 5 states + 4 viewports + keyboard path + a11y pass + only tokens/approved components + evidence attached + Verifier PASS. **YELLOW** = builds but a check is missing/blocked (blocker stated explicitly). **RED** = build/typecheck/render/a11y fails, OR GREEN claimed without runtime evidence.
**HY:** **GREEN** = render + 5 state + 4 viewport + keyboard + a11y + token/approved-component only + evidence + Verifier PASS։ **YELLOW** = build-ը լինում ա բայց check պակասում/blocked (blocker հստակ)։ **RED** = build/typecheck/render/a11y fail, ԿԱՄ GREEN առանց evidence-ի։

### 9.7 What requires Gev's "go" / Ինչ է պահանջում Գևի «գո»
**EN:** any write to the Bro repo — `self/gev_standard/`, `memory/*`, `skills/*/PRODUCTION_CONTRACT.md`, `_core/laws/*`, `_core/production_os/*`, spine, seed-to-all-bros, and installing the proven slice. Even the sandbox build waits for your "go" to start (your standing hold).
**HY:** ցանկացած գրում Bro repo-ում — `self/gev_standard/`, `memory/*`, `skills/*/PRODUCTION_CONTRACT.md`, `_core/laws/*`, `_core/production_os/*`, spine, seed, ապացուցված slice-ի install։ Նույնիսկ sandbox build-ը սպասում է քո «գո»-ին։

### 9.8 What I will NOT do / Ինչ ՉԵՄ անի
**EN:** no empty adapter/skill folders · no "universal" claim without 2 proven slices · no GREEN without runtime evidence · no new skills (upgrade only) · no repo/law/spine/memory write without your "go" · no yes-man agreement without an independent check · no page cloned from references (study → synthesize original).
**HY:** ոչ դատարկ պապկա · ոչ «universal» առանց 2 ապացուցված slice-ի · ոչ GREEN առանց runtime evidence-ի · ոչ նոր skill (միայն upgrade) · ոչ repo/law/spine/memory գրում առանց «գո»-ի · ոչ yes-man առանց անկախ ստուգման · ոչ կլոնված էջ (study → synthesize)։

---

*EN: Collected, not built. Plan is executable and saved (§9). On your "go" I run the first UI proof slice in a sandbox — no repo touch.*
*HY: Հավաքված է, ոչ կառուցված։ Պլանը կիրառելի է ու պահված (§9)։ Քո «գո»-ից՝ վազում եմ առաջին UI proof slice-ը sandbox-ում — repo-ին ձեռք չեմ տալիս։ 💪🤍*
