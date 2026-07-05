# Data Engineering and Pipelines domain rubric

## English

Use this rubric before finalizing a pipeline design, freshness contract, backfill runbook, streaming-semantics review, or schema-evolution plan. A score of 5 requires the mechanism, the evidence, and a checkable domain artifact — not vocabulary.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Delivery semantics | Claims exactly-once vaguely, or ignores duplicates. | Retries discussed; idempotency mentioned. | Processing guarantee, sink idempotency/transaction, checkpoint, and replay behavior are proven; no end-to-end exactly-once on a non-dedupe sink. |
| Time & windowing | No event-time policy; window type unstated. | Windows named; watermark mentioned. | Event vs processing time, the window **type** (tumbling/sliding/session with size/step/gap), watermark, allowed-lateness, and the late-event/correction path are all explicit. |
| Schema & serialization | Breaks consumers; schemaless. | Registry exists; format chosen. | Compatibility class + registry mode (BACKWARD/FORWARD/FULL), consumer list, version/migration, rollback, and a justified Avro/Protobuf choice are defined. |
| Backfill & DLQ safety | Reruns overwrite blindly; bad records dropped or block. | Backfill step exists; some error handling. | Backfill is partitioned/versioned, idempotent, reconciled, swap-reversible; poison messages route to a DLQ with context and a replay path. |
| Data quality & freshness | Tests absent; freshness = dashboard load. | Row counts only; informal SLA. | Freshness contract (arrival, allowed lateness, completeness, owner, alert) + blocking quality gates (freshness/volume/schema/uniqueness/null/reconciliation) actually gate release. |

## Հայերեն

Այս rubric-ը կիրառիր pipeline design, freshness contract, backfill runbook, streaming-semantics review կամ schema-evolution plan-ը վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և domain-ին հատուկ ստուգելի artifact — ոչ vocabulary։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Delivery semantics | Vague exactly-once claim, կամ duplicate-ները անտեսված։ | Retry-երը քննարկված. idempotency նշված։ | Processing guarantee-ն, sink idempotency/transaction-ը, checkpoint-ը և replay behavior-ը ապացուցված. ոչ մի end-to-end exactly-once non-dedupe sink-ի վրա։ |
| Time & windowing | Event-time policy չկա. window-ի տեսակը չնշված։ | Window-ները նշված. watermark հիշատակված։ | Event ընդդեմ processing time-ի, window-ի **տեսակը** (tumbling/sliding/session՝ size/step/gap-ով), watermark, allowed-lateness և late-event/correction path-ը բոլորը բացահայտ են։ |
| Schema & serialization | Consumer-ները կոտրվում են. schemaless։ | Registry կա. format ընտրված։ | Compatibility class + registry mode (BACKWARD/FORWARD/FULL), consumer list, version/migration, rollback և հիմնավորված Avro/Protobuf ընտրությունը սահմանված են։ |
| Backfill & DLQ safety | Rerun-ը blind overwrite է. bad record-ները drop կամ block են։ | Backfill step կա. որոշ error handling։ | Backfill-ը partitioned/versioned, idempotent, reconciled, swap-ով հետշրջելի է. poison message-ները route DLQ՝ context-ով և replay path-ով։ |
| Data quality & freshness | Test չկա. freshness = dashboard load։ | Միայն row count. ոչ-ֆորմալ SLA։ | Freshness contract (arrival, allowed lateness, completeness, owner, alert) + blocking quality gate-ներ (freshness/volume/schema/uniqueness/null/reconciliation) իրականում gate են անում release-ը։ |
