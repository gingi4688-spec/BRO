# ai-ml-engineering-llmops — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: DECLARED.** Contract complete and anchored to this skill's `domain-rubric.md` + `tests/`; harness/eval code inherits the **PROVEN Code adapter** (CODESLICE-001) pattern. **Not PROVEN:** no independent ML/eval-harness run yet (L15/L18). Next proof slice: reuse the Code adapter on an ML/eval slice (a real eval harness run + leakage check). **Never assert a model id / context window / price / benchmark from memory** — dated verify-before-use or omitted.
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ DECLARED։** Contract-ը լրիվ է, eval code-ը ժառանգում է PROVEN Code adapter-ի pattern-ը։ **Ոչ PROVEN․** անկախ ML/eval-harness դեռ չի վազել։ Model-ի fact-երը երբեք memory-ից՝ verify-before-use։

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
