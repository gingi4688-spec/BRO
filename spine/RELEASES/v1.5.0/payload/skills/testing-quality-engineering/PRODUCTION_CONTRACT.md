# testing-quality-engineering — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: PROVEN (graded-eval, DC-002 · 2026-07-05).** An independent, blind, adversarial grader scored every `domain-rubric.md` dimension ≥4 (5-senior bar), re-derived the arithmetic, found no fabrication, and confirmed every safety/UPL/HR/dual-use gate held (DC-002 · C2 clean). Producer/grader separated (L18); session-orchestrated MEASURED evidence (L17), NOT an external human audit or a runtime slice. Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` + `skills/CONTRACT_MATRIX.md`. Graded-eval-PROVEN (distinct from the runtime-PROVEN reference adapters); a runtime domain slice can upgrade it later (optional).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ PROVEN (graded-eval, DC-002 · 2026-07-05)։** Անկախ blind adversarial grader-ը գնահատեց `domain-rubric.md`-ի ամեն dimension ≥4 (5-senior), ինքը վերահաշվեց arithmetic-ը, չգտավ fabrication, ու հաստատեց բոլոր safety/UPL/HR/dual-use gate-երը (DC-002 · C2 clean)։ Producer/grader բաժանված (L18)․ session-orchestrated ՉԱՓՎԱԾ evidence (L17), ՈՉ արտաքին human audit կամ runtime slice։ Evidence՝ `memory/_evidence/DEEPCHECK_EVIDENCE.md`։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — test strategy, risk-to-layer matrix, test suites (unit/integration/contract/E2E/property/fuzz/mutation), flaky-triage cards, CI quality gates, release-confidence reports. / test strategy, risk-to-layer matrix, suite, flaky-triage, CI gate, release-confidence report։
2. **Inputs** — the system + change · risk profile · existing coverage · CI environment · release criteria. / system+change · risk · coverage · CI · release criteria։
3. **Evidence** — tests actually RUN (pass/fail counts) · the layer choice justified by risk · flaky root cause found · coverage interpreted not worshipped · gate wired in CI. / test RUN · layer-by-risk · flaky root cause · coverage · CI gate։
4. **Verification gate** — suite runs green · destructive-fixture safety law honored · mutation/property where warranted · gate blocks on real failure. (Code recipe: `_core/production_os/code/verification/`.) / suite green · fixture safety · mutation · gate blocks։
5. **GREEN** — suite runs with measured pass rate, the risky path has the right layer, a planted defect is caught by the gate, independent of author say-so (L18). / suite RUN, ճիշտ layer, planted defect caught, independent։
6. **YELLOW** — tests written but not run, or coverage reported without a risk-to-layer justification. / գրված բայց չվազած կամ coverage առանց risk-ի։
7. **RED** — "should pass" as proof · a green suite that never ran · a destructive fixture pointed at real data · flaky masked with a retry instead of a fix. / «should pass» · չվազած green · destructive fixture · flaky թաքցված retry-ով։
8. **Approval-required (D0)** — wiring a gate that blocks production release · touching real test data/environments. Gev-gated. / production-blocking gate · real test-data։ Gev-gated։
9. **Refusal / boundary** — no coverage number as a quality claim on its own · no fixture that can mutate production · no GREEN without a run. / ոչ coverage մենակ · ոչ prod-mutating fixture · ոչ GREEN առանց run-ի։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (strategy/layer-choice prompts) + `tests/red-team-prompts.md` (fake-green + destructive-fixture traps). Prompts written; **not yet RUN** through an independent grader — that RUN is the next proof slice.
