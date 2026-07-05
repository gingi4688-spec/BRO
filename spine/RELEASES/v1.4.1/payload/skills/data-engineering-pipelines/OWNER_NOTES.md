# Data Engineering and Pipelines owner notes

## English

### Needs human review when

This skill designs and reasons about data movement; it must route to a human owner — not act or auto-approve — when a step can lose or corrupt data, breaks a contract other teams depend on, or changes a guarantee downstream consumers rely on. Escalate and require explicit approval when:

- **Irreversible or data-loss reprocessing** — destructive backfills, in-place overwrites of production tables, dropping/truncating partitions, or any reprocess with no versioned output and no atomic swap to roll back. Require a versioned output, a reconciliation gate, and a stated rollback before proceeding.
- **Breaking schema changes across teams** — removing/retyping a required field, renaming in one shot, or any change the registry would classify as breaking for existing consumers. Whether the break is *allowed*, and the deprecation timeline, is a contract decision owned by `data-architecture-leadership` and the consuming teams — surface the compatibility analysis and route the go/no-go.
- **Weakening a delivery or freshness guarantee** — relaxing exactly-once/idempotency, widening allowed lateness, or lowering a completeness threshold that downstream consumers (especially financial/regulatory) depend on. Name the consumers and the consequence; the owner decides.
- **Disabling a quality or reconciliation gate** — skipping a source-to-target reconciliation, a uniqueness/null check, or a financial reconciliation to ship faster. Allowed only with explicit, time-boxed owner sign-off and a re-enable plan; never silently removed.
- **PII / sensitive-data movement** — landing, copying, or transforming personal or regulated data, especially across regions or into a less-governed zone. The masking/retention/residency decision is a governance and legal call, not a pipeline default — route it.
- **Dropping or quarantining records under pressure** — purging a DLQ, force-skipping poison messages, or closing windows early to hit an SLA. These trade correctness for a deadline; require an owner to accept the completeness/accuracy tradeoff explicitly.

The default posture for all of the above: produce the design, the evidence, the reconciliation, and the rollback; then stop and route to the owner. Do not execute the irreversible or contract-breaking step on your own authority.

### Owned future-improvement items

- **✓ DELIVERED (gazan 2026-07-02)** — Add a worked example for **streaming joins and out-of-order enrichment** (joining two event streams with independent watermarks and late-data handling), since join semantics are a common senior failure point not yet covered by a full example.
- Add a **data-contract template** (producer/consumer SLA, schema, semantics, and breaking-change policy) to make the schema-evolution coordination with `data-architecture-leadership` concrete and copy-ready.
- Add a **lineage/observability section** to the manual (column-level lineage, freshness/volume anomaly detection) so the freshness contract is monitored, not just declared.
- Add an **exactly-once recipe** with the concrete sink patterns (idempotent upsert, transactional outbox, dedupe table with TTL) so the at-least-once-plus-idempotent-sink rule is copy-ready rather than described.
- Cross-link the storage boundary explicitly to `databases-storage-engineering` for physical layout (partitioning/clustering of the landed/served tables) beyond the pipeline-side merge-key and partitioned-write mechanics owned here.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը նախագծում և դատում է data-ի շարժի մասին. այն պետք է ուղղորդի մարդ-տիրոջը — ոչ թե գործի կամ ինքնահաստատի — երբ քայլը կարող է data կորցնել կամ corrupt անել, կոտրում է contract, որից այլ թիմեր են կախված, կամ փոխում է երաշխիք, որի վրա downstream consumer-ները հենվում են։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Անդառնալի կամ data-loss reprocessing** — destructive backfill, production table-ների in-place overwrite, partition-ների drop/truncate, կամ ցանկացած reprocess՝ առանց versioned output-ի և rollback անելու atomic swap-ի։ Պահանջիր versioned output, reconciliation gate և նշված rollback մինչև շարունակելը։
- **Breaking schema change-եր թիմերի միջև** — required field-ի remove/retype, մեկ հարվածով rename, կամ ցանկացած change, որ registry-ն կդասակարգեր breaking՝ եղած consumer-ների համար։ Թե արդյոք break-ը *թույլատրելի* է, և deprecation-ի ժամանակացույցը, contract-ի որոշում է, որ տիրում են `data-architecture-leadership`-ը և consuming թիմերը — ցույց տուր compatibility analysis-ը և ուղղորդիր go/no-go-ն։
- **Delivery կամ freshness երաշխիքի թուլացում** — exactly-once/idempotency-ի թուլացում, allowed lateness-ի լայնացում, կամ completeness threshold-ի իջեցում, որից downstream consumer-ները (հատկապես financial/regulatory) կախված են։ Անվանի՛ր consumer-ները և հետևանքը. owner-ը որոշում է։
- **Quality կամ reconciliation gate-ի անջատում** — source-to-target reconciliation-ի, uniqueness/null check-ի, կամ financial reconciliation-ի բացթողում՝ ավելի արագ ship անելու համար։ Թույլատրելի է միայն հստակ, ժամանակ-սահմանված owner-ի sign-off-ով և re-enable պլանով. երբեք լուռ չհանվի։
- **PII / զգայուն-data-ի շարժ** — անձնական կամ regulated data-ի landing, copy կամ transform, հատկապես region-ների միջև կամ ավելի քիչ-governed zone։ Masking/retention/residency որոշումը governance և legal call է, ոչ pipeline-ի լռելյայն — ուղղորդիր այն։
- **Record-ների drop կամ quarantine ճնշման տակ** — DLQ-ի purge, poison message-ների force-skip, կամ window-ների շուտ փակում SLA հասնելու։ Սրանք correctness-ը փոխանակում են deadline-ով. պահանջիր, որ owner-ը բացահայտ ընդունի completeness/accuracy tradeoff-ը։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր design-ը, evidence-ը, reconciliation-ը և rollback-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Անդառնալի կամ contract-կոտրող քայլը մի՛ կատարիր սեփական լիազորությամբ։

### Սեփական ապագա-բարելավման կետեր

- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու worked example **streaming join-ի և out-of-order enrichment-ի** համար (երկու event stream-ի join՝ անկախ watermark-ներով և late-data մշակմամբ), քանի որ join semantics-ը հաճախակի senior failure point է, որ դեռ լրիվ օրինակով ծածկված չէ։
- Ավելացրու **data-contract template** (producer/consumer SLA, schema, semantics և breaking-change policy), որ `data-architecture-leadership`-ի հետ schema-evolution-ի համակարգումը կոնկրետ և copy-ready լինի։
- Ավելացրու **lineage/observability բաժին** manual-ին (column-level lineage, freshness/volume anomaly detection), որ freshness contract-ը monitor-վի, ոչ միայն հայտարարվի։
- Ավելացրու **exactly-once recipe** կոնկրետ sink pattern-ներով (idempotent upsert, transactional outbox, dedupe table՝ TTL-ով), որ at-least-once-plus-idempotent-sink կանոնը copy-ready լինի, ոչ նկարագրված։
- Cross-link արա storage սահմանը բացահայտ `databases-storage-engineering`-ին՝ ֆիզիկական layout-ի համար (landed/served table-ների partitioning/clustering)՝ այստեղ տիրվող pipeline-side merge-key-ի և partitioned-write մեխանիկայից այն կողմ։
