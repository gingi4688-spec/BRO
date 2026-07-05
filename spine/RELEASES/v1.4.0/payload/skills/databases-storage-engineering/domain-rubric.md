# Databases and Storage Engineering domain rubric

## English

Use this rubric before finalizing a query review, schema-and-index plan, consistency/isolation decision, multi-store architecture, or migration/recovery plan. A score of 5 requires the mechanism, the evidence (EXPLAIN, an invariant, an amplification/vacuum model, a partition behavior, a tested restore), and a checkable domain artifact. Score the lowest dimension honestly; a single weak dimension is where the design fails in production.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Transaction correctness | Default isolation accepted; concurrency unconsidered. | Isolation level named. | Invariant maps to isolation level and the specific anomaly; lost update and write skew under snapshot isolation are handled (FOR UPDATE / SERIALIZABLE / constraint); MVCC vs locking behavior is correct. |
| Query-plan literacy | Adds an index from a column name. | EXPLAIN glanced at. | Scan type, estimated vs actual rows, join order, sort/hash spill, index column order (equality→range→sort), covering INCLUDE, and N+1 are all addressed, with a re-run EXPLAIN to confirm. |
| Storage fit | Engine buzzwords. | B-tree/LSM named. | Write/read/space amplification, compaction, MVCC dead tuples/autovacuum/bloat, cache hit rate, and the real access pattern drive the engine choice and the diagnosis. |
| Distributed tradeoff | CAP slogan; "CA under partition." | CP/AP chosen. | Partition behavior, the named invariant, the PACELC latency-vs-consistency tradeoff, read-your-writes routing, and the repair path are explicit; no impossible CAP claim. |
| Operational safety | No migration or recovery plan. | Backup mentioned. | Online migration (expand/contract), replication lag, deadlock/lock-ordering, WAL/checkpoint crash recovery, and a backup restore that was actually run (RPO/RTO, PITR) are planned and gated. |

## Հայերեն

Այս rubric-ը կիրառիր query review, schema-and-index plan, consistency/isolation որոշում, multi-store architecture կամ migration/recovery plan-ը վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence (EXPLAIN, invariant, amplification/vacuum model, partition behavior, ստուգված restore) և domain-ին հատուկ ստուգելի artifact։ Ամենացածր չափանիշը ազնիվ գնահատիր. մեկ թույլ չափանիշն այն տեղն է, որտեղ design-ը fail է լինում production-ում։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Transaction correctness | Default isolation-ը ընդունվում է. concurrency-ն չդիտարկված։ | Isolation level-ը նշված է։ | Invariant-ը կապվում է isolation level-ի և կոնկրետ anomaly-ի հետ. lost update-ը և write skew-ը snapshot isolation-ի տակ մշակված են (FOR UPDATE / SERIALIZABLE / constraint). MVCC ընդդեմ locking behavior-ը ճիշտ է։ |
| Query-plan literacy | Index ավելացվում է սյունի անունից։ | EXPLAIN-ին նայում է։ | Scan type-ը, estimated ընդդեմ actual rows-ը, join order-ը, sort/hash spill-ը, index-ի սյունի կարգը (equality→range→sort), covering INCLUDE-ը և N+1-ը հասցեագրված են՝ վերագործարկած EXPLAIN-ով հաստատված։ |
| Storage fit | Engine buzzword-ներ։ | B-tree/LSM նշված է։ | Write/read/space amplification-ը, compaction-ը, MVCC dead tuple/autovacuum/bloat-ը, cache hit rate-ը և իրական access pattern-ը driving են engine choice-ը և diagnosis-ը։ |
| Distributed tradeoff | CAP slogan. «CA under partition»։ | CP/AP ընտրված է։ | Partition behavior-ը, անվանված invariant-ը, PACELC latency-ընդդեմ-consistency trade-off-ը, read-your-writes routing-ը և repair path-ը բացահայտ են. ոչ մի անհնար CAP պնդում։ |
| Operational safety | Migration կամ recovery plan չկա։ | Backup նշված է։ | Online migration-ը (expand/contract), replication lag-ը, deadlock/lock-ordering-ը, WAL/checkpoint crash recovery-ն և իրականում գործարկած backup restore-ը (RPO/RTO, PITR) պլանավորված և gated են։ |
