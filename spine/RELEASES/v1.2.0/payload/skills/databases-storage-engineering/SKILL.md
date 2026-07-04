---
name: "databases-storage-engineering"
description: >-
  use when the work is database and storage engineering: transaction correctness and isolation, schema and data modeling, indexing and query-plan tuning, storage-engine choice (B-tree vs LSM), replication/partitioning/sharding, consistency under partition (CAP/PACELC), MVCC/vacuum/bloat, locking/deadlocks/queueing, WAL/checkpoint/crash recovery, backup-restore and migrations, or a multi-store architecture (OLTP + cache + search + analytics) — for decisions, critique, planning, diagnostics, artifacts, teaching, or evaluation. use as lead when this domain owns the central decision or deliverable (schema-and-index plan, query review, consistency decision, multi-store data architecture, migration/recovery plan). do not use as lead when another skill owns the main artifact and storage is only one input — then support it. հայերեն՝ օգտագործիր տվյալների բազաների և պահեստավորման աշխատանքի համար՝ transaction correctness, schema/index, query plan, storage engine, replication/partition, consistency, MVCC/vacuum, lock/deadlock, WAL/recovery, backup/migration, multi-store architecture։
---

# Databases and Storage Engineering / Տվյալների բազաներ և պահեստավորում

## English

**Scope.** In: transaction correctness and isolation (anomalies, MVCC, locking, deadlocks, snapshot isolation, write skew), schema and data modeling, indexing and query-plan tuning (EXPLAIN, selectivity, covering indexes, N+1), storage-engine choice (B-tree vs LSM, amplification, compaction), replication and partitioning/sharding, consistency under partition (CAP/PACELC, read-your-writes), MVCC garbage and vacuum/bloat, WAL/checkpoints and crash recovery, backup-restore and online migrations, and multi-store architecture (OLTP + cache + search + analytics with explicit consistency boundaries). Out: application feature logic and overall system decomposition (architecture owns those), pipeline/ETL orchestration and stream processing semantics beyond the storage contract (data-engineering owns those), and the host/cluster/observability layer beyond the database's own metrics (devops/SRE owns those). This skill turns storage into stated invariants, plans backed by EXPLAIN and evidence, consistency promises with a named repair path, and migrations/recoveries that have actually been restored.

**Leads / Supports.** Lead when the central deliverable is data-shaped: a schema-and-index plan, a query review, a consistency/isolation decision, a multi-store data architecture, a migration or backup-recovery plan, a storage-engine diagnosis. Support when another skill owns the artifact and storage is one input — e.g. architecture owns the system design and you supply the consistency boundary and the data model; data-engineering owns the pipeline and you supply the target-table schema, partitioning, and idempotency contract; devops owns the rollout and you supply the online-migration (expand/contract) sequence.

Conflict rules:
- **Consistency vs availability → the invariant arbitrates, not taste.** When a design debates CP vs AP, do not argue preference. Name the invariant that must never be wrong (money, access, legal record → CP; staleness acceptable and repairable → AP), the partition behavior, and the repair path. The invariant decides.
- **Schema/consistency boundary → coordinate with architecture, do not redraw the system alone.** You own the data model, indexes, and isolation; where a storage boundary changes a service boundary or a public contract, that is coordinated with `software-systems-architecture`, not unilaterally set here.
- **Irreversible data change → coordinate with the data owner, do not execute on your own authority.** Destructive migrations, drops, and backfills produce the plan, the backup/restore path, and the reversible (expand/contract) sequence; the go decision belongs to the data owner (see `OWNER_NOTES.md`).
- **Pipeline semantics → defer to data-engineering.** You own the target schema, partitioning, and the idempotency key contract; stream exactly-once semantics and orchestration route to `data-engineering-pipelines`.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Start from the invariant, not the schema.** Name the state that must never exist (no double-charge, no negative balance, no two owners of one row) before choosing isolation, indexes, or stores. The invariant drives everything downstream.
2. **Slow query → read EXPLAIN before adding an index.** Inspect scan type, estimated vs actual rows, join order, and sort/hash spill. An index proposed without the query shape and the plan is a guess.
3. **Index order = equality → range → sort.** Put equality predicates first, then the range/inequality, then the `ORDER BY` column; a covering index (`INCLUDE` the selected columns) removes the table lookup. Wrong column order makes the index unusable.
4. **Many small queries per parent row → it is an N+1.** Replace per-parent fetches with one batched query (`IN (ids)` or a join); the tell is query count scaling with result rows.
5. **Duplicate or lost update → check isolation and idempotency, not retries.** Lost updates and double-effects come from read-modify-write races or non-idempotent retries; fix with `SELECT FOR UPDATE`, an atomic update, an idempotency key, or higher isolation — not by retrying harder.
6. **Cross-row invariant under concurrency → snapshot isolation is not enough; guard against write skew.** SI prevents the classic anomalies but allows two transactions reading the same set and each writing a disjoint row to violate a multi-row constraint. Use `SERIALIZABLE`, a materialized conflict row locked `FOR UPDATE`, or an explicit constraint.
7. **CP vs AP → decide from the invariant and state the repair path.** Money/access/legal → CP (refuse some ops under partition). Staleness acceptable and repairable → AP (serve possibly-stale, reconcile after). Never claim "CA under partition" — a partition forces the choice.
8. **Read-your-writes needed → do not read from a lagging replica.** If a user must see their own just-committed write (order confirmation, profile edit), route that read to the primary or use a read-your-writes token; only lag-tolerant reads (history, feeds) go to replicas.
9. **Write-heavy, high-ingest, range-scan workload → consider LSM; in-place-update, point/range OLTP → B-tree.** Tie the engine to write/read/space amplification and compaction cost, not to fashion.
10. **Writes degrade over time on MVCC (Postgres-style) → check dead tuples, autovacuum, and bloat before resizing.** Old row versions accumulate as garbage; if autovacuum cannot keep up, the table and its indexes bloat and scans slow. Tune autovacuum / cure the long transaction holding the snapshot before adding hardware.
11. **Queue/job table → claim rows with `FOR UPDATE SKIP LOCKED`.** This lets N workers pull disjoint rows without blocking each other or processing the same job twice; plain `FOR UPDATE` serializes the workers and `SELECT` without locking double-processes.
12. **Concurrent writers touching the same rows in different orders → impose a lock ordering.** Deadlocks happen when two transactions grab locks A→B and B→A; the engine's deadlock detector kills one victim. Acquire locks in a consistent global order to prevent the cycle; keep transactions short.
13. **Schema change on a live table → expand/contract, never an atomic destructive cutover.** Add backward-compatible columns, dual-write/dual-read, backfill in batches, switch reads, then drop the old shape. A single destructive `ALTER`/drop on a hot table with no reversible path is unsafe.
14. **A backup is not a backup until a restore has succeeded.** Require a tested restore and a measured recovery time; "we have backups" with no restore drill is an untested claim. WAL/PITR needs the base backup plus the archived log replayed to a target time.
15. **Irreversible/production data change → require explicit approval and a stated rollback.** Drops, destructive backfills, and PITR over live data stop and get the data owner's go, with the backup/restore path named, before proceeding.

### Failure modes to prevent / Ձախողման ձևեր

1. **Index added with no query plan.** An index proposed from the column name, not from EXPLAIN; it may be unused, wrong-ordered, or redundant. Tell: "add an index on X" with no scan type, no selectivity, no plan.
2. **Covering-index / N+1 missed.** The query still does a table lookup per row, or the app fires one query per parent. Tell: query count scales with rows; `INCLUDE`/batched fetch never considered.
3. **Isolation chosen by default, not by invariant.** Running at the engine default and assuming it is safe; a cross-row invariant silently breaks. Tell: a money/permission write with no isolation level named.
4. **Write skew under snapshot isolation.** Two transactions each read a shared set, each write a different row, and together violate a constraint (both on-call go off duty, balance goes negative). Tell: SI assumed "serializable enough" with no conflict materialization or constraint.
5. **Lost update from read-modify-write.** Two concurrent updaters read the same value, both write back, one is lost. Tell: `read → compute → write` with no `FOR UPDATE`, atomic update, or version check.
6. **"CA under partition" claimed.** Treating CAP as if all three hold during a partition. Tell: a consistency promise that never says what happens when the network splits.
7. **Stale-replica read where correctness needs read-your-writes.** Reading the just-written row from a lagging replica and showing the user old data. Tell: replica reads on a confirmation/edit path with no lag bound or token.
8. **MVCC bloat ignored.** Dead tuples pile up, autovacuum falls behind (or a long-running transaction pins the snapshot), tables and indexes bloat, scans slow — and the "fix" proposed is more hardware. Tell: degrading writes/scans with no dead-tuple, autovacuum, or long-transaction check.
9. **Deadlocks treated as random.** Recurring deadlocks blamed on load instead of inconsistent lock ordering; no global order imposed. Tell: deadlock victims in the log with no analysis of which two lock orders collide.
10. **Queue table that double-processes or serializes.** A job table read with plain `SELECT` (two workers grab the same job) or plain `FOR UPDATE` (workers block in a line). Tell: a worker pool with no `SKIP LOCKED`.
11. **Destructive migration with no reversible path.** A drop/rename/backfill shipped atomically on a live table; if it is wrong, there is no way back. Tell: an `ALTER`/drop with no expand/contract, no backfill batching, no rollback.
12. **Untested backup / no recovery objective.** Backups that have never been restored, no measured RTO, WAL archiving assumed to work. Tell: "we have backups" with no restore drill, no RPO/RTO, no PITR test.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (schema-and-index plan / query review / consistency decision / multi-store architecture / migration-recovery plan), not generic advice.
- Every index traces to the query shape + EXPLAIN; covering and N+1 are addressed; no index proposed from a column name alone.
- The isolation level is chosen from the named invariant; write-skew and lost-update risks are checked, not assumed away by the default.
- Consistency promises state the partition behavior and a repair path; no "CA under partition"; read-your-writes paths are routed off lagging replicas.
- Storage-engine and MVCC/vacuum claims are mechanism-backed (amplification, compaction, dead tuples, autovacuum, WAL/checkpoint); no engine buzzwords.
- Migrations are reversible (expand/contract) where the table is live; irreversible/data-loss steps are gated with an owner and a tested backup/restore path.
- **Verify in the running database, not on assumption** — re-run EXPLAIN after the index, confirm `plan shows no seq-scan`, run the restore, watch replica lag — before calling the work done.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled; no invented benchmarks, prices, or version-specific numbers.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **transaction correctness** (invariant → isolation level → anomaly risk → MVCC/lock behavior; write skew and lost update handled) · **query-plan literacy** (EXPLAIN, selectivity, join order, sort/spill, covering index, N+1) · **storage fit** (write/read/space amplification, compaction, MVCC/vacuum/bloat, cache, access pattern drive the engine choice) · **distributed tradeoff** (partition behavior, PACELC latency tradeoff, invariant, repair path explicit) · **operational safety** (online migration, replication lag, deadlock/lock ordering, WAL/checkpoint recovery, tested backup restore).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, MVCC/vacuum/bloat, WAL/checkpoints, deadlocks/SKIP LOCKED, snapshot isolation/write skew) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (slow-query diagnosis + multi-store architecture) · `output-templates.md` (query review / schema-and-index plan / multi-store decision) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ transaction correctness և isolation (anomaly-ներ, MVCC, locking, deadlock, snapshot isolation, write skew), schema և data modeling, indexing և query-plan tuning (EXPLAIN, selectivity, covering index, N+1), storage-engine ընտրություն (B-tree ընդդեմ LSM, amplification, compaction), replication և partitioning/sharding, consistency partition-ի տակ (CAP/PACELC, read-your-writes), MVCC garbage և vacuum/bloat, WAL/checkpoint և crash recovery, backup-restore և online migration, և multi-store architecture (OLTP + cache + search + analytics՝ հստակ consistency boundary-ներով)։ Դուրս՝ application-ի feature-տրամաբանությունը և համակարգի ընդհանուր decomposition-ը (architecture-ինն են), pipeline/ETL orchestration-ը և stream processing-ի semantics-ը storage contract-ից այն կողմ (data-engineering-ինն է), և host/cluster/observability շերտը database-ի սեփական metric-ներից այն կողմ (devops/SRE-ինն է)։ Այս skill-ը storage-ը դարձնում է հստակ invariant-ներ, EXPLAIN-ով ու evidence-ով հենված plan-եր, consistency խոստումներ՝ նշված repair path-ով, և migration/recovery, որ իրականում restore-վել են։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը տվյալների ձև ունի՝ schema-and-index plan, query review, consistency/isolation որոշում, multi-store data architecture, migration կամ backup-recovery plan, storage-engine diagnosis։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ storage-ը մեկ input է. օրինակ՝ architecture-ը տիրում է system design-ին, դու տալիս ես consistency boundary-ն և data model-ը. data-engineering-ը տիրում է pipeline-ին, դու տալիս ես target-table schema-ն, partitioning-ը և idempotency contract-ը. devops-ը տիրում է rollout-ին, դու տալիս ես online-migration (expand/contract) հերթականությունը։

Կոնֆլիկտի կանոններ․
- **Consistency ընդդեմ availability → որոշում է invariant-ը, ոչ ճաշակը։** Երբ design-ը վիճում է CP ընդդեմ AP-ի, նախապատվության վեճ մի՛ արա։ Անվանի՛ր invariant-ը, որ երբեք չպետք է սխալ լինի (money, access, legal record → CP. staleness acceptable և repairable → AP), partition behavior-ը և repair path-ը։ Invariant-ը որոշում է։
- **Schema/consistency boundary → համակարգիր architecture-ի հետ, համակարգը մենակ մի՛ վերագծիր։** Դու տիրում ես data model-ին, index-ներին և isolation-ին. երբ storage boundary-ն փոխում է service boundary կամ public contract, դա համակարգվում է `software-systems-architecture`-ի հետ, ոչ թե միակողմանի սահմանվում այստեղ։
- **Անդառնալի data change → համակարգիր data owner-ի հետ, սեփական լիազորությամբ մի՛ կատարիր։** Destructive migration-ները, drop-ները և backfill-ները արտադրում են plan-ը, backup/restore path-ը և հետշրջելի (expand/contract) հերթականությունը. go որոշումը data owner-ինն է (տես `OWNER_NOTES.md`)։
- **Pipeline semantics → զիջիր data-engineering-ին։** Դու տիրում ես target schema-ին, partitioning-ին և idempotency key-ի contract-ին. stream exactly-once semantics-ը և orchestration-ը ուղղորդվում են `data-engineering-pipelines`-ին։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Սկսիր invariant-ից, ոչ schema-ից։** Անվանի՛ր այն state-ը, որ երբեք չպետք է գոյություն ունենա (ոչ double-charge, ոչ բացասական balance, ոչ մեկ row-ի երկու owner) մինչև isolation, index կամ store ընտրելը։ Invariant-ը driving է անում մնացած ամեն ինչ ներքև։
2. **Slow query → EXPLAIN կարդա մինչև index ավելացնելը։** Ստուգիր scan type, estimated ընդդեմ actual rows, join order և sort/hash spill։ Index, որ առաջարկվում է առանց query shape-ի և plan-ի, գուշակություն է։
3. **Index order = equality → range → sort։** Equality predicate-ները նախ դիր, հետո range/inequality-ն, հետո `ORDER BY` սյունը. covering index-ը (selected սյուները `INCLUDE` արած) հանում է table lookup-ը։ Սխալ սյունի կարգը index-ը դարձնում է անօգտագործելի։
4. **Շատ փոքր query-ներ ամեն parent row-ի համար → սա N+1 է։** Per-parent fetch-երը փոխարինիր մեկ batched query-ով (`IN (ids)` կամ join). tell-ը՝ query-ների քանակը մեծանում է result row-երի հետ։
5. **Duplicate կամ lost update → ստուգիր isolation և idempotency, ոչ retry։** Lost update-ը և double-effect-ը գալիս են read-modify-write race-ից կամ ոչ-idempotent retry-ից. ուղղիր `SELECT FOR UPDATE`-ով, atomic update-ով, idempotency key-ով կամ ավելի բարձր isolation-ով, ոչ ավելի շատ retry-ով։
6. **Cross-row invariant concurrency-ի տակ → snapshot isolation-ը բավարար չէ. պաշտպանվիր write skew-ից։** SI-ն կանխում է classic anomaly-ները, բայց թույլ է տալիս, որ երկու transaction կարդան նույն set-ը և ամեն մեկը գրի disjoint row՝ խախտելով multi-row constraint։ Օգտագործիր `SERIALIZABLE`, materialized conflict row՝ `FOR UPDATE` lock-ված, կամ explicit constraint։
7. **CP ընդդեմ AP → որոշիր invariant-ից և նշիր repair path-ը։** Money/access/legal → CP (partition-ի տակ որոշ op մերժիր)։ Staleness acceptable և repairable → AP (հնարավոր stale serve արա, հետո reconcile)։ Երբեք «CA under partition» մի՛ պնդիր — partition-ը պարտադրում է ընտրությունը։
8. **Read-your-writes պետք է → lagging replica-ից մի՛ կարդա։** Եթե user-ը պետք է տեսնի իր հենց նոր commit-ած write-ը (order confirmation, profile edit), այդ read-ը ուղղորդիր primary-ին կամ օգտագործիր read-your-writes token. միայն lag-հանդուրժող read-երը (history, feed) գնում են replica։
9. **Write-heavy, high-ingest, range-scan workload → դիտարկիր LSM. in-place-update, point/range OLTP → B-tree։** Engine-ը կապիր write/read/space amplification-ի և compaction cost-ի հետ, ոչ նորաձևության։
10. **MVCC-ի (Postgres-style) վրա write-ը ժամանակի հետ degrade է անում → ստուգիր dead tuple, autovacuum և bloat մինչև resize-ը։** Old row version-ները կուտակվում են որպես garbage. եթե autovacuum-ը չի հասցնում, table-ը և իր index-ները bloat են լինում, և scan-ը դանդաղում է։ Tune արա autovacuum-ը / բուժիր snapshot-ը պահող երկար transaction-ը մինչև hardware ավելացնելը։
11. **Queue/job table → claim արա row-երը `FOR UPDATE SKIP LOCKED`-ով։** Սա թույլ է տալիս N worker-ի disjoint row-եր քաշել՝ առանց իրար block անելու կամ նույն job-ը երկու անգամ մշակելու. պարզ `FOR UPDATE`-ը serialize է անում worker-ները, իսկ առանց lock-ի `SELECT`-ը double-process է անում։
12. **Concurrent writer-ներ նույն row-երը տարբեր կարգով են դիպչում → պարտադրիր lock ordering։** Deadlock-ը լինում է, երբ երկու transaction lock են վերցնում A→B և B→A. engine-ի deadlock detector-ը սպանում է մեկ victim։ Lock-երը վերցրու հետևողական global կարգով՝ cycle-ը կանխելու համար. transaction-ները կարճ պահիր։
13. **Live table-ի schema change → expand/contract, ոչ երբեք atomic destructive cutover։** Ավելացրու backward-compatible սյուներ, dual-write/dual-read, batch-երով backfill, switch արա read-երը, հետո drop արա հին ձևը։ Մեկ destructive `ALTER`/drop hot table-ի վրա՝ առանց հետշրջելի path-ի, անվտանգ չէ։
14. **Backup-ը backup չէ, մինչև restore-ը հաջողի։** Պահանջիր ստուգված restore և չափված recovery time. «backup ունենք»՝ առանց restore drill-ի, չստուգված պնդում է։ WAL/PITR-ին պետք է base backup plus archived log-ը target time-ին replay արած։
15. **Անդառնալի/production data change → պահանջիր հստակ approval և նշված rollback։** Drop-եր, destructive backfill, և PITR live data-ի վրա կանգնի՛ր և ստացիր data owner-ի go-ն՝ backup/restore path-ը նշված, նախքան շարունակելը։

### Ձախողման ձևեր

1. **Index ավելացված առանց query plan-ի։** Index, որ առաջարկվել է սյունի անունից, ոչ EXPLAIN-ից. կարող է լինել չօգտագործված, սխալ-ordered կամ ավելորդ։ Tell՝ «ավելացրու index X-ի վրա»՝ առանց scan type-ի, selectivity-ի, plan-ի։
2. **Covering-index / N+1 բաց թողնված։** Query-ն դեռ table lookup է անում ամեն row-ի, կամ app-ը մեկ query է կրակում ամեն parent-ի։ Tell՝ query-ների քանակը մեծանում է row-երի հետ. `INCLUDE`/batched fetch երբեք չդիտարկված։
3. **Isolation ընտրված default-ով, ոչ invariant-ով։** Աշխատում է engine default-ով՝ ենթադրելով, որ ապահով է. cross-row invariant-ը լուռ կոտրվում է։ Tell՝ money/permission write՝ առանց isolation level անվանելու։
4. **Write skew snapshot isolation-ի տակ։** Երկու transaction ամեն մեկը կարդում է shared set, ամեն մեկը գրում է տարբեր row, և միասին խախտում են constraint (երկու on-call էլ off duty, balance բացասական)։ Tell՝ SI ենթադրված «serializable-enough»՝ առանց conflict materialization-ի կամ constraint-ի։
5. **Lost update read-modify-write-ից։** Երկու concurrent updater կարդում են նույն արժեքը, երկուսն էլ գրում, մեկը կորում է։ Tell՝ `read → compute → write`՝ առանց `FOR UPDATE`-ի, atomic update-ի կամ version check-ի։
6. **«CA under partition» պնդված։** CAP-ը վերաբերվում է, կարծես երեքն էլ պահվում են partition-ի ժամանակ։ Tell՝ consistency խոստում, որ երբեք չի ասում, ինչ է լինում, երբ network-ը պառակտվում է։
7. **Stale-replica read, որտեղ correctness-ը read-your-writes է պահանջում։** Հենց նոր գրված row-ը կարդալ lagging replica-ից և user-ին հին data ցույց տալ։ Tell՝ replica read confirmation/edit path-ի վրա՝ առանց lag bound-ի կամ token-ի։
8. **MVCC bloat անտեսված։** Dead tuple-ները կուտակվում են, autovacuum-ը հետ է մնում (կամ երկար transaction-ը pin է անում snapshot-ը), table-ները և index-ները bloat են լինում, scan-ը դանդաղում է — և առաջարկվող «fix»-ը ավելի շատ hardware է։ Tell՝ degrade-վող write/scan՝ առանց dead-tuple, autovacuum կամ long-transaction ստուգման։
9. **Deadlock-ները համարված random։** Կրկնվող deadlock-ները մեղադրվում են load-ի վրա՝ inconsistent lock ordering-ի փոխարեն. ոչ մի global order պարտադրված։ Tell՝ deadlock victim-ներ log-ում՝ առանց վերլուծելու, որ երկու lock order է բախվում։
10. **Queue table, որ double-process է անում կամ serialize։** Job table՝ կարդացված պարզ `SELECT`-ով (երկու worker վերցնում են նույն job-ը) կամ պարզ `FOR UPDATE`-ով (worker-ները հերթ են կանգնում)։ Tell՝ worker pool՝ առանց `SKIP LOCKED`-ի։
11. **Destructive migration՝ առանց հետշրջելի path-ի։** Drop/rename/backfill ship-ված atomic live table-ի վրա. եթե սխալ է, հետ ճանապարհ չկա։ Tell՝ `ALTER`/drop՝ առանց expand/contract-ի, backfill batching-ի, rollback-ի։
12. **Չստուգված backup / recovery objective չկա։** Backup, որ երբեք restore չի եղել, չափված RTO չկա, WAL archiving ենթադրված է աշխատող։ Tell՝ «backup ունենք»՝ առանց restore drill-ի, RPO/RTO-ի, PITR test-ի։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (schema-and-index plan / query review / consistency decision / multi-store architecture / migration-recovery plan), ոչ generic advice։
- Ամեն index հետ է գնում query shape-ի + EXPLAIN-ի. covering-ը և N+1-ը հասցեագրված են. ոչ մի index առաջարկված միայն սյունի անունից։
- Isolation level-ը ընտրված է անվանված invariant-ից. write-skew և lost-update ռիսկերը ստուգված են, ոչ default-ով անտեսված։
- Consistency խոստումները նշում են partition behavior-ը և repair path-ը. ոչ «CA under partition». read-your-writes path-երը հանված են lagging replica-ից։
- Storage-engine և MVCC/vacuum պնդումները mechanism-ով են հենված (amplification, compaction, dead tuple, autovacuum, WAL/checkpoint). ոչ engine buzzword։
- Migration-ները հետշրջելի են (expand/contract), որտեղ table-ը live է. անդառնալի/data-loss step-երը gated են owner-ով և ստուգված backup/restore path-ով։
- **Ստուգի՛ր running database-ում, ոչ ենթադրությամբ** — index-ից հետո վերագործարկիր EXPLAIN-ը, հաստատիր `plan-ը seq-scan չի ցույց տալիս`, գործարկիր restore-ը, հետևիր replica lag-ին — մինչև done ասելը։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված. ոչ մի հորինված benchmark, price կամ version-specific թիվ։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **transaction correctness** (invariant → isolation level → anomaly risk → MVCC/lock behavior. write skew և lost update մշակված) · **query-plan literacy** (EXPLAIN, selectivity, join order, sort/spill, covering index, N+1) · **storage fit** (write/read/space amplification, compaction, MVCC/vacuum/bloat, cache, access pattern-ը driving են engine choice-ը) · **distributed tradeoff** (partition behavior, PACELC latency tradeoff, invariant, repair path՝ բացահայտ) · **operational safety** (online migration, replication lag, deadlock/lock ordering, WAL/checkpoint recovery, ստուգված backup restore)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, MVCC/vacuum/bloat, WAL/checkpoint, deadlock/SKIP LOCKED, snapshot isolation/write skew) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (slow-query diagnosis + multi-store architecture) · `output-templates.md` (query review / schema-and-index plan / multi-store decision) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
