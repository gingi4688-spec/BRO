# Databases and Storage Engineering output templates

## English

Three domain-shaped deliverables. Fill the real fields; every index traces to EXPLAIN, every consistency promise names the partition behavior, and no number is invented. Do not propose an index from a column name or claim a backup that was never restored.

### Template 1 — Query review

- **Query & access pattern:** the SQL, the predicates (equality / range), the `ORDER BY`, and the columns returned
- **EXPLAIN findings:** scan type (seq vs index) · estimated vs actual rows (gap → stale stats / skew) · join order & method · sort/hash spill
- **Diagnosis:** the specific cause(s) — missing/mis-ordered index, stale statistics, N+1, full table scan
- **Index proposal:** `(equality_cols, range_col, sort_col) INCLUDE (returned_cols)` — justify each position; note if covering removes the heap lookup
- **N+1 check:** does query count scale with result rows? → batch with `IN (ids)` or a join
- **Consistency note:** is any read on a read-your-writes path served from a lagging replica? route it to primary / token
- **Assumptions & unknowns:** table size, cardinality, whether stats are fresh
- **Verify live:** re-run EXPLAIN after the index — confirm index scan, no separate sort, no seq scan
- **Acceptance:** index justified by the plan · covering/N+1 addressed · re-run EXPLAIN confirms

### Template 2 — Schema-and-index plan (with isolation & migration)

- **Invariant(s):** the state that must never exist (no double-charge, no negative stock, one owner per row)
- **Data model:** tables/columns/types, keys, foreign keys, constraints that enforce the invariant
- **Isolation choice:** the level per critical write, mapped to the anomaly it prevents; write-skew/lost-update guard (`FOR UPDATE` / `SERIALIZABLE` / constraint) where a cross-row invariant exists
- **Indexes:** per hot query, the index (equality→range→sort, covering `INCLUDE`), traced to EXPLAIN
- **Concurrency:** lock ordering for multi-row transactions; `FOR UPDATE SKIP LOCKED` for any queue/job table
- **Migration plan:** expand/contract sequence (add backward-compatible → dual-write/dual-read → batched backfill → switch reads → drop old); reversible at each step
- **Recovery:** RPO/RTO · backup type (base + WAL) · a **tested** restore / PITR
- **Owner & approval:** irreversible/data-loss steps gated (see `OWNER_NOTES.md`)
- **Acceptance:** invariant enforced · isolation matches it · migration reversible · restore actually run

### Template 3 — Multi-store / consistency decision

- **System of record:** the single strongly-consistent store that owns the invariants (and why it is the truth)
- **Derived stores:** each cache / search / analytics / read-model store, marked as a projection (not a source of truth)
- **Per store — consistency boundary:** strongly-consistent | bounded-stale (TTL) | eventually-consistent (CDC) | lag-tolerant read-only — stated explicitly
- **Propagation:** how writes reach the derived stores (write-through / invalidation / outbox / CDC / batch ETL) and the dual-write trap it closes
- **CP/AP per store:** partition behavior — what refuses, what goes stale — and the repair path (reindex / reconcile)
- **Read-your-writes:** which paths must hit the primary; which may read a replica/cache with a stated lag bound
- **PACELC note:** the latency-vs-consistency tradeoff of sync vs async replication where relevant
- **Assumptions & unknowns:** volumes/cardinalities to measure before sizing/sharding
- **Acceptance:** exactly one source of truth · every derived store has a stated boundary + repair path · no "CA under partition"

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն index հետ է գնում EXPLAIN-ի, ամեն consistency խոստում անվանում է partition behavior-ը, և ոչ մի թիվ չի հորինվում։ Index մի՛ առաջարկիր սյունի անունից և backup մի՛ պնդիր, որ երբեք restore չի եղել։

### Template 1 — Query review

- **Query & access pattern․** SQL-ը, predicate-ները (equality / range), `ORDER BY`-ը և վերադարձվող սյուները
- **EXPLAIN findings․** scan type (seq ընդդեմ index) · estimated ընդդեմ actual rows (բացը → stale stats / skew) · join order & method · sort/hash spill
- **Diagnosis․** կոնկրետ պատճառ(ներ)ը — բացակայող/սխալ-ordered index, stale statistics, N+1, full table scan
- **Index proposal․** `(equality_cols, range_col, sort_col) INCLUDE (returned_cols)` — արդարացրու ամեն դիրք. նշիր՝ covering-ը հանու՞մ է heap lookup-ը
- **N+1 check․** query count-ը մեծանու՞մ է result row-երով → batch արա `IN (ids)`-ով կամ join-ով
- **Consistency note․** read-your-writes path-ի որևէ read serve է՞ լինում lagging replica-ից. ուղղորդիր primary-ին / token-ին
- **Assumption-ներ & unknown-ներ․** table size, cardinality, stats-ը թա՞րմ է
- **Verify live․** index-ից հետո վերագործարկիր EXPLAIN — հաստատիր index scan, ոչ առանձին sort, ոչ seq scan
- **Acceptance․** index-ը արդարացված է plan-ով · covering/N+1 հասցեագրված · վերագործարկած EXPLAIN-ը հաստատում է

### Template 2 — Schema-and-index plan (isolation & migration-ով)

- **Invariant(ներ)․** այն state-ը, որ երբեք չպետք է գոյություն ունենա (ոչ double-charge, ոչ բացասական stock, մեկ owner ամեն row-ի)
- **Data model․** table/column/type, key-եր, foreign key-եր, invariant-ը enforce անող constraint-ներ
- **Isolation choice․** level-ը ամեն critical write-ի, քարտեզված այն anomaly-ին, որ կանխում է. write-skew/lost-update guard (`FOR UPDATE` / `SERIALIZABLE` / constraint), որտեղ cross-row invariant կա
- **Index-ներ․** ամեն hot query-ի index-ը (equality→range→sort, covering `INCLUDE`), հետ գծված EXPLAIN-ին
- **Concurrency․** lock ordering multi-row transaction-ների համար. `FOR UPDATE SKIP LOCKED` ցանկացած queue/job table-ի համար
- **Migration plan․** expand/contract հերթականություն (backward-compatible ավելացրու → dual-write/dual-read → batched backfill → switch read-եր → drop հին-ը). հետշրջելի ամեն step-ին
- **Recovery․** RPO/RTO · backup type (base + WAL) · **ստուգված** restore / PITR
- **Owner & approval․** անդառնալի/data-loss step-երը gated (տես `OWNER_NOTES.md`)
- **Acceptance․** invariant-ը enforce-ված · isolation-ը համապատասխանում է · migration-ը հետշրջելի · restore-ը իրականում գործարկված

### Template 3 — Multi-store / consistency որոշում

- **System of record․** միակ strongly-consistent store-ը, որ տիրում է invariant-ներին (և ինչու է truth-ը)
- **Derived store-եր․** ամեն cache / search / analytics / read-model store՝ նշված որպես projection (ոչ source of truth)
- **Ամեն store-ի consistency boundary․** strongly-consistent | bounded-stale (TTL) | eventually-consistent (CDC) | lag-հանդուրժող read-only — բացահայտ նշված
- **Propagation․** ինչպես են write-երը հասնում derived store-երին (write-through / invalidation / outbox / CDC / batch ETL) և dual-write trap-ը, որ փակում է
- **CP/AP ամեն store-ի․** partition behavior — ինչ է մերժվում, ինչ է stale լինում — և repair path-ը (reindex / reconcile)
- **Read-your-writes․** որ path-երը պետք է հասնեն primary-ին. որոնք կարող են replica/cache կարդալ՝ նշված lag bound-ով
- **PACELC note․** sync ընդդեմ async replication-ի latency-ընդդեմ-consistency trade-off-ը, որտեղ տեղին է
- **Assumption-ներ & unknown-ներ․** volume/cardinality՝ չափելու մինչ sizing/sharding
- **Acceptance․** ճիշտ մեկ source of truth · ամեն derived store ունի նշված boundary + repair path · ոչ «CA under partition»
