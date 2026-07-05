# AI, ML Engineering, and LLMOps owner notes

## English

### Needs human review when

This skill designs, evaluates, and reasons about ML systems; it must route to a human owner — not act or auto-approve — when a step is irreversible, touches personal/proprietary data, or gates real-world consequences. Escalate and require explicit approval when:

- **Training or fine-tuning on personal or proprietary data** — using customer chats, user content, or licensed corpora as training data. Gate until governance, consent/lawful-basis, and license review are confirmed; route the privacy question to `security-privacy-engineering`. Do not proceed on "just do it."
- **Irreversible data/index/model actions** — dropping or rebuilding a production vector index, deleting embeddings, overwriting a model in place, rotating the serving model. Name the backup and the rollback before proceeding; require an owner's go.
- **Pushing a model that gates money, safety, or eligibility** — anything where a model decision approves spend, denies a person a benefit, flags risk, or affects health/legal/financial outcomes. The model produces evidence; a human owns the consequential decision and the threshold.
- **Logging or retaining prompts/completions that may contain PII** — what is captured for eval/telemetry can itself be a privacy exposure. Confirm retention, redaction, and access with the data owner; do not expand logging unilaterally.
- **Disabling an eval/safety gate under pressure** — shipping past a failed safety slice, skipping the post-quantization replay, releasing on judge score alone, or launching with a known slice regression. Allowed only with explicit, owner-approved, time-boxed sign-off and a stated re-enable/rollback plan.
- **Asserting a volatile fact that drives a real decision** — when a model id, context window, price, or benchmark would change an architecture or a budget, the value is verified-before-use with a date/source or routed to whoever can confirm it. Do not let an unverified number stand.

The default posture for all of the above: produce the design, the evidence, the eval result, and the rollback; then stop and route to the owner. Do not execute the irreversible or consequential step on your own authority.

### Owned future-improvement items

- Add a **multi-window retrieval-quality recipe** (specific recall@k targets per query class and a stale-source freshness threshold) so the launch gate is copy-ready rather than described.
- Add a **prompt/KV-cache cost model** worked example (prefix-cache hit rate, KV memory vs context length, batching) to make the serving-math dimension concrete end-to-end.
- Add a **drift-monitor playbook** spanning both LLM drift (recall/refusal/cost over time) and classical-ML drift (feature + concept drift) with the retrain trigger wiring.
- Add a **calibration worked example** (reliability curve + Brier + a threshold decision) to make the classical-ML calibration requirement concrete beyond the leakage example.
- Cross-link the agent boundary explicitly to `ai-agent-engineering` for the tool-loop/injection-surface, and the ingestion boundary to `data-engineering-pipelines`, so the support relationships are wired, not just named.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը նախագծում, գնահատում և դատում է ML համակարգերի մասին. այն պետք է ուղղորդի մարդ-տիրոջը — ոչ թե գործի կամ ինքնահաստատի — երբ քայլը անդառնալի է, դիպչում է personal/proprietary data-ին, կամ gate է անում իրական հետևանքներ։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Training կամ fine-tuning personal կամ proprietary data-ի վրա** — customer chat, user content կամ licensed corpus-ի օգտագործում որպես training data։ Gate արա, մինչ governance-ը, consent/lawful-basis-ը և license review-ն հաստատվեն. privacy հարցը ուղղորդիր `security-privacy-engineering`-ին։ Մի՛ շարունակիր «պարզապես արա»-ի վրա։
- **Անդառնալի data/index/model action-ներ** — production vector index drop/rebuild, embedding-ների ջնջում, model-ի in-place overwrite, serving model-ի rotation։ Անվանի՛ր backup-ը և rollback-ը մինչ շարունակելը. պահանջիր owner-ի go։
- **Money, safety կամ eligibility gating model-ի push** — ամեն ինչ, որտեղ model-ի որոշումը approve է անում ծախս, մերժում է մարդուն benefit, flag է անում risk, կամ ազդում է health/legal/financial արդյունքների վրա։ Model-ը evidence է արտադրում. մարդը տիրում է հետևանքային որոշմանը և threshold-ին։
- **PII-ով prompt/completion-ի logging կամ retention** — ինչ է captured eval/telemetry-ի համար, ինքնին կարող է privacy exposure լինել։ Հաստատիր retention-ը, redaction-ը և access-ը data owner-ի հետ. logging-ը մի՛ ընդլայնիր միակողմանի։
- **Eval/safety gate-ի անջատում ճնշման տակ** — fail-ած safety slice-ի վրայով ship, post-quantization replay-ի բացթողում, միայն judge score-ով release, կամ հայտնի slice regression-ով launch։ Թույլատրելի է միայն հստակ, owner-հաստատված, ժամանակ-սահմանված sign-off-ով և նշված re-enable/rollback պլանով։
- **Volatile fact-ի պնդում, որ driving է իրական որոշում** — երբ model id, context window, price կամ benchmark կփոխեր architecture կամ budget, արժեքը verify-before-use է՝ ամսաթիվ/source-ով, կամ ուղղորդվում է նրան, ով կարող է հաստատել։ Մի՛ թող, որ չստուգված թիվը մնա։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր design-ը, evidence-ը, eval result-ը և rollback-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Անդառնալի կամ հետևանքային քայլը մի՛ կատարիր սեփական լիազորությամբ։

### Սեփական ապագա-բարելավման կետեր

- Ավելացրու **multi-window retrieval-quality recipe** (կոնկրետ recall@k target ամեն query class-ի և stale-source freshness threshold), որ launch gate-ը copy-ready լինի, ոչ նկարագրված։
- Ավելացրու **prompt/KV-cache cost model** worked example (prefix-cache hit rate, KV memory ընդդեմ context length-ի, batching), որ serving-math չափանիշը կոնկրետ լինի ծայրից ծայր։
- Ավելացրու **drift-monitor playbook**, որ ընդգրկում է և՛ LLM drift (recall/refusal/cost ժամանակի ընթացքում), և՛ classical-ML drift (feature + concept drift)՝ retrain trigger-ի wiring-ով։
- Ավելացրու **calibration worked example** (reliability curve + Brier + threshold decision), որ classical-ML calibration-ի պահանջը կոնկրետ լինի leakage example-ից այն կողմ։
- Cross-link արա agent boundary-ն բացահայտ `ai-agent-engineering`-ին tool-loop/injection-surface-ի համար, և ingestion boundary-ն՝ `data-engineering-pipelines`-ին, որ support հարաբերությունները wired լինեն, ոչ միայն անվանված։
