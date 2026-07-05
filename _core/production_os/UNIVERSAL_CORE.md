# production_os — UNIVERSAL CORE (EXTRACTION RECORD) / ՈՒՆԻՎԵՐՍԱԼ ՄԻՋՈՒԿ (ԱՐԴՅՈՒՆԱՀԱՆՄԱՆ ԳՐԱՌՈՒՄ)

> **EN:** The record of the Universal Core extraction (Phase 10B), per §8's rule of three: the shared core is lifted **only after** two adapters are proven end-to-end. It is now PROVEN — not by abstraction, but because the **same** loop demonstrably drove **two independent artifact classes**: UI (render + a11y) and Code (test + build). This file states what is shared, what stays adapter-specific, and the evidence.
>
> **HY:** Ունիվերսալ Միջուկի արդյունահանման գրառումը (Phase 10B), §8-ի rule of three-ով՝ shared core-ը հանվում է **միայն** երկու adapter-ի ապացուցումից հետո։ Հիմա PROVEN է — ոչ աբստրակցիայով, այլ որովհետև **նույն** loop-ը վարեց **երկու անկախ artifact-դաս**՝ UI (render+a11y) և Code (test+build)։

## Status / Կարգավիճակ (L15/L17/L18)

**Universal Core = PROVEN.** Evidence = two independent runtime proofs through one documented loop: **UISLICE-001** (UI render · 6 states · 4 viewports · keyboard · axe 0-serious · controlled ESC defect + unplanned contrast defect) + **CODESLICE-001** (TDD red→green 13/13 · tsc+eslint+build 0 · controlled boundary defect + unplanned TS5011 build defect). Generality is **measured** (two artifact classes), not asserted (L17). / Universal Core = PROVEN. Evidence՝ երկու անկախ runtime proof մեկ loop-ով (UISLICE-001 + CODESLICE-001)։

## What is shared (the Universal Core — domain-agnostic) / Ինչ է ընդհանուր

| Core element | File(s) | Proven across |
|---|---|---|
| The 10-step loop | `00_EXECUTION_CONSTITUTION.md` §1 | UI + Code |
| The 3 statuses + 6 gates (incl. L18 independence, D0) | `00` §2–3 | UI + Code |
| Intake + Intent classify | `01_INTAKE_AND_INTENT.md` | UI + Code |
| Evidence engine + 4 labels (PROVEN/INFERRED/ASSUMED/UNKNOWN) | `02_EVIDENCE_ENGINE.md` | UI + Code |
| Best-Solution scoring (3–5 options, 10 criteria) | `03_BEST_SOLUTION_ENGINE.md` | UI + Code |
| Execution planner (files/steps/commands/checks/rollback) | `04_EXECUTION_PLANNER.md` | UI + Code |
| **Executor / Verifier / Repairer** (the 3 roles) | `05` · `06` · `07` | UI + Code (reference runs in each show both classes) |
| Final Report (fixed 8-part format) | `08_FINAL_REPORT.md` | UI + Code |
| The ledgers (evidence · verification · failure · repair · decision · success) | `memory/_evidence` · `memory/_failures` · `memory/_decisions` | UI + Code |
| Capability-check **principle** (capability, never file-presence) | `checks/README.md` | UI + Code |
| The 10-question Production-Contract **template** | `skills/_PRODUCTION_CONTRACT_TEMPLATE.md` | UI + Code |

None of the above names a single domain — they are the core, and each role now has a reference run in BOTH artifact classes (05–08). / Վերևից ոչ մեկը մեկ domain չի անվանում — դրանք միջուկն են։

## What stays adapter-specific (NOT in the core) / Ինչ է մնում adapter-specific

- **UI adapter** — `_core/production_os/ui/` (design-tokens · component-kit · page-templates · `verification/UI_VERIFICATION_CHECKLIST.md`: render/states/viewports/keyboard/axe/Playwright). PROVEN (UISLICE-001).
- **Code adapter** — `_core/production_os/code/verification/CODE_VERIFICATION_CHECKLIST.md` (tsc/lint/test/build/red→green/controlled-failure). PROVEN (CODESLICE-001).
- **Data adapter** — `_core/production_os/data/verification/DATA_VERIFICATION_CHECKLIST.md` (golden-report conformance over a labeled dataset · red→green · controlled-defect). PROVEN (DATASLICE-001) — the 3rd artifact class, §8 rule of three exceeded.
- **Per-skill contracts** — `skills/<skill>/PRODUCTION_CONTRACT.md` (each skill's artifact-specific 10 answers). UI (`frontend-ux-product-design`) + Code (`software-systems-architecture`) PROVEN; the other 30 DECLARED, filled opportunistically.
- **The artifact→proof routing row** (`00` §4) — lists what counts as GREEN per artifact; the recipes live in the adapters.

## Validation after extraction (Phase 10B) / Validate extraction-ից հետո

- **Code adapter — LIVE re-run** against the current state: `tsc --noEmit`=0 · `eslint`=0 · `vitest`=13/13 · build=0 (`dist/*.js+.d.ts`). Reproducible.
- **UI adapter — evidence-backed:** UISLICE-001 recorded runtime + `ui/verification/` recipe integrity (extraction did not touch adapter recipes). The original Next.js sandbox is ephemeral and not re-run here — honestly labeled evidence-backed, not freshly re-run (L18, no faked run).
- **Core neutrality audit:** 00–08 grep for single-domain leakage → the reference runs in 05–08 were UI-only; Phase 10B added the Code reference run to each, so every role demonstrably spans both classes.
- **Governance:** doctor · audit · registry · beast · selfcheck (L3 gate now: Universal PROVEN requires BOTH adapter proofs; fake-universal = RED).

## Honest limits / Ազնիվ սահմաններ

Two proven adapters clear §8's **minimum** (rule of three); a **third, different-shape slice is now DONE** — **DATASLICE-001** (Data validation/transformation, Python, golden-report conformance over a labeled dataset, with real red→green + a controlled defect caught+repaired). Generality is now measured across **three** artifact classes (UI + Code + Data), L17. The Universal Core label stays **PROVEN** — the *same* PROVEN, now backed by three artifact classes instead of two, not inflated. UI re-validation is evidence-backed (recorded), not a fresh run. / Երկու adapter-ը բավարարում է §8-ի նվազագույնը. **3-րդ slice-ը հիմա DONE է** (DATASLICE-001, Data, Python, golden-report conformance, real red→green + controlled defect)։ Generality-ն չափված է **երեք** artifact-դասով (UI+Code+Data)։ Universal Core-ը մնում է PROVEN՝ նույն PROVEN-ը, հիմա 3 դասով, ոչ ուռճացված։
