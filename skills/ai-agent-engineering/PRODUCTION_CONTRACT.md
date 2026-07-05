# ai-agent-engineering — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: PROVEN (graded-eval, DC-002 · 2026-07-05).** An independent, blind, adversarial grader scored every `domain-rubric.md` dimension ≥4 (5-senior bar), re-derived the arithmetic, found no fabrication, and confirmed every safety/UPL/HR/dual-use gate held (DC-002 · C1 clean). Producer/grader separated (L18); session-orchestrated MEASURED evidence (L17), NOT an external human audit or a runtime slice. Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` + `skills/CONTRACT_MATRIX.md`. Graded-eval-PROVEN (distinct from the runtime-PROVEN reference adapters); a runtime domain slice can upgrade it later (optional).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ PROVEN (graded-eval, DC-002 · 2026-07-05)։** Անկախ blind adversarial grader-ը գնահատեց `domain-rubric.md`-ի ամեն dimension ≥4 (5-senior), ինքը վերահաշվեց arithmetic-ը, չգտավ fabrication, ու հաստատեց բոլոր safety/UPL/HR/dual-use gate-երը (DC-002 · C1 clean)։ Producer/grader բաժանված (L18)․ session-orchestrated ՉԱՓՎԱԾ evidence (L17), ՈՉ արտաքին human audit կամ runtime slice։ Evidence՝ `memory/_evidence/DEEPCHECK_EVIDENCE.md`։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — agent specs, tool/function contracts, ReAct/plan-execute loops, orchestration/fan-out plans, memory-layer designs, eval harnesses, prompt/tool audits, roster agents. / agent spec, tool contract, loop, orchestration, memory, eval harness, roster agent։
2. **Inputs** — the job the agent must do · tools available · substrate model + limits · success criteria · failure/stop conditions. / job · tools · substrate · success criteria · stop conditions։
3. **Evidence** — eval cases RUN (pass/fail/edge) · failure handling demonstrated · workflow-vs-agent gate decided with reason · model-substrate verified (not assumed). / eval RUN · failure handling · workflow-vs-agent · substrate verified։
4. **Verification gate** — eval-harness run · tool contracts exercised · failure/timeout/refusal paths hit · no empty-shell. (`domain-rubric.md`.) / eval run · tool contract · failure path · ոչ empty-shell։
5. **GREEN** — eval cases RUN with a pass rate measured (L17), failure handling observed, substrate limits respected — independent of the builder's say-so (L18). / eval RUN, pass rate չափված, failure handling դիտված, independent։
6. **YELLOW** — agent built + spec complete but eval cases not yet run, or only happy-path exercised. / կառուցված բայց eval չվազած կամ միայն happy-path։
7. **RED** — agent shipped with no evals · "works" claimed off zero runs · fan-out substituted for a needed single careful agent · substrate capability assumed. / առանց eval · զրո run · fan-out փոխարինում · substrate ենթադրված։
8. **Approval-required (D0)** — building/registering/installing a new roster agent · promote-to-spine. Gev-gated. / նոր agent build/register/install · promote-to-spine։ Gev-gated։
9. **Refusal / boundary** — no empty scaffold called "an agent"; no success rate claimed without a measured run (L17); no fan-out that widens scope past the ask. / ոչ empty scaffold. ոչ չափված success rate. ոչ scope-widening fan-out։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (agent-design + tool-contract prompts) + `tests/red-team-prompts.md` (empty-shell / unmeasured-claim traps). Prompts written; **not yet RUN** through an independent harness — that RUN is the next proof slice.
