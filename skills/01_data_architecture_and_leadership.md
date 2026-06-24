# Skill 01 — Data Architecture & Leadership
### Enterprise Data Architect · Chief Data Architect · Chief Data Officer (CDO)

> **EN:** This is Bro's "data" capability — three roles in one layered competency: the architect who decides *how* data is structured/stored/moved/secured, the chief architect who decides *what patterns/standards/direction* govern every team, and the CDO who treats data as an enterprise asset (strategy, governance, value, risk, culture). Theory + frameworks + decision-rules + anti-patterns + glossary, written as my own private operating manual — read it, then act with a senior's judgment, not a beginner's hesitation. Sources I draw on: DAMA-DMBOK2, TOGAF (Phase C Data), EDM Council **DCAM**, Kimball/Inmon/Linstedt (Data Vault), Codd (relational), Dehghani (Data Mesh), DalleMule & Davenport (offensive/defensive data strategy), Kleppmann (DDIA), DataOps, FAIR (risk), GDPR/ISO-8000/ISO-27001 families.
>
> **HY:** Սա Bro-ի «data» competency-ն է՝ երեք role մեկ շերտավոր capability-ում՝ architect-ը, որ որոշում է *ոնց* ա data-ն structured/stored/moved/secured, chief architect-ը, որ որոշում է *ինչ pattern-ներ/standard-ներ/ուղղություն* են govern անում ամեն team, ու CDO-ն, որ data-ն դիտում ա որպես enterprise asset (strategy, governance, value, risk, culture)։ Theory + frameworks + decision-rule-ներ + anti-pattern-ներ + բառարան՝ գրված որպես իմ սեփական operating manual — կարդա, հետո գործիր senior-ի judgment-ով, ոչ թե սկսնակի վարանումով։ Status: **v2 (top-level), 2026-06-13 → 2026-06-23** (living — Գևի incoming info-ն ու ամ նոր scar-ը շերտ ա դառնում)։

---

## 0. Ո՞Ր ՈՍՊՆՅԱԿԸ ԵՐԲ (the three lenses)

| Role | Horizon | Ի՞նչ ա որոշում | Question it asks |
|---|---|---|---|
| **Enterprise Data Architect** | systems / technical | *Ոնց ա* data-ն modeled, stored, moved, integrated, secured | "Is this the right structure, and will it scale & stay consistent?" |
| **Chief Data Architect** | enterprise / standards | *Ի՞նչ patterns/standards/reference-arch* են governing ամ team-ին; tech selection; roadmap | "Does this fit our architecture, our principles, our 3-year direction?" |
| **Chief Data Officer (CDO)** | business / executive | Data **strategy, governance, value, risk, culture** — data as an enterprise asset | "Does this create value / reduce risk / is it trustworthy & compliant?" |

**Rule of use:** start from the CDO question (why / value / risk), descend to the Chief-Architect question
(fit / standards), land on the Data-Architect question (structure / mechanics). Most mistakes = jumping straight
to mechanics without the value & fit questions → you build the wrong thing correctly.

**The inversion test (when which lens dominates):** if the cost of *being wrong* is a refactor → architect lens
is enough. If the cost is a re-platform or a re-org → chief-architect lens. If the cost is a fine, a breach, lost
trust, or a strategy that doesn't pay → CDO lens, first. **Sizing the blast radius tells you which hat to wear.**

**The escalation reflex:** I default to deciding (L-decisive), but three triggers force me up a lens before I touch
mechanics — (1) the decision is *irreversible* (core entity shape, tenancy model, primary store), (2) it crosses a
*domain/ownership boundary*, (3) it touches *regulated data*. Hit any of those and I stop and answer the value/fit
question explicitly, out loud, before drawing a single table.

---

## 1. MINDSET — operating principles (CDO-level, governs everything below)

1. **Data is an asset and a liability simultaneously.** It compounds value (analytics, AI, product) AND accrues
   risk (privacy, breach, decay). Every decision weighs both. (DalleMule & Davenport: **offensive** data strategy =
   value/revenue/analytics; **defensive** = security/compliance/single-source-of-truth. Pick the balance per company;
   regulated/foundational → defensive-leaning; growth/product → offensive-leaning.)
2. **Single Source of Truth (SSOT), then fan out.** One authoritative source per concept; everything else is a
   read-replica/projection/lens. The corollary: **single source of truth, multiple systems of record is a smell** —
   if two systems both *originate* the same fact, you don't have an SSOT, you have a future reconciliation bug.
3. **Model the business, not the screen or the report.** Data outlives apps and dashboards. The conceptual/canonical
   model is the durable layer; UIs and reports are disposable projections. A schema shaped like today's UI is a
   liability the day the UI changes — and it always changes.
4. **Governance is an enabler, not a gate.** Good governance makes the right thing the easy thing (standards,
   catalogs, contracts), not a committee that says no. If governance is felt as friction by good actors, it's
   designed wrong — paved roads, not toll booths.
5. **Make correctness enforceable, not aspirational.** A rule with no automated guard will drift. Data quality rules,
   schema contracts, and lineage checks become CI/runtime gates. **Shift-left**: catch the violation at the producer
   commit, not in the consumer's dashboard three weeks later.
6. **Decentralize ownership, centralize standards.** Domains own their data and its quality; the center owns the
   rules of interoperability (the data-mesh insight, even without full mesh tooling). The center's job is the
   *interfaces between domains*, never the *internals of one*.
7. **Privacy & security by design, by default.** Minimize collection, classify everything, encrypt sensitive,
   tokenize secrets, least-privilege, isolate tenants. Retrofit privacy = expensive and incomplete. **You cannot
   bolt on what you didn't design in** — especially erasure, residency, and consent.
8. **Measure the data function like a product.** Adoption, trust (DQ scores), time-to-data, cost, value realized.
   What isn't measured isn't governed. The dashboard about the data is itself a data product — hold it to the
   same standard.
9. **The running pipeline is the truth — not the DAG on disk.** A model, contract, or transform that's been edited
   but not deployed/reloaded is NOT live. Always know which version of the schema and which version of the transform
   is actually producing the rows consumers read. Migration/reload/backfill are first-class operations, not
   afterthoughts. (Sister scar to Skill 02's source-running drift: data drift is worse because it's *silent* — wrong
   rows look exactly like right rows until someone reconciles.)
10. **Conway's Law is a data law too.** Your data architecture will mirror your org chart whether you plan it or not.
    If three teams own one entity, you'll get three "truths." Decide ownership boundaries deliberately, or the org
    chart decides them for you — badly.

---

## 2. ENTERPRISE DATA ARCHITECT — the technical core

### 2.1 Data modeling — the three levels (never skip a level)
- **Conceptual** — entities + relationships in business language, tech-agnostic ("Customer subscribes to Service").
  Output: domain/canonical model. This is the contract everyone agrees on.
- **Logical** — attributes, keys, normalization, cardinality; still platform-agnostic.
- **Physical** — tables, columns, types, indexes, partitions, constraints for a specific engine (e.g. PostgreSQL).

**Why never skip:** skip conceptual → you encode one team's mental model as everyone's truth. Skip logical → you bake
physical optimizations into the meaning of the data. The levels are *decoupling layers*: the conceptual model can
survive a database migration; the physical model is allowed to be ugly for performance *because* the logical model
holds the meaning.

**Keys — the spine of every model:**
- **Natural key** = a real-world identifier (email, ISBN, refnum). Meaningful, but mutable and sometimes non-unique →
  risky as a primary key.
- **Surrogate key** = a system-generated, meaningless, immutable id (serial/UUID). The default PK for durable
  entities; decouples identity from any business attribute that might change.
- **Business key** = the *stable* natural identifier a domain agrees on (Data Vault calls it the hub key). Carry it
  alongside the surrogate; it's how you match across systems and survive a re-platform.
- **UUID vs sequence:** UUID for distributed generation / no central coordination / merge-ability; sequence for
  index locality and human-debuggability. UUIDv7 (time-ordered) gives you both-ish. Never expose a sequence PK as a
  public, guessable identifier.

**Cardinality & relationships:** name the cardinality of every relationship (1:1, 1:N, M:N) and its *optionality*.
M:N always becomes an associative/junction entity — and that junction is usually a real business concept in disguise
(an "Enrollment," a "Membership"), not just plumbing. **Find the hidden entity in every many-to-many.**

**Normalization (OLTP/transactional):** aim 3NF for write-side integrity (no update anomalies, no redundant truth).
The normal-form ladder, said plainly: **1NF** = atomic values, no repeating groups; **2NF** = no partial dependency
on part of a composite key; **3NF** = no transitive dependency (non-key depends only on the key). BCNF for the
edge cases where a non-trivial dependency's determinant isn't a candidate key. **Codd's rule of thumb:** "the key,
the whole key, and nothing but the key." Denormalize deliberately and only for measured read performance,
documenting the trade — denormalization is a *cache*, and like every cache it needs an invalidation story.

**Dimensional modeling (OLAP/analytics — Kimball):** facts (measures, events, grain) + dimensions (context, conformed
across facts). Star schema default; snowflake only when dimension reuse demands it. **Grain first** — declare the
fact grain ("one row per invoice line per day") before anything else; ambiguous grain is the #1 warehouse bug.
**Fact types:** *transaction* (one row per event), *periodic snapshot* (one row per entity per period), *accumulating
snapshot* (one row per process instance, updated as it progresses — perfect for pipelines/funnels/order lifecycles).
**Additivity:** know whether a measure is *additive* (sum across all dims — revenue), *semi-additive* (sum across
some, not time — account balance), or *non-additive* (ratios, percentages — never sum, recompute from components).
Summing a semi-additive measure across time is a classic silent wrong-number bug.

**Inmon vs Kimball vs Data Vault:**
- **Inmon (CIF):** top-down, 3NF enterprise warehouse → dependent marts. Best when enterprise consistency dominates.
- **Kimball:** bottom-up conformed dimensional marts → bus matrix. Faster value, business-friendly. The **bus matrix**
  (business processes × conformed dimensions) is the planning artifact — it shows where dimensions *must* conform.
- **Data Vault 2.0 (Linstedt):** Hubs (business keys) + Links (relationships) + Satellites (descriptive, historized).
  Best for auditable, source-agnostic, highly-changeable integration layers; verbose for direct consumption (serve a
  dimensional layer on top). Use when lineage/auditability/many-sources/schema-churn dominate.
- **One Big Table (OBT) / wide denormalized:** with columnar engines, a single wide flat table can outperform a star
  for many analytical workloads (no joins). Valid for serving layers / specific marts; not an integration strategy.
  Choose it for the *gold* layer, never for the source of truth.

**Canonical / semantic model:** one shared definition of each core entity that all systems map to (the anti-Babel
layer). A **semantic layer / metrics layer** (e.g. dbt semantic models, headless BI, Cube) centralizes metric
definitions so "revenue" means one thing everywhere — the metric is defined *once*, near the model, and every BI tool,
notebook, and API reads that one definition.

**Slowly Changing Dimensions (SCD):** Type 0 (retain original, never change), Type 1 (overwrite, no history),
Type 2 (new row + validity dates + current-flag, history preserved — the default for anything you'll audit),
Type 3 (limited prior-value columns), Type 4 (history split to a separate table), Type 6 (1+2+3 hybrid). Know when
history matters: **if anyone will ever ask "what did it look like back then?", you need Type 2 or an event log —
decided at design time, because you can't reconstruct history you never captured.**

**Temporal modeling:** distinguish **valid time** (when the fact was true in the world) from **transaction/system
time** (when the database learned it). Bitemporal modeling tracks both — mandatory for finance, insurance, and any
domain that must answer "what did we *believe* on date X about what was *true* on date Y" (e.g. restating a report).

**Schema evolution discipline:** additive changes (new nullable column, new table) are safe; renames, type narrowing,
and drops are breaking. Treat the schema as a published API (see §2.3 data contracts). Expand-and-contract migration:
add new → dual-write/backfill → switch readers → drop old. Never rename-in-place on a shared table.

### 2.2 Storage & processing architectures
- **OLTP** (row-store, normalized, low-latency writes) vs **OLAP** (columnar, denormalized, scan-heavy reads).
  Don't run heavy analytics on the OLTP primary — replicate/stream to an analytics store. **HTAP** (hybrid) engines
  blur this, but the workload-isolation instinct (keep analytics off the transactional hot path) stays right.
- **Row vs columnar — why it matters:** row-store reads whole records fast (point lookups, writes); columnar reads
  one column across millions of rows fast and compresses brilliantly (aggregations, scans). The storage layout *is*
  the workload decision.
- **Data Warehouse** — curated, schema-on-write, governed, BI-ready. Trust high, flexibility lower.
- **Data Lake** — raw, schema-on-read, cheap, all formats. Flexibility high, governance risk high → **"data swamp"**
  without catalog + ownership.
- **Lakehouse** — lake storage + warehouse semantics (ACID tables: Delta/Iceberg/Hudi). The current default for new
  analytics estates. Open table formats give you ACID, time-travel, schema enforcement, and partition evolution on
  cheap object storage — warehouse trust at lake cost.
- **Data Mesh vs the above:** mesh is an *operating model*, not a storage tier — domain-owned data products on a
  self-serve platform. You can run a mesh *on* a lakehouse. Don't confuse the org pattern (§5) with the storage box.
- **Medallion architecture** — **Bronze** (raw/immutable, append-only, replayable) → **Silver** (cleaned/conformed/
  deduped/typed) → **Gold** (business-level aggregates/marts, semantic-layer-ready). Clean mental model for any
  pipeline maturity. **Bronze is sacred — never mutate it; it's your replay tape.** Everything downstream is
  reproducible from Bronze + code.
- **Lambda vs Kappa** — batch+speed layers vs stream-only. Kappa (stream-first, reprocess from log) is simpler when
  your event log is the source of truth; Lambda's two code paths (batch + stream) double the bug surface and the
  reconciliation pain — prefer Kappa unless a batch-only historical correction path forces Lambda.
- **Partitioning & file layout (the silent cost lever):** partition by the column you filter on (usually time);
  avoid small-file proliferation (compaction), avoid over-partitioning (a partition per user = metadata death).
  In analytics, **how the bytes are laid out on disk often dwarfs query SQL for cost/latency.**

### 2.3 Integration & movement
- **ETL vs ELT** — transform-before-load (classic, governed) vs load-then-transform (modern, leverages warehouse
  compute, keeps raw). ELT default in lakehouse/cloud — but ELT without a Bronze raw retention is just ETL pretending.
- **CDC (Change Data Capture)** — capture row changes from OLTP (log-based, e.g. WAL/Debezium) to feed analytics/
  search/caches without dual-writes. Log-based CDC > query-based polling (no missed deletes, no load on the primary,
  ordered). Pairs with the **outbox pattern** for reliable event emission (write business row + event in one
  transaction → relay publishes → exactly-once-ish). **Dual-write across two systems with no shared transaction is
  always a bug** — outbox or CDC, never two `INSERT`s and a prayer.
- **Orchestration** — DAG schedulers (Airflow/Dagster/Prefect) for dependencies, retries, backfills, SLAs.
  Asset/lineage-aware orchestration (Dagster's software-defined assets) beats pure task scheduling because it knows
  *what data* a task produces, not just *that a task ran*. **Idempotent, replayable, backfillable** is the bar for
  every job — a job you can't safely re-run is a job you can't operate.
- **Data contracts** — a producer↔consumer agreement: schema, semantics, SLAs, quality guarantees, versioning,
  ownership. Breaking changes go through versioning, not surprise. **Schema registry** + contract tests in CI prevent
  the "someone renamed a column and 14 dashboards died" failure. The contract is owned by the *producer* but
  *negotiated* with consumers — and it's the seam where shift-left enforcement lives.
- **Delivery semantics — say which one, every time:** at-most-once (may drop), at-least-once (may duplicate → consumers
  must be idempotent), exactly-once (effective-once via idempotency keys + dedup + outbox; true exactly-once over a
  network is a myth). Pick deliberately per pipeline; "we'll figure out duplicates later" is how you get
  double-counted revenue.
- **API & event data shapes** — REST/GraphQL/gRPC for sync; Kafka/queues/event-bus for async. Event schemas are data
  contracts too (Avro/Protobuf/JSON-Schema + registry). Prefer **event-as-fact** ("OrderPlaced" with the payload) over
  **event-as-trigger** ("go look it up") when consumers need to be decoupled and replayable.
- **Backfill & reprocessing as design inputs:** assume you *will* need to recompute history (bug found, logic
  changed, new consumer). Design pipelines so a backfill is a parameter, not a heroic one-off — replay from Bronze,
  partition by time, make transforms pure functions of input.

### 2.4 Master Data Management (MDM) & Reference Data
- **Master data** = the shared core nouns (Customer, Product, Location, Vendor). **Reference data** = controlled
  vocabularies/code lists (country codes, statuses, currencies). Rule of thumb: **master data = the rows everyone
  argues about owning; reference data = the lookup tables nobody should be redefining.**
- **MDM styles:** **Registry** (index + match, sources keep their copy — read-only golden view), **Consolidation**
  (collect → golden record for analytics), **Coexistence** (golden record synced back to sources), **Centralized/
  Transaction** (MDM hub is the system of entry). Choose by how much control vs disruption you can take.
- **Golden record** built via **match/merge** (deterministic + probabilistic/fuzzy matching), survivorship rules
  (which source wins per attribute — "trust source A for address, source B for phone"), and stewardship (humans
  resolve ambiguous merges). **Entity resolution** is the hard core: blocking (reduce comparison space) → scoring
  (similarity) → clustering (group matches) → merge. Set thresholds for auto-merge vs review-queue; tune for the cost
  asymmetry (a wrong merge fuses two real customers — usually worse than a missed merge).
- **Reference data governance:** one owner per code list, versioned, no hardcoded enums scattered in apps. A status
  value lives in *one* governed table with an owner, not as a magic string in fourteen services.
- **Hierarchies & affiliations:** master data isn't flat — Customer→Parent-Company, Product→Category, Location→Region.
  Model the hierarchy explicitly (and its versioning); reorgs and acquisitions change it, and analytics rolls up
  along it.

### 2.5 Metadata, catalog, lineage
- **Three kinds of metadata:** **technical** (schemas, types, jobs), **business** (definitions, owners, glossary),
  **operational** (freshness, volume, run stats, quality scores). A fourth is rising: **social** (who uses this,
  who endorsed it, popularity) — the signal that tells a newcomer which of five similar tables is the trusted one.
- **Data catalog** — searchable inventory: what data exists, what it means, who owns it, how fresh, how trusted.
  Kills "does this table exist / can I trust it" archaeology. A catalog without *adoption* is a graveyard — the test
  is whether analysts search it before they Slack someone.
- **Lineage** — column/table-level provenance (source → transforms → consumers). Enables impact analysis ("if I
  change X, what breaks?"), root-cause ("this number is wrong — where did it come from?"), and compliance ("where did
  this PII go?"). **Column-level lineage > table-level** — most impact questions are about a specific field.
- **Active metadata** — metadata that drives automation (auto-classify PII, auto-apply masking, auto-alert on drift,
  auto-deprecate unused tables). The catalog stops being a passive wiki and becomes a control plane.

### 2.6 Data quality (DQ) architecture
- **Dimensions:** Accuracy · Completeness · Consistency · Timeliness/Freshness · Validity · Uniqueness · Integrity.
  Add **Conformity** (matches the agreed format/standard) when integrating many sources.
- **Approach:** define DQ rules per **Critical Data Element (CDE)** → measure → score → alert → remediate → prevent at
  source. Prevention > detection > correction. You don't QA *everything* — you identify the handful of CDEs that
  drive money/risk/decisions and guard those hard.
- **Data observability** — freshness, volume, schema, distribution, lineage monitoring (the "5 pillars"); anomaly
  detection on pipelines (the data equivalent of APM). Catches the *unknown-unknowns* (a source silently halved its
  rows) that rule-based DQ misses.
- **DQ at the contract boundary** — validate on ingest and at producer publish, not only in reports. **Circuit-break
  bad data**: a pipeline that detects a quality breach should *quarantine and halt the affected partition*, not
  cheerfully propagate garbage to gold and dashboards. Failing loud beats serving wrong.
- **Reconciliation as a first-class check:** row-count and control-total reconciliation between source and target on
  every load. The cheapest, highest-value DQ check, and the one teams skip until they've shipped a wrong number.

### 2.7 Security, privacy, multi-tenancy (architect-level)
- **Classify** every data element (Public / Internal / Confidential / Restricted-PII). Classification drives controls.
  Without classification, every other control is a guess. **Tag at the column level**, propagate the tag through
  lineage (active metadata), so masking follows the data automatically.
- **Controls:** encryption at rest + in transit; **field-level encryption** for secrets/PII (e.g. Fernet);
  **tokenization/masking/pseudonymization** (and know the difference: pseudonymization is reversible with a key →
  still personal data under GDPR; anonymization is irreversible → out of scope, but true anonymization is *hard*);
  **least privilege** (default-deny, role-scoped); **row-level security (RLS)**; **column-level security** for
  sensitive fields; key management & rotation; audit of access to sensitive data.
- **Multi-tenancy models:** silo (DB-per-tenant) · bridge (schema-per-tenant) · pool (shared schema + tenant_id + RLS).
  Pool = most cost/ops-efficient, hardest to isolate correctly → **RLS + fail-closed policies + tenant context binding
  are non-negotiable.** The app must connect as a least-privilege role, never the table owner (owners bypass RLS),
  and the tenant context must be set per-request and impossible to spoof. Test the isolation in CI — a cross-tenant
  leak is the breach that ends a SaaS.
- **Privacy engineering:** data minimization, purpose limitation, retention/deletion policies, right-to-erasure
  mechanics, consent tracking, data residency (where rows physically live — matters for EU and other regulated
  markets). **Erasure is a lineage problem:** you can only delete what you can find; PII fan-out into logs, backups,
  caches, and derived tables is the thing that makes "right to be forgotten" technically painful — design for it.

---

## 3. CHIEF DATA ARCHITECT — architecture leadership

### 3.1 What changes at this level
You stop drawing one system and start **governing how all systems are drawn**. Deliverables shift from schemas to:
- **Architecture principles** (short, enforceable statements: "Buy before build for commodity; one canonical entity
  per concept; events over point-to-point integration; privacy-by-default; raw data is immutable and replayable").
- **Reference architectures** — the blessed patterns teams instantiate (the standard pipeline, the standard
  multi-tenant data layer, the standard event-choreography) so they don't reinvent. A reference arch is only real if
  there's a *paved-road* implementation teams can copy, not just a diagram.
- **Standards & catalogs** — naming, modeling, integration, security standards; the entity/API/event catalogs.
- **Technology strategy** — build-vs-buy, tool selection, target-state vs current-state, **roadmap** with migration
  paths (never big-bang; phased, reversible, value-delivering increments).

### 3.2 Governance mechanisms (how an architect leads without being a bottleneck)
- **ADRs (Architecture Decision Records)** — every significant decision captured: context, options, decision,
  consequences. Durable, reviewable, prevents re-litigation. The ADR records *why not* the alternatives — that's the
  part future-you forgets and re-argues.
- **Architecture review** — lightweight, criteria-based (does it fit principles, reuse canonicals, avoid new silos?),
  not a gatekeeping ritual. Review the *deviations*, not every conforming design — async, criteria-driven, fast-path
  for "follows the reference arch."
- **Fitness functions** — automated tests that enforce architectural properties continuously (no cross-tenant leak,
  no duplicate canonical, no schema drift, no PII column without a classification tag). This is principle #5 made
  real at the architecture layer: the rule is code, not a wiki page.
- **Capability-based alignment** — map every data asset/system to a business capability; gaps and overlaps become
  visible. Avoid org-chart-shaped architecture (the Conway's Law trap, §1.10).
- **Target operating model for data architecture:** centralized standards + federated execution; an architecture
  guild; clear escalation. The center publishes interfaces and paved roads; domains build behind them.

### 3.3 Build-vs-buy & selection discipline
- Buy commodity (auth, payments, mail infra, generic ETL connectors), build differentiators (a config-driven
  multi-tenant kernel that is your moat → build). Evaluate on: fit-to-capability, TCO (including ops/people, not just
  license), lock-in/exit cost, security & compliance posture, extensibility, data-portability (can you get YOUR data
  out?), and team capacity to operate it.
- Prefer **reversible decisions** (Bezos "two-way doors") fast; deliberate hard only on irreversible ones
  (data model of a core entity, tenancy model, primary datastore, the event/contract schema everyone depends on).
- **The lock-in lens for data tools specifically:** proprietary table formats, proprietary SQL dialects, and "your
  data lives in our cloud" pricing are the data-world's golden handcuffs. Favor open formats (Parquet/Iceberg/Delta)
  and standard SQL at the boundaries you'll want to leave through.

---

## 4. CHIEF DATA OFFICER (CDO) — strategy, governance, value, risk, culture

### 4.1 Data strategy
- **Frame:** offensive (grow revenue, analytics, AI, data products) vs defensive (control, compliance, SSOT, risk).
  State the chosen balance explicitly; it cascades into every architecture choice. (DalleMule & Davenport's single
  most useful CDO move: pick the tilt, write it down, and let it arbitrate the inevitable trade-offs.)
- **Strategy artifact:** vision → guiding principles → priority use-cases → capability roadmap → operating model →
  metrics. Tie every data initiative to a business outcome (revenue, cost, risk, experience). No "data for data's
  sake." A platform/program without a named owner and a named outcome is a hobby.
- **Sequencing:** crawl (get foundational data trustworthy + governed) → walk (analytics/BI on it) → run (data
  products, ML/AI). Skipping to "run" on un-governed, low-quality data is the #1 way AI/analytics initiatives die —
  garbage in, confident garbage out.

### 4.2 Data governance — the operating system of trust
- **What it covers:** ownership/stewardship, policies, standards, data quality, metadata/glossary, privacy/security,
  lifecycle/retention, issue management, compliance.
- **Roles:** **Data Owner** (accountable, usually business exec — "the buck stops here for this domain") ·
  **Data Steward** (day-to-day quality/definitions, the working hands of governance) · **Data Custodian** (technical
  operation — DBAs/platform) · **Governance Council** (cross-domain decisions, standards ratification). RACI it:
  exactly one Accountable per data domain, no orphaned data.
- **Operating models:** **Centralized** (one team, strong control, can bottleneck) · **Federated/Hub-and-spoke**
  (central standards + domain stewards — most common, scales) · **Decentralized** (domain-autonomous, needs strong
  shared standards = data mesh's premise).
- **Frameworks to anchor on:**
  - **DAMA-DMBOK2** — the 11 knowledge areas (see §5). The encyclopedic reference.
  - **DCAM (EDM Council)** — capability/maturity assessment model for data management.
  - **DataOps** — agile + CI/CD + observability applied to data pipelines (automate, test, monitor, iterate).
- **Make it real:** policies → standards → automated controls → catalog → metrics dashboard. Governance that lives
  only in a PDF is theater. **Start with the CDEs and one painful domain** — boil-the-ocean governance programs
  collapse under their own weight; land value on the data that hurts most, then expand.

### 4.3 Data as a product / value & monetization
- **Data-as-a-product** thinking: each significant dataset has an owner, an SLA, documentation, quality guarantees,
  discoverability, and consumers — treated like a product, not a byproduct. Dehghani's checklist for a data product:
  discoverable, addressable, trustworthy/SLA'd, self-describing, interoperable, secure (**DATSIS**).
- **Value realization:** internal (better decisions, automation, efficiency, risk reduction) and external (data
  products, benchmarks, insights, platform features). For a SaaS platform, **the customers' operational data + the
  insights you give back are the product's stickiness.**
- **Monetization ladder:** improve internal decisions → optimize operations → enhance product (analytics features) →
  new data-driven products → (carefully, legally) data sharing/marketplaces. Each rung has a privacy/consent gate —
  and the higher rungs require the lower rungs' trust foundation to already exist.

### 4.4 Privacy, compliance, risk, ethics
- **Regulatory map:** GDPR (EU — lawful basis, DSARs, right-to-erasure, DPIA, breach notice 72h, data residency),
  CCPA/CPRA (California), sector rules (PCI-DSS for card data, HIPAA for US health, etc.), plus applicable national
  personal-data laws and cross-border transfer rules. When unsure on legal specifics → flag for a qualified lawyer
  (architect proposes, lawyers ratify). **My job is to make compliance mechanically possible (classification,
  lineage, retention automation, consent tracking); the lawyer's job is to say what's required.**
- **Risk management:** classify, assess likelihood×impact, mitigate (controls), accept/transfer/avoid the residual;
  maintain a risk register. **FAIR** for quantifying information risk in money terms (so risk competes for budget on
  the same scale as everything else).
- **Data ethics & responsible AI:** fairness/bias, transparency, explainability, consent, purpose limitation, human
  oversight. When a platform adds AI (assistants, analytics), this becomes a first-class CDO concern: model
  governance, training-data provenance/lineage, PII in prompts, the right to *not* have your data train a model, and
  output auditability. Treat the model's training set as a governed data product like any other.
- **Lifecycle & retention:** define retention per data class; automate deletion; legal hold; the right to be forgotten
  must be mechanically executable (you can't honor erasure if you don't have lineage). **Data has a half-life** —
  most of it is liability after its useful window; default to deletion schedules, not infinite hoarding.

### 4.5 Culture, literacy, org design, metrics
- **Data literacy** — invest in people reading/using data correctly; the best architecture fails on data-illiterate
  consumers. A correct number, misread, does the same damage as a wrong number.
- **Org design** — where the data function sits (often CDO peer to CTO/CFO), centralized vs federated stewards,
  RACI for data decisions. The CDO's reporting line is itself a strategy signal: under the CTO → tech-led; standalone
  → asset-led.
- **Metrics that matter:** data quality scores (trend), governance coverage (% critical elements owned/cataloged),
  time-to-data, adoption (catalog/active users), cost-per-TB/per-pipeline, value realized (use-cases shipped),
  incidents (DQ/privacy) trend. Dashboard them; review on a cadence. **Pick a small set and trend them** — a wall of
  vanity metrics governs nothing.

---

## 5. CANONICAL FRAMEWORK QUICK-REFERENCE

**DAMA-DMBOK2 — 11 knowledge areas** (the "DAMA Wheel," Data Governance at the hub):
1. Data Governance · 2. Data Architecture · 3. Data Modeling & Design · 4. Data Storage & Operations ·
5. Data Security · 6. Data Integration & Interoperability · 7. Document & Content Management ·
8. Reference & Master Data · 9. Data Warehousing & BI · 10. Metadata Management · 11. Data Quality.
*Use as the completeness checklist for "have we thought about the whole data function?"*

**TOGAF Phase C (Data Architecture):** baseline → target data architecture, data entity/component catalogs,
data-to-application/function matrices, gap analysis, migration. Data architecture is one half of the Information
Systems Architecture phase (with Application).

**DCAM (EDM Council):** maturity model across data strategy, governance, architecture, quality, etc. — used to
assess "how good is our data management" and plan improvement. Pair with a current→target maturity score per domain.

**Zachman Framework:** the ontology — what/how/where/who/when/why × scope/business/system/tech/detail. Use as a
completeness checklist, not a method.

**Codd's relational model:** the theoretical bedrock — data as relations, set-based operations, normalization,
declarative querying. Every relational decision is downstream of it; know it so you know *why* 3NF and *when* to break it.

**Data Mesh (Dehghani) — 4 principles:** domain-oriented ownership · data-as-a-product · self-serve data platform ·
federated computational governance. Org/operating-model shift more than a tech stack; adopt the principles even at
small scale (domains own quality; central owns interop standards). Don't adopt mesh *tooling* before you have the
*org maturity* — premature mesh = N data swamps instead of one.

**Kleppmann (DDIA) lens:** the three concerns of any data system — *reliability* (works correctly under faults),
*scalability* (handles growth), *maintainability* (operability + simplicity + evolvability). A useful gut-check on
any architecture before committing.

**DataOps:** version control + CI/CD + automated testing + monitoring/observability + fast feedback for data work.

---

## 6. DECISION RULES (fast, reusable)

- **Which modeling approach?** Transactional integrity → normalized 3NF (OLTP). BI/analytics consumption →
  dimensional/Kimball. Heavy multi-source integration + audit + schema churn → Data Vault, serve dimensional on top.
  Single high-volume scan-only serving table on a columnar engine → consider OBT for that mart only.
- **Surrogate or natural key?** Durable entity / value might change / public-facing → surrogate PK + carry the
  business key. Stable, externally-governed identifier and you control uniqueness → natural key acceptable.
- **Warehouse vs lake vs lakehouse?** Structured + governed + BI → warehouse. Raw/varied/cheap/ML → lake (with catalog).
  Want both without two stacks → lakehouse (ACID table format). Default new estate → lakehouse + medallion.
- **SCD type?** Never changes → Type 0/1. History matters / will be audited / "what did it look like then?" → Type 2.
  Need both current and prior-of-one-attribute side by side → Type 3. Heavy history + clean current → Type 4/6.
- **MDM style?** Can't disrupt sources → Registry. Need analytics golden record → Consolidation. Need golden record
  back in sources → Coexistence. New greenfield system-of-entry → Centralized.
- **Sync vs async integration?** Need immediate consistency / request-response → API. Decoupling, fan-out, resilience,
  multiple consumers → events. **Cross-domain side-effects → events (choreography), not inline calls.**
- **CDC vs batch extract?** Low latency / no missed deletes / no load on primary → log-based CDC. Daily-enough and
  source is small → scheduled batch. **Never dual-write across systems → outbox/CDC.**
- **Lambda vs Kappa?** Event log is the source of truth and you can reprocess from it → Kappa. A separate batch
  correction path is genuinely required → Lambda (and accept the double maintenance).
- **Centralize or federate governance?** Few domains / high control need → centralized. Many domains / scale / domain
  expertise matters → federated hub-and-spoke (default). Mature + autonomous domains → mesh.
- **Build or buy?** Commodity & non-differentiating → buy. Core moat / unique config thesis → build. Reversible →
  decide fast; irreversible (core data model, tenancy, primary store) → deliberate hard. Watch data-portability/lock-in.
- **Offensive or defensive tilt?** Regulated / foundational / trust-critical → defensive. Growth / product-led /
  analytics-driven → offensive. Re-balance as the company matures.
- **Crawl/walk/run on a new data initiative?** Foundational data not trustworthy yet → fix governance/quality first.
  Trustworthy + governed → analytics/BI. Mature foundation → data products / ML. **Never run before the data is clean.**

---

## 7. ANTI-PATTERNS (smell → fix)

- **Data swamp** — lake with no catalog/ownership/quality → nobody trusts it. *Fix:* catalog + owners + DQ + medallion.
- **Spaghetti integration** — N×N point-to-point pipelines → fragile, opaque. *Fix:* hub/event-bus + contracts + lineage.
- **Multiple "sources of truth"** — Customer in 5 systems, none authoritative. *Fix:* MDM + canonical entity.
- **Reverse-ETL-as-architecture / dual writes** — apps writing the same fact to two stores → drift. *Fix:* CDC + outbox, one writer.
- **Metric chaos** — "revenue" computed 6 ways. *Fix:* semantic/metrics layer, one definition.
- **Hardcoded reference data** — status/enum/code lists scattered in code. *Fix:* governed reference data, one owner.
- **Governance theater** — policies in a PDF, no automated enforcement. *Fix:* policy → standard → CI/runtime guard (fitness functions).
- **Tenant leakage in pooled multi-tenancy** — missing/permissive RLS, app runs as DB owner. *Fix:* fail-closed RLS, least-privilege role, tenant-context binding, CI gate.
- **History loss** — Type-1 overwrite on data you must audit. *Fix:* SCD Type 2 / event log / Data Vault satellites.
- **Big-bang migration** — rewrite-and-cutover. *Fix:* strangler-fig, phased, reversible, value each step.
- **PII you can't find** — no classification/lineage → can't honor erasure or breach scope. *Fix:* classify + lineage + active metadata.
- **Ambiguous grain** — fact table where nobody can state "one row per ___". *Fix:* declare grain first, before any column.
- **Schema-shaped-like-the-UI** — model mirrors today's screen/report. *Fix:* model the business concepts; UI is a projection.
- **Mutated Bronze** — "fixing" raw data in place → lost replay tape. *Fix:* Bronze is immutable/append-only; correct in Silver.
- **Semi-additive summed over time** — balances/inventories summed across periods → inflated nonsense. *Fix:* snapshot-aware aggregation, mark additivity.
- **Backfill-by-heroics** — every reprocess is a one-off script. *Fix:* idempotent, parameterized, replay-from-Bronze pipelines.
- **Silent pipeline drift** — edited transform/schema not deployed, or no version surfaced → consumers read stale logic. *Fix:* know/surface the running version, treat reload/migration as first-class, contract tests in CI.
- **Premature mesh** — mesh tooling/decentralization before org maturity → N swamps. *Fix:* federated hub-and-spoke first; adopt mesh principles, defer mesh sprawl.
- **Garbage-in AI/analytics** — ML/BI on ungoverned, low-quality data. *Fix:* crawl/walk/run — clean+govern the foundation first.
- **Pseudonymity mistaken for anonymity** — "we hashed the id, it's anonymous" → still personal data, still in scope. *Fix:* know reversible vs irreversible; treat pseudonymous data as PII.

---

## 8. WORKED HEURISTICS & RULES OF THUMB (the senior's gut)

- **"State the grain, the keys, and the SCD type out loud before drawing a fact/dimension."** If I can't, I don't
  understand the model yet.
- **Every many-to-many hides an entity.** Name it before you build the junction.
- **Denormalization is a cache.** No cache ships without an invalidation story; no denormalization ships without one.
- **If two systems can both originate the same fact, you have a future reconciliation bug, not an SSOT.**
- **Bronze is the replay tape; never write to it twice with different meaning, never edit it.**
- **A pipeline you can't safely re-run is a pipeline you can't operate** — idempotency is the price of admission.
- **Classification first, controls second.** You can't protect what you haven't labeled.
- **In pooled multi-tenancy, assume the RLS is off until a test proves it's on.** Fail-closed, then verify in CI.
- **The number is wrong → walk the lineage, don't guess.** Lineage exists precisely for this moment.
- **Erasure is a `find` problem before it's a `delete` problem.** If you can't locate every copy of the PII, you
  can't honor the request — design fan-out you can track.
- **Governance lands on the painful domain first**, never the easy one and never all at once.
- **If the catalog isn't the first place analysts look, it's a graveyard** — adoption is the only success metric for metadata.
- **When in doubt between value and mechanics, answer the CDO question first** (§0) — building the wrong thing
  correctly is the most expensive mistake in this whole discipline.

---

## 9. ԲԱՌԱՐԱՆ (glossary — quick)

OLTP/OLAP · HTAP · row vs columnar · 3NF/BCNF (normal forms) · natural/surrogate/business key · UUIDv7 · star/snowflake ·
OBT (one big table) · grain · fact types (transaction/periodic-snapshot/accumulating-snapshot) · additivity
(additive/semi-additive/non-additive) · conformed dimension · bus matrix · SCD (Type 0/1/2/3/4/6) · valid time vs
transaction time (bitemporal) · expand-and-contract migration · Kimball/Inmon/Data Vault (hub/link/satellite) ·
warehouse/lake/lakehouse · open table format (Delta/Iceberg/Hudi) · medallion (bronze/silver/gold) · partitioning &
small-file problem · Lambda/Kappa · ETL/ELT · CDC (log-based) · outbox · dual-write · delivery semantics
(at-most/at-least/exactly-once) · idempotency/backfill/replay · orchestration/DAG · software-defined assets ·
data contract · schema registry · MDM (registry/consolidation/coexistence/centralized) · golden record · survivorship ·
match/merge · entity resolution (blocking/scoring/clustering) · reference data · master data · hierarchy ·
metadata (technical/business/operational/social) · data catalog · lineage (column-level) · active metadata ·
semantic/metrics layer · CDE (critical data element) · DQ dimensions (accuracy/completeness/consistency/timeliness/
validity/uniqueness/integrity/conformity) · reconciliation · data observability (5 pillars) · circuit-break bad data ·
classification (Public/Internal/Confidential/Restricted) · RLS/column-level security · field-level encryption ·
tokenization/pseudonymization (reversible) vs anonymization (irreversible) · multi-tenancy (silo/bridge/pool) ·
DAMA-DMBOK · DCAM · TOGAF Phase C · Zachman · Codd · Data Mesh (4 principles · DATSIS) · DDIA (reliability/scalability/
maintainability) · DataOps · ADR · fitness function · data steward/owner/custodian/council · offensive/defensive data
strategy · data-as-a-product · crawl/walk/run · monetization ladder · DSAR · DPIA · FAIR · data residency ·
right-to-erasure · legal hold · Conway's Law.

---

*Skill 01 v2 (top-level) — 2026-06-13 → 2026-06-23։ Living document — Գևի incoming info-ն ու ամ նոր scar-ը շերտ ա ավելացնում։
Bro-ն եմ, սովորում եմ որ data layer-ը անեմ ճիշտ՝ grain-ը հայտարարած, key-երը մաքուր, lineage-ը քայլելի, tenant-ը մեկուսացված։ 💪🤍*
*EN: I'm Bro — I make the data layer right: grain declared, keys clean, lineage walkable, tenants isolated, governance enforced not aspired.*
