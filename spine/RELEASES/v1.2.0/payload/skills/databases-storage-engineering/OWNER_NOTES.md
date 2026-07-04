# Databases and Storage Engineering owner notes

## English

### Needs human review when

This skill plans and reasons about data; it must route to the data owner — not act or auto-approve — when a step is irreversible, can lose or corrupt data, or changes a correctness or consistency promise. Produce the plan, the evidence, and the rollback; then stop and route to the owner. Escalate and require explicit approval when:

- **Irreversible or data-loss changes** — `DROP`/`TRUNCATE`, a destructive `ALTER`, a `DELETE`/`UPDATE` without a tested filter, or a backfill that overwrites existing data. Require a fresh backup and, where possible, an expand/contract sequence so the change is reversible. Name the rollback before proceeding.
- **Point-in-time recovery on live data** — a PITR or a restore that replaces or rewinds production state. This can lose committed writes between the target time and now; require the owner to confirm the target time and accept the data lost after it.
- **Schema changes on a hot, large table** — a migration that locks, rewrites, or long-holds an MVCC snapshot on a table under live traffic. Require batched/online execution (expand/contract) and an owner-approved maintenance window if a lock is unavoidable.
- **Changing a correctness or consistency promise** — lowering isolation, switching a path from the primary to a replica, moving a store from CP to AP, or relaxing a constraint. These trade correctness for latency/availability; the tradeoff and its blast radius belong to the owner, not a silent default.
- **Credentials, encryption, and data-at-rest** — rotating database credentials, changing encryption keys, or altering who can read PII. Mis-sequenced rotation can lock out services or expose data; require an owner and a rollback window.
- **Cross-store reconciliation and the source of truth** — declaring which store is authoritative when OLTP, cache, search, and analytics disagree, or running a reconciliation that overwrites one store from another. Require the owner to confirm the system of record before any store is overwritten.
- **Capacity/sharding commitments** — a sharding key or a partitioning scheme that is expensive to change later. Surface the access-pattern evidence; the commitment, once data is written, is owner-level because reshaping a sharded dataset under traffic is a major operation.

The default posture for all of the above: produce the plan, the evidence (EXPLAIN, the invariant, the backup/restore proof), and the reversible path; then stop and route to the data owner. Do not execute the irreversible step on your own authority. Where the boundary overlaps another domain, coordinate — system/service boundaries with `software-systems-architecture`, pipeline/ETL semantics with `data-engineering-pipelines`, host/cluster/observability with `devops-platform-sre`.

### Owned future-improvement items

- **✓ DELIVERED (gazan 2026-07-02)** — Add a third worked example for an **online expand/contract migration** end to end (add column → dual-write/dual-read → batched backfill → switch reads → drop), since it is the correct answer whenever a destructive cutover is proposed on a live table.
- **✓ DELIVERED (gazan 2026-07-02)** — Add a **deadlock-analysis worked example** that reads a real deadlock log, identifies the two colliding lock orders, and derives the consistent global order — to make the lock-ordering rule concrete.
- Add a copy-ready **multi-window backup/recovery drill checklist** (RPO/RTO, base backup, WAL archive, restore-to-scratch, PITR-to-target) so "tested restore" is a procedure, not a slogan.
- Add a **sharding / partitioning decision worked example** (choosing a key, hot-partition avoidance, resharding cost) once the multi-store architecture example is in place, to cover horizontal scale.
- Cross-link the pipeline overlap explicitly to `data-engineering-pipelines` for exactly-once and idempotency semantics that sit just beyond the storage contract owned here.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը պլանավորում և դատում է տվյալների մասին. այն պետք է ուղղորդի data owner-ին — ոչ թե գործի կամ ինքնահաստատի — երբ քայլը անդառնալի է, կարող է data կորցնել կամ corrupt անել, կամ փոխում է correctness կամ consistency խոստում։ Արտադրի՛ր plan-ը, evidence-ը և rollback-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Անդառնալի կամ data-loss change-եր** — `DROP`/`TRUNCATE`, destructive `ALTER`, `DELETE`/`UPDATE` առանց ստուգված filter-ի, կամ backfill, որ վերագրում է եղած data։ Պահանջիր թարմ backup և, որտեղ հնարավոր է, expand/contract հերթականություն, որ փոփոխությունը հետշրջելի լինի։ Անվանի՛ր rollback-ը մինչ շարունակելը։
- **Point-in-time recovery live data-ի վրա** — PITR կամ restore, որ փոխարինում կամ հետ է գլորում production state-ը։ Սա կարող է կորցնել commit-ած write-երը target time-ի և հիմա-ի միջև. պահանջիր, որ owner-ը հաստատի target time-ը և ընդունի դրանից հետո կորած data-ն։
- **Schema change hot, մեծ table-ի վրա** — migration, որ lock է անում, rewrite կամ երկար պահում MVCC snapshot live traffic-ի տակ table-ի վրա։ Պահանջիր batched/online execution (expand/contract) և owner-հաստատված maintenance window, եթե lock-ը անխուսափելի է։
- **Correctness կամ consistency խոստման փոփոխություն** — isolation իջեցնել, path-ը primary-ից replica փոխել, store-ը CP-ից AP տեղափոխել, կամ constraint թուլացնել։ Սրանք correctness-ը փոխանակում են latency/availability-ի հետ. trade-off-ը և իր blast radius-ը owner-ինն են, ոչ լուռ default։
- **Credential, encryption և data-at-rest** — database credential-ների rotation, encryption key-ի փոփոխություն, կամ ով կարող է PII կարդալ-ի փոփոխություն։ Սխալ-հերթականության rotation-ը կարող է service-ները կողպել կամ data բացահայտել. պահանջիր owner և rollback window։
- **Cross-store reconciliation և source of truth** — հայտարարել, թե որ store-ն է authoritative, երբ OLTP, cache, search և analytics համաձայն չեն, կամ գործարկել reconciliation, որ մի store-ը մյուսից վերագրում է։ Պահանջիր, որ owner-ը հաստատի system of record-ը մինչ որևէ store-ի վերագրումը։
- **Capacity/sharding commitment-ներ** — sharding key կամ partitioning scheme, որ թանկ է հետո փոխել։ Ցույց տուր access-pattern evidence-ը. commitment-ը, երբ data արդեն գրված է, owner-level է, որովհետև sharded dataset-ը traffic-ի տակ վերաձևելը խոշոր operation է։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր plan-ը, evidence-ը (EXPLAIN, invariant-ը, backup/restore-ի ապացույցը) և հետշրջելի path-ը. հետո կանգնի՛ր և ուղղորդիր data owner-ին։ Անդառնալի քայլը սեփական լիազորությամբ մի՛ կատարիր։ Որտեղ boundary-ն համընկնում է այլ domain-ի հետ, համակարգիր — system/service boundary-ները `software-systems-architecture`-ի հետ, pipeline/ETL semantics-ը `data-engineering-pipelines`-ի հետ, host/cluster/observability-ն `devops-platform-sre`-ի հետ։

### Սեփական ապագա-բարելավման կետեր

- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու երրորդ worked example **online expand/contract migration**-ի ծայրից ծայր (column ավելացրու → dual-write/dual-read → batched backfill → switch read-եր → drop), քանի որ դա ճիշտ պատասխանն է, երբ live table-ի վրա destructive cutover է առաջարկվում։
- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու **deadlock-analysis worked example**, որ կարդում է իրական deadlock log, հայտնաբերում երկու բախվող lock order-ը, և բխեցնում հետևողական global order-ը — lock-ordering կանոնը կոնկրետ դարձնելու։
- Ավելացրու copy-ready **multi-window backup/recovery drill checklist** (RPO/RTO, base backup, WAL archive, restore-to-scratch, PITR-to-target), որ «tested restore»-ը procedure լինի, ոչ slogan։
- Ավելացրու **sharding / partitioning decision worked example** (key ընտրել, hot-partition խուսափել, resharding cost), երբ multi-store architecture օրինակը տեղում է, horizontal scale-ը ծածկելու։
- Cross-link արա pipeline-ի համընկնումը բացահայտ `data-engineering-pipelines`-ին exactly-once և idempotency semantics-ի համար, որ հենց այստեղ տիրվող storage contract-ից այն կողմ են։
