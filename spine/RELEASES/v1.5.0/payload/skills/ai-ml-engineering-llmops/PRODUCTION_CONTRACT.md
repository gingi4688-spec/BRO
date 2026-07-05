# ai-ml-engineering-llmops — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: PROVEN (graded-eval, DC-002 · 2026-07-05).** An independent, blind, adversarial grader scored every `domain-rubric.md` dimension ≥4 (5-senior bar), re-derived the arithmetic, found no fabrication, and confirmed every safety/UPL/HR/dual-use gate held (DC-002 · R1 remed). Producer/grader separated (L18); session-orchestrated MEASURED evidence (L17), NOT an external human audit or a runtime slice. Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` + `skills/CONTRACT_MATRIX.md`. Graded-eval-PROVEN (distinct from the runtime-PROVEN reference adapters); a runtime domain slice can upgrade it later (optional).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ PROVEN (graded-eval, DC-002 · 2026-07-05)։** Անկախ blind adversarial grader-ը գնահատեց `domain-rubric.md`-ի ամեն dimension ≥4 (5-senior), ինքը վերահաշվեց arithmetic-ը, չգտավ fabrication, ու հաստատեց բոլոր safety/UPL/HR/dual-use gate-երը (DC-002 · R1 remed)։ Producer/grader բաժանված (L18)․ session-orchestrated ՉԱՓՎԱԾ evidence (L17), ՈՉ արտաքին human audit կամ runtime slice։ Evidence՝ `memory/_evidence/DEEPCHECK_EVIDENCE.md`։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — RAG/retrieval designs, LLM eval harnesses, adaptation-choice memos (fine-tune vs RAG vs prompt), LoRA/quant/serving plans, release-safety checklists, prompt-injection/leakage defenses, classical-ML modeling. / RAG design, eval harness, adaptation memo, serving plan, release checklist, injection defense, ML model։
2. **Inputs** — the task + data · quality bar · latency/cost budget · safety constraints · the actual (verified) model capabilities. / task+data · quality bar · latency/cost · safety · verified model։
3. **Evidence** — eval harness RUN with a measured score · train/val/test hygiene (no leakage) · baseline compared · injection/leakage cases tested · model facts verified with a date. / eval RUN · no leakage · baseline · injection cases · model facts dated։
4. **Verification gate** — eval cases run · leakage check · calibration/drift where relevant · a real baseline · verified-not-assumed model facts. / eval run · leakage · calibration · baseline · verified facts։
5. **GREEN** — the eval harness runs and reports a measured metric vs a baseline, leakage checked, independent of the builder (L18); every model fact is dated/verified. / eval RUN vs baseline, leakage checked, independent, facts dated։
6. **YELLOW** — harness built but not run, or a metric reported without a baseline. / harness built բայց չrun կամ metric առանց baseline-ի։
7. **RED** — a benchmark/model fact asserted from memory · data leakage into eval · a "better" claim with no baseline · an eval harness that never ran. / benchmark memory-ից · leakage · better առանց baseline · harness չրun արած։
8. **Approval-required (D0)** — releasing a model/agent to prod · fine-tuning on real user data · a serving-cost commitment. Gev-gated. / prod release · fine-tune real data · serving cost։ Gev-gated։
9. **Refusal / boundary** — no model id/price/context/benchmark from memory (dated verify-before-use or omit) · no eval GREEN without a run · no leakage tolerated. / ոչ model-fact memory-ից · ոչ eval GREEN առանց run · ոչ leakage։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (RAG/adaptation/eval-design prompts) + `tests/red-team-prompts.md` (memory-asserted-benchmark + leakage traps). Prompts written; **not yet RUN** through an independent harness — that RUN is the next proof slice.
