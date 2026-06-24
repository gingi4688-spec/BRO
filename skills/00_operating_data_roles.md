# 00 — Operating Layer: ոնց եմ կրում էս 3 role-ը
# 00 — Operating Layer: how I carry these 3 roles

> **HY:** Սա **operating companion** ա Գևի 3 skill-spec-ի վրա՝ [01 Enterprise Data Architect](roles/01_Enterprise_Data_Architect.md) ·
> [02 Chief Data Architect](roles/02_Chief_Data_Architect.md) · [03 Chief Data Officer](roles/03_Chief_Data_Officer.md)։
> Էն 3-ը = **ինչ պիտի իմանամ** (curriculum)։ Սա = **ոնց եմ դա օգտագործում որոշում կայացնելիս + ոնց ա կպնում
> մեր գործին**։ Living — Գևի նոր ֆայլերն ու lesson-ները շերտ են դառնում։ Status: **v2 (top-level), 2026-06-23**։
>
> **EN:** This is the **operating companion** to Gev's three skill-specs — Enterprise Data Architect (01), Chief Data
> Architect (02), Chief Data Officer (03). Those three = *what I must know* (the curriculum). This file = *how I wield
> it when deciding, and how it lands on our actual work*. It is the bridge between the architecture skill (01) and the
> day-job triad of roles that physically build and serve the data: **data engineer · analytics engineer · analyst**.
> Read it as my own private operating manual, not an essay. Living document.

---

## A. Ո՞Ր ՈՍՊՆՅԱԿԸ ԵՐԲ (lens-selection)

| Role | Horizon | Որոշում ա | Հարցը |
|---|---|---|---|
| **Enterprise Data Architect** (01) | systems/technical | *ոնց* ա data-ն modeled/stored/moved/secured | "Right structure? Will it scale & stay consistent?" |
| **Chief Data Architect** (02) | enterprise/standards | *ինչ* patterns/standards/reference-arch + tech selection + roadmap | "Fits our architecture, principles, 3-year direction?" |
| **Chief Data Officer** (03) | business/executive | data **strategy, governance, value, risk, culture** | "Creates value / reduces risk / is it trustworthy & compliant?" |

**Order of reasoning:** CDO-ի հարց (why/value/risk) → Chief-Architect-ի հարց (fit/standards) → Architect-ի հարց
(structure/mechanics)։ Ամ սխալ սկսում ա mechanics-ից առանց value+fit-ի → կառուցում ես **սխալ բանը ճիշտ**։

**HY — ինչ եմ իրականում անում:** Երբ Գևը հարց ա տալիս, ես **երեք ոսպնյակն էլ իրար ետևից եմ քաշում** մեկ վայրկյանում, բայց
**վերևից ներքև**։ Նախ՝ "սա արժեք ա ստեղծում, թե ռիսկ ա կրճատում, ու trust-ի վրա ոնց ա ազդում" (CDO)։ Հետո՝ "սա մեր
ունեցած patterns-ին ու 3-տարվա ուղղությանը տեղավորվու՞մ ա, թե նոր silo ա ծնում" (Chief Architect)։ Վերջում նոր՝ "կոնկրետ
ոնց եմ սա modeled/stored/moved անելու" (Architect)։ Եթե Գևի հարցը զուտ mechanics ա ("ո՞ր index-ը"), միևնույն ա մի վայրկյան
վեր եմ նայում՝ չլինի թե ճիշտ եմ լուծում սխալ problem-ը։

---

## A2. ՕՊԵՐԱՑԻՈՆ ՏՐԻԱԴԱՆ — data engineer · analytics engineer · analyst (the people who actually do it)

Architecture-ն (01) ասում ա *ինչ պիտի լինի*։ Բայց building-ն ու serving-ը երեք **operating role** են անում, ու ես պիտի
կարողանամ կանգնել ցանկացած մեկի կոշիկի մեջ։ Սա modern data stack-ի **division of labor**-ն ա (Maxime Beauchemin-ի
«rise of the analytics engineer» framing-ը + dbt Labs-ի կանոնավորած roster-ը)։

| Role | Owns | Output | Primary tools | "Done" նշանակում ա |
|---|---|---|---|---|
| **Data Engineer (DE)** | ingestion, raw→bronze, infra, orchestration, pipelines, perf, reliability | trusted **raw + landed tables**, healthy pipelines, SLAs | SQL, Python/Scala, Airflow/Dagster, Spark, Kafka/CDC, warehouse admin, IaC | data **arrives** fresh, complete, on time, reproducibly |
| **Analytics Engineer (AE)** | bronze/silver→gold **transforms**, modeling, tests, docs, semantic layer | clean, documented, **tested** marts + metric defs (the "analytics-ready" layer) | **dbt/SQLMesh**, SQL, Jinja, git, semantic layer, data tests | data is **trustworthy, modeled, reusable**, one metric = one definition |
| **Analyst / Data Analyst** | questions→answers, exploration, BI, narrative, decisions | **insight**, dashboards, ad-hoc analyses, recommendations that move a number | SQL, BI (Looker/Metabase/PowerBI/Tableau), spreadsheets, stats, storytelling | a **decision** got made or a question got truly answered |

**Mental model — the relay (DE → AE → Analyst):**
- **DE = plumbing.** Gets the water into the building, clean and reliable. Cares about *delivery*, not meaning.
- **AE = the kitchen.** Turns raw ingredients into a menu — modeled, named, tested, documented. The **software-engineering
  rigor applied to the transform layer**: version control, CI, tests, modularity, DRY (refs/macros), code review,
  environments (dev/prod). AE is the role that didn't have a name before dbt; it's the **most leveraged** seat in the
  stack because it sets the definitions everyone downstream inherits.
- **Analyst = the diner who also reviews the restaurant.** Consumes the gold layer to answer real business questions and
  push a decision. Cares about *meaning and action*, not pipelines.

**HY — ոնց եմ սա կրում:** Երբ Գևը ասում ա «բեր էս data-ն», ես **ինքս ինձ հարցնում եմ՝ սա ո՞ր seat-ի գործ ա**։ Եթե խնդիրը
"data-ն չի գալիս / ուշանում ա / pipeline-ը կոտրվում ա" → DE-ի գլխարկ։ Եթե "ունենք data, բայց պիտի modeled, tested,
մի definition-ով" → AE-ի գլխարկ (ամենաշատ leverage-ը հենց էստեղ ա)։ Եթե "ի՞նչ ա սա ասում, ի՞նչ որոշում ենք կայացնում" →
analyst-ի գլխարկ։ Մեկ մարդ (ես) երեքն էլ կրում եմ, բայց **չեմ խառնում seat-երը մեկ քայլում** — դա ա կարգապահությունը։

**Anti-pattern որ խուսափում եմ — "the full-stack mush":** ամեն ինչ մեկ notebook-ում խառնել՝ ingestion + transform +
chart, առանց շերտերի։ Smell՝ analyst-ը ուղիղ raw-ից ա query անում ու ամ մարդ իր «revenue»-ն ա սարքում։ Fix՝ հարգիր
relay-ը՝ DE-ն landed table ա տալիս, AE-ն modeled+tested mart ա տալիս, analyst-ը **միայն gold-ից** ա կերակրվում։

---

## A3. SEAT BOUNDARIES — որտեղ ա մի role-ը վերջանում, մյուսը սկսում (the seam rules)

Իրական աշխարհում conflict-ը միշտ **seam-երի վրա ա**։ Ֆիքսված կանոններ, որ պահում եմ՝

- **Raw ↔ modeled seam (DE↔AE):** DE-ն **չի** business logic դնում raw-ի մեջ (no "helpful" renames, no joins, no
  filtering away rows). Bronze = **immutable, faithful copy** of source. Ամ transform = AE-ի կողմ, version-controlled։
  Smell՝ "the ingestion script also computes net_revenue" → drift ու untested business logic pipeline-ի մեջ։
- **Modeled ↔ consumed seam (AE↔Analyst):** մետրիկայի definition-ը **ապրում ա semantic/metrics layer-ում** (AE-ի
  ownership), ոչ թե ամ dashboard-ի SQL-ում։ Analyst-ը **սպառում ա** definition-ը, չի վերագյուտում։ Smell՝ երեք
  dashboard «active users»-ը երեք ձև ա հաշվում → metric chaos (տես anti-patterns)։
- **Exploration ↔ production seam:** analyst-ի ad-hoc query-ն որ պետք ա դառնա կրկնվող → այն **promote ա արվում AE-ի մարտ**,
  չի մնում «that one analyst's magic query» ձեռքով run արվող։ Սա ա **analytics debt**-ի #1 աղբյուրը։
- **Ownership = accountable, not just "wrote it":** ամ gold table ունի **one owner** (սովորաբար AE), SLA, ու consumer-ների
  ցանկ։ Եթե owner չկա → orphan dataset, որ ոչ ոք չի trust անում։

---

## B. Operating principles (CDO-level, governs everything)
1. **Data = asset AND liability.** Offensive (value/analytics/AI/product) vs defensive (security/compliance/SSOT)
   tilt — declare it explicitly.
2. **SSOT, then fan out** — 1 authoritative source/concept; rest = projections.
3. **Model the business, not the screen/report** — canonical model durable, UIs/reports disposable.
4. **Governance enables, not gates** — make the right thing the easy thing (standards/catalogs/contracts).
5. **Correctness enforceable, not aspirational** — every rule → automated guard, else it drifts. — data contracts / DQ / lineage become CI/runtime gates = **fitness functions**.
6. **Decentralize ownership, centralize standards** (the data-mesh insight, even pre-mesh).
7. **Privacy & security by default** — minimize, classify, encrypt, tokenize, least-privilege, isolate tenants.
8. **Measure the data function like a product** — adoption, trust (DQ), time-to-data, cost, value.

### B2. Operating principles for the TRIAD (how the three seats stay honest)
9. **Software-engineering rigor on the transform layer.** Analytics code is *code*: git, PR review, CI tests,
   modularity, DRY (`ref()`/macros), environments. The AE seat exists precisely to bring this rigor. "It's just SQL,
   ship it to prod by hand" is how you get an undebuggable warehouse. (This is the dbt/analytics-engineering thesis.)
10. **DAG, not a pile of scripts.** Every table is a node with declared dependencies; lineage is derived, not drawn by
    hand. If you can't generate the lineage graph automatically, you don't actually have a pipeline — you have a swamp.
11. **Idempotent & reproducible.** Re-running a pipeline on the same inputs gives the same output. No "run it twice and
    you get double rows." Backfills must be safe (the DE's cardinal rule).
12. **Test at the layer you own.** DE tests freshness/volume/schema on landing; AE tests uniqueness/not-null/
    relationships/accepted-values + business assertions on models; analyst sanity-checks the answer against reality.
    Each layer catches its own class of bug — don't push detection downstream to the dashboard.
13. **One metric, one definition, in one place.** The semantic layer is the contract between AE and every consumer.
14. **Optimize for the reader, not the writer (in the analyst seat).** A correct number that nobody understands or acts
    on created zero value. The deliverable is a *decision*, not a query.
15. **Shift-left on quality.** Prevent at source > validate at contract boundary > detect in pipeline > correct in
    report. Every step right is 10× more expensive. (Mirrors principle 5; this is its triad-level expression.)

---

## C. Cross-cutting DECISION RULES (fast)
- **Modeling:** OLTP integrity → 3NF · BI consumption → dimensional/Kimball · multi-source+audit+churn → Data Vault (serve dimensional on top).
- **Store:** governed BI → warehouse · raw/varied/ML → lake (+catalog!) · both → lakehouse + medallion (default new estate).
- **Integration:** immediate consistency → API · decoupling/fan-out/many-consumers → events · **cross-domain side-effects → events (choreography), not inline** (= I3).
- **MDM style:** can't disrupt sources → Registry · analytics golden → Consolidation · golden back to sources → Coexistence · greenfield system-of-entry → Centralized.
- **Governance model:** few domains/high control → centralized · many/scale → federated hub-and-spoke (default) · mature autonomous → mesh.
- **Build/buy:** commodity → buy · core moat → build · reversible → fast · irreversible (core model/tenancy/primary store) → deliberate.
- **Tilt:** regulated/foundational/trust-critical → defensive · growth/product/analytics → offensive · re-balance as company matures.

### C2. SEAT-SELECTION & OPERATING decision rules (which hat, which move)
- **Which seat is this?** "Data isn't here / is late / pipeline broke" → **DE**. "Data's here but messy/untrusted/
  needs one definition" → **AE**. "What does this mean / what do we decide" → **Analyst**.
- **ELT vs ETL in practice:** modern cloud warehouse + cheap storage → **ELT** (DE lands raw, AE transforms in-warehouse
  with dbt). Reach for ETL-before-load only when compliance forbids landing raw PII, or transform cost dwarfs storage.
- **Where does this transform live?** One-off question → analyst's exploratory query (throwaway). Will be re-asked →
  **promote to an AE model** (versioned, tested). Rule of thumb: *the third time you copy-paste a CTE, it becomes a model.*
- **Incremental vs full-refresh (DE/AE):** small table or cheap → full refresh (simplest, always correct). Large +
  append-mostly → incremental (faster/cheaper) but you now own late-arriving-data and backfill correctness — only pay
  that complexity when the full refresh actually hurts.
- **New metric request:** does a canonical definition exist in the semantic layer? Yes → reuse it. No → AE defines it
  *once*, with the business owner, then everyone consumes. Never let the analyst quietly invent a parallel definition.
- **Dashboard vs ad-hoc vs notebook:** recurring + many viewers → governed dashboard on a modeled mart. One-time
  decision → ad-hoc query, document the answer, throw the query away. Exploration/stats → notebook, but graduate
  anything load-bearing into the modeled layer.
- **Add a column or model the event?** Need a quick attribute → add to existing dim (SCD-aware). It's a new business
  fact/process → model it as its own fact/event with declared grain. (Don't smuggle a fact into a dimension.)
- **Optimize or leave it?** Pipeline/query is slow → measure first (is it the bottleneck? does anyone wait on it?).
  Optimize only the path on the critical SLA. Premature warehouse tuning is the analytics version of premature
  optimization.

---

## D. ANTI-PATTERNS (smell → fix)
data swamp → catalog+owners+DQ · spaghetti integration → hub/events+contracts+lineage · multiple SSOTs → MDM+canonical · dual writes → CDC+outbox, one writer · metric chaos → semantic/metrics layer · hardcoded reference data →
governed code-lists, one owner · governance theater → policy→standard→CI guard · tenant leakage (pooled) →
fail-closed RLS+least-priv role+tenant-context bind · history loss → SCD2/event log/Data-Vault sats · big-bang migration
→ strangler-fig phased reversible · PII you can't find → classify+lineage+active metadata.

### D2. OPERATING-LAYER anti-patterns (triad smells → fix)
- **The hero query** — one analyst's undocumented 400-line SQL that the whole company depends on, run by hand monthly.
  *Fix:* promote to a tested, version-controlled AE model in the DAG; kill the manual ritual.
- **Business logic in the ingestion layer** — DE script renames/filters/computes during load. *Fix:* bronze stays a
  faithful raw copy; all logic moves to the AE transform layer where it's tested and reviewed.
- **Spreadsheet as the warehouse** — the real numbers live in someone's Excel, the "data team" is an afterthought.
  *Fix:* canonical metric in the semantic layer; the spreadsheet becomes a read-only view, not the source.
- **Untested transforms** — models with zero data tests; bugs surface in the boardroom. *Fix:* not-null/unique/
  relationship/accepted-values + business assertions in CI; no model merges without tests.
- **Snowflake-of-CTEs / no DAG** — one giant query nobody can change safely. *Fix:* decompose into modular models with
  `ref()`; let lineage be generated, not memorized.
- **Drift between dev and prod** — analyst built it on a stale copy; prod differs. *Fix:* environments + idempotent
  builds; dev is a sampled-but-faithful mirror; promote via git, not copy-paste.
- **Dashboard sprawl** — 300 dashboards, 12 actually viewed, none owned. *Fix:* catalog + ownership + usage metrics;
  deprecate the dead; consolidate onto modeled marts.
- **Answering the wrong question** — analyst returns a technically correct number that doesn't address the decision.
  *Fix:* clarify the *decision* first (what changes based on this answer?), then query. Optimize for the reader.
- **Metric defined per-dashboard** — "active users" computed 3 ways across 3 BI tools. *Fix:* one semantic-layer
  definition consumed by all (this is "metric chaos" seen from the consumer seat).
- **Backfill that double-counts** — re-running an incremental load duplicates rows. *Fix:* idempotent merge/upsert keys;
  test that re-run = no change.
- **Seat confusion** — treating the analyst as a pipeline engineer or the DE as a storyteller. *Fix:* respect the relay;
  staff the actual gap. Wrong seat = burnout + bad output.

---

## E. WORKED HEURISTICS & RULES OF THUMB (the stuff seniors just *know*)
- **Grain first, always.** Before writing any fact/mart: declare the grain in one sentence ("one row per invoice line
  per day"). Ambiguous grain is the #1 warehouse bug — restated here because it bites at the AE seat constantly.
- **The third copy-paste becomes a model.** First two times a CTE is fine inline; the third, it's shared logic → model it.
- **If you can't draw the lineage, you can't change it safely.** Auto-generated lineage is the prerequisite for fearless
  refactoring and impact analysis.
- **Trust is binary at the point of use.** A dashboard the business "mostly trusts" is a dashboard the business ignores
  in the one meeting that matters. Earn full trust via tests + freshness + ownership, or don't ship it.
- **Freshness is a feature.** A correct number that's a day too late for the decision is a wrong number. State the
  required freshness SLA before building the pipeline; size the architecture to it.
- **Storage is cheap, your time is not.** Default to ELT + keep raw; don't pre-aggregate away detail you might need.
  (Reverse only under a real compliance or cost-at-scale reason.)
- **Make the slow path obvious.** When something's slow, profile before tuning; optimize only what sits on a human's
  wait or a contractual SLA. Most warehouse "perf problems" are one un-pruned partition or a fan-out join.
- **One owner, one definition, one place.** Repeated like a mantra because every triad failure traces back to violating
  one of these three.

---

## F. Self-assessment (honest, per role) — ուր եմ կանգնած
- **Enterprise Data Architect (01):** STRONG on modeling/warehousing/integration/streaming/governance/security/patterns
  theory + SQL/Python. Tool-specific hands-on depth (Snowflake/Databricks/specific cloud consoles) = conversant, not
  battle-scarred — but the *judgment* transfers across stacks.
- **Chief Data Architect (02):** STRONG — standards authoring, reference arch, ADRs, governance mechanisms, build-vs-buy,
  org topology.
- **Chief Data Officer (03):** STRONG on strategy/governance/risk/monetization/org/communication frameworks. The
  business-acumen/P&L → I reason well + flag for a qualified lawyer/CFO on
  binding calls; I architect, experts ratify.
- **Data Engineer (DE) seat:** STRONG on pipeline design, orchestration, ELT/CDC, idempotency, freshness/SLA thinking,
  incremental-load correctness. Tool muscle-memory (specific Airflow/Spark/Kafka knobs) = conversant; the *design
  judgment* transfers.
- **Analytics Engineer (AE) seat:** STRONG — this is the most leveraged seat and I treat analytics as software:
  modular dbt-style modeling, testing, semantic layer, grain discipline, DAG hygiene, environments. This is where I do
  my sharpest data work.
- **Analyst seat:** STRONG on SQL, exploration, framing the decision, statistical sanity, and storytelling that moves a
  number. I optimize for the *reader and the decision*, not for clever queries.

*Operating layer v2 (top-level) — 2026-06-23։ Ready to wield all three architecture roles AND the operating triad
(data engineer · analytics engineer · analyst). Ready to absorb the next files. / Bro-ն եմ — սուր, ջերմ, անկեղծ,
Գևի կողքին, մինչև վերջ։ 💪🤍*

---

## G. ԲԱՌԱՐԱՆ (glossary — operating triad)

**Roles:** data engineer (DE) · analytics engineer (AE) · analyst · data steward/owner/custodian · the relay (DE→AE→Analyst)։

**DE world:** ingestion · landing/bronze · ELT/ETL · CDC · outbox · orchestration/DAG (Airflow/Dagster/Prefect) ·
Spark · streaming (Kafka) · idempotency · backfill · incremental vs full-refresh · late-arriving data · SLA/freshness ·
IaC · schema registry · data contract։

**AE world:** transform layer · dbt/SQLMesh · `ref()`/macros/Jinja · modular models · staging→intermediate→marts ·
medallion (bronze/silver/gold) · grain · star/snowflake · conformed dimension · SCD (Type 1/2/3) · data tests
(not-null/unique/relationships/accepted-values) · business assertions · semantic/metrics layer · one-metric-one-definition ·
environments (dev/prod) · CI for analytics · DRY · lineage · DAG hygiene · analytics debt · promote-to-model։

**Analyst world:** exploratory analysis · ad-hoc query · BI (Looker/Metabase/PowerBI/Tableau) · dashboard ·
decision-framing · the reader-not-writer rule · statistical sanity · narrative/storytelling · insight → decision։

**Cross-cutting:** SSOT/canonical · data catalog · ownership/SLA · data observability (freshness/volume/schema/
distribution/lineage) · shift-left on quality · prevention>detection>correction · fitness functions · DataOps ·
"the rise of the analytics engineer" (Beauchemin) · modern data stack։
