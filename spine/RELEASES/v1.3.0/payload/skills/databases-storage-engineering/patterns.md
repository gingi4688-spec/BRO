# Databases and Storage Engineering patterns

## English

These are canonical database and storage moves. Each is a mechanism for one of the domain's artifacts (query review, schema-and-index plan, consistency/isolation decision, multi-store architecture, migration/recovery plan). Choose the move that changes the next decision, not the nicest label.

### 1. EXPLAIN-to-index review

- **Trigger:** A query is slow and someone asks for "an index."
- **Mechanism:** Read EXPLAIN for scan type (seq vs index), estimated vs actual rows, join order/method, and any sort/hash spill. Design the index column order as equality → range → `ORDER BY`, and check whether a covering `INCLUDE` removes the table lookup. Re-run EXPLAIN after the change to confirm the seq-scan/lookup is gone.
- **Do not use when:** The query/parameters are not representative (a cold cache or an unusual user) — confirm a real, repeated query shape first.
- **Failure repair:** If estimated rows are wildly off actual, refresh statistics or inspect data skew before adding indexes; the planner is choosing badly because its numbers are stale, not because an index is missing.

### 2. Isolation-and-anomaly choice

- **Trigger:** A write touches money, permissions, inventory, or any cross-row invariant.
- **Mechanism:** Name the invariant that must never be wrong, map it to the anomaly that would break it (dirty/non-repeatable/phantom/lost-update/write-skew), and set isolation to exactly that level — or add a constraint / explicit `FOR UPDATE` lock. For a cross-row invariant under snapshot isolation, default to `SERIALIZABLE`, a single locked guard row, or a database constraint, because SI permits write skew.
- **Do not use when:** The operation has no cross-transaction invariant (a single independent insert) — raising isolation just adds contention.
- **Failure repair:** If isolation was taken from the engine default, restate the invariant and raise the level (or add the lock/constraint) to the minimum that actually protects it.

### 3. Lost-update and queue concurrency

- **Trigger:** A read-modify-write race produces lost updates or double-effects, or a job/queue table is processed by multiple workers.
- **Mechanism:** For read-modify-write, take `SELECT ... FOR UPDATE` on the row (or use an atomic update / optimistic version column / idempotency key) so a concurrent writer cannot overwrite. For a work queue, claim rows with `SELECT ... FOR UPDATE SKIP LOCKED` so N workers pull disjoint unlocked rows without blocking and without double-processing; add a lease/status column to reclaim a crashed worker's rows.
- **Do not use when:** There is no contention (single writer) — the explicit lock is overhead.
- **Failure repair:** If the queue double-processes, the claim is a plain `SELECT`; if workers serialize, it is plain `FOR UPDATE`; switch to `FOR UPDATE SKIP LOCKED`.

### 4. CP/AP consistency decision

- **Trigger:** A distributed or replicated design debates CP vs AP, or a read is served from a replica.
- **Mechanism:** State the invariant that must never be wrong, the behavior during a partition, and the user-visible result. Choose CP (refuse some operations) when wrong answers harm money, access, or legal records; choose AP (serve possibly-stale, reconcile after) when staleness is acceptable and repairable, and name the repair path. Route read-your-writes paths off lagging replicas; reserve replica reads for lag-tolerant paths with a stated lag bound. PACELC: even without a partition, name the latency-vs-consistency tradeoff of synchronous vs asynchronous replication.
- **Do not use when:** It is a single-node transaction problem — that is an isolation/locking question, not CAP.
- **Failure repair:** If no invariant is named, CAP talk is theater; if the answer claims "CA under partition," replace it with the actual CP-or-AP partition behavior.

### 5. Storage-engine and MVCC-bloat diagnosis

- **Trigger:** Reads or writes degrade after data growth, or write throughput falls over time.
- **Mechanism:** Identify B-tree vs LSM and the dominant cost. For LSM: compaction backlog, read amplification across SSTables, space amplification, bloom-filter use, cache hit rate, disk saturation. For an MVCC (Postgres-style) engine: dead tuples, autovacuum lag, a long-running transaction pinning an old snapshot, and table/index bloat (on-disk size far past live rows). Cure the cause — compaction strategy on the LSM side; ending the long transaction, tuning autovacuum, and reclaiming bloat on the MVCC side.
- **Do not use when:** The bottleneck is application-level N+1 queries — that is a query/index fix, not an engine fix.
- **Failure repair:** If compaction backlog is growing, adding read replicas will not fix write amplification; if MVCC scans slow, more hardware hides bloat instead of curing it — end the long transaction and vacuum.

### 6. Online migration (expand/contract) and tested recovery

- **Trigger:** A live table's schema or data must change, or a backup/recovery plan is owed.
- **Mechanism:** Use expand/contract: add the backward-compatible shape, dual-write/dual-read, backfill in batches (so no single long transaction pins MVCC snapshots), switch reads, then drop the old shape — every step reversible. For recovery, define RPO/RTO, take a base backup plus archived WAL, and **run an actual restore** (including a PITR to a target time) measuring the recovery time, before trusting the backup.
- **Do not use when:** The table is empty or pre-production and a direct change is genuinely reversible — then a plain migration is fine, but still keep a backup.
- **Failure repair:** If a destructive `ALTER`/drop/backfill was shipped atomically with no rollback, stop and convert it to expand/contract, and if a backup has never been restored, run the restore drill before relying on it.

## Հայերեն

Սրանք canonical database և storage move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (query review, schema-and-index plan, consistency/isolation որոշում, multi-store architecture, migration/recovery plan)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. EXPLAIN-ից index review

- **Երբ է պետք․** Query-ն slow է, և խնդրում են «index»։
- **Մեխանիզմը․** EXPLAIN-ում կարդա scan type (seq ընդդեմ index), estimated ընդդեմ actual rows, join order/method, և ցանկացած sort/hash spill։ Index-ի սյունի կարգը նախագծիր equality → range → `ORDER BY`, և ստուգիր՝ covering `INCLUDE`-ը table lookup-ը հանու՞մ է։ Փոփոխությունից հետո վերագործարկիր EXPLAIN-ը՝ հաստատելու, որ seq-scan/lookup-ը գնացել է։
- **Երբ չօգտագործել․** Query/parameter-ները representative չեն (cold cache կամ անսովոր user) — նախ հաստատիր իրական, կրկնվող query shape։
- **Ուղղում․** Եթե estimated rows-ը շատ սխալ է actual-ից, թարմացրու statistics-ը կամ ստուգիր data skew մինչ index ավելացնելը. planner-ը վատ է ընտրում, որովհետև իր թվերը stale են, ոչ թե index է պակասում։

### 2. Isolation-և-anomaly ընտրություն

- **Երբ է պետք․** Write-ը դիպչում է money-ին, permission-ին, inventory-ին կամ ցանկացած cross-row invariant-ի։
- **Մեխանիզմը․** Անվանի՛ր invariant-ը, որ երբեք չպետք է սխալ լինի, քարտեզիր այն anomaly-ին, որ կկոտրեր (dirty/non-repeatable/phantom/lost-update/write-skew), և set արա isolation-ը ճիշտ այդ level-ին — կամ ավելացրու constraint / explicit `FOR UPDATE` lock։ Snapshot isolation-ի տակ cross-row invariant-ի համար լռելյայն ընտրիր `SERIALIZABLE`, մեկ lock-ված guard row կամ database constraint, որովհետև SI-ն թույլ է տալիս write skew։
- **Երբ չօգտագործել․** Operation-ը cross-transaction invariant չունի (մեկ անկախ insert) — isolation բարձրացնելը պարզապես contention է ավելացնում։
- **Ուղղում․** Եթե isolation-ը վերցվել է engine default-ից, վերաձևակերպիր invariant-ը և բարձրացրու level-ը (կամ ավելացրու lock/constraint) մինիմումին, որ իրականում պաշտպանում է այն։

### 3. Lost-update և queue concurrency

- **Երբ է պետք․** Read-modify-write race-ը արտադրում է lost update կամ double-effect, կամ job/queue table-ը մշակվում է մի քանի worker-ով։
- **Մեխանիզմը․** Read-modify-write-ի համար վերցրու `SELECT ... FOR UPDATE` row-ի վրա (կամ օգտագործիր atomic update / optimistic version սյուն / idempotency key), որ concurrent writer-ը չվերագրի։ Work queue-ի համար row-երը claim արա `SELECT ... FOR UPDATE SKIP LOCKED`-ով, որ N worker-ը disjoint unlocked row քաշի՝ առանց block-ի և առանց double-process-ի. ավելացրու lease/status սյուն՝ crash-ած worker-ի row-երը վերադարձնելու։
- **Երբ չօգտագործել․** Contention չկա (մեկ writer) — explicit lock-ը overhead է։
- **Ուղղում․** Եթե queue-ն double-process է անում, claim-ը պարզ `SELECT` է. եթե worker-ները serialize են, պարզ `FOR UPDATE` է. անցիր `FOR UPDATE SKIP LOCKED`-ի։

### 4. CP/AP consistency որոշում

- **Երբ է պետք․** Distributed կամ replicated design-ը վիճում է CP ընդդեմ AP-ի, կամ read-ը serve է լինում replica-ից։
- **Մեխանիզմը․** Գրիր invariant-ը, որ երբեք չպետք է սխալ լինի, partition-ի ժամանակ behavior-ը և user-visible արդյունքը։ CP ընտրիր (որոշ operation մերժիր), երբ սխալ պատասխանները վնասում են money-ին, access-ին կամ legal record-ին. AP ընտրիր (հնարավոր stale serve արա, հետո reconcile), երբ staleness-ը acceptable և repairable է, և անվանի՛ր repair path-ը։ Read-your-writes path-երը հանիր lagging replica-ից. replica read-երը պահիր lag-հանդուրժող path-երի համար՝ նշված lag bound-ով։ PACELC․ նույնիսկ առանց partition-ի, անվանի՛ր synchronous ընդդեմ asynchronous replication-ի latency-ընդդեմ-consistency trade-off-ը։
- **Երբ չօգտագործել․** Սա single-node transaction խնդիր է — դա isolation/locking հարց է, ոչ CAP։
- **Ուղղում․** Եթե invariant չկա, CAP talk-ը theater է. եթե պատասխանը «CA under partition» է պնդում, փոխարինիր այն իրական CP-կամ-AP partition behavior-ով։

### 5. Storage-engine և MVCC-bloat diagnosis

- **Երբ է պետք․** Growth-ից հետո read-ը կամ write-ը degrade է անում, կամ write throughput-ը ժամանակի հետ ընկնում է։
- **Մեխանիզմը․** Տարբերիր B-tree ընդդեմ LSM և գերակշռող cost-ը։ LSM-ի համար՝ compaction backlog, read amplification SSTable-ների միջև, space amplification, bloom-filter use, cache hit rate, disk saturation։ MVCC (Postgres-style) engine-ի համար՝ dead tuple, autovacuum lag, old snapshot pin անող երկար transaction, և table/index bloat (on-disk size՝ live rows-ից շատ ավելի)։ Բուժիր պատճառը — compaction strategy LSM կողմում. երկար transaction-ի ավարտ, autovacuum tuning և bloat-ի վերադարձ MVCC կողմում։
- **Երբ չօգտագործել․** Bottleneck-ը application-level N+1 query-ն է — դա query/index fix է, ոչ engine fix։
- **Ուղղում․** Եթե compaction backlog-ը աճում է, read replica ավելացնելը write amplification-ը չի շտկի. եթե MVCC scan-ը դանդաղում է, ավելի շատ hardware-ը bloat-ը թաքցնում է, ոչ բուժում — ավարտիր երկար transaction-ը և vacuum արա։

### 6. Online migration (expand/contract) և ստուգված recovery

- **Երբ է պետք․** Live table-ի schema-ն կամ data-ն պետք է փոխվի, կամ backup/recovery plan է պարտք։
- **Մեխանիզմը․** Օգտագործիր expand/contract․ ավելացրու backward-compatible ձևը, dual-write/dual-read, batch-երով backfill (որ ոչ մի մեկ երկար transaction MVCC snapshot չ-pin անի), switch արա read-երը, հետո drop արա հին ձևը — ամեն step հետշրջելի։ Recovery-ի համար սահմանիր RPO/RTO, վերցրու base backup plus archived WAL, և **գործարկի՛ր իրական restore** (ներառյալ PITR target time-ին)՝ չափելով recovery time-ը, մինչ backup-ին վստահելը։
- **Երբ չօգտագործել․** Table-ը դատարկ է կամ pre-production, և ուղիղ փոփոխությունը իսկապես հետշրջելի է — ապա պարզ migration-ը նորմալ է, բայց դարձյալ պահիր backup։
- **Ուղղում․** Եթե destructive `ALTER`/drop/backfill ship-վել է atomic առանց rollback-ի, կանգնի՛ր և փոխիր expand/contract-ի, և եթե backup-ը երբեք restore չի եղել, գործարկիր restore drill-ը մինչ դրա վրա հենվելը։
