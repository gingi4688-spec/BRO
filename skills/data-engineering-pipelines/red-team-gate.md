# Data Engineering and Pipelines red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (pipeline design, freshness contract, backfill runbook, streaming-semantics review, schema-evolution plan). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Exactly-once promised on a non-dedupe sink** — do not let an engine's "exactly-once" feature stand in for the sink reality. Require the idempotency key + sink merge/transaction, or downgrade the claim to at-least-once.
- **Non-idempotent retry** — do not approve a retryable task that appends; require a deterministic key and an upsert/MERGE.
- **Windowing with no watermark or no late-event path** — do not approve event-time windows that silently drop late data; require a watermark and an allowed-lateness/side-output policy.
- **Unnamed window type** — do not approve "windowing" without the type (tumbling/sliding/session) and the size/step/gap.
- **Schema change with no compatibility check** — do not approve a producer change without the compatibility class, registry mode, consumer list, and version/migration.
- **Schemaless / format-by-accident** — do not approve unschema'd records or "we'll add Avro later"; require a pinned format and registry mode.
- **Query-based CDC with no delete handling** — do not approve `updated_at` polling without hard-delete handling, an overlap window, and reconciliation.
- **No DLQ / poison handling** — do not approve a stream where a bad record drops data or halts the pipeline; require a DLQ with context and a replay path.
- **In-place backfill** — do not approve a backfill that overwrites production directly; require versioned/partitioned write, reconciliation, and an atomic swap.
- **Freshness = dashboard load** — do not approve a "freshness SLA" with no arrival time, completeness threshold, or owner.
- **Green DAG treated as verification** — do not let a successful run stand in for fresh/complete/reconciled data; require a downstream check.

### Reviewer probes (ask these of any answer)

- What is the end-to-end delivery guarantee, and where does it actually hold — the engine, or the sink? Show the idempotency key and the sink write (append vs upsert/MERGE). If "exactly-once" is claimed, what dedupes?
- Is the pipeline idempotent on retry? What is the deterministic key, and what happens if the source re-sends the same row with a new load timestamp?
- For a streaming aggregate: what is the window **type** and its size/step/gap, what is the watermark strategy, and where do past-allowed-lateness events go — dropped, side-output, or DLQ?
- For a schema change: what is the compatibility class against the registry mode, who are the consumers, and is the rename decomposed into add-with-default → dual-write → migrate → remove? Is any field tag being reused?
- Is the serialization format pinned (Avro/Protobuf) with a justification, or are records effectively schemaless?
- For CDC: is it log-based, or query-based with stated missed-delete handling, overlap window, and reconciliation?
- How are poison messages handled — DLQ with payload/error/offset/timestamp and a replay path, or silently dropped / blocking the stream?
- Does the backfill write to a versioned/partitioned output, reconcile, and swap — or overwrite production in place?
- Is there a real freshness contract (arrival, allowed lateness, completeness, owner, alert) and do quality gates actually block release on failure?
- Does the answer rely on a green DAG run, or does it name the real downstream metric/contract verified in the running system? Any invented throughput/price/benchmark, and is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (pipeline design, freshness contract, backfill runbook, streaming-semantics review, schema-evolution plan)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Exactly-once խոստացված non-dedupe sink-ի վրա** — մի՛ թող, որ engine-ի «exactly-once» feature-ը փոխարինի sink-ի իրականությանը։ Պահանջիր idempotency key + sink merge/transaction, կամ իջեցրու պնդումը at-least-once-ի։
- **Non-idempotent retry** — մի՛ approve արա retry-ունակ task, որ append է անում. պահանջիր դետերմինիստիկ key և upsert/MERGE։
- **Windowing առանց watermark-ի կամ late-event path-ի** — մի՛ approve արա event-time window, որ լուռ drop է անում ուշ data. պահանջիր watermark և allowed-lateness/side-output policy։
- **Չանվանված window տեսակ** — մի՛ approve արա «windowing» առանց տեսակի (tumbling/sliding/session) և size/step/gap-ի։
- **Schema change առանց compatibility check-ի** — մի՛ approve արա producer change առանց compatibility class-ի, registry mode-ի, consumer list-ի և version/migration-ի։
- **Schemaless / format-պատահականությամբ** — մի՛ approve արա unschema'd record կամ «հետո Avro կավելացնենք». պահանջիր pin-ված format և registry mode։
- **Query-based CDC առանց delete-ի մշակման** — մի՛ approve արա `updated_at` polling առանց hard-delete-ի մշակման, overlap window-ի և reconciliation-ի։
- **DLQ / poison մշակում չկա** — մի՛ approve արա stream, որտեղ bad record-ը data է drop անում կամ կանգնեցնում pipeline-ը. պահանջիր DLQ՝ context-ով և replay path-ով։
- **In-place backfill** — մի՛ approve արա backfill, որ ուղիղ production է overwrite անում. պահանջիր versioned/partitioned write, reconciliation և atomic swap։
- **Freshness = dashboard load** — մի՛ approve արա «freshness SLA» առանց arrival time-ի, completeness threshold-ի կամ owner-ի։
- **Green DAG՝ որպես verification** — մի՛ թող, որ հաջող run-ը փոխարինի fresh/complete/reconciled data-ին. պահանջիր downstream check։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ինչ է end-to-end delivery երաշխիքը, և որտեղ է այն իրականում պահվում — engine-ո՞ւմ, թե sink-ո՞ւմ։ Ցույց տուր idempotency key-ը և sink write-ը (append ընդդեմ upsert/MERGE-ի)։ Եթե «exactly-once» է պնդված, ի՞նչն է dedupe անում։
- Pipeline-ը idempotent է՞ retry-ին։ Ինչ է դետերմինիստիկ key-ը, և ինչ է լինում, եթե source-ը նույն row-ը re-send է անում նոր load timestamp-ով։
- Streaming aggregate-ի համար․ ինչ է window-ի **տեսակը** և իր size/step/gap-ը, ինչ է watermark strategy-ն, և ուր են գնում past-allowed-lateness event-ները — drop, side-output, թե DLQ։
- Schema change-ի համար․ ինչ է compatibility class-ը registry mode-ի դեմ, ով են consumer-ները, և rename-ը քայքայվա՞ծ է add-with-default → dual-write → migrate → remove-ի։ Որևէ field tag re-use-վո՞ւմ է։
- Serialization format-ը pin-ված է՞ (Avro/Protobuf)՝ հիմնավորմամբ, թե record-ները փաստացի schemaless են։
- CDC-ի համար․ log-based է՞, թե query-based՝ նշված missed-delete-ի մշակմամբ, overlap window-ով և reconciliation-ով։
- Poison message-ները ոնց են մշակվում — DLQ՝ payload/error/offset/timestamp-ով և replay path-ով, թե լուռ drop / stream-ը block անելով։
- Backfill-ը versioned/partitioned output է՞ գրում, reconcile և swap է անում — թե production-ը տեղում overwrite է անում։
- Կա՞ իրական freshness contract (arrival, allowed lateness, completeness, owner, alert), և quality gate-ները իրականում block են անու՞մ release-ը fail-ի դեպքում։
- Պատասխանը հենվու՞մ է green DAG run-ի վրա, թե անվանում է իրական downstream metric-ը/contract-ը՝ ստուգված running system-ում։ Որևէ հորինված throughput/price/benchmark, և հայերենը equal-depth ու punctuation-clean է՞։
