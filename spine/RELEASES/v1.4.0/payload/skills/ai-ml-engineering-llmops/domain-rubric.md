# AI, ML Engineering, and LLMOps domain rubric

## English

Use this rubric before finalizing a RAG design, adaptation-choice memo, evaluation harness, quantization/serving plan, release checklist, or classical-ML modeling plan. A score of 5 requires the mechanism, the evidence, and a checkable domain artifact — not vocabulary.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Retrieval mechanics | Says "use vectors." | Has chunks and metadata but no recall gate. | Specifies chunking, metadata, top-k, rerank, context packing, freshness, and a recall@k launch gate; treats injected context as untrusted data. |
| Adaptation fit | Fine-tuning is the default answer. | Compares prompt/RAG/tuning at a high level. | Maps volatility, behavior, data, cost, serving, and rollback to the cheapest reversible path, named and tried first. |
| Serving math | Latency/cost are vibes. | Names batching or quantization. | Replays the exact eval after quantization and explains KV-cache, batching, memory, and a fallback on the actual deployment path; no invented prices/windows. |
| Evaluation discipline | One demo answer is accepted. | Golden set exists but gating is weak. | Golden, adversarial, slice, human-label, judge-calibration, leakage/calibration, and telemetry gates all appear; one safety-slice regression can veto. |
| Release safety | No rollback or privacy plan. | A basic canary is named. | Canary, logging limits, refusal tests, drift monitor, owner, and rollback threshold are concrete; irreversible/high-stakes actions route to a human. |

## Հայերեն

Այս rubric-ը կիրառիր RAG design, adaptation-choice memo, evaluation harness, quantization/serving plan, release checklist կամ classical-ML modeling plan վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և domain-ին հատուկ ստուգելի artifact — ոչ vocabulary։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Retrieval-ի մեխանիկա | Միայն ասում է «օգտագործիր vector search»։ | Կան chunk և metadata, բայց recall gate չկա։ | Հստակ են chunking-ը, metadata-ն, top-k-ը, rerank-ը, context packing-ը, freshness-ը և recall@k launch gate-ը. inject-ված context-ը համարում է անվստահելի data։ |
| Adaptation-ի համապատասխանություն | Fine-tuning-ը default պատասխանն է։ | Prompt/RAG/tuning համեմատությունը մակերեսային է։ | Volatility-ն, behavior-ը, data-ն, cost-ը, serving-ը և rollback-ը կապում է ամենաէժան շրջելի path-ի հետ՝ անվանված և առաջինը փորձված։ |
| Serving-ի հաշվարկ | Latency-ն և cost-ը զգացողություն են։ | Մի քանի knob է անվանում։ | Quantization-ից հետո կրկնում է ճշգրիտ eval-ը և բացատրում KV-cache-ը, batching-ը, memory-ն ու fallback-ը իրական deployment path-ում. ոչ մի հորինված price/window։ |
| Evaluation-ի կարգապահություն | Մեկ demo answer-ը բավարար է համարվում։ | Golden set կա, բայց gating-ը թույլ է։ | Կան golden, adversarial, slice, human-label, judge-calibration, leakage/calibration և telemetry gate-եր. մեկ safety-slice regression կարող է veto անել։ |
| Թողարկման անվտանգություն | Rollback կամ privacy plan չկա։ | Canary-ն միայն անվանված է։ | Canary-ն, logging սահմանները, refusal test-երը, drift monitor-ը, owner-ը և rollback threshold-ը կոնկրետ են. անդառնալի/high-stakes action-ները ուղղորդվում են մարդուն։ |
