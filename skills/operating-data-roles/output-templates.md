# Operating Data Roles output templates

## English

Three domain-shaped deliverables. Fill the real fields; every routing decision must carry an owning role, an artifact, and an acceptance check. Do not import data-mesh vocabulary unless the substrate (contracts, stewards, platform) exists.

### Template 1 — Symptom→role routing tree

- **Symptom (classified, not the report):** what actually failed (freshness / definition / causal / serving / standard)
- **Lens (from the cascade):** descriptive | semantic | causal | pipeline | serving | standard/topology
- **Owning role:** data engineer | analytics engineer | data scientist | analyst | ML engineer | architect (→ `data-architecture-leadership`)
- **Artifact the role must produce:** (contract / semantic-model test / experiment design / readout / serving runbook / standard)
- **One acceptance check:** the single observable that proves it is done (a passing test on a real run)
- **Escalation owner & trigger:** who is paged, and on what signal
- **Seam note:** if the question turns into platform/contract/topology *design*, route that to `data-architecture-leadership` and name the steward here
- **Verify live:** the named owner accepts the artifact and the acceptance check passes in the running operating model

### Template 2 — RACI / RAPID grid

- **Frame:** RACI (execution boundary) | RAPID (contested decision) — and why
- **Asset / decision:** the one thing this row governs
- **Per decision row:**
  - RACI — Responsible: ___ · **Accountable (exactly one):** ___ · Consulted: ___ · Informed: ___
  - RAPID — Recommend: ___ · Agree: ___ · Perform: ___ · Input: ___ · **Decide (exactly one):** ___
- **Steward (definition / quality / policy):** ___ — *named separately from the owner*
- **Owner (delivery / SLA):** ___ — *named separately from the steward*
- **On-call routing:** delivery miss → owner; wrong-meaning bug → steward
- **Acceptance:** exactly one Accountable/Decide per row · steward ≠ owner both named · grid changes a real handoff
- **Verify live:** the named owner has accepted the row; the grid is not just on the chart

### Template 3 — Handoff contract

- **Producer → Consumer:** which role hands to which
- **Grain:** what one row represents (state it explicitly)
- **SLA / freshness:** delivery time + allowed lateness
- **Schema-change policy:** how breaking changes are announced and versioned
- **Backfill rule:** how reprocessing is run safely
- **Idempotency key:** the field(s) that make retries/backfills non-duplicating
- **Tests:** the checks the consumer runs to accept (row-count, freshness, definition assertions)
- **Escalation owner:** who is paged when the contract breaks
- **Acceptance:** consumer accepts only when tests + sample rows pass on a real run
- **Governed?:** if yes, name the steward (meaning/policy) in addition to the owner (delivery)

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն ուղղորդման որոշում պետք է կրի տիրող դեր, artifact և acceptance check։ Մի՛ ներմուծիր data-mesh vocabulary, քանի դեռ substrate-ը (contract-ներ, steward-ներ, platform) չկա։

### Template 1 — Symptom→role routing tree

- **Symptom (classified, ոչ report-ը)․** ինչն իրականում ձախողվեց (freshness / definition / causal / serving / standard)
- **Lens (cascade-ից)․** descriptive | semantic | causal | pipeline | serving | standard/topology
- **Տիրող դեր․** data engineer | analytics engineer | data scientist | analyst | ML engineer | architect (→ `data-architecture-leadership`)
- **Artifact, որ դերը պետք է արտադրի․** (contract / semantic-model test / experiment design / readout / serving runbook / standard)
- **Մեկ acceptance check․** միակ observable-ը, որ ապացուցում է ավարտը (անցնող test իրական run-ի վրա)
- **Escalation owner & trigger․** ով է page ստանում, և որ signal-ի վրա
- **Seam note․** եթե հարցը դառնում է platform/contract/topology *design*, ուղղորդիր այն `data-architecture-leadership`-ին և այստեղ անվանիր steward-ը
- **Verify live․** անվանված owner-ը ընդունում է artifact-ը, և acceptance check-ն անցնում է գործող operating model-ում

### Template 2 — RACI / RAPID grid

- **Frame․** RACI (execution boundary) | RAPID (վիճարկվող որոշում) — և ինչու
- **Asset / decision․** այն մեկ բանը, որ այս row-ը կառավարում է
- **Ամեն decision row․**
  - RACI — Responsible․ ___ · **Accountable (ճիշտ մեկը)․** ___ · Consulted․ ___ · Informed․ ___
  - RAPID — Recommend․ ___ · Agree․ ___ · Perform․ ___ · Input․ ___ · **Decide (ճիշտ մեկը)․** ___
- **Steward (definition / quality / policy)․** ___ — *անվանված owner-ից առանձին*
- **Owner (delivery / SLA)․** ___ — *անվանված steward-ից առանձին*
- **On-call routing․** delivery miss → owner. wrong-meaning bug → steward
- **Acceptance․** ճիշտ մեկ Accountable/Decide ամեն row-ում · steward ≠ owner երկուսն էլ անվանված · grid-ը փոխում է իրական handoff
- **Verify live․** անվանված owner-ը ընդունել է row-ը. grid-ը միայն chart-ի վրա չէ

### Template 3 — Handoff contract

- **Producer → Consumer․** որ դերն է հանձնում որին
- **Grain․** ինչ է ներկայացնում մեկ row-ը (նշիր բացահայտ)
- **SLA / freshness․** delivery ժամ + allowed lateness
- **Schema-change policy․** ինչպես են breaking change-երը հայտարարվում և versioned
- **Backfill rule․** ինչպես է reprocessing-ը ապահով գործարկվում
- **Idempotency key․** field(եր)-ը, որ retry/backfill-ը non-duplicating են դարձնում
- **Tests․** check-երը, որ consumer-ը գործարկում է ընդունելու համար (row-count, freshness, definition assertion)
- **Escalation owner․** ով է page ստանում, երբ contract-ը breach է լինում
- **Acceptance․** consumer-ը ընդունում է միայն, երբ tests + sample rows-ն անցնում են իրական run-ի վրա
- **Governed՞․** եթե այո, owner-ից (delivery) բացի անվանիր steward-ը (meaning/policy)
