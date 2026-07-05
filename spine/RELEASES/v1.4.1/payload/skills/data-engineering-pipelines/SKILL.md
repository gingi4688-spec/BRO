---
name: "data-engineering-pipelines"
description: >-
  use when the work is data pipelines and movement: batch/streaming ingestion, ETL vs ELT, exactly-once vs at-least-once delivery, event-time windowing and watermarks, CDC, schema evolution and the serialization/registry layer (Avro/Protobuf), idempotent backfills, dead-letter handling, freshness/SLA contracts, and data-quality gates — for decisions, critique, planning, diagnostics, runbooks/artifacts, teaching, or evaluation. use as lead when this domain owns the central deliverable (pipeline design, freshness contract, backfill runbook, streaming-semantics review, schema-evolution plan). do not use as lead when another skill owns the main artifact and the pipeline is only one input — then support it. հայերեն՝ օգտագործիր data pipeline-ների, ingestion-ի (batch/streaming), ETL/ELT-ի, delivery semantics-ի, event-time windowing-ի ու watermark-ների, CDC-ի, schema evolution-ի ու serialization/registry շերտի, idempotent backfill-ի, dead-letter-ի և freshness/quality-ի աշխատանքի համար։
---

# Data Engineering and Pipelines / Տվյալների ինժեներիա և pipeline-ներ

## English

**Scope.** In: batch and streaming ingestion, ETL vs ELT decisions, delivery semantics (exactly-once vs at-least-once, idempotent sinks), event-time vs processing-time and windowing (tumbling/sliding/session) with watermarks and allowed-lateness, change data capture (CDC), schema evolution and the serialization/registry layer (Avro vs Protobuf, registry compatibility modes), idempotent and reversible backfills, dead-letter-queue (DLQ) handling and replay, freshness/SLA contracts, orchestration (DAGs, rerunnability), and data-quality gates. Out: warehouse internals and physical storage tuning (partitioning, indexing, query plans → `databases-storage-engineering`), platform/cluster reliability and deploy safety (`devops-platform-sre`), org-level data strategy and contracts governance (`data-architecture-leadership`), and statistical/feature modeling (`data-science-analytics`). This skill turns data movement into explicit guarantees: known freshness, traceable lineage, deterministic reprocessing, governed schema change, and quarantined-not-dropped bad records.

**Leads / Supports.** Lead when the central deliverable is pipeline-shaped: a pipeline design, a freshness/SLA contract, a backfill runbook, a streaming-semantics review, a schema-evolution/compatibility plan, a DLQ/quality-gate design. Support when another skill owns the artifact and the pipeline is one input — e.g. `data-architecture-leadership` owns the data-product/contract strategy and you supply the delivery semantics and backfill mechanics; `data-science-analytics` owns the feature/model and you supply the freshness contract and reproducible input snapshot.

Conflict rules:
- **Storage/query tuning → defer to databases.** You own where merge keys, idempotency, and partitioned writes live in the *pipeline*; physical table layout, indexing, clustering, and query-plan tuning route to `databases-storage-engineering`. Name the boundary instead of guessing at storage internals.
- **Schema contract governance → coordinate, do not decree alone.** You own the technical compatibility check (registry mode, consumer list, version bump). Whether a breaking change is *allowed*, and the deprecation timeline across teams, is a contract decision coordinated with `data-architecture-leadership` and the consuming owners — not set unilaterally in the pipeline.
- **Exactly-once claims → bounded by the sink, not by the engine.** Do not let a streaming engine's "exactly-once" feature override sink reality. If the sink cannot dedupe or commit transactionally, the end-to-end guarantee is at-least-once with idempotent writes; say so plainly rather than inheriting the engine's marketing.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **"Exactly-once" requested → resolve it at the sink, not the engine.** Engine exactly-once (Kafka transactions, Flink checkpoints) only covers the processing stage. End-to-end is `at-least-once + idempotent/transactional sink`. If the sink cannot dedupe or commit atomically, promise at-least-once with an idempotency key — do not promise exactly-once.
2. **Any retryable pipeline → it must be idempotent.** Define a deterministic idempotency key and write via upsert/MERGE on that key, not blind append. A retry that creates duplicates is a design defect, not bad luck.
3. **Streaming on event time → require a watermark and an explicit allowed-lateness policy.** Windowing without a lateness policy silently drops or misplaces real late events. State the watermark strategy and what happens to events past allowed-lateness (drop, side-output, or correct).
4. **Picking a window → name the type and justify it.** Tumbling for fixed non-overlapping buckets (hourly counts), sliding for moving aggregates with overlap (5-min metric every 1 min), session for activity bounded by an inactivity gap (user sessions). A window with no stated type or gap is underspecified.
5. **ETL vs ELT → push transform to where compute and governance live.** Choose ELT (load raw, transform in-warehouse) when the warehouse has the compute and you want raw lineage and replayable transforms; choose ETL (transform before load) when you must mask/validate before landing or the target cannot transform at scale. State which and why.
6. **Schema change → classify compatibility, then enforce it in the registry.** Classify backward / forward / full / breaking against the registry's mode; list consumers; bump the version or run a migration. Never ship a producer change without the consumer impact named.
7. **Serialization format → choose Avro vs Protobuf on the actual constraint, not taste.** Avro carries its schema and pairs natively with a schema registry for streaming evolution; Protobuf gives compact, strongly-typed, cross-language contracts with explicit field tags. Pin the format and its compatibility rules; do not leave records schemaless.
8. **CDC source → log-based by default; query-based only with stated gaps.** Log-based CDC preserves order and captures deletes; query-based (timestamp polling) misses hard deletes and clock-skewed updates. If query-based is forced, state the missed-delete and overlap-window mitigations.
9. **Bad records → route to a DLQ, never silently drop and never block the stream.** A poison message must go to a dead-letter queue with enough context to diagnose (raw payload, error, offset/key, timestamp), with a documented replay path. Silent drop loses data; blocking-on-bad-record halts the pipeline.
10. **Backfill → versioned/partitioned write first, then atomic swap.** Never overwrite production in place. Write to a versioned/partitioned output, run quality and reconciliation checks, then swap the view/pointer so rollback is one step. A backfill must be idempotent and re-runnable for the same partition.
11. **Freshness argued by feeling → write a freshness contract.** Define expected arrival, allowed lateness, a completeness threshold, the owner, and the alert route. "The dashboard looks slow" is not a contract; arrival-time + completeness is.
12. **Release a pipeline → gate it on data-quality tests, not just "it ran".** Freshness, volume/row-count, schema, uniqueness, null-rate, and source-to-target reconciliation tests gate the release. A green DAG run with no quality assertions is unverified.
13. **"The DAG succeeded" → not "the data is correct".** A successful run proves the tasks executed; it does not prove the output is fresh, complete, and reconciled. Verify against the real downstream metric/contract before declaring done.

### Failure modes to prevent / Ձախողման ձևեր

1. **Exactly-once promised on a non-dedupe sink.** The engine advertises exactly-once but the sink appends; retries duplicate. Tell: an "exactly-once" claim with no idempotency key or sink merge condition named.
2. **Duplicate rows after a retry.** A failed-then-retried task re-emits rows because the sink appends instead of upserting. Tell: row counts grow on rerun; no deterministic key; "we'll dedupe downstream later".
3. **Late events silently dropped.** Event-time windows close on a watermark with no allowed-lateness, so real late data vanishes with no trace. Tell: a windowing design with no watermark or no late-event path.
4. **Wrong window type.** A sliding/session need is forced into a tumbling window (or vice versa), so aggregates double-count or split sessions. Tell: a window with no stated type, overlap, or session gap.
5. **Schema drift breaks consumers.** A producer drops or retypes a field with no registry check; downstream parsing breaks in production. Tell: a producer change with no compatibility class and no consumer list.
6. **Schemaless / format-by-accident.** Records carry no enforced schema or mix formats, so evolution is impossible to reason about. Tell: JSON blobs with no registry, or "we'll add Avro later".
7. **Query-based CDC silently misses deletes.** Timestamp polling never sees hard deletes or clock-skewed rows; the target slowly diverges from source. Tell: incremental load on `updated_at` with no delete handling and no reconciliation.
8. **Poison message kills or is lost.** One unparseable record either halts the whole stream or is dropped with no record. Tell: no DLQ, no replay path, no quarantine count.
9. **Backfill overwrites history in place.** A reprocess rewrites the production table directly, with no version and no rollback, and corrupts live numbers mid-run. Tell: a backfill that writes straight to the prod table with no staging/swap.
10. **Freshness defined as dashboard load time.** "Fresh" means the dashboard opened, not that the data arrived complete and on time. Tell: a freshness "SLA" with no arrival time, completeness threshold, or owner.
11. **No data-quality gate.** The pipeline ships on "it ran green" with no uniqueness/null/reconciliation assertions; bad data lands unnoticed. Tell: a DAG with zero quality tests between source and serving.
12. **"DAG succeeded" treated as "data correct".** A green orchestration run is read as verification; the output is stale, partial, or unreconciled and nobody checked. Tell: "done" with no downstream reconciliation or freshness check.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (pipeline design / freshness contract / backfill runbook / streaming-semantics review / schema-evolution plan), not generic advice.
- Delivery semantics are explicit and bounded by the sink: processing guarantee + sink idempotency/transaction + replay behavior named; no end-to-end exactly-once claim on a non-dedupe sink.
- Streaming designs name the window type, the watermark strategy, and the allowed-lateness/late-event path (DLQ or side-output), not just "windowing".
- Schema change carries a compatibility class, the registry mode, the consumer list, and a version/migration + rollback; the serialization format (Avro/Protobuf) and its compatibility rules are pinned.
- Bad records route to a DLQ with diagnostic context and a documented replay path; nothing is silently dropped and no single record halts the stream.
- Backfills are partitioned/versioned, idempotent, reconciled, and reversible via swap; irreversible/data-loss steps are gated to a human owner.
- A freshness contract (arrival, allowed lateness, completeness, owner, alert) and data-quality gates (freshness/volume/schema/uniqueness/null/reconciliation) are present.
- **Verify against the real downstream metric/contract, not just a green DAG run** before calling the work done.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled; no invented prices/benchmarks/throughput numbers.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **delivery semantics** (processing guarantee, sink idempotency, checkpoint, replay proven, not asserted) · **time & windowing** (event vs processing time, window type, watermark, allowed-lateness, correction path explicit) · **schema & serialization** (compatibility class, registry mode, consumers, version/migration, Avro/Protobuf choice, rollback) · **backfill & DLQ safety** (partitioned/versioned, idempotent, reversible; poison-message routing + replay) · **data quality & freshness** (freshness contract + quality gates that actually block release).

### Deep dive & assets

`manual.md` (operating principle, mechanism reference for exactly-once/watermarks/windows/CDC/Avro-Protobuf/DLQ/backfill, decision rules, failure-repair playbook, worked ELT walkthrough) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (streaming-semantics + ELT + schema-evolution) · `output-templates.md` (pipeline design / freshness contract / schema-evolution plan) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ batch և streaming ingestion, ETL ընդդեմ ELT-ի որոշումներ, delivery semantics (exactly-once ընդդեմ at-least-once-ի, idempotent sink), event-time ընդդեմ processing-time-ի և windowing (tumbling/sliding/session)՝ watermark-ներով ու allowed-lateness-ով, change data capture (CDC), schema evolution և serialization/registry շերտ (Avro ընդդեմ Protobuf-ի, registry-ի compatibility mode-եր), idempotent ու հետշրջելի backfill, dead-letter-queue (DLQ) մշակում և replay, freshness/SLA պայմանագրեր, orchestration (DAG, rerunnability) և data-quality gate-եր։ Դուրս՝ warehouse-ի ներքին կառուցվածքը և ֆիզիկական storage-ի tuning-ը (partitioning, indexing, query plan → `databases-storage-engineering`), հարթակի/cluster-ի հուսալիությունը և deploy-ի անվտանգությունը (`devops-platform-sre`), org-մակարդակի data strategy-ն և contract-ների governance-ը (`data-architecture-leadership`), և վիճակագրական/feature modeling-ը (`data-science-analytics`)։ Այս skill-ը data-ի շարժը դարձնում է հստակ երաշխիք՝ հայտնի freshness, հետագծելի lineage, դետերմինիստիկ reprocessing, կառավարվող schema change և quarantine-ված, ոչ թե լուռ ջնջված bad record-ներ։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը pipeline-ի ձև ունի՝ pipeline design, freshness/SLA պայմանագիր, backfill runbook, streaming-semantics review, schema-evolution/compatibility plan, DLQ/quality-gate design։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ pipeline-ը մեկ input է. օրինակ՝ `data-architecture-leadership`-ը տիրում է data-product/contract strategy-ին, դու տալիս ես delivery semantics-ը և backfill մեխանիկան. `data-science-analytics`-ը տիրում է feature/model-ին, դու տալիս ես freshness contract-ը և վերարտադրելի input snapshot-ը։

Կոնֆլիկտի կանոններ․
- **Storage/query tuning → զիջիր databases-ին։** Դու տիրում ես, թե որտեղ են ապրում merge key-երը, idempotency-ն և partitioned write-երը *pipeline*-ում. ֆիզիկական table layout-ը, indexing-ը, clustering-ը և query-plan tuning-ը ուղղորդվում են `databases-storage-engineering`-ին։ Անվանի՛ր սահմանը, ոչ թե կռահիր storage-ի ներքինը։
- **Schema contract governance → համակարգիր, մենակ մի՛ որոշիր։** Դու տիրում ես տեխնիկական compatibility check-ին (registry mode, consumer list, version bump)։ Թե արդյոք breaking change-ը *թույլատրելի* է, և deprecation-ի ժամանակացույցը թիմերի միջև, contract-ի որոշում է, որ համակարգվում է `data-architecture-leadership`-ի և consuming owner-ների հետ, ոչ թե միակողմանի սահմանվում pipeline-ում։
- **Exactly-once պնդումներ → սահմանափակված են sink-ով, ոչ engine-ով։** Մի՛ թող, որ streaming engine-ի «exactly-once» feature-ը գերակայի sink-ի իրականությանը։ Եթե sink-ը չի կարող dedupe անել կամ transactional commit անել, end-to-end երաշխիքը at-least-once է idempotent write-երով. ասա՛ դա պարզ, ոչ թե ժառանգիր engine-ի marketing-ը։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **«Exactly-once» է խնդրված → լուծիր sink-ի վրա, ոչ engine-ի։** Engine-ի exactly-once-ը (Kafka transaction, Flink checkpoint) ծածկում է միայն processing stage-ը։ End-to-end-ը `at-least-once + idempotent/transactional sink` է։ Եթե sink-ը չի կարող dedupe անել կամ atomic commit անել, խոստացիր at-least-once՝ idempotency key-ով, exactly-once մի՛ խոստացիր։
2. **Ցանկացած retry-ունակ pipeline → պետք է idempotent լինի։** Սահմանիր դետերմինիստիկ idempotency key և գրիր upsert/MERGE-ով այդ key-ի վրա, ոչ blind append-ով։ Retry-ն, որ duplicate է ստեղծում, դիզայնի թերություն է, ոչ վատ բախտ։
3. **Streaming event-time-ի վրա → պահանջիր watermark և հստակ allowed-lateness policy։** Windowing-ը առանց lateness policy-ի լուռ կորցնում կամ սխալ պատուհանում է դնում իրական ուշ event-ները։ Նշի՛ր watermark strategy-ն և ինչ է լինում allowed-lateness-ից ուշ event-ի հետ (drop, side-output, թե correct)։
4. **Window ընտրելիս → անվանի՛ր տեսակը և հիմնավորիր։** Tumbling՝ ֆիքսված չհատվող bucket-ների համար (ժամային count), sliding՝ overlap-ով շարժվող aggregate-ի համար (5-րոպեանոց metric ամեն 1 րոպեն), session՝ inactivity gap-ով սահմանված ակտիվության համար (user session)։ Window առանց նշված տեսակի կամ gap-ի թերի սահմանված է։
5. **ETL ընդդեմ ELT → transform-ը մղիր այնտեղ, որտեղ compute-ն ու governance-ն են։** Ընտրիր ELT (load raw, transform warehouse-ում), երբ warehouse-ն ունի compute, և ուզում ես raw lineage ու replayable transform. ընտրիր ETL (transform նախքան load), երբ պետք է mask/validate անես նախքան land-ը, կամ target-ը չի կարող scale-ով transform անել։ Նշի՛ր որը և ինչու։
6. **Schema change → classify արա compatibility-ն, հետո enforce արա registry-ում։** Classify արա backward / forward / full / breaking՝ registry-ի mode-ի դեմ. գրիր consumer-ները. bump արա version-ը կամ գործարկիր migration։ Երբեք producer change մի՛ ship արա առանց consumer-ի impact-ը անվանելու։
7. **Serialization format → ընտրիր Avro ընդդեմ Protobuf-ի իրական constraint-ով, ոչ ճաշակով։** Avro-ն կրում է իր schema-ն և native զուգվում է schema registry-ի հետ streaming evolution-ի համար. Protobuf-ը տալիս է compact, ուժեղ-տիպավորված, cross-language contract՝ բացահայտ field tag-երով։ Pin արա format-ը և իր compatibility rule-ները. record-ները schemaless մի՛ թող։
8. **CDC source → log-based լռելյայն. query-based միայն նշված gap-երով։** Log-based CDC-ն պահում է order-ը և բռնում deletes. query-based-ը (timestamp polling) բաց է թողնում hard delete-երը և clock-skewed update-երը։ Եթե query-based-ը պարտադրված է, նշի՛ր missed-delete-ի և overlap-window-ի mitigation-ները։
9. **Bad record-ներ → ուղղորդիր DLQ, երբեք լուռ մի՛ ջնջիր և երբեք stream-ը մի՛ block արա։** Poison message-ը պետք է գնա dead-letter queue՝ diagnose-ի բավարար context-ով (raw payload, error, offset/key, timestamp), փաստաթղթավորված replay path-ով։ Լուռ drop-ը data է կորցնում. bad-record-ի վրա block-ը կանգնեցնում է pipeline-ը։
10. **Backfill → նախ versioned/partitioned write, հետո atomic swap։** Երբեք production-ը տեղում մի՛ overwrite արա։ Գրիր versioned/partitioned output, գործարկիր quality և reconciliation check, հետո swap արա view-ը/pointer-ը, որ rollback-ը մեկ քայլ լինի։ Backfill-ը պետք է idempotent և re-runnable լինի նույն partition-ի համար։
11. **Freshness-ը զգացմունքով է վիճարկվում → գրիր freshness contract։** Սահմանիր expected arrival, allowed lateness, completeness threshold, owner և alert route։ «Dashboard-ը դանդաղ է երևում»-ը contract չէ. arrival-time + completeness-ն է։
12. **Pipeline release անելիս → gate արա data-quality test-երով, ոչ թե «աշխատեց»-ով։** Freshness, volume/row-count, schema, uniqueness, null-rate և source-to-target reconciliation test-երը gate են անում release-ը։ Green DAG run՝ առանց quality assertion-ի, unverified է։
13. **«DAG-ը հաջողվեց» → «data-ն ճիշտ է» չէ։** Հաջող run-ը ապացուցում է, որ task-երը կատարվեցին. չի ապացուցում, որ output-ը fresh, complete և reconciled է։ Ստուգիր իրական downstream metric-ի/contract-ի դեմ մինչև done ասելը։

### Ձախողման ձևեր

1. **Exactly-once խոստացված non-dedupe sink-ի վրա։** Engine-ը գովազդում է exactly-once, բայց sink-ը append է անում. retry-ն duplicate է անում։ Tell՝ «exactly-once» պնդում՝ առանց idempotency key-ի կամ sink merge condition-ի անվանման։
2. **Duplicate row-եր retry-ից հետո։** Fail-եղած-հետո-retry-արված task-ը կրկին emit է անում row-եր, որովհետև sink-ը append է անում upsert-ի փոխարեն։ Tell՝ row count-ը մեծանում է rerun-ին. դետերմինիստիկ key չկա. «հետո downstream-ում dedupe կանենք»։
3. **Ուշ event-ները լուռ drop-ված։** Event-time window-ները փակվում են watermark-ով՝ առանց allowed-lateness-ի, ուստի իրական ուշ data-ն անհետանում է առանց հետքի։ Tell՝ windowing design՝ առանց watermark-ի կամ առանց late-event path-ի։
4. **Սխալ window տեսակ։** Sliding/session կարիքը պարտադրվում է tumbling window-ի մեջ (կամ հակառակը), ուստի aggregate-ները կրկնակի հաշվում կամ session-ները բաժանում են։ Tell՝ window՝ առանց նշված տեսակի, overlap-ի կամ session gap-ի։
5. **Schema drift-ը կոտրում է consumer-ներին։** Producer-ը field drop կամ retype է անում առանց registry check-ի. downstream parsing-ը կոտրվում է production-ում։ Tell՝ producer change՝ առանց compatibility class-ի և consumer list-ի։
6. **Schemaless / format-պատահականությամբ։** Record-ները enforce-ված schema չունեն կամ format-եր են խառնում, ուստի evolution-ի մասին դատելն անհնար է։ Tell՝ JSON blob՝ առանց registry-ի, կամ «հետո Avro կավելացնենք»։
7. **Query-based CDC-ն լուռ բաց է թողնում delete-երը։** Timestamp polling-ը երբեք չի տեսնում hard delete կամ clock-skewed row. target-ը դանդաղ շեղվում է source-ից։ Tell՝ incremental load `updated_at`-ով՝ առանց delete-ի մշակման և reconciliation-ի։
8. **Poison message-ը սպանում է կամ կորում է։** Մեկ չ-parse-վող record-ը կա՛մ կանգնեցնում է ողջ stream-ը, կա՛մ drop է լինում առանց հետքի։ Tell՝ DLQ չկա, replay path չկա, quarantine count չկա։
9. **Backfill-ը history-ն overwrite է անում տեղում։** Reprocess-ը ուղղակիորեն վերագրում է production table-ը, առանց version-ի և rollback-ի, և corrupt է անում live թվերը run-ի կեսին։ Tell՝ backfill, որ ուղիղ prod table է գրում առանց staging/swap-ի։
10. **Freshness-ը սահմանված dashboard load time-ով։** «Fresh»-ը նշանակում է dashboard-ը բացվեց, ոչ թե data-ն ժամանակին և ամբողջական ժամանեց։ Tell՝ freshness «SLA»՝ առանց arrival time-ի, completeness threshold-ի կամ owner-ի։
11. **Data-quality gate չկա։** Pipeline-ը ship է լինում «green աշխատեց»-ով՝ առանց uniqueness/null/reconciliation assertion-ի. bad data-ն land է լինում աննկատ։ Tell՝ DAG՝ զրո quality test source-ի և serving-ի միջև։
12. **«DAG-ը հաջողվեց»-ը՝ որպես «data-ն ճիշտ է»։** Green orchestration run-ը կարդացվում է որպես verification. output-ը stale, partial կամ unreconciled է, և ոչ ոք չստուգեց։ Tell՝ «done»՝ առանց downstream reconciliation-ի կամ freshness check-ի։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (pipeline design / freshness contract / backfill runbook / streaming-semantics review / schema-evolution plan), ոչ generic advice։
- Delivery semantics-ը հստակ է և sink-ով սահմանափակված. processing guarantee + sink idempotency/transaction + replay behavior անվանված. ոչ մի end-to-end exactly-once պնդում non-dedupe sink-ի վրա։
- Streaming design-ները անվանում են window-ի տեսակը, watermark strategy-ն և allowed-lateness/late-event path-ը (DLQ կամ side-output), ոչ թե միայն «windowing»։
- Schema change-ը կրում է compatibility class, registry mode, consumer list և version/migration + rollback. serialization format-ը (Avro/Protobuf) և իր compatibility rule-ները pin-ված են։
- Bad record-ները ուղղորդվում են DLQ՝ diagnostic context-ով և փաստաթղթավորված replay path-ով. ոչինչ լուռ չի drop-վում և ոչ մի record stream-ը չի կանգնեցնում։
- Backfill-ները partitioned/versioned, idempotent, reconciled և swap-ով հետշրջելի են. անդառնալի/data-loss step-երը gated են մարդ-տիրոջը։
- Freshness contract (arrival, allowed lateness, completeness, owner, alert) և data-quality gate-ներ (freshness/volume/schema/uniqueness/null/reconciliation) կան։
- **Ստուգի՛ր իրական downstream metric-ի/contract-ի դեմ, ոչ միայն green DAG run-ով** մինչև աշխատանքը done ասելը։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված. ոչ մի հորինված price/benchmark/throughput թիվ։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **delivery semantics** (processing guarantee, sink idempotency, checkpoint, replay՝ ապացուցված, ոչ պնդված) · **time & windowing** (event ընդդեմ processing time-ի, window-ի տեսակ, watermark, allowed-lateness, correction path՝ բացահայտ) · **schema & serialization** (compatibility class, registry mode, consumers, version/migration, Avro/Protobuf ընտրություն, rollback) · **backfill & DLQ safety** (partitioned/versioned, idempotent, հետշրջելի. poison-message routing + replay) · **data quality & freshness** (freshness contract + quality gate-ներ, որ իրականում block են անում release-ը)։

### Խորացում և asset-եր

`manual.md` (operating principle, mechanism reference՝ exactly-once/watermark/window/CDC/Avro-Protobuf/DLQ/backfill, որոշման կանոններ, failure-repair playbook, worked ELT walkthrough) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (streaming-semantics + ELT + schema-evolution) · `output-templates.md` (pipeline design / freshness contract / schema-evolution plan) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
