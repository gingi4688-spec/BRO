# AI, ML Engineering, and LLMOps patterns

## English

These are canonical AI, ML, and LLMOps moves. Each is a mechanism for one of the domain's artifacts (RAG design, adaptation-choice memo, eval harness, quantization/serving plan, release checklist, classical-ML modeling plan). Choose the move that changes the next decision, not the nicest label.

### 1. RAG failure triage

- **Trigger:** Answers cite wrong or missing knowledge, or hallucinate facts that should be retrievable.
- **Mechanism:** Walk the chain in order — ingestion/checksum → chunk boundary → metadata filter → embedding recall → rerank cutoff → context packing → generation instruction. Test by asking: does the correct document appear in retrieval top ~20, then survive rerank into top ~5? Measure recall@k on the golden set at each stage and fix the earliest failing stage, not the model.
- **Do not use when:** The task is a pure style classifier or a deterministic formatter with no knowledge lookup.
- **Failure repair:** If the correct source is absent from top 20, raise retrieval recall or metadata quality; if present at 20 but lost after rerank, tune the reranker or cutoff; if present in context but absent from the answer, repair the synthesis prompt.

### 2. Adaptation choice matrix

- **Trigger:** The team is choosing between prompt, RAG, tools, LoRA, full fine-tune, or a combination.
- **Mechanism:** Score five axes — fact volatility, behavior/format change, data volume, latency/cost, and rollback path. Changing facts push to RAG/tools; a stable output style with examples pushes to LoRA; deterministic math or database state pushes to tools. Name the cheapest reversible experiment first (usually a prompt or RAG change before any training), and state how each option rolls back.
- **Do not use when:** A simple prompt rewrite already solves it with no state or learning.
- **Failure repair:** If the plan trains on policy facts, move those facts into retrieval; if it reaches for tools to fix style, use prompting or adapter data instead; if it fine-tunes first, demand the cheaper reversible experiment be tried and measured first.

### 3. Eval slice board

- **Trigger:** The average score improved but launch risk is unclear.
- **Mechanism:** Build slices by task, language, ambiguity, freshness, refusal boundary, document family, and high-value workflow. For each slice set a pass threshold, a sample count, and an owner; one severe safety or freshness regression vetoes the aggregate. Add judge calibration: compare any LLM-as-judge score to human labels on a sample before trusting automation.
- **Do not use when:** It is a disposable demo that will never reach users.
- **Failure repair:** If a slice has too few examples, mark it insufficient rather than hide it in the average; if the judge is uncalibrated, calibrate it against human labels before it gates anything.

### 4. Untrusted-context injection defense

- **Trigger:** The model reads retrieved documents, tool outputs, or pasted/user content, especially in an agent that can take actions.
- **Mechanism:** Treat every retrieved/tool/pasted string as untrusted **data**, never instructions. Keep system rules in the trusted system prompt; structurally isolate untrusted text (delimit, label, optionally strip instruction-like spans). Gate any high-privilege action (send, delete, pay, escalate) behind explicit confirmation, and constrain tool scopes to least privilege. Add adversarial injection cases to the eval set so the defense is measured, not assumed.
- **Do not use when:** All context is fully trusted and the model takes no privileged actions — but verify that assumption before relying on it.
- **Failure repair:** If an injection succeeds (the model obeyed retrieved text or exfiltrated data), treat it as a reportable incident: isolate the source, add the case to the eval set, and tighten the confirmation gate and tool scopes.

### 5. Quantization / serving replay

- **Trigger:** A model is being quantized (GPTQ/AWQ/int8/int4) or its serving path (KV-cache, batching, paged attention) is being tuned for cost/latency.
- **Mechanism:** Before shipping, replay the exact evaluation suite on the quantized/served path — not a subset, not the calibration set. Check the int4/int8 cliff specifically on long prompts, code, Armenian, and rare tool traces the calibration set may have missed. Reason about KV-cache memory (roughly linear in context length, eased by paged attention, prefix caching, MQA/GQA) and keep a fallback to the higher-precision model behind a quality threshold.
- **Do not use when:** Quality margin is razor-thin and the workload is safety-critical — then prefer a smaller-but-full-precision model or more serving budget over an aggressive quantization.
- **Failure repair:** If a quantized model shipped on the size win alone, replay the full suite now, gate on the slices that regressed, and route traffic back to the fallback until the cliff is closed.

### 6. Classical-ML leakage & calibration audit

- **Trigger:** A non-LLM model is being trained/evaluated, or an offline metric looks suspiciously good.
- **Mechanism:** Fix the split before touching data — train/val/test, grouped when rows share an entity, temporal when predicting the future. Beat a trivial baseline (majority class, last value, simple rule). Hunt leakage: drop any feature available only after the prediction moment, confirm no entity spans train and test, and fit all normalization/encoders on train only. When a probability drives a decision, check calibration (reliability curve, Brier), not only ranking (AUC). Tie a drift monitor and refresh trigger to feature and concept drift.
- **Do not use when:** The output is never used as a probability or threshold and is purely a ranked list with no decision attached — calibration matters less, but leakage and the split still do.
- **Failure repair:** If the metric is "too good," assume leakage first: re-split (grouped/temporal), remove post-outcome features, refit encoders on train, and re-measure against the baseline before trusting any number.

## Հայերեն

Սրանք canonical AI, ML, and LLMOps move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (RAG design, adaptation-choice memo, eval harness, quantization/serving plan, release checklist, classical-ML modeling plan)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. RAG-ի խափանման ախտորոշում

- **Երբ է պետք․** Պատասխանը սխալ կամ բացակա source է cite անում, կամ հալյուցինացնում է փաստեր, որ պետք է retrievable լինեն։
- **Մեխանիզմը․** Շղթան ստուգիր հերթով — ingestion/checksum → chunk boundary → metadata filter → embedding recall → rerank cutoff → context packing → generation instruction։ Test արա հարցով․ ճիշտ document-ը կա՞ retrieval top ~20-ում, հետո վերապրու՞մ է rerank-ը մինչ top ~5։ Measure արա recall@k golden set-ի վրա ամեն stage-ին և շտկիր ամենավաղ failing stage-ը, ոչ model-ը։
- **Երբ չօգտագործել․** Task-ը մաքուր style classifier է կամ deterministic formatter՝ առանց knowledge lookup-ի։
- **Ուղղում․** Եթե ճիշտ source-ը top 20-ում չկա, բարձրացրու retrieval recall-ը կամ metadata quality-ն. եթե 20-ում կա, բայց rerank-ից հետո կորել է, tune արա reranker-ը կամ cutoff-ը. եթե context-ում կա, բայց answer-ում չկա, շտկիր synthesis prompt-ը։

### 2. Adaptation-ի ընտրության մատրիցա

- **Երբ է պետք․** Թիմը ընտրում է prompt, RAG, tool, LoRA, full fine-tune կամ համակցության միջև։
- **Մեխանիզմը․** Գնահատիր հինգ առանցք — fact volatility, behavior/format change, data volume, latency/cost և rollback path։ Փոփոխվող փաստերը տանում են դեպի RAG/tool. stable output style-ը օրինակներով՝ դեպի LoRA. deterministic math-ը կամ database state-ը՝ դեպի tool։ Անվանի՛ր ամենաէժան շրջելի փորձը առաջինը (սովորաբար prompt կամ RAG փոփոխություն՝ նախքան որևէ training), և նշիր, թե ինչպես է ամեն option-ը rollback անում։
- **Երբ չօգտագործել․** Պարզ prompt rewrite-ը արդեն լուծում է առանց state-ի կամ learning-ի։
- **Ուղղում․** Եթե plan-ը policy fact է train անում, այդ փաստերը տեղափոխիր retrieval. եթե style-ի համար tool է փնտրում, օգտագործիր prompt կամ adapter data. եթե նախ fine-tune է անում, պահանջիր, որ ավելի էժան շրջելի փորձը նախ փորձվի և չափվի։

### 3. Eval slice board

- **Երբ է պետք․** Average score-ը բարձրացել է, բայց launch-ի ռիսկը պարզ չէ։
- **Մեխանիզմը․** Կառուցիր slice-եր ըստ task-ի, language-ի, ambiguity-ի, freshness-ի, refusal boundary-ի, document family-ի և high-value workflow-ի։ Ամեն slice-ի համար սահմանիր pass threshold, sample count և owner. մեկ ծանր safety կամ freshness regression veto է անում aggregate-ը։ Ավելացրու judge calibration․ ցանկացած LLM-as-judge score համեմատիր human label-ի հետ sample-ի վրա մինչ automation-ին վստահելը։
- **Երբ չօգտագործել․** Disposable demo է, որ երբեք user-ի մոտ չի գնալու։
- **Ուղղում․** Եթե slice-ը քիչ օրինակ ունի, գրիր insufficiency, ոչ թե թաքցրու average-ի մեջ. եթե judge-ը uncalibrated է, calibrate արա human label-ի դեմ մինչ որևէ բան gate անելը։

### 4. Անվստահելի-context-ի injection-ի պաշտպանություն

- **Երբ է պետք․** Model-ը կարդում է retrieved document, tool output կամ pasted/user content, հատկապես agent-ում, որ կարող է action անել։
- **Մեխանիզմը․** Ամեն retrieved/tool/pasted string համարիր անվստահելի **data**, երբեք instruction։ System rule-ները պահիր trusted system prompt-ում. structurally մեկուսացրու անվստահելի text-ը (delimit, label, ընտրովի strip արա instruction-like span-երը)։ Ցանկացած high-privilege action (send, delete, pay, escalate) gate արա հստակ confirmation-ի հետևում, և tool scope-երը սահմանափակիր least privilege-ի։ Ավելացրու adversarial injection case-եր eval set-ին, որ պաշտպանությունը չափվի, ոչ ենթադրվի։
- **Երբ չօգտագործել․** Ամբողջ context-ը լրիվ trusted է, և model-ը privileged action չի անում — բայց ստուգիր այդ ենթադրությունը մինչ դրա վրա հենվելը։
- **Ուղղում․** Եթե injection-ը հաջողվեց (model-ը հնազանդվեց retrieved text-ին կամ data exfiltrate արեց), համարիր reportable incident․ մեկուսացրու source-ը, ավելացրու case-ը eval set-ին, և խստացրու confirmation gate-ը և tool scope-երը։

### 5. Quantization / serving replay

- **Երբ է պետք․** Model-ը quantize է լինում (GPTQ/AWQ/int8/int4), կամ serving path-ը (KV-cache, batching, paged attention) tune է լինում cost/latency-ի համար։
- **Մեխանիզմը․** Ship-ից առաջ replay արա ճշգրիտ evaluation suite-ը quantized/served path-ի վրա — ոչ subset, ոչ calibration set։ Ստուգիր int4/int8 cliff-ը հատկապես երկար prompt-ի, code-ի, հայերենի և հազվադեպ tool trace-ի վրա, որ calibration set-ը գուցե բաց թողեց։ Դատիր KV-cache memory-ի մասին (մոտավորապես գծային context length-ով, մեղմացված paged attention-ով, prefix caching-ով, MQA/GQA-ով) և պահիր fallback դեպի ավելի բարձր precision-ի model՝ quality threshold-ի հետևում։
- **Երբ չօգտագործել․** Quality margin-ը շատ բարակ է, և workload-ը safety-critical է — ապա նախընտրիր ավելի փոքր-բայց-full-precision model կամ ավելի շատ serving budget, քան aggressive quantization։
- **Ուղղում․** Եթե quantized model-ը ship-ված է միայն size-ի շահով, replay արա ամբողջ suite-ը հիմա, gate արա regress-ած slice-երի վրա, և traffic-ը հետ ուղղիր fallback-ին, մինչ cliff-ը փակվի։

### 6. Classical-ML leakage և calibration audit

- **Երբ է պետք․** Ոչ-LLM model է train/evaluate-վում, կամ offline metric-ը կասկածելիորեն լավ է երևում։
- **Մեխանիզմը․** Ֆիքսիր split-ը մինչ data-ին դիպչելը — train/val/test, grouped՝ երբ row-երը entity են կիսում, temporal՝ երբ ապագան է կանխատեսվում։ Հաղթիր trivial baseline-ին (majority class, last value, պարզ rule)։ Որսա leakage. drop արա ցանկացած feature, որ հասանելի է միայն prediction moment-ից հետո, հաստատիր, որ ոչ մի entity չի ընկնում և՛ train, և՛ test, և fit արա ամբողջ normalization/encoder-ը միայն train-ի վրա։ Երբ probability-ն driving է որոշում, ստուգիր calibration-ը (reliability curve, Brier), ոչ միայն ranking-ը (AUC)։ Կապիր drift monitor և refresh trigger feature և concept drift-ին։
- **Երբ չօգտագործել․** Output-ը երբեք probability կամ threshold չի օգտագործվում և մաքուր ranked list է՝ առանց որոշման — calibration-ը պակաս կարևոր է, բայց leakage-ը և split-ը՝ դեռ։
- **Ուղղում․** Եթե metric-ը «չափազանց լավ» է, նախ ենթադրիր leakage․ re-split արա (grouped/temporal), հեռացրու post-outcome feature-ները, refit արա encoder-ները train-ի վրա, և re-measure արա baseline-ի դեմ մինչ որևէ թվի վստահելը։
