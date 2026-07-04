# frontend-ux-product-design — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: PROVEN (proof slice 1).** Validated end-to-end on a real Next.js list-detail slice → runtime GREEN (23/23 Playwright, axe 0 serious, 10 screenshots, controlled-failure caught→repaired→re-verified). Evidence: `memory/_evidence/EVIDENCE_LEDGER.md`. This is the reference contract the template ([`../_PRODUCTION_CONTRACT_TEMPLATE.md`](../_PRODUCTION_CONTRACT_TEMPLATE.md)) was proven on.
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ ՊՐՈՎՎԱԾ (proof slice 1)։** Validate արած իրական Next.js list-detail slice-ով → runtime GREEN։ Սա հղումային contract-ն է, որով template-ը ապացուցվեց։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — UI pages/screens (dashboard, list-detail, CRUD-form, settings, auth, landing, report, admin, kanban, …), components, design tokens, page templates. / UI էջ/screen, component, token, template։
2. **Inputs** — page type · data shape · states needed · role model · target viewports · brand/taste (Mode A default, Mode B if examples). / էջի տեսակ · data · state-եր · role · viewport · ճաշակ։
3. **Evidence** — rendered app + all states + viewports + keyboard path + axe report + screenshots. / render + state + viewport + keyboard + axe + screenshot։
4. **Verification gate** — [`_core/production_os/ui/verification/UI_VERIFICATION_CHECKLIST.md`](../../_core/production_os/ui/verification/UI_VERIFICATION_CHECKLIST.md): tsc + eslint + build + Playwright(states×viewports+interactions) + axe + controlled-failure.
5. **GREEN** — renders · all 6 states · 4 viewports · keyboard-operable · axe 0 serious · tokens+kit only · all screenshots · controlled failure caught+repaired+re-verified · Verifier PASS with evidence.
6. **YELLOW** — builds but ≥1 state/viewport/interaction/a11y check missing or blocked (blocker named).
7. **RED** — build/render/a11y fails · a missing state or interaction · GREEN claimed without runtime evidence · a planted defect not repaired.
8. **Approval-required (D0)** — installing built UI into a real repo · touching production data/routes · any push/release. (Sandbox build itself is Gev-gated per the phase model.)
9. **Refusal / boundary** — no cloning a reference site (study→synthesize original) · no "beautiful" that fails the a11y/keyboard floors · no GREEN on description without render.
10. **Eval cases** — PASS: list-detail with all 6 states renders + axe clean. FAIL: drawer ESC no-close (FL-001, caught). EDGE: soft destructive badge 4.0:1 < AA at 12px (FL-002, caught+fixed to 4.77:1).

## Taste dimensions (on top of the floors) / Ճաշակի չափումներ (հատակների վրայով)

Premium feel · conversion structure · product-UX correctness (3 levels) — added ON TOP of, never replacing, the evidence floors (render + states + viewport + keyboard + a11y). Sourced via the study-not-copy rubric ([`self/gev_standard/`](../../self/gev_standard/README.md)). / premium · conversion · product-UX — evidence-հատակների ՎՐԱՅՈՎ, երբեք փոխարեն։
