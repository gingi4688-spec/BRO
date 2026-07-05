# AI, ML Engineering, and LLMOps output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep every number traceable to a measurement or a formula. Never assert a model id, context window, price, or benchmark from memory — mark it verify-before-use or leave a placeholder.

### Template 1 — RAG design review

- **Use case & knowledge source:** what flow this serves; how many docs; how often they change
- **Adaptation choice & why:** RAG / tools / prompt / fine-tune — and the volatility reason (changing facts → retrieval, not weights)
- **Ingestion & chunking:** normalization, section/heading preservation, chunk size (~300–800 tok) + overlap (10–20%)
- **Metadata per chunk:** document id, owner, effective date, language, category (drives freshness + filtering)
- **Retrieval & rerank:** embedding model (verify-before-use), retrieve top-k (~20) → rerank to (~5), context-packing with citations
- **Launch gate — recall@k:** golden set defined; correct source must appear in reranked top-k ≥ target before the generator is evaluated
- **Untrusted-context defense:** retrieved text treated as data; instruction-like spans isolated; high-privilege actions gated
- **Eval slices:** task · language (incl. Armenian) · freshness/stale-policy · refusal/ambiguous · safety — each with threshold + owner
- **Telemetry & rollback:** source-click/recall/refusal/latency/cost monitored; rollback threshold when freshness or refusal correctness drops
- **Acceptance:** recall@k gate present · facts in retrieval not weights · untrusted context handled · Armenian slice · running-system gate, not notebook

### Template 2 — Evaluation harness

- **What decision the eval gates:** ship / rollback / refresh — the harness exists to make this call
- **Golden set:** known-correct examples; size; owner; refresh cadence (dated)
- **Adversarial set:** stale facts · prompt injection · refusal cases · edge inputs
- **Slices:** task · language · freshness · ambiguity · safety · document family — each with pass threshold, sample count, owner
- **Safety-slice veto:** which slices can veto a green aggregate on their own
- **Judge calibration:** if LLM-as-judge is used — sample compared to human labels; agreement reported; judge kept off shared biases (verbosity/position/self-style)
- **Classical-ML checks (if applicable):** split (grouped/temporal) · baseline beaten · leakage audit · calibration (reliability/Brier) where probabilities decide
- **Telemetry gates:** live recall · refusal correctness · latency · cost · drift monitor
- **Verify live:** the production signal that confirms the offline result, with a rollback threshold
- **Acceptance:** no single headline number · per-slice thresholds + owners · judge calibrated · leakage/calibration covered for classical-ML

### Template 3 — LLM / model release checklist

- **Change & blast radius:** new model/adapter/index/prompt; who and what is exposed
- **Adaptation & rollback path:** how this rolls back (remove from index / unmerge adapter / route to fallback model)
- **Quantization replay (if quantized):** exact eval suite replayed on the served path; int4/int8 cliff checked on long prompts/code/Armenian; fallback kept
- **Serving math:** KV-cache/memory vs context length; batching; paged attention/prefix caching; capacity sized to the heaviest path/modality
- **Eval gate:** slice pass rates · safety-slice veto · refusal correctness · judge calibration result
- **Injection & privacy:** untrusted-context defense · what is logged from prompts/completions · no training on personal/proprietary data without governance
- **Volatile facts:** every model id/window/price/benchmark is dated verify-before-use or a placeholder — none asserted from memory
- **Canary & monitors:** canary traffic %; guardrail metrics; drift monitor; owner; rollback threshold
- **Human-review gate:** irreversible/high-stakes actions (personal-data training, index deletion, money/safety-gating push) routed to an owner per `OWNER_NOTES.md`
- **Acceptance:** quantization replayed · injection defended · no invented volatile facts · canary + rollback + owner · running-system verification, not green notebook

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն թիվ պահիր հետագծելի measurement-ի կամ formula-ի։ Երբեք մի՛ պնդիր model id, context window, price կամ benchmark հիշողությունից — նշիր verify-before-use կամ թող placeholder։

### Template 1 — RAG design review

- **Use case & knowledge source․** որ flow-ին է ծառայում. քանի doc. որքան հաճախ են փոխվում
- **Adaptation choice & ինչու․** RAG / tool / prompt / fine-tune — և volatility պատճառը (փոխվող փաստեր → retrieval, ոչ weight)
- **Ingestion & chunking․** normalization, section/heading պահպանում, chunk size (~300–800 tok) + overlap (10–20%)
- **Metadata ամեն chunk-ին․** document id, owner, effective date, language, category (driving է freshness + filtering)
- **Retrieval & rerank․** embedding model (verify-before-use), retrieve top-k (~20) → rerank to (~5), context-packing citation-ներով
- **Launch gate — recall@k․** golden set սահմանված. ճիշտ source-ը պետք է հայտնվի reranked top-k-ում ≥ target նախքան generator-ը գնահատվի
- **Անվստահելի-context-ի պաշտպանություն․** retrieved text-ը համարված data. instruction-like span-երը մեկուսացված. high-privilege action-ները gated
- **Eval slice-եր․** task · language (ներառյալ հայերեն) · freshness/stale-policy · refusal/ambiguous · safety — ամեն մեկը threshold + owner-ով
- **Telemetry & rollback․** source-click/recall/refusal/latency/cost monitored. rollback threshold, երբ freshness կամ refusal correctness ընկնում է
- **Acceptance․** recall@k gate կա · փաստերը retrieval-ում, ոչ weight · անվստահելի context handled · հայերեն slice · running-system gate, ոչ notebook

### Template 2 — Evaluation harness

- **Որ որոշումն է eval-ը gate անում․** ship / rollback / refresh — harness-ը գոյություն ունի այս call-ն անելու համար
- **Golden set․** հայտնի-ճիշտ example-ներ. size. owner. refresh cadence (dated)
- **Adversarial set․** stale fact · prompt injection · refusal case · edge input
- **Slice-եր․** task · language · freshness · ambiguity · safety · document family — ամեն մեկը pass threshold, sample count, owner-ով
- **Safety-slice veto․** որ slice-երը կարող են մենակ veto անել green aggregate-ը
- **Judge calibration․** եթե LLM-as-judge է — sample համեմատված human label-ի հետ. agreement report արված. judge-ը պահված shared bias-ից (verbosity/position/self-style)
- **Classical-ML ստուգում (եթե կիրառելի է)․** split (grouped/temporal) · baseline հաղթված · leakage audit · calibration (reliability/Brier), որտեղ probability-ն որոշում է
- **Telemetry gate-եր․** live recall · refusal correctness · latency · cost · drift monitor
- **Verify live․** production signal-ը, որ հաստատում է offline արդյունքը, rollback threshold-ով
- **Acceptance․** ոչ մեկ headline թիվ · per-slice threshold + owner · judge calibrated · leakage/calibration ծածկված classical-ML-ի համար

### Template 3 — LLM / model release checklist

- **Change & blast radius․** նոր model/adapter/index/prompt. ով և ինչ է exposed
- **Adaptation & rollback path․** ինչպես է rollback անում (index-ից հեռացնել / adapter unmerge / fallback model route)
- **Quantization replay (եթե quantized)․** ճշգրիտ eval suite replay-ված served path-ի վրա. int4/int8 cliff ստուգված երկար prompt/code/հայերեն-ի վրա. fallback պահված
- **Serving math․** KV-cache/memory ընդդեմ context length-ի. batching. paged attention/prefix caching. capacity size-ված ամենածանր path/modality-ին
- **Eval gate․** slice pass rate · safety-slice veto · refusal correctness · judge calibration result
- **Injection & privacy․** անվստահելի-context-ի պաշտպանություն · ինչ է log-վում prompt/completion-ից · ոչ personal/proprietary data-ով training առանց governance-ի
- **Volatile fact-եր․** ամեն model id/window/price/benchmark dated verify-before-use է կամ placeholder — ոչ մեկը հիշողությունից պնդված
- **Canary & monitor-ներ․** canary traffic %. guardrail metric. drift monitor. owner. rollback threshold
- **Human-review gate․** անդառնալի/high-stakes action-ները (personal-data training, index deletion, money/safety-gating push) ուղղորդված owner-ին՝ ըստ `OWNER_NOTES.md`-ի
- **Acceptance․** quantization replay-ված · injection պաշտպանված · ոչ մի հորինված volatile fact · canary + rollback + owner · running-system verification, ոչ green notebook
