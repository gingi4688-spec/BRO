# AI, ML Engineering, and LLMOps red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (RAG design, adaptation-choice memo, eval harness, quantization/serving plan, release checklist, classical-ML modeling plan). It extends but never replaces the safety boundaries in `SKILL.md`, `OWNER_NOTES.md`, and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Fine-tuning for changing facts** — do not approve baking weekly/volatile facts into weights; require retrieval/tools with a recall@k gate.
- **RAG with no recall gate** — do not approve a RAG design that evaluates the generator before recall@k on a golden set; a generator cannot cite what retrieval never returned.
- **Single-stage retrieval on hard queries** — do not approve embedding-only search with no rerank and no measured recall@k on ambiguous queries.
- **Untrusted context as instructions** — do not approve a system that lets retrieved/tool/pasted text change rules or trigger high-privilege actions without isolation and a confirmation gate.
- **Cache-busting / poisoned prefix** — do not approve a dynamic/user/timestamp prefix in front of the cacheable content, or a shared cache keyed on untrusted input.
- **Judge-as-ground-truth** — do not approve a release gated on an LLM judge's score with no calibration against human labels.
- **Synthetic-data overdose** — do not approve a mostly-synthetic training set with no real holdout and no diversity check.
- **Data leakage / target leakage** — do not accept a "too good" offline metric; require grouped/temporal split, no post-outcome features, and encoders fit on train only.
- **Training-serving skew** — do not approve a model whose features/tokenization differ between train and serve with no parity assertion.
- **Aggregate hides a slice regression** — do not approve a single headline number; require per-slice thresholds and a safety-slice veto.
- **Quantization with no quality replay** — do not approve a quantized model shipped on the size win without replaying the exact eval suite (incl. long/code/Armenian).
- **Invented volatile facts** — do not allow any asserted model id, context window, price, or benchmark; require dated verify-before-use or a placeholder.
- **Notebook green treated as verified** — do not let an offline eval stand in for canary slices, refusal correctness, latency, cost, and a drift monitor in production.

### Reviewer probes (ask these of any answer)

- Are the facts in this system stable or changing — and does the design route changing facts to retrieval/tools, with fine-tuning reserved for stable behavior only?
- What is the recall@k gate? Is the golden set defined, and is the generator only evaluated after the correct source survives into the reranked top-k?
- On hard/ambiguous queries, is there a reranker (retrieve broad → rerank narrow), and is recall measured before and after it?
- Where does untrusted context enter, is it treated as data rather than instructions, and are high-privilege actions gated behind confirmation? Were injection cases added to the eval set?
- Could a volatile or user-controlled prefix break prompt/KV caching, or could a shared cache be poisoned across a trust boundary?
- If an LLM judge is used, was it calibrated against human labels on a sample, and is it kept off the biases it shares (verbosity, position, self-style)?
- Is any of the training data synthetic, and is there a real untouched holdout plus a diversity check?
- For classical-ML: is the split grouped/temporal where rows are correlated, is a baseline beaten, are there post-outcome/leaky features, and — if a probability drives a decision — is it calibrated, not just ranked?
- Do features/tokenization/normalization match between training and serving, with a parity assertion and a serving-path replay in eval?
- Is the eval sliced with per-slice thresholds and a safety-slice veto, or is it one headline number? Is there an Armenian slice?
- If quantized: was the exact eval suite replayed on the served path (long prompts, code, Armenian), and is a higher-precision fallback kept?
- Did the answer assert any model id, context window, price, or benchmark from memory instead of marking it verify-before-use? Is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (RAG design, adaptation-choice memo, eval harness, quantization/serving plan, release checklist, classical-ML modeling plan)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի, `OWNER_NOTES.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Fine-tuning փոփոխվող փաստերի համար** — մի՛ approve արա շաբաթական/volatile փաստերը weight-ի մեջ թխելը. պահանջիր retrieval/tool՝ recall@k gate-ով։
- **RAG առանց recall gate-ի** — մի՛ approve արա RAG design, որ generator-ը գնահատում է նախքան recall@k golden set-ի վրա. generator-ը չի կարող cite անել, ինչ retrieval-ը երբեք չի վերադարձրել։
- **Single-stage retrieval դժվար query-ի վրա** — մի՛ approve արա embedding-only search՝ առանց rerank-ի և չափված recall@k-ի ambiguous query-ի վրա։
- **Անվստահելի context՝ որպես instruction** — մի՛ approve արա system, որ թույլ է տալիս retrieved/tool/pasted text փոխել rule կամ trigger անել high-privilege action՝ առանց մեկուսացման և confirmation gate-ի։
- **Cache-busting / poisoned prefix** — մի՛ approve արա dynamic/user/timestamp prefix cacheable content-ից առաջ, կամ shared cache՝ keyed անվստահելի input-ով։
- **Judge-as-ground-truth** — մի՛ approve արա release, որ gate-ված է LLM judge-ի score-ով՝ առանց human label-ի դեմ calibration-ի։
- **Synthetic-data overdose** — մի՛ approve արա հիմնականում-synthetic training set՝ առանց real holdout-ի և diversity check-ի։
- **Data leakage / target leakage** — մի՛ ընդունիր «չափազանց լավ» offline metric. պահանջիր grouped/temporal split, ոչ post-outcome feature, և encoder-ներ՝ fit արված միայն train-ի վրա։
- **Training-serving skew** — մի՛ approve արա model, որի feature/tokenization-ը train-ի և serve-ի միջև տարբեր է՝ առանց parity assertion-ի։
- **Aggregate-ը թաքցնում է slice regression** — մի՛ approve արա մեկ headline թիվ. պահանջիր per-slice threshold և safety-slice veto։
- **Quantization առանց quality replay-ի** — մի՛ approve արա quantized model, ship-ված size-ի շահով՝ առանց ճշգրիտ eval suite-ի replay-ի (ներառյալ երկար/code/հայերեն)։
- **Հորինված volatile fact-եր** — թույլ մի՛ տուր ոչ մի պնդված model id, context window, price կամ benchmark. պահանջիր dated verify-before-use կամ placeholder։
- **Notebook green՝ որպես verified** — մի՛ թող, որ offline eval-ը փոխարինի canary slice-ին, refusal correctness-ին, latency-ին, cost-ին և drift monitor-ին production-ում։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Այս system-ի փաստերը կայո՞ւն են, թե փոփոխվող — և design-ը փոփոխվող փաստերը ուղղո՞ւմ է retrieval/tool, fine-tuning-ը պահելով միայն կայուն behavior-ի համար։
- Ո՞րն է recall@k gate-ը։ Golden set-ը սահմանվա՞ծ է, և generator-ը գնահատվու՞մ է միայն այն բանից հետո, երբ ճիշտ source-ը վերապրում է reranked top-k-ում։
- Դժվար/ambiguous query-ի վրա reranker կա՞ (retrieve broad → rerank narrow), և recall-ը չափվա՞ծ է դրանից առաջ ու հետո։
- Որտեղ է մտնում անվստահելի context-ը, համարվու՞մ է data, ոչ instruction, և high-privilege action-ները gate-ված են՞ confirmation-ի հետևում։ Injection case-եր ավելացվե՞լ են eval set-ին։
- Կարո՞ղ է volatile կամ user-controlled prefix-ը կոտրել prompt/KV caching-ը, կամ shared cache-ը poisoned լինել trust boundary-ի վրայով։
- Եթե LLM judge է օգտագործվում, calibrate-վա՞ծ է human label-ի դեմ sample-ի վրա, և պահվա՞ծ է այն bias-երից, որ կիսում է (verbosity, position, self-style)։
- Training data-ից որևէ մասը synthetic է՞, և կա՞ real անձեռնմխելի holdout plus diversity check։
- Classical-ML-ի համար․ split-ը grouped/temporal է՞, որտեղ row-երը correlated են, baseline-ը հաղթվա՞ծ է, կա՞ն post-outcome/leaky feature-ներ, և — եթե probability-ն driving է որոշում — calibrated է՞, ոչ միայն ranked։
- Feature/tokenization/normalization-ը համընկնո՞ւմ է training-ի և serving-ի միջև՝ parity assertion-ով և serving-path replay-ով eval-ում։
- Eval-ը sliced է՞ per-slice threshold-ով և safety-slice veto-ով, թե մեկ headline թիվ է։ Հայերեն slice կա՞։
- Եթե quantized է․ ճշգրիտ eval suite-ը replay-վա՞ծ է served path-ի վրա (երկար prompt, code, հայերեն), և ավելի բարձր precision-ի fallback պահվա՞ծ է։
- Պատասխանը պնդե՞ց որևէ model id, context window, price կամ benchmark հիշողությունից՝ verify-before-use նշելու փոխարեն։ Հայերենը equal-depth ու punctuation-clean է՞։
