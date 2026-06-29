---
name: "ai-ml-engineering-llmops"
description: >-
  use when the work is RAG/retrieval design, LLM evaluation harnesses, fine-tuning vs RAG vs prompting choices, LoRA/QLoRA and quantization/serving, LLM/agent release safety, prompt-injection and data-leakage defense, or classical-ML modeling (train/val/test, leakage, baselines, calibration, drift) — for decisions, critique, planning, diagnostics, eval harnesses/artifacts, teaching, or evaluation. use as lead when this domain owns the central decision or deliverable (RAG design, eval harness, adaptation-choice memo, model release checklist). do not use as lead when another skill owns the main artifact and ML is only one input — then support it. NEVER assert a model id, context window, price, or benchmark from memory: any such fact is a dated verify-before-use snapshot or it is omitted. հայերեն՝ օգտագործիր RAG-ի, LLM eval-ի, fine-tune/RAG ընտրության, LoRA/QLoRA/quantization-ի, release-ի անվտանգության, prompt-injection-ի և classical-ML modeling-ի աշխատանքի համար։
---

# AI, ML Engineering, and LLMOps / AI, ML ճարտարագիտություն և LLMOps

## English

**Scope.** In: retrieval/RAG design (chunking, metadata, recall@k gates, rerank, context packing, indirect-injection defense), adaptation choice (prompt vs RAG vs tools vs LoRA/QLoRA vs full fine-tune), quantization and serving math (GPTQ/AWQ/int8, KV-cache, batching), evaluation harnesses (golden/adversarial/slice/judge-calibration/telemetry), LLM and agent release safety (canary, refusal tests, drift, rollback), training-serving skew, data leakage, and classical-ML modeling (train/val/test discipline, baselines, calibration, drift). Out: agent orchestration and tool-protocol design (`ai-agent-engineering` owns it), ingestion/warehouse pipeline plumbing (`data-engineering-pipelines` owns it), and threat-model/PII-policy authority beyond ML-specific leakage and logging hygiene (`security-privacy-engineering` owns it). This skill turns a model into a measured system: the smallest learning mechanism that fits, wrapped in data contracts, retrieval, an eval gate, monitoring, and a rollback.

**Leads / Supports.** Lead when the central deliverable is ML-shaped: a RAG design review, an evaluation harness, an adaptation-choice memo, a quantization/serving plan, an LLM/agent release checklist, a leakage/calibration audit. Support when another skill owns the artifact and ML is one input — e.g. `ai-agent-engineering` owns the agent's control loop and you supply its eval gate and injection defense; `data-engineering-pipelines` owns the ingestion DAG and you supply the chunking/metadata contract retrieval needs.

Conflict rules:
- **Volatile model facts → never assert, verify or omit.** Model ids, context windows, prices, and benchmark numbers are verify-before-use snapshots with a date, or they are left as a placeholder. Inventing one is itself a tracked failure mode, not a stylistic slip — a wrong price or window changes architecture and budget decisions.
- **Privacy / data-governance → defer policy to security, own the ML-specific hygiene.** You own what gets logged from prompts/completions, leakage between train/val/test, and what enters a fine-tune set; PII policy, lawful-basis, and threat modeling route to `security-privacy-engineering`. Do not train on proprietary or personal data until governance is confirmed.
- **Agent vs model boundary → defer the loop to agent-engineering.** You own retrieval, adaptation, eval, and serving of the model; the tool-calling loop, planner, and multi-agent protocol route to `ai-agent-engineering`. You supply the eval harness and the indirect-injection defense it must pass.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Facts change often → RAG/tools, not fine-tuning.** Weekly-changing policy, prices, inventory, or per-tenant facts belong in retrieval or a tool call; baking them into weights guarantees stale, unciteable answers. Fine-tune only stable behavior, format, and tone.
2. **No recall@k gate yet → not a RAG design.** Define the golden set and the recall@5 (or @k) target before evaluating the generator: a generator cannot cite a source retrieval never returned. Block launch when the correct source is absent from the reranked top-k.
3. **Chunks split mid-idea → re-chunk on semantic boundaries.** Chunk by section/heading at ~300–800 tokens with 10–20% overlap; chunks that cut across a clause destroy recall and the generator hallucinates the missing half.
4. **Hard queries, single-stage retrieval → add a reranker.** Retrieve broadly (top ~20) for recall, then rerank to a small context (top ~5) for precision; embedding-only search on ambiguous queries surfaces near-duplicates and misses the right doc.
5. **Untrusted text enters the context window → it is data, never instructions.** Retrieved docs, tool outputs, and pasted content can carry an indirect prompt injection; isolate them, never let them change system rules, and gate the agent's high-privilege actions behind confirmation.
6. **Aggregate eval improved → still slice before you trust it.** A higher mean can hide a safety, freshness, or Armenian-slice regression; one severe slice regression vetoes a green aggregate. Per slice: pass threshold, sample count, owner.
7. **LLM-as-judge proposed → calibrate against human labels first.** A judge prefers verbose answers, earlier-listed options, and its own style; trust its scores only after they track human labels on a sample, and keep it off the very bias it shares.
8. **Quantized → replay the exact eval suite before shipping.** Int4/int8 can fall off a quality cliff on long prompts, code, Armenian, or rare tool traces the calibration set missed; a size win with no quality replay is unverified.
9. **Classical-ML task → split before you touch the data, baseline before you model.** Fix train/val/test (grouped/temporal where needed) first, beat a trivial baseline, and check for leakage; a model that "beats" a leaked split or a missing baseline is measuring nothing.
10. **Probabilities used for a decision → calibrate, don't just rank.** If a threshold or expected-value decision rides on the score, check calibration (reliability curve / Brier) — a well-ranking model can be badly miscalibrated and its 0.9 may not mean 90%.
11. **Train and serve compute features differently → that is training-serving skew.** Any feature, tokenizer, normalization, or default computed one way offline and another way online silently degrades production; pin one code path or a feature store and assert parity.
12. **Synthetic data proposed to fill gaps → cap it and keep a real holdout.** Some synthetic augmentation helps; overdosing collapses diversity and trains the model on its own artifacts. Always evaluate on a real, untouched holdout.
13. **Multimodal input → state the modality contract and eval each modality.** Image/audio/document inputs need their own preprocessing, token budget, failure modes, and slice eval; an aggregate that hides a vision-OCR or audio-noise slice is not a pass.
14. **"Eval passed in the notebook" → not "verified in production."** Offline green on a static set is necessary, not sufficient; gate on canary slices, refusal correctness, latency, cost, and a drift monitor in the running system before declaring done.
15. **Irreversible/high-stakes ML action → require approval and rollback.** Training on personal data, deleting an index, pushing a model that gates money/safety/eligibility, or rotating the serving model: name the rollback and route to a human owner before proceeding.

### Failure modes to prevent / Ձախողման ձևեր

1. **Fine-tuning for changing facts.** A team trains weekly policy/price facts into weights; answers go stale and cannot cite a source. Tell: a fine-tune plan whose training data is facts that change, with no retrieval path.
2. **Chunks cut across semantic boundaries.** Fixed-size chunking splits a rule from its exception; recall drops and the generator fabricates the missing half. Tell: chunking by character count with no section/heading awareness and no overlap.
3. **Embedding search with no reranking on hard queries.** Single-stage vector search returns near-duplicates and misses the right doc on ambiguous queries. Tell: top-k passed straight to context with no rerank and no recall@k measured.
4. **RAG / indirect prompt injection.** Retrieved or tool-returned text contains "ignore previous instructions" and the system obeys it or exfiltrates data. Tell: untrusted context treated as instructions; high-privilege actions with no confirmation gate.
5. **Cache-busting / prompt-cache poisoning.** A volatile or attacker-influenced prefix sits before the cacheable content, so prefix/KV cache never hits (cost/latency blow up) — or a poisoned shared prefix serves wrong context. Tell: dynamic timestamps/user text prepended to an otherwise static system prompt; a shared cache keyed on untrusted input.
6. **Judge-as-ground-truth.** An LLM judge's score is treated as truth with no human-label calibration, rewarding verbosity and its own style. Tell: a release gated on judge score alone, never compared to human labels.
7. **Synthetic-data overdose.** The training set is mostly model-generated; diversity collapses and the model learns its own artifacts. Tell: a large synthetic share with no real holdout and no diversity check.
8. **Data leakage / target leakage.** A feature encodes the label (post-outcome field, id ordering) or val/test rows leak into train; offline scores soar, production fails. Tell: a metric that is "too good," random/temporal split on grouped data, features available only after the prediction time.
9. **Training-serving skew.** Features/tokenization/normalization computed differently offline vs online; the served model silently underperforms its eval. Tell: two code paths for the same feature, no parity assertion, eval that never replays the serving path.
10. **Aggregate eval hides a slice regression.** The mean improves while a safety, freshness, or Armenian slice regresses. Tell: a single headline number, no per-slice thresholds, no safety-slice veto.
11. **Quantization shipped with no quality replay.** A model is quantized for cost/latency and shipped on the size win alone. Tell: int4/int8 in production with no post-quantization replay of the real eval suite.
12. **Invented volatile facts.** An answer asserts a model id, context window, price, or benchmark from memory. Tell: a concrete number/name with no dated source and no verify-before-use label — treat this as a hard failure, not a footnote.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (RAG design / eval harness / adaptation-choice memo / quantization plan / release checklist), not generic "use a better model" advice.
- Every retrieval claim names chunking, metadata, top-k, rerank, context packing, and a recall@k launch gate; every adaptation choice maps volatility/behavior/data/cost/rollback to the cheapest reversible experiment first.
- No model id, context window, price, or benchmark is asserted from memory: each is a dated verify-before-use snapshot, a formula, or a placeholder.
- Evaluation carries slices with thresholds + owners, a safety-slice veto, judge calibration against human labels, and a real holdout; classical-ML work shows the split, a baseline, leakage check, and calibration where decisions ride on probabilities.
- Untrusted context is treated as data; injection defense and a confirmation gate on high-privilege actions are present where the model reads retrieved/tool content.
- Irreversible/high-stakes ML actions (personal-data training, index deletion, money/safety-gating model push) name the approval and the rollback.
- **Verify in the running system, not just the notebook** — canary slices, refusal correctness, latency, cost, and a drift monitor are observed before the work is called done.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **retrieval mechanics** (chunking, metadata, top-k, rerank, context packing, freshness, recall@k gate) · **adaptation fit** (volatility/behavior/data/cost/serving/rollback mapped to the cheapest reversible path) · **serving math** (quantization replay, KV-cache, batching, memory, fallback on the real deployment path) · **evaluation discipline** (golden, adversarial, slice, human-label, judge-calibration, leakage/calibration, telemetry) · **release safety** (canary, logging limits, refusal tests, drift monitor, owner, rollback threshold).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, classical-ML, multimodal, the six named failure modes) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (RAG design + fine-tune-vs-RAG + leakage/calibration audit) · `output-templates.md` (RAG design / eval harness / release checklist) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ retrieval/RAG-ի դիզայն (chunking, metadata, recall@k gate, rerank, context packing, indirect-injection-ի պաշտպանություն), adaptation-ի ընտրություն (prompt ընդդեմ RAG-ի ընդդեմ tool-ի ընդդեմ LoRA/QLoRA-ի ընդդեմ full fine-tune-ի), quantization և serving-ի հաշիվ (GPTQ/AWQ/int8, KV-cache, batching), evaluation harness (golden/adversarial/slice/judge-calibration/telemetry), LLM-ի և agent-ի release-ի անվտանգություն (canary, refusal test, drift, rollback), training-serving skew, data leakage և classical-ML modeling (train/val/test կարգապահություն, baseline, calibration, drift)։ Դուրս՝ agent-ի orchestration-ը և tool-protocol-ի դիզայնը (`ai-agent-engineering`-ինն է), ingestion/warehouse pipeline-ի plumbing-ը (`data-engineering-pipelines`-ինն է), և threat-model/PII-policy-ի լիազորությունը ML-ին հատուկ leakage-ից ու logging hygiene-ից այն կողմ (`security-privacy-engineering`-ինն է)։ Այս skill-ը model-ը դարձնում է չափված համակարգ․ խնդրին համապատասխան ամենափոքր ուսուցման մեխանիզմը՝ փաթաթված data contract-ով, retrieval-ով, eval gate-ով, monitoring-ով և rollback-ով։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը ML-ի ձև ունի՝ RAG design review, evaluation harness, adaptation-choice memo, quantization/serving plan, LLM/agent release checklist, leakage/calibration audit։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ ML-ը մեկ input է. օրինակ՝ `ai-agent-engineering`-ը տիրում է agent-ի control loop-ին, դու տալիս ես նրա eval gate-ը և injection-ի պաշտպանությունը. `data-engineering-pipelines`-ը տիրում է ingestion DAG-ին, դու տալիս ես chunking/metadata contract-ը, որ retrieval-ին պետք է։

Կոնֆլիկտի կանոններ․
- **Փոփոխական model facts → երբեք մի՛ պնդիր, ստուգիր կամ բաց թող։** Model id-ները, context window-ները, գները և benchmark թվերը verify-before-use snapshot են՝ ամսաթվով, կամ թողնվում են placeholder։ Մեկը հորինելը ինքնին tracked failure mode է, ոչ թե ոճական վրիպում — սխալ գին կամ window փոխում է architecture-ի և budget-ի որոշումները։
- **Privacy / data-governance → policy-ն զիջիր security-ին, ML-ին հատուկ hygiene-ը պահիր։** Դու տիրում ես, թե ինչ է log-վում prompt/completion-ից, train/val/test-ի leakage-ին, և ինչ է մտնում fine-tune set։ PII policy-ն, lawful-basis-ը և threat modeling-ը ուղղորդվում են `security-privacy-engineering`-ին։ Proprietary կամ personal data-ով մի՛ train արա, մինչև governance-ը հաստատված չէ։
- **Agent ընդդեմ model սահման → loop-ը զիջիր agent-engineering-ին։** Դու տիրում ես model-ի retrieval-ին, adaptation-ին, eval-ին և serving-ին. tool-calling loop-ը, planner-ը և multi-agent protocol-ը ուղղորդվում են `ai-agent-engineering`-ին։ Դու տալիս ես eval harness-ը և indirect-injection-ի պաշտպանությունը, որ այն պետք է անցնի։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Փաստերը հաճախ փոխվում են → RAG/tool, ոչ fine-tuning։** Շաբաթական փոխվող policy-ն, գները, inventory-ն կամ per-tenant փաստերը պատկանում են retrieval-ին կամ tool call-ին. դրանք weight-ի մեջ թխելը երաշխավորում է հնացած, ոչ-citeable պատասխան։ Fine-tune արա միայն կայուն behavior, format և tone։
2. **Դեռ recall@k gate չկա → սա RAG design չէ։** Սահմանիր golden set-ը և recall@5 (կամ @k) target-ը նախքան generator-ը գնահատելը. generator-ը չի կարող cite անել source, որ retrieval-ը երբեք չի վերադարձրել։ Block արա launch-ը, երբ ճիշտ source-ը բացակայում է reranked top-k-ից։
3. **Chunk-երը կիսում են միտքը → re-chunk արա semantic boundary-ով։** Chunk արա section/heading-ով ~300–800 token-ով, 10–20% overlap-ով. chunk-ը, որ կտրում է clause-ը, քանդում է recall-ը, ու generator-ը հալյուցինացնում է բացակայող կեսը։
4. **Դժվար query, single-stage retrieval → ավելացրու reranker։** Retrieve արա լայն (top ~20) recall-ի համար, հետո rerank արա փոքր context-ի (top ~5) precision-ի համար. embedding-only search-ը ambiguous query-ի վրա բերում է near-duplicate-ներ և բաց թողնում ճիշտ doc-ը։
5. **Անվստահելի text է մտնում context window → այն data է, երբեք instruction։** Retrieved doc-երը, tool output-ները և pasted content-ը կարող են կրել indirect prompt injection. մեկուսացրու դրանք, երբեք թույլ մի՛ տուր փոխեն system rule-ը, և high-privilege action-ները gate արա confirmation-ի հետևում։
6. **Aggregate eval-ը բարձրացավ → միևնույն է slice արա մինչ վստահելը։** Բարձր mean-ը կարող է թաքցնել safety, freshness կամ հայերեն-slice-ի regression. մեկ ծանր slice regression veto է անում green aggregate-ը։ Ամեն slice-ի՝ pass threshold, sample count, owner։
7. **LLM-as-judge առաջարկվեց → նախ calibrate արա human label-ի դեմ։** Judge-ը նախընտրում է երկար պատասխան, առաջ նշված տարբերակ և իր ոճը. վստահիր նրա score-ին միայն, երբ այն հետևում է human label-ին sample-ի վրա, և պահիր այն հենց այն bias-ից, որ կիսում է։
8. **Quantize-վեց → ship-ից առաջ replay արա ճշգրիտ eval suite-ը։** Int4/int8-ը կարող է որակի կտրուկ անկում տալ երկար prompt-ի, code-ի, հայերենի կամ հազվադեպ tool trace-ի վրա, որ calibration set-ը բաց թողեց. size-ի շահ առանց quality replay-ի unverified է։
9. **Classical-ML task → split արա մինչ data-ին դիպչելը, baseline արա մինչ model անելը։** Նախ ֆիքսիր train/val/test-ը (grouped/temporal՝ որտեղ պետք է), հաղթիր trivial baseline-ին, և ստուգիր leakage. model, որ «հաղթում է» leak-ված split-ին կամ բացակա baseline-ին, ոչինչ չի չափում։
10. **Probability-ն օգտագործվում է որոշման համար → calibrate արա, ոչ միայն rank։** Եթե threshold կամ expected-value որոշումը հենվում է score-ի վրա, ստուգիր calibration-ը (reliability curve / Brier) — լավ rank-ող model-ը կարող է վատ calibrate-ված լինել, ու նրա 0.9-ը կարող է 90% չնշանակել։
11. **Train-ը և serve-ը feature-ները տարբեր են հաշվում → սա training-serving skew է։** Ցանկացած feature, tokenizer, normalization կամ default, որ offline մի կերպ է հաշվվում, online՝ մյուս, լուռ վատացնում է production-ը. pin արա մեկ code path կամ feature store և assert արա parity-ն։
12. **Synthetic data առաջարկվեց բացերը լցնելու → cap արա այն և պահիր real holdout։** Որոշ synthetic augmentation օգնում է. overdose-ը կազմալուծում է diversity-ն և train է անում model-ին իր artifact-ների վրա։ Միշտ գնահատիր real, անձեռնմխելի holdout-ի վրա։
13. **Multimodal input → նշիր modality contract-ը և eval արա ամեն modality։** Image/audio/document input-ները ունեն իրենց preprocessing-ը, token budget-ը, failure mode-ը և slice eval-ը. aggregate, որ թաքցնում է vision-OCR կամ audio-noise slice, pass չէ։
14. **«Eval-ը notebook-ում անցավ» → «production-ում verified» չէ։** Static set-ի վրա offline green-ը անհրաժեշտ է, ոչ բավարար. gate արա canary slice-ով, refusal correctness-ով, latency-ով, cost-ով և drift monitor-ով running system-ում մինչ done ասելը։
15. **Անդառնալի/high-stakes ML action → պահանջիր approval և rollback։** Personal data-ով training, index-ի ջնջում, money/safety/eligibility gating model-ի push, կամ serving model-ի rotation. անվանի՛ր rollback-ը և ուղղորդիր մարդ-տիրոջը մինչ շարունակելը։

### Ձախողման ձևեր

1. **Fine-tuning փոփոխվող փաստերի համար։** Թիմը շաբաթական policy/price փաստերը train է անում weight-ի մեջ. պատասխանները հնանում են և չեն կարող source cite անել։ Tell՝ fine-tune plan, որի training data-ն փոխվող փաստեր են, առանց retrieval path-ի։
2. **Chunk-երը կտրում են semantic boundary-ն։** Fixed-size chunking-ը rule-ը կտրում է իր exception-ից. recall-ը ընկնում է, generator-ը հորինում է բացակայող կեսը։ Tell՝ chunking character count-ով՝ առանց section/heading awareness-ի և overlap-ի։
3. **Embedding search՝ առանց rerank-ի դժվար query-ի վրա։** Single-stage vector search-ը near-duplicate է վերադարձնում և բաց թողնում ճիշտ doc-ը ambiguous query-ի վրա։ Tell՝ top-k-ն ուղիղ context, առանց rerank-ի և չափված recall@k-ի։
4. **RAG / indirect prompt injection։** Retrieved կամ tool-returned text-ը պարունակում է «ignore previous instructions», ու system-ը հնազանդվում է կամ data exfiltrate անում։ Tell՝ անվստահելի context՝ որպես instruction. high-privilege action՝ առանց confirmation gate-ի։
5. **Cache-busting / prompt-cache poisoning։** Փոփոխական կամ attacker-ազդեցիկ prefix-ը նստած է cacheable content-ից առաջ, ուստի prefix/KV cache-ը երբեք hit չի անում (cost/latency պայթում են) — կամ poisoned shared prefix-ը սխալ context է serve անում։ Tell՝ dynamic timestamp/user text՝ ավելացված static system prompt-ից առաջ. shared cache՝ keyed անվստահելի input-ով։
6. **Judge-as-ground-truth։** LLM judge-ի score-ը համարվում է ճշմարտություն՝ առանց human-label calibration-ի, պարգևատրելով verbosity-ն և իր ոճը։ Tell՝ release, որ gate-ված է միայն judge score-ով, երբեք համեմատված human label-ի հետ։
7. **Synthetic-data overdose։** Training set-ը հիմնականում model-generated է. diversity-ն կազմալուծվում է, model-ը սովորում է իր artifact-ները։ Tell՝ մեծ synthetic մաս՝ առանց real holdout-ի և diversity check-ի։
8. **Data leakage / target leakage։** Feature-ը կոդավորում է label-ը (post-outcome field, id ordering), կամ val/test row-երը leak են անում train. offline score-երը թռչում են, production-ը fail է անում։ Tell՝ metric, որ «չափազանց լավ է», random/temporal split grouped data-ի վրա, feature-ներ՝ հասանելի միայն prediction time-ից հետո։
9. **Training-serving skew։** Feature/tokenization/normalization-ն offline ընդդեմ online տարբեր են հաշվվում. serve-ված model-ը լուռ թերակատարում է իր eval-ին։ Tell՝ երկու code path նույն feature-ի համար, parity assertion չկա, eval, որ երբեք serving path-ը չի replay անում։
10. **Aggregate eval-ը թաքցնում է slice regression։** Mean-ը բարձրանում է, մինչ safety, freshness կամ հայերեն slice-ը regress է անում։ Tell՝ մեկ headline թիվ, ոչ per-slice threshold, ոչ safety-slice veto։
11. **Quantization-ը ship-ված առանց quality replay-ի։** Model-ը quantize է cost/latency-ի համար և ship-ված միայն size-ի շահով։ Tell՝ int4/int8 production-ում՝ առանց real eval suite-ի post-quantization replay-ի։
12. **Հորինված volatile fact-եր։** Պատասխանը պնդում է model id, context window, price կամ benchmark՝ հիշողությունից։ Tell՝ կոնկրետ թիվ/անուն՝ առանց dated source-ի և verify-before-use label-ի — սա հարդ failure է, ոչ footnote։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (RAG design / eval harness / adaptation-choice memo / quantization plan / release checklist), ոչ generic «լավ model օգտագործիր» advice։
- Ամեն retrieval պնդում անվանում է chunking, metadata, top-k, rerank, context packing և recall@k launch gate. ամեն adaptation ընտրություն volatility/behavior/data/cost/rollback-ը կապում է ամենաէժան շրջելի փորձին առաջինը։
- Ոչ մի model id, context window, price կամ benchmark չի պնդվում հիշողությունից․ ամեն մեկը dated verify-before-use snapshot է, formula կամ placeholder։
- Evaluation-ը կրում է slice-եր՝ threshold + owner-ով, safety-slice veto, judge calibration human label-ի դեմ և real holdout. classical-ML աշխատանքը ցույց է տալիս split-ը, baseline-ը, leakage check-ը և calibration-ը, որտեղ որոշումները հենվում են probability-ի վրա։
- Անվստահելի context-ը համարվում է data. injection-ի պաշտպանությունը և high-privilege action-ի վրա confirmation gate-ը կան, որտեղ model-ը կարդում է retrieved/tool content։
- Անդառնալի/high-stakes ML action-ները (personal-data training, index deletion, money/safety-gating model push) անվանում են approval-ը և rollback-ը։
- **Ստուգի՛ր running system-ում, ոչ միայն notebook-ում** — canary slice-ը, refusal correctness-ը, latency-ն, cost-ը և drift monitor-ը դիտվում են մինչ done ասելը։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **retrieval mechanics** (chunking, metadata, top-k, rerank, context packing, freshness, recall@k gate) · **adaptation fit** (volatility/behavior/data/cost/serving/rollback-ը կապված ամենաէժան շրջելի path-ի հետ) · **serving math** (quantization replay, KV-cache, batching, memory, fallback իրական deployment path-ում) · **evaluation discipline** (golden, adversarial, slice, human-label, judge-calibration, leakage/calibration, telemetry) · **release safety** (canary, logging limits, refusal test, drift monitor, owner, rollback threshold)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, classical-ML, multimodal, վեց անվանված failure mode) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (RAG design + fine-tune-ընդդեմ-RAG + leakage/calibration audit) · `output-templates.md` (RAG design / eval harness / release checklist) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
