# Data Engineering and Pipelines patterns

## English

These are canonical data-pipeline moves. Each is a mechanism for one of the domain's artifacts (pipeline design, freshness contract, backfill runbook, streaming-semantics review, schema-evolution plan). Choose the move that changes the next decision, not the nicest label.

### 1. Duplicate-after-retry autopsy

- **Trigger:** Rows duplicate after a failure-and-retry, or an "exactly-once" claim is in doubt.
- **Mechanism:** Trace the path — source replay, transform non-determinism, or sink append. Identify the delivery semantics (at-least-once + idempotent sink, transaction, or checkpoint) and the dedupe mechanism. If the sink appends, define a deterministic idempotency key and convert the write to upsert/MERGE on that key. Prove which of the three caused the duplicates.
- **Do not use when:** The "duplicates" are real, distinct business events with distinct keys — that is correct data, not a defect.
- **Failure repair:** If no natural key exists, build a deterministic surrogate from stable fields (e.g. `source_id + source_updated_at`) so retries and backfills are idempotent.

### 2. Freshness / SLA contract

- **Trigger:** Consumers argue the pipeline is "late," or a downstream depends on it with no stated guarantee.
- **Mechanism:** Define expected arrival time, allowed lateness, a completeness threshold (e.g. ≥99%), the owner, the alert route, and the backfill SLA. State the event-time vs processing-time semantics so "late" is measured against arrival, not chart render.
- **Do not use when:** It is a genuine one-off, ad-hoc extract with no recurring consumer — a full contract is overhead there.
- **Failure repair:** If freshness is defined only as dashboard load time, the contract is incomplete — add arrival time and a completeness threshold.

### 3. Schema-evolution / compatibility gate

- **Trigger:** A producer wants to change an event, add/remove/retype a field, or onboard a new consumer.
- **Mechanism:** Classify the change as backward / forward / full / breaking against the registry's compatibility mode. Pick BACKWARD to upgrade consumers first, FORWARD to upgrade producers first, FULL for both. List the consumers, bump the version, and choose versioning or a migration with rollback. Pin the serialization format (Avro for registry-driven evolution, Protobuf for typed cross-language) and never reuse a field tag.
- **Do not use when:** It is a private scratch/scratchpad schema with no external consumer — governance there is friction with no payoff.
- **Failure repair:** If a required field is removed or retyped, that is breaking — require a new version and a deprecation window, never a silent in-place change.

### 4. Streaming windowing & watermark design

- **Trigger:** A streaming aggregate (counts, averages, sessions) on event time, especially with late or out-of-order data.
- **Mechanism:** Name the window type and justify it — tumbling for non-overlapping fixed buckets, sliding for overlapping moving aggregates (state size + step), session for inactivity-gap-bounded activity (state the gap). Set a watermark strategy and an explicit allowed-lateness; route past-lateness events to a side-output/DLQ rather than dropping them, and decide whether allowed-late events correct an emitted result.
- **Do not use when:** The job is pure batch over already-complete partitions — event-time watermarking adds complexity with no late-data problem to solve.
- **Failure repair:** If the design has no watermark or no late-event path, real late data is being silently dropped or mis-bucketed — add both before shipping.

### 5. Dead-letter-queue (DLQ) & replay design

- **Trigger:** Records can fail to parse or violate schema, and one bad record must not drop data or halt the stream.
- **Mechanism:** Separate transient failures (retry with backoff) from poison messages (route to a DLQ). The DLQ record carries the raw payload, the error, the source offset/key, and the timestamp. Track a quarantine count and alert on its rate. Document the replay path: fix the cause, then re-ingest the DLQ records through the normal idempotent path so nothing is lost or double-counted.
- **Do not use when:** The failure is a genuine upstream outage affecting all records — that is a circuit-breaker/pause situation, not per-record quarantine.
- **Failure repair:** If a single unparseable record halts the pipeline or vanishes with no record, add the DLQ + replay and stop blocking the stream on poison.

### 6. Idempotent backfill runbook

- **Trigger:** History must be reprocessed — a transform-logic fix, a late-arriving correction, or a schema migration.
- **Mechanism:** Reprocess from immutable raw into a versioned/partitioned output (e.g. `target_backfill_YYYYMMDD`), idempotent per partition. Run the quality + source-to-target reconciliation gate on the backfill output, then atomically swap the serving view/pointer so rollback is one step. Never overwrite production in place.
- **Do not use when:** The change is forward-only and no historical rows are affected — a normal incremental run suffices; a full backfill is wasted compute.
- **Failure repair:** If the backfill writes straight to the production table with no staging and no swap, redirect it to a versioned output and gate the swap on reconciliation.

## Հայերեն

Սրանք canonical data-pipeline move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (pipeline design, freshness contract, backfill runbook, streaming-semantics review, schema-evolution plan)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Retry-ից հետո duplicate-ի autopsy

- **Երբ է պետք․** Row-երը duplicate են failure-and-retry-ից հետո, կամ «exactly-once» պնդումը կասկածի տակ է։
- **Մեխանիզմը․** Trace արա path-ը՝ source replay, transform non-determinism, թե sink append։ Հստակեցրու delivery semantics-ը (at-least-once + idempotent sink, transaction, կամ checkpoint) և dedupe մեխանիզմը։ Եթե sink-ը append է անում, սահմանիր դետերմինիստիկ idempotency key և write-ը փոխիր upsert/MERGE-ի այդ key-ի վրա։ Ապացուցիր՝ երեքից որն է duplicate-ի պատճառը։
- **Երբ չօգտագործել․** Երբ «duplicate-ները» իրական, distinct business event են distinct key-ով — դա ճիշտ data է, ոչ թերություն։
- **Ուղղում․** Եթե natural key չկա, կառուցիր դետերմինիստիկ surrogate stable field-երից (օր.՝ `source_id + source_updated_at`), որ retry-ն և backfill-ը idempotent լինեն։

### 2. Freshness / SLA contract

- **Երբ է պետք․** Consumer-ները վիճում են, որ pipeline-ը «ուշ» է, կամ downstream-ը կախված է դրանից առանց նշված երաշխիքի։
- **Մեխանիզմը․** Սահմանիր expected arrival time, allowed lateness, completeness threshold (օր.՝ ≥99%), owner, alert route և backfill SLA։ Նշի՛ր event-time ընդդեմ processing-time semantics-ը, որ «ուշ»-ը չափվի arrival-ի դեմ, ոչ chart render-ի։
- **Երբ չօգտագործել․** Երբ իսկապես one-off, ad-hoc extract է՝ առանց կրկնվող consumer-ի — լրիվ contract-ը այնտեղ overhead է։
- **Ուղղում․** Եթե freshness-ը սահմանված է միայն dashboard load time-ով, contract-ը թերի է — ավելացրու arrival time և completeness threshold։

### 3. Schema-evolution / compatibility gate

- **Երբ է պետք․** Producer-ը ուզում է event փոխել, field ավելացնել/հանել/retype անել, կամ նոր consumer onboard անել։
- **Մեխանիզմը․** Classify արա change-ը որպես backward / forward / full / breaking՝ registry-ի compatibility mode-ի դեմ։ Ընտրիր BACKWARD՝ consumer-ները նախ upgrade անելու, FORWARD՝ producer-ները նախ upgrade անելու, FULL՝ երկուսի համար։ Գրիր consumer-ները, bump արա version-ը և ընտրիր versioning կամ migration՝ rollback-ով։ Pin արա serialization format-ը (Avro՝ registry-driven evolution-ի, Protobuf՝ typed cross-language-ի) և երբեք field tag մի՛ reuse արա։
- **Երբ չօգտագործել․** Երբ private scratch schema է՝ առանց արտաքին consumer-ի — governance-ն այնտեղ շփում է առանց օգուտի։
- **Ուղղում․** Եթե required field է հանվում կամ retype-վում, դա breaking է — պահանջիր նոր version և deprecation window, երբեք լուռ in-place change։

### 4. Streaming windowing & watermark design

- **Երբ է պետք․** Streaming aggregate (count, average, session) event-time-ի վրա, հատկապես ուշ կամ out-of-order data-ով։
- **Մեխանիզմը․** Անվանի՛ր window-ի տեսակը և հիմնավորիր — tumbling՝ չհատվող ֆիքսված bucket-ի, sliding՝ հատվող շարժվող aggregate-ի (նշի՛ր size + step), session՝ inactivity-gap-ով սահմանված ակտիվության (նշի՛ր gap-ը)։ Սահմանիր watermark strategy և բացահայտ allowed-lateness. past-lateness event-ները ուղղորդիր side-output/DLQ, drop անելու փոխարեն, և որոշիր՝ allowed-late event-ները ուղղո՞ւմ են emit-ված result-ը։
- **Երբ չօգտագործել․** Երբ job-ը մաքուր batch է արդեն-complete partition-ների վրա — event-time watermarking-ը բարդություն է ավելացնում առանց late-data խնդրի։
- **Ուղղում․** Եթե design-ը watermark կամ late-event path չունի, իրական ուշ data-ն լուռ drop կամ սխալ-bucket է լինում — ավելացրու երկուսն էլ նախքան ship-ը։

### 5. Dead-letter-queue (DLQ) & replay design

- **Երբ է պետք․** Record-ները կարող են չ-parse-վել կամ schema խախտել, և մեկ bad record-ը չպետք է data drop անի կամ stream-ը կանգնեցնի։
- **Մեխանիզմը․** Բաժանիր transient failure-ները (retry՝ backoff-ով) poison message-ից (route DLQ)։ DLQ record-ը կրում է raw payload, error, source offset/key և timestamp։ Հաշվիր quarantine count և alert արա իր rate-ի վրա։ Փաստաթղթավորիր replay path-ը․ ուղղիր պատճառը, հետո re-ingest արա DLQ record-ները նորմալ idempotent path-ով, որ ոչինչ չկորի կամ չ-double-count լինի։
- **Երբ չօգտագործել․** Երբ failure-ը իրական upstream outage է, որ բոլոր record-ներին է ազդում — դա circuit-breaker/pause իրավիճակ է, ոչ per-record quarantine։
- **Ուղղում․** Եթե մեկ չ-parse-վող record-ը կանգնեցնում է pipeline-ը կամ անհետանում առանց հետքի, ավելացրու DLQ + replay և դադարիր stream-ը block անել poison-ի վրա։

### 6. Idempotent backfill runbook

- **Երբ է պետք․** History-ն պետք է reprocess-վի — transform-logic fix, ուշ-ժամանող correction, կամ schema migration։
- **Մեխանիզմը․** Reprocess արա immutable raw-ից versioned/partitioned output (օր.՝ `target_backfill_YYYYMMDD`), idempotent ըստ partition-ի։ Գործարկիր quality + source-to-target reconciliation gate-ը backfill output-ի վրա, հետո atomic-ով swap արա serving view-ը/pointer-ը, որ rollback-ը մեկ քայլ լինի։ Երբեք production-ը տեղում մի՛ overwrite արա։
- **Երբ չօգտագործել․** Երբ change-ը forward-only է և ոչ մի historical row չի ազդվում — նորմալ incremental run-ը բավարար է. լրիվ backfill-ը վատնված compute է։
- **Ուղղում․** Եթե backfill-ը ուղիղ production table է գրում առանց staging-ի և swap-ի, ուղղորդիր այն versioned output և gate արա swap-ը reconciliation-ի վրա։
