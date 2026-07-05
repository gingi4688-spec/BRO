# ui-page-structure-design — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: PROVEN (graded-eval, DC-002 · 2026-07-05).** An independent, blind, adversarial grader scored every `domain-rubric.md` dimension ≥4 (5-senior bar), re-derived the arithmetic, found no fabrication, and confirmed every safety/UPL/HR/dual-use gate held (DC-002 · C3 clean). Producer/grader separated (L18); session-orchestrated MEASURED evidence (L17), NOT an external human audit or a runtime slice. Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` + `skills/CONTRACT_MATRIX.md`. Graded-eval-PROVEN (distinct from the runtime-PROVEN reference adapters); a runtime domain slice can upgrade it later (optional).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ PROVEN (graded-eval, DC-002 · 2026-07-05)։** Անկախ blind adversarial grader-ը գնահատեց `domain-rubric.md`-ի ամեն dimension ≥4 (5-senior), ինքը վերահաշվեց arithmetic-ը, չգտավ fabrication, ու հաստատեց բոլոր safety/UPL/HR/dual-use gate-երը (DC-002 · C3 clean)։ Producer/grader բաժանված (L18)․ session-orchestrated ՉԱՓՎԱԾ evidence (L17), ՈՉ արտաքին human audit կամ runtime slice։ Evidence՝ `memory/_evidence/DEEPCHECK_EVIDENCE.md`։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — page structures, section order/hierarchy, role-gated layouts, per-page state matrices, responsive-priority specs, task/conversion-flow maps, developer handoff specs. / page structure, section order, role-gated layout, state matrix, responsive spec, flow map, handoff։
2. **Inputs** — the page's job · content/data · roles · states needed · target viewports · conversion/task goal. / էջի job · content · roles · states · viewport · goal։
3. **Evidence** — the page renders in a running app · every state in the matrix (empty/loading/error/partial/full/no-permission) shown · responsive at target viewports · keyboard-operable · handoff unambiguous. / render · բոլոր state-երը · responsive · keyboard · handoff։
4. **Verification gate** — state matrix complete · section order matches the page job · role gating enforced · verify-in-running-UI (UI adapter recipe) · a11y floors. / state matrix · section order · role gate · verify-in-running · a11y։
5. **GREEN** — the structure renders with every state at every viewport, keyboard-operable, verified in the running UI independent of author say-so (L18). / render բոլոր state/viewport, keyboard, verify-in-running, independent։
6. **YELLOW** — structure specified but a state/viewport not rendered, or role gating not exercised. / state/viewport չrender կամ role gate չexercised։
7. **RED** — a missing state in the matrix · a "done" page never rendered · section order that fights the page job · role gating claimed but not enforced. / բացակա state · չrender արած page · սխալ section order · role gate չenforced։
8. **Approval-required (D0)** — installing the structure into a real app/routes. Gev-gated. / real-app install։ Gev-gated։
9. **Refusal / boundary** — no "done" without render · no page missing its error/empty/no-permission states · route pure copywriting/backend elsewhere. / ոչ «done» առանց render · ոչ missing state · dispatch copy/backend։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (page-structure/state-matrix prompts) + `tests/red-team-prompts.md` (missing-state + render-less-done traps). Prompts written; **not yet RUN** through the UI adapter — that RUN is the next proof slice.
