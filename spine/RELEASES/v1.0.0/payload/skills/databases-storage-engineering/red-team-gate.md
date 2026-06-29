# Databases and Storage Engineering red-team gate

## English

This gate extends the skill's final gate for the domain artifacts (query review, schema-and-index plan, consistency/isolation decision, multi-store architecture, migration/recovery plan). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Index proposed with no query plan** — do not approve "add an index on X" without the query shape and EXPLAIN; require scan type, selectivity, and column order (equality→range→sort).
- **Covering / N+1 missed** — do not approve a query review that leaves a per-row heap lookup or a per-parent query; require a covering `INCLUDE` and a batched fetch.
- **Isolation taken from the default** — do not approve a money/permission/inventory write with no isolation level named against the invariant.
- **Write skew under snapshot isolation** — do not approve a cross-row invariant "protected" only by SI; require `SERIALIZABLE`, a locked guard row, or a constraint.
- **Lost update from read-modify-write** — do not approve `read → compute → write` with no `FOR UPDATE`, atomic update, or version check.
- **"CA under partition"** — do not approve a consistency claim that says all three of C/A/P hold during a partition; require an explicit CP-or-AP partition behavior.
- **Stale-replica read on a read-your-writes path** — do not approve a confirmation/edit read served from a lagging replica with no lag bound or token.
- **MVCC bloat ignored** — do not approve "add hardware" for degrading writes/scans without checking dead tuples, autovacuum lag, and a long transaction pinning a snapshot.
- **Deadlocks treated as random** — do not approve "it's just load" for recurring deadlocks; require lock-ordering analysis of the two colliding orders.
- **Queue table that double-processes or serializes** — do not approve a worker pool with plain `SELECT` (double-process) or plain `FOR UPDATE` (serialize); require `SKIP LOCKED`.
- **Destructive migration with no rollback** — do not approve an atomic `ALTER`/drop/backfill on a live table with no expand/contract and no reversible path.
- **Untested backup** — do not approve "we have backups" with no restore drill, no RPO/RTO, and no PITR test.

### Reviewer probes (ask these of any answer)

- Show the plan: what does EXPLAIN say — scan type, estimated vs actual rows, sort/spill — and which line does the proposed index remove? If the index is justified by a column name, not the plan, it is a guess.
- Is the index ordered equality → range → `ORDER BY`, and does a covering `INCLUDE` remove the heap lookup? Does query count scale with result rows (an N+1)?
- What is the invariant this write protects, and which isolation level (or lock/constraint) is mapped to the anomaly that would break it? If a cross-row invariant runs under snapshot isolation, where is the write-skew guard?
- For a read-modify-write, where is the `FOR UPDATE` / atomic update / version check that prevents a lost update?
- For a distributed/replicated claim: what happens during a partition — which operations refuse (CP) or which reads go stale (AP) — and what is the repair path? Does any answer claim "CA under partition"?
- Which reads are on a read-your-writes path, and are any of them served from a lagging replica without a lag bound or a token?
- If writes/scans are degrading on an MVCC engine: were dead tuples, autovacuum lag, and a long-running transaction holding a snapshot checked before recommending more hardware?
- For recurring deadlocks: which two lock orders collide, and is a consistent global lock order imposed? For a queue/job table, is the claim `FOR UPDATE SKIP LOCKED`?
- Is the live-table migration expand/contract (reversible at each step), and has the backup actually been restored (RPO/RTO measured, PITR tested), or is "we have backups" being trusted untested?
- Did the answer invent any price, benchmark, or version-specific number, and is the Armenian equal-depth and punctuation-clean (correct `․`/`։`/«», no homoglyphs)?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը domain artifact-ների համար (query review, schema-and-index plan, consistency/isolation որոշում, multi-store architecture, migration/recovery plan)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Index առաջարկված առանց query plan-ի** — մի՛ approve արա «ավելացրու index X-ի վրա»՝ առանց query shape-ի և EXPLAIN-ի. պահանջիր scan type, selectivity և սյունի կարգ (equality→range→sort)։
- **Covering / N+1 բաց թողնված** — մի՛ approve արա query review, որ թողնում է per-row heap lookup կամ per-parent query. պահանջիր covering `INCLUDE` և batched fetch։
- **Isolation վերցված default-ից** — մի՛ approve արա money/permission/inventory write՝ առանց invariant-ի դեմ isolation level անվանելու։
- **Write skew snapshot isolation-ի տակ** — մի՛ approve արա cross-row invariant, որ «պաշտպանված» է միայն SI-ով. պահանջիր `SERIALIZABLE`, lock-ված guard row կամ constraint։
- **Lost update read-modify-write-ից** — մի՛ approve արա `read → compute → write`՝ առանց `FOR UPDATE`-ի, atomic update-ի կամ version check-ի։
- **«CA under partition»** — մի՛ approve արա consistency պնդում, որ ասում է C/A/P երեքն էլ պահվում են partition-ի ժամանակ. պահանջիր բացահայտ CP-կամ-AP partition behavior։
- **Stale-replica read read-your-writes path-ի վրա** — մի՛ approve արա confirmation/edit read serve-ված lagging replica-ից՝ առանց lag bound-ի կամ token-ի։
- **MVCC bloat անտեսված** — մի՛ approve արա «hardware ավելացրու» degrade-վող write/scan-ի համար՝ առանց dead tuple-ի, autovacuum lag-ի և snapshot pin անող երկար transaction-ի ստուգման։
- **Deadlock-ները համարված random** — մի՛ approve արա «պարզապես load է» կրկնվող deadlock-ի համար. պահանջիր երկու բախվող order-ի lock-ordering վերլուծություն։
- **Queue table, որ double-process է անում կամ serialize** — մի՛ approve արա worker pool՝ պարզ `SELECT`-ով (double-process) կամ պարզ `FOR UPDATE`-ով (serialize). պահանջիր `SKIP LOCKED`։
- **Destructive migration առանց rollback-ի** — մի՛ approve արա atomic `ALTER`/drop/backfill live table-ի վրա՝ առանց expand/contract-ի և հետշրջելի path-ի։
- **Չստուգված backup** — մի՛ approve արա «backup ունենք»՝ առանց restore drill-ի, RPO/RTO-ի և PITR test-ի։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ցույց տուր plan-ը․ ինչ է ասում EXPLAIN-ը — scan type, estimated ընդդեմ actual rows, sort/spill — և որ տողն է հանում առաջարկվող index-ը։ Եթե index-ը արդարացված է սյունի անունով, ոչ plan-ով, գուշակություն է։
- Index-ը ordered է՞ equality → range → `ORDER BY`, և covering `INCLUDE`-ը հանու՞մ է heap lookup-ը։ Query count-ը մեծանու՞մ է result row-երով (N+1)։
- Ինչ է invariant-ը, որ այս write-ը պաշտպանում է, և որ isolation level-ն է (կամ lock/constraint) քարտեզված այն anomaly-ին, որ կկոտրեր այն։ Եթե cross-row invariant-ը աշխատում է snapshot isolation-ի տակ, որտեղ է write-skew guard-ը։
- Read-modify-write-ի համար որտեղ է `FOR UPDATE` / atomic update / version check-ը, որ կանխում է lost update-ը։
- Distributed/replicated պնդման համար․ ինչ է լինում partition-ի ժամանակ — որ operation-ները մերժվում են (CP) կամ որ read-երը stale են լինում (AP) — և ինչ է repair path-ը։ Որևէ պատասխան «CA under partition» պնդու՞մ է։
- Որ read-երն են read-your-writes path-ի վրա, և դրանցից որևէ մեկը serve է՞ լինում lagging replica-ից՝ առանց lag bound-ի կամ token-ի։
- Եթե write/scan-ը degrade է անում MVCC engine-ի վրա․ dead tuple-ները, autovacuum lag-ը և snapshot պահող երկար transaction-ը ստուգվե՞լ են մինչ ավելի շատ hardware առաջարկելը։
- Կրկնվող deadlock-ի համար․ որ երկու lock order է բախվում, և հետևողական global lock order պարտադրվա՞ծ է։ Queue/job table-ի համար claim-ը `FOR UPDATE SKIP LOCKED` է՞։
- Live-table migration-ը expand/contract է՞ (հետշրջելի ամեն step-ին), և backup-ը իրականում restore-վե՞լ է (RPO/RTO չափված, PITR ստուգված), թե «backup ունենք»-ին վստահում են չստուգված։
- Պատասխանը հորինե՞ց price, benchmark կամ version-specific թիվ, և հայերենը equal-depth ու punctuation-clean է՞ (ճիշտ `․`/`։`/«», առանց homoglyph-ի)։
