# Data Engineering and Pipelines output templates

## English

Three domain-shaped deliverables. Fill the real fields; tie every guarantee to a mechanism (key, watermark, registry mode, reconciliation). Do not invent throughput numbers, prices, or benchmarks.

### Template 1 — Pipeline design

- **Decision / outcome:** (the metric, table, or stream this unblocks)
- **Pattern:** batch | streaming | micro-batch · **ETL or ELT** (and why — where compute/governance live)
- **Source & ingest:** source system · CDC type (log-based / query-based, with missed-delete handling if query-based)
- **Serialization & schema:** format (Avro / Protobuf) · schema registry + compatibility mode (BACKWARD/FORWARD/FULL)
- **Delivery semantics:** processing guarantee (at-least-once / exactly-once at the stage) · **idempotency key** · sink write (upsert/MERGE/transactional) · replay behavior
- **Windowing (if streaming):** window **type** (tumbling/sliding/session) + size/step/gap · watermark strategy · allowed lateness · late-event path (side-output/DLQ)
- **Bad-record handling:** DLQ target · diagnostic fields (payload/error/offset/timestamp) · transient-vs-poison split · replay path
- **Quality gates:** freshness · volume/row-count · schema · uniqueness · null-rate · source-to-target reconciliation (blocking)
- **Backfill:** versioned/partitioned output · idempotent per partition · reconciliation · atomic swap · rollback
- **Freshness contract:** arrival · allowed lateness · completeness threshold · owner · alert route
- **Assumptions / unknowns:** labeled
- **Verify live:** the real downstream metric/contract checked in the running system (not a green DAG)

### Template 2 — Freshness / SLA contract

- **Dataset & consumers:** what this feeds and who depends on it
- **Expected arrival:** time the data must be available (with timezone)
- **Allowed lateness:** how late before it breaches
- **Completeness threshold:** % of expected rows/events required to be "fresh" (e.g. ≥99%)
- **Event-time vs processing-time:** which "late" is measured against (arrival, not chart render)
- **Owner:** the on-call/team accountable
- **Alert route:** where a breach pages, and the escalation
- **Backfill SLA:** how fast a missed window is reprocessed, and via which runbook
- **Acceptance:** breach is measured on arrival + completeness, has an owner, and alerts — not "the dashboard loaded"

### Template 3 — Schema-evolution / compatibility plan

- **Change:** field(s) added / removed / retyped / renamed
- **Compatibility class:** backward | forward | full | **breaking** (against the registry mode)
- **Registry mode:** BACKWARD (upgrade consumers first) | FORWARD (upgrade producers first) | FULL
- **Consumers:** list every consumer + current cutover status
- **Sequence:** add-with-default → dual-write → migrate consumers → remove (for a rename/remove under BACKWARD)
- **Version & deprecation window:** new version id · how long old + new coexist
- **Rollback:** re-point to the prior schema version
- **Tag/field-id discipline:** never reuse a removed field's tag/position for a new meaning
- **Acceptance:** the registry rejects the breaking version; every consumer has cut over before a required field is dropped

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն երաշխիք կապիր mechanism-ի հետ (key, watermark, registry mode, reconciliation)։ Մի՛ հորինիր throughput թիվ, price կամ benchmark։

### Template 1 — Pipeline design

- **Decision / outcome․** (metric-ը, table-ը կամ stream-ը, որ սա unblock է անում)
- **Pattern․** batch | streaming | micro-batch · **ETL թե ELT** (և ինչու — որտեղ են compute/governance-ը)
- **Source & ingest․** source system · CDC տեսակ (log-based / query-based, missed-delete-ի մշակմամբ, եթե query-based է)
- **Serialization & schema․** format (Avro / Protobuf) · schema registry + compatibility mode (BACKWARD/FORWARD/FULL)
- **Delivery semantics․** processing guarantee (at-least-once / exactly-once stage-ին) · **idempotency key** · sink write (upsert/MERGE/transactional) · replay behavior
- **Windowing (եթե streaming)․** window-ի **տեսակ** (tumbling/sliding/session) + size/step/gap · watermark strategy · allowed lateness · late-event path (side-output/DLQ)
- **Bad-record մշակում․** DLQ target · diagnostic field-եր (payload/error/offset/timestamp) · transient-ընդդեմ-poison բաժանում · replay path
- **Quality gate-եր․** freshness · volume/row-count · schema · uniqueness · null-rate · source-to-target reconciliation (blocking)
- **Backfill․** versioned/partitioned output · idempotent ըստ partition-ի · reconciliation · atomic swap · rollback
- **Freshness contract․** arrival · allowed lateness · completeness threshold · owner · alert route
- **Assumption-ներ / unknown-ներ․** label-ված
- **Verify live․** իրական downstream metric-ը/contract-ը ստուգված running system-ում (ոչ green DAG)

### Template 2 — Freshness / SLA contract

- **Dataset & consumers․** ինչ է սնում սա և ով է կախված դրանից
- **Expected arrival․** ժամանակը, երբ data-ն պետք է հասանելի լինի (timezone-ով)
- **Allowed lateness․** որքան ուշ՝ նախքան breach
- **Completeness threshold․** սպասվող row/event-ի %-ը, որ պետք է լինի «fresh» (օր.՝ ≥99%)
- **Event-time ընդդեմ processing-time-ի․** որի դեմ է չափվում «ուշ»-ը (arrival, ոչ chart render)
- **Owner․** պատասխանատու on-call/թիմ
- **Alert route․** ուր է page անում breach-ը, և escalation-ը
- **Backfill SLA․** որքան արագ է missed window-ը reprocess-վում, և որ runbook-ով
- **Acceptance․** breach-ը չափվում է arrival + completeness-ով, ունի owner և alert է անում — ոչ «dashboard-ը load եղավ»

### Template 3 — Schema-evolution / compatibility plan

- **Change․** field(ներ)՝ ավելացված / հանված / retype-ված / rename-ված
- **Compatibility class․** backward | forward | full | **breaking** (registry mode-ի դեմ)
- **Registry mode․** BACKWARD (նախ consumer upgrade) | FORWARD (նախ producer upgrade) | FULL
- **Consumers․** գրիր ամեն consumer + ընթացիկ cutover status
- **Sequence․** add-with-default → dual-write → migrate consumers → remove (rename/remove-ի համար BACKWARD-ի տակ)
- **Version & deprecation window․** նոր version id · որքան են հին + նոր համակեցում
- **Rollback․** re-point նախորդ schema version-ին
- **Tag/field-id discipline․** երբեք մի՛ reuse արա հանված field-ի tag/position-ը նոր իմաստի համար
- **Acceptance․** registry-ն մերժում է breaking version-ը. ամեն consumer cut over է արել մինչև required field-ի drop-ը
