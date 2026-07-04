# BRO PERFECT UPGRADE — EXECUTION RM / BRO PERFECT UPGRADE — ԿԱՏԱՐՄԱՆ RM

> **EN:** Durable session checkpoint so no token/context is lost and the next chat continues crystal-clear. This file is the roadmap; the detailed decision record lives in [`PRODUCTION_UPGRADE_INTAKE.md`](PRODUCTION_UPGRADE_INTAKE.md) (§0–§9); the Bro description lives in [`BRO_OVERVIEW.md`](BRO_OVERVIEW.md).
>
> **HY:** Durable session checkpoint, որ token/context չկորի ու հաջորդ chat-ը շարունակի crystal-clear։ Այս ֆայլը roadmap-ն է. մանրամասն որոշման գրառումը՝ [`PRODUCTION_UPGRADE_INTAKE.md`](PRODUCTION_UPGRADE_INTAKE.md) (§0–§9), Bro-ի նկարագիրը՝ [`BRO_OVERVIEW.md`](BRO_OVERVIEW.md)։

*Saved under permission: **GO-REPO-SAVE-RM ONLY** (2026-07-05). No build, no sandbox, no install, no laws/spine/skill/memory-behavior change. / Պահված է **GO-REPO-SAVE-RM ONLY** թույլտվությամբ։ Ոչ build, ոչ sandbox, ոչ install, ոչ laws/spine/skill/memory-behavior փոփոխություն։*

---

## 0. Current Session Checkpoint / Ընթացիկ session-ի checkpoint

**What we decided / Ինչ որոշեցինք:**
- Bro must become **production**, not only advisory. / Bro-ն պիտի դառնա **production**, ոչ միայն խորհրդատու։
- Architecture target = **Universal Production Core + Domain Adapters**, but **proven by vertical slices**, never top-down empty abstraction. / architecture թիրախ = **Universal Core + Domain Adapter**, բայց **ապացուցված vertical slice-երով**, ոչ վերևից դատարկ աբստրակցիա։
- Skills: **upgrade with a Production Contract per skill**, do **not** add new skills (32 coverage is good; the gap is production-readiness). / Skill-երը՝ **Production Contract ամեն skill-ի**, ոչ նոր skill։
- Donor pack `..._V3_RUNTIME_FIXED.zip` = **donor only** (harvest L14–18 content, Activation protocol, guard concept, schema, eval structure). Its "GREEN" is a file-presence lint, not capability — **do not install as-is**. / Donor pack = **donor only**. as-is չինստալել։
- **12 organs** define "perfect"; first proof = **UI list-detail vertical slice** that exercises 7 of 12. / **12 օրգան**. առաջին ապացույց = **UI list-detail slice** (12-ից 7)։
- Everything seeds to **all bros via spine**; **D0** gates preserved; **no version theater**. / Ամեն ինչ **բոլոր բռոներին spine-ով**. **D0** պահված. **version theater չկա**։

**Accepted / Ընդունված:** §8 proposal (slice-first) · §9 execution plan + 12-organ matrix · locked UI acceptance spec · 3-gate phase model · daily self-check audit finding · sandbox-outside-repo + preflight-first.

**Still pending / Դեռ pending:** nothing is built · the 15–20 Gev taste examples (Mode B) · the sandbox slice · install. / ոչինչ կառուցված չէ · 15–20 taste օրինակ · sandbox slice · install։

**Permissions we HAVE now / Ունեցած permission:** **GO-REPO-SAVE-RM ONLY** — create/commit/push the RM + session checkpoint docs only.

**Permissions we do NOT have / Չունեցած permission:** GO-SANDBOX PREFLIGHT · GO-SANDBOX BUILD SLICE · GO-INSTALL — all await Gev's explicit word. / բոլորը սպասում են Գևի բացահայտ բառին։

---

## 1. Phase Gate Model / Փուլային gate-մոդել

### Gate 1 — GO-SANDBOX PREFLIGHT ONLY
**Purpose:** external sandbox toolchain preflight. / External sandbox-ի toolchain preflight։
**Allowed:** return sandbox absolute path · `node -v` · `npm -v` · npx/playwright availability · network/install availability · exact command list for build stage.
**Forbidden:** no build · no package install beyond version/availability check · no Bro-repo write · no laws/spine/memory/skills change · STOP after preflight report.
**Output:** preflight report · exact command list · GREEN/YELLOW/RED · ask Gev for `GO-SANDBOX BUILD SLICE`.

### Gate 2 — GO-SANDBOX BUILD SLICE
**Purpose:** build the first real UI vertical slice in the external sandbox. / External sandbox-ում կառուցել առաջին real UI slice-ը։
**Allowed:** create external `nextjs-sandbox` + `slice-evidence` · build one UI list-detail page · run build/tsc/lint/Playwright/axe · screenshots · controlled failure → repair → reverify · evidence + failure ledger entries inside sandbox evidence · role-separated report.
**Forbidden:** no Bro-repo write · no laws/spine/memory/skills change · no universal extraction · no install · no push.
**Output (only):** 1) changed file list · 2) commands + outputs · 3) screenshots/evidence list · 4) Executor output · 5) Verifier verdict · 6) Repairer/failure log · 7) final GREEN/YELLOW/RED · 8) ask Gev for `GO-INSTALL` only if GREEN.

### Gate 3 — GO-INSTALL
**Purpose:** only after the sandbox slice is GREEN, install the proven pattern into the real Bro repo. / Միայն sandbox slice-ը GREEN-ից հետո՝ ապացուցված pattern-ը իրական Bro repo։
**Allowed only after explicit `GO-INSTALL`:** production_os wiring · evidence/failure/decision ledgers · skill production contracts · laws/spine updates if explicitly approved · Gev Taste Engine seed · daily self-check vNext integration · commit/push after verification.
**Forbidden before `GO-INSTALL`:** any Bro-repo implementation write · law/spine/memory/skill install · universal extraction.

---

## 2. Locked UI Slice Acceptance Spec / Կողպված UI slice acceptance spec

- **Page type:** list-detail
- **Domain:** neutral CRM — Customers list → customer detail drawer, **synthetic data only**
- **Stack:** Next.js App Router + TypeScript + Tailwind + shadcn/ui
- **States:** loading · empty first-run · empty filtered-to-zero · error + retry · populated · permission-denied (read-only role)
- **Viewports:** 375 · 768 · 1024 · 1440
- **Interactions:** filter · select row · open drawer · keyboard tab path · primary action keyboard-accessible · close drawer with ESC
- **A11y:** semantic HTML · focus-visible · drawer focus trap + restore · labels · contrast AA · axe 0 serious/critical · keyboard-only operable
- **Screenshots required:** 375-loading · 375-empty · 375-populated · 768-populated · 1024-populated · 1440-populated · drawer-open · permission-denied · error-state · keyboard-focus
- **Controlled failure (mandatory):** one intentional defect (e.g. drawer ESC-close fails) → Verifier catches → Repairer fixes → re-verify → Failure Ledger records: what failed · why · which gate caught it · what fix · re-verification result.
- **Design:** Mode A professional baseline (tokens: spacing/type/color/radius/shadow/breakpoint); study-not-copy from references; **no cloning**.
- **Verdict:** GREEN = build+tsc+eslint pass · all states · all viewports · all interactions · axe 0 serious · tokens+kit only · all screenshots · controlled failure caught+repaired+re-verified · Verifier PASS with evidence. YELLOW = builds but ≥1 mandatory check missing/blocked (blocker explicit). RED = build/tsc/render/a11y fail · missing state/interaction · GREEN claimed without runtime evidence · Repairer didn't fix the controlled failure.

---

## 3. Daily Self-Check Finding / Daily self-check-ի եզրակացություն

**EN:** The existing daily self-check (`bro-selfaudit` → `bro-doctor` + `bro-audit` + `bro-beast-check`, 11:00 daily, read-only, fail-closed) is **real and honest** — it is not self-comfort, and the audit SEAL explicitly enumerates what GREEN does NOT prove. But it is mostly **structural/governance** health, **not behavior/production/taste** health (≈ 5 GREEN / 8 YELLOW / 17 RED across 30 areas).
**HY:** Առկա daily self-check-ը **իրական ու ազնիվ ա** — ոչ self-comfort. բայց հիմնականում **structural/governance** ա, ոչ **behavior/production/taste** (≈ 5🟢 / 8🟡 / 17🔴)։

- **Strong now:** L8 memory isolation · D0 approval boundary · hook health · repo cleanliness · isolation wall.
- **Missing:** behavior evals · production capability · doc hygiene · Gev Taste Engine · skill production contracts · evidence/failure/decision ledgers · no-fake-GREEN runtime proof · L0 bilingual behavior check · research freshness behavior · anti-flattery behavior.
- **False-GREEN risk found:** audit checks skills/agents hash **format** (`^sha256:…64`), not **match** to actual content.
- **Required vNext:** Daily **Doctor** + Daily **Auditor** + Daily **Improvement Planner**.
- **Rule:** Bro may self-diagnose daily · may propose patches · **may NOT self-modify silently** · all self-updates require Gev approval.

---

## 4. Final Status Now / Վերջնական կարգավիճակ հիմա

| Item | Status |
|---|---|
| Plan | 🟢 GREEN |
| Self-audit honesty | 🟢 GREEN |
| Sandbox ambiguity | ✅ CLOSED (external temp, outside Bro repo) |
| Preflight-first ambiguity | ✅ CLOSED |
| Bro repo implementation | ⛔ NOT STARTED |
| Sandbox build | ⛔ NOT STARTED |
| Install | ⛔ NOT ALLOWED YET |
| Next action awaited | **GO-SANDBOX PREFLIGHT ONLY** |

---

*EN: Session saved. Nothing built. Repo implementation untouched. Next word: GO-SANDBOX PREFLIGHT ONLY.*
*HY: Session-ը պահված է։ Ոչինչ կառուցված չէ։ Repo implementation-ը անձեռնմխելի։ Հաջորդ բառը՝ GO-SANDBOX PREFLIGHT ONLY։ 💪🤍*
