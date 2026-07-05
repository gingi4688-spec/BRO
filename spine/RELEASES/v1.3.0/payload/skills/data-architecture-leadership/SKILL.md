---
name: "data-architecture-leadership"
description: >-
  use when the work is data architecture or data leadership — warehouse vs lake vs lakehouse vs mesh selection, dimensional / Data Vault / 3NF modeling and grain, data contracts and schema evolution, MDM and golden records, governance, ownership and decision rights, medallion (bronze/silver/gold) layering, or a data-team maturity/coaching plan — for decisions, critique, planning, diagnostics, artifacts (decision matrix, contract, MDM rulebook, architecture review), teaching, or evaluation. use as lead when this domain owns the central decision or deliverable. do not use as lead when another skill owns the artifact and data architecture is only one input — then support it (pipeline build → data-engineering-pipelines; modeling/stats for an analysis → data-science-analytics; org design and hiring of data roles → operating-data-roles). հայերեն՝ օգտագործիր տվյալների ճարտարապետության և առաջնորդության աշխատանքի համար՝ պահեստ/lake/lakehouse/mesh ընտրություն, modeling և grain, data contract, MDM, governance և decision rights, medallion շերտեր, թիմի maturity/coaching plan։
---

# Data Architecture and Leadership / Տվյալների ճարտարապետություն և առաջնորդություն

## English

**Scope.** In: storage/architecture selection (warehouse, lake, lakehouse, mesh), data modeling and grain (3NF, Kimball dimensional, Data Vault, One Big Table), medallion bronze/silver/gold layering, data contracts and schema evolution (compatibility, registries, deprecation), master data management (match/merge/survivorship/stewardship), governance, ownership, decision rights and standards, and a data-team maturity/coaching plan (crawl/walk/run). Out: the physical pipeline build and orchestration (data-engineering-pipelines owns it), the statistical model or experiment of a specific analysis (data-science-analytics owns it), the hiring and org structure of the data function as people management (operating-data-roles owns it), and the cluster/cost reliability of the platform as infrastructure (devops-platform-sre owns it). This skill makes enterprise data trustworthy by assigning meaning, ownership, lineage, and decision rights **before** tools multiply inconsistent truths.

**Leads / Supports.** Lead when the central deliverable is architecture- or governance-shaped: a platform/storage decision matrix, a data contract, an MDM rulebook, a modeling/grain decision, a governance decision log, or a data-team maturity roadmap. Support when another skill owns the artifact and architecture is one input — e.g. data-engineering owns the pipeline and you supply the contract and the medallion layering rule; data-science owns the analysis and you supply the conformed dimension and the grain; operating-data-roles owns the team design and you supply which decisions need an owner.

**Three lenses — name which one is asked.** This skill answers in three distinct modes, and conflating them produces a wrong-shaped answer:
- **Operating lens** — a specific architecture/governance decision *now* (which storage, which model, is this schema change safe). Answer with a decision matrix or contract.
- **Full curriculum** — teach the field's mechanisms end-to-end. Answer with the manual's mechanism reference, not a one-off recommendation.
- **Operating-data-roles** — *who* owns each decision, and how a data team matures. Route the people/org part to `operating-data-roles`; keep the architecture decision-rights here.

Conflict rules:
- **Modeling/tooling preference vs requirement → the requirement decides.** Do not pick Kimball, Data Vault, or a lakehouse because the team likes it; pick it because the grain, change rate, audit need, and ownership maturity require it. Name the constraint that forced the choice.
- **Mesh vs central platform → ownership maturity arbitrates, not the org chart.** Data mesh is an operating model, not a storage layer. Do not endorse mesh unless domains can actually own data products with contracts, SLAs, and stewards. Drawing domains on a slide is not mesh.
- **Org design / hiring of data roles → route to `operating-data-roles`.** You own the *decision rights* for architecture (who approves a schema change, who owns the golden record); the team's headcount, leveling, and management route to operating-data-roles.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Grain unstated → stop and define it first.** Ambiguous grain is the #1 warehouse bug: every join, every metric, every double-count traces back to "what does one row mean?" Write the grain as one sentence ("one row = one shipped order line") before any table is designed.
2. **"Lakehouse plus mesh" requested → split storage from operating model.** Lakehouse is a storage/table-format choice; mesh is a domain-ownership operating model. Decide each on its own evidence; do not bundle them as one buzzword.
3. **Mesh proposed without domain owners and contracts → do not endorse it.** Mesh without product owners, versioned contracts, SLAs, and stewards is an org chart on a slide. Recommend central/lakehouse first; earn mesh when ownership is real.
4. **Storage choice → score against latency, cost, governance, transactions, schema volatility, ownership.** Pick the simplest architecture that satisfies the hard constraints; do not choose by trend. Name which constraint is binding.
5. **Raw/bronze layer → immutable and append-only; never mutate it.** Bronze is the system of record for "what actually arrived." Fixes and dedupe happen in silver/gold, never by rewriting bronze; a mutated raw layer destroys the ability to replay and audit.
6. **Schema change → classify backward / forward / full / breaking before shipping.** A breaking change (rename, type narrow, drop) needs a versioned table/topic, a migration window, and named consumer owners; nullable-additive is backward-compatible. Unknown consumers → freeze the breaking change.
7. **Model choice → tie to grain, change rate, and audit need.** 3NF for transactional integrity; Kimball stars (fact grain, conformed dimensions, SCD) for stable analytics; Data Vault (hubs/links/satellites) for many volatile sources with lineage/audit needs. State the grain in every model.
8. **"Single customer view" → require explicit survivorship rules.** Without per-attribute survivorship (which source wins legal name, tax id, contact), the golden record silently becomes last-writer-wins. Define match → merge → survivorship → stewardship.
9. **Catalog/governance tool bought → adoption is the deliverable, not the install.** A catalog nobody queries is shelfware. Tie governance to a decision people must make (who can change this, who owns this metric), not to a tool purchase.
10. **Metric defined in two places → assign one owner and one definition.** A metric ownership vacuum produces two "revenue" numbers in two dashboards. One definition, one owner, one source of truth; conflicting copies are deprecated.
11. **Lineage too noisy to act → prune to decision-relevant edges.** Column-level lineage of everything is unusable. Surface the lineage that answers "if I change X, who breaks?" — the rest is noise.
12. **Data-team capability question → answer with a crawl/walk/run maturity path.** Do not hand a five-year-old a mesh. Sequence: crawl (one governed warehouse, defined grain, basic contracts) → walk (medallion layers, a catalog with real adoption, MDM on the top entity) → run (domain ownership/mesh, automated contract enforcement). Skipping a stage is the failure.
13. **Regulatory/retention/PII claim → require jurisdiction and source, never invent thresholds.** Retention periods, residency rules, and PII categories are jurisdiction-specific; cite the source or mark verify-before-use. A guessed threshold is a compliance risk.
14. **Irreversible data change → gate behind an owner and a rollback.** Destructive backfills, hard deletes, and golden-record overwrites can lose history; require explicit approval, a backup/restore path, and where possible an expand/contract (reversible) sequence.

### Failure modes to prevent / Ձախողման ձևեր

1. **Ambiguous grain (the #1 warehouse bug).** Nobody can say what one row means, so metrics double-count and joins fan out. Tell: a fact table with no one-sentence grain, two dashboards disagreeing on the same number.
2. **Mutating the raw/bronze layer.** "Fixing" or deduping data in place in bronze, destroying the immutable record of what arrived. Tell: an UPDATE/DELETE against the raw layer, no ability to replay history.
3. **Mesh as org-chart theater.** Domains drawn on a slide and called a mesh, with no product owners, contracts, SLAs, or stewards. Tell: "we're doing data mesh" with a central team still owning every pipeline.
4. **"Lakehouse plus mesh" bundled as one decision.** A storage choice and an operating model fused into a single buzzword, so neither gets real evidence. Tell: a recommendation that can't separate the table format from the ownership model.
5. **Survivorship vacuum in MDM.** A "golden record" with no rule for which source wins each attribute, so it silently becomes last-writer-wins. Tell: "single customer view" with no per-attribute survivorship table.
6. **Breaking schema change with unknown consumers.** A rename/drop shipped with no consumer inventory and no migration window. Tell: a schema change merged with no compatibility class and no list of who reads it.
7. **Catalog without adoption.** A governance tool installed, populated once, and never queried. Tell: a catalog purchase celebrated as governance, with no decision tied to it.
8. **Metric ownership vacuum.** The same metric defined differently in two places with no single owner. Tell: two "active users" numbers, both "correct," neither authoritative.
9. **Modeling by preference, not requirement.** Kimball/Data Vault/3NF chosen because the team likes it, not because grain/change/audit require it. Tell: a model choice with no stated grain or change-rate rationale.
10. **Skipping crawl/walk/run.** A small/immature team handed mesh, automated contracts, or column-level lineage before it can run a single governed warehouse. Tell: a maturity leap with no intermediate stage and no defined grain underneath.
11. **Lineage noise.** Column-level lineage of everything, so nobody can answer "if I change X, who breaks?" Tell: a lineage graph too dense to read, used for nothing.
12. **Invented compliance thresholds.** Retention/residency/PII rules asserted as fact without a jurisdiction or source. Tell: "you must keep it 7 years" with no statute cited.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (decision matrix / data contract / MDM rulebook / modeling decision / governance log / maturity roadmap), not generic advice.
- Every fact table and model states its **grain** in one sentence; the raw/bronze layer is declared immutable/append-only.
- Storage/architecture choice cites the binding constraint (latency, cost, governance, transactions, schema volatility, ownership), and mesh is endorsed only with real domain ownership + contracts.
- Schema changes carry a compatibility class, a consumer inventory, and a migration/rollback path; MDM carries per-attribute survivorship.
- A data-team capability answer is sequenced as crawl → walk → run with no skipped stage.
- Compliance/retention/PII claims cite a jurisdiction/source or are marked verify-before-use; no invented thresholds.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **architecture fit** (storage choice follows workload constraints + ownership maturity, not trend) · **modeling mechanism** (grain, history/SCD, dimensions/hubs, lineage, query path explicit) · **contract discipline** (compatibility class, registry, owners, migration, rollback concrete) · **master data** (match, merge, survivorship, stewardship, conflict workflow defined) · **leadership tradeoff** (decision rights, standards, adoption path, exception process, and a crawl/walk/run sequence included).

### Deep dive & assets

`manual.md` (mechanism reference: warehouse/lake/lakehouse/mesh, Kimball/Data Vault/3NF, medallion, data contracts, MDM; decision rules; failure-repair playbook; crawl/walk/run coaching) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (platform decision matrix + maturity roadmap) · `output-templates.md` (decision matrix / data contract / MDM rulebook) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ storage/architecture-ի ընտրություն (warehouse, lake, lakehouse, mesh), data modeling և grain (3NF, Kimball dimensional, Data Vault, One Big Table), medallion bronze/silver/gold շերտավորում, data contract և schema evolution (compatibility, registry, deprecation), master data management (match/merge/survivorship/stewardship), governance, ownership, decision rights և standard-ներ, և թիմի maturity/coaching plan (crawl/walk/run)։ Դուրս՝ ֆիզիկական pipeline-ի կառուցումն ու orchestration-ը (data-engineering-pipelines-ինն է), կոնկրետ վերլուծության վիճակագրական model-ը կամ experiment-ը (data-science-analytics-ինն է), տվյալների ֆունկցիայի hiring-ն ու org-structure-ը՝ որպես մարդկանց կառավարում (operating-data-roles-ինն է), և հարթակի cluster/cost հուսալիությունը՝ որպես ենթակառուցվածք (devops-platform-sre-ինն է)։ Այս skill-ը կազմակերպության տվյալները վստահելի է դարձնում՝ իմաստ, ownership, lineage և decision rights նշանակելով **նախ**, քանի դեռ գործիքները չեն բազմապատկել անհամապատասխան ճշմարտությունները։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը architecture- կամ governance-ձև ունի՝ platform/storage decision matrix, data contract, MDM rulebook, modeling/grain որոշում, governance decision log, կամ թիմի maturity roadmap։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ architecture-ն մեկ input է. օրինակ՝ data-engineering-ը տիրում է pipeline-ին, դու տալիս ես contract-ը և medallion-ի շերտի կանոնը. data-science-ը տիրում է վերլուծությանը, դու տալիս ես conformed dimension-ը և grain-ը. operating-data-roles-ը տիրում է թիմի դիզայնին, դու տալիս ես, թե որ որոշումը owner է պահանջում։

**Երեք ոսպնյակ — անվանի՛ր, թե որն է հարցվում։** Այս skill-ը պատասխանում է երեք տարբեր ռեժիմով, և դրանք շփոթելը սխալ ձևի պատասխան է տալիս․
- **Operating ոսպնյակ** — կոնկրետ architecture/governance որոշում *հիմա* (որ storage-ը, որ model-ը, այս schema change-ն անվտանգ է՞)։ Պատասխանիր decision matrix-ով կամ contract-ով։
- **Լրիվ ուսումնական ծրագիր** — սովորեցրու ոլորտի մեխանիզմները ծայրից ծայր։ Պատասխանիր manual-ի mechanism reference-ով, ոչ թե մեկանգամյա recommendation-ով։
- **Operating-data-roles** — *ով* է տիրում ամեն որոշմանը և ինչպես է տվյալների թիմը հասունանում։ Մարդկանց/org մասը ուղղորդիր `operating-data-roles`-ին. architecture-ի decision rights-ը պահիր այստեղ։

Կոնֆլիկտի կանոններ․
- **Modeling/tooling նախասիրություն ընդդեմ պահանջի → որոշում է պահանջը։** Kimball, Data Vault կամ lakehouse մի՛ ընտրիր, որովհետև թիմին դուր է գալիս. ընտրիր, որովհետև grain-ը, change rate-ը, audit need-ը և ownership maturity-ն դա պահանջում են։ Անվանի՛ր այն constraint-ը, որ ստիպեց ընտրությունը։
- **Mesh ընդդեմ կենտրոնական հարթակի → որոշում է ownership maturity-ն, ոչ org chart-ը։** Data mesh-ը operating model է, ոչ storage layer։ Mesh մի՛ հաստատիր, քանի դեռ domain-ները չեն կարող իրականում data product-ի owner լինել՝ contract-ով, SLA-ով և steward-ով։ Domain-ները slide-ի վրա նկարելը mesh չէ։
- **Org-design / data-role-երի hiring → ուղղորդիր `operating-data-roles`-ին։** Դու տիրում ես architecture-ի *decision rights*-ին (ով է approve անում schema change-ը, ով է տիրում golden record-ին). թիմի headcount-ը, leveling-ը և management-ը ուղղորդվում են operating-data-roles-ին։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Grain-ը նշված չէ → կանգնի՛ր և նախ սահմանիր այն։** Ambiguous grain-ը warehouse-ի #1 bug-ն է․ ամեն join, ամեն metric, ամեն double-count հետ է գնում «ի՞նչ է նշանակում մեկ row» հարցին։ Grain-ը գրիր մեկ նախադասությամբ («մեկ row = մեկ shipped order line») նախքան որևէ table նախագծելը։
2. **«Lakehouse plus mesh» է խնդրվում → բաժանիր storage-ը operating model-ից։** Lakehouse-ը storage/table-format ընտրություն է. mesh-ը domain-ownership operating model է։ Ամեն մեկը որոշիր իր ապացույցով. մի՛ կապկպիր դրանք մեկ buzzword-ի մեջ։
3. **Mesh է առաջարկվում առանց domain owner-ի և contract-ի → մի՛ հաստատիր։** Mesh առանց product owner-ի, versioned contract-ի, SLA-ի և steward-ի՝ slide-ի վրա org chart է։ Առաջարկիր նախ կենտրոնական/lakehouse. mesh-ը վաստակիր, երբ ownership-ը իրական է։
4. **Storage ընտրություն → score արա latency, cost, governance, transactions, schema volatility, ownership-ի դեմ։** Ընտրիր ամենապարզ architecture-ը, որ բավարարում է hard constraint-ները. trend-ով մի՛ ընտրիր։ Անվանի՛ր, թե որ constraint-ն է binding։
5. **Raw/bronze շերտ → immutable և append-only. երբեք մի՛ mutate արա այն։** Bronze-ը «ինչ իրականում եկավ»-ի system of record-ն է։ Fix-երը և dedupe-ը արվում են silver/gold-ում, երբեք bronze-ը վերագրելով. mutate-ված raw layer-ը ոչնչացնում է replay-ի և audit-ի հնարավորությունը։
6. **Schema change → ship-ից առաջ classify արա backward / forward / full / breaking։** Breaking change-ը (rename, type narrow, drop) պահանջում է versioned table/topic, migration window և անվանված consumer owner. nullable-additive-ը backward-compatible է։ Անհայտ consumer-ներ → freeze արա breaking change-ը։
7. **Model ընտրություն → կապիր grain-ի, change rate-ի և audit need-ի հետ։** 3NF՝ transactional integrity-ի. Kimball star (fact grain, conformed dimensions, SCD)՝ կայուն analytics-ի. Data Vault (hubs/links/satellites)՝ շատ փոփոխվող source-ների՝ lineage/audit need-ով։ Grain-ը նշիր ամեն model-ում։
8. **«Single customer view» → պահանջիր հստակ survivorship rule-ներ։** Առանց per-attribute survivorship-ի (որ source-ն է հաղթում legal name-ում, tax id-ում, contact-ում), golden record-ը լուռ դառնում է last-writer-wins։ Սահմանիր match → merge → survivorship → stewardship։
9. **Catalog/governance գործիք գնված է → deliverable-ը adoption-ն է, ոչ install-ը։** Catalog, որ ոչ ոք չի query անում, shelfware է։ Governance-ը կապիր որոշման հետ, որ մարդիկ պետք է կայացնեն (ով կարող է սա փոխել, ով է տիրում այս metric-ին), ոչ գործիքի գնմանը։
10. **Metric երկու տեղ սահմանված է → նշանակիր մեկ owner և մեկ սահմանում։** Metric ownership vacuum-ը երկու «revenue» թիվ է տալիս երկու dashboard-ում։ Մեկ սահմանում, մեկ owner, մեկ source of truth. հակասող copy-ները deprecate են արվում։
11. **Lineage-ն չափազանց աղմկոտ է գործելու համար → prune արա decision-relevant edge-երին։** Ամեն ինչի column-level lineage-ն անօգտագործելի է։ Երևացրու այն lineage-ը, որ պատասխանում է «եթե X փոխեմ, ո՞վ է կոտրվում» — մնացածը աղմուկ է։
12. **Թիմի կարողության հարց → պատասխանիր crawl/walk/run maturity path-ով։** Հնգամյա երեխային mesh մի՛ տուր։ Հերթականություն․ crawl (մեկ governed warehouse, սահմանված grain, հիմնական contract) → walk (medallion շերտեր, իրական adoption-ով catalog, MDM՝ top entity-ի վրա) → run (domain ownership/mesh, ավտոմատ contract enforcement)։ Stage բաց թողնելը ձախողումն է։
13. **Regulatory/retention/PII պնդում → պահանջիր jurisdiction և source, երբեք threshold մի՛ հորինիր։** Retention period-ները, residency rule-ները և PII category-ները jurisdiction-specific են. վկայակոչիր source-ը կամ նշիր verify-before-use։ Գուշակած threshold-ը compliance risk է։
14. **Անդառնալի data change → gate արա owner-ի և rollback-ի հետևում։** Destructive backfill-ները, hard delete-ները և golden-record overwrite-ները կարող են history կորցնել. պահանջիր հստակ approval, backup/restore path, և որտեղ հնարավոր է՝ expand/contract (հետշրջելի) հերթականություն։

### Ձախողման ձևեր

1. **Ambiguous grain (warehouse-ի #1 bug)։** Ոչ ոք չի կարող ասել՝ ինչ է նշանակում մեկ row, ուստի metric-ները double-count են անում, join-երը fan-out։ Tell՝ fact table՝ առանց մեկ-նախադասությամբ grain-ի, երկու dashboard, որ նույն թվի շուրջ համաձայն չեն։
2. **Raw/bronze շերտը mutate անելը։** Տվյալը bronze-ում տեղում «շտկելը» կամ dedupe անելը՝ ոչնչացնելով, թե ինչ եկավ, immutable գրառումը։ Tell՝ UPDATE/DELETE raw layer-ի դեմ, history replay անելու հնարավորություն չկա։
3. **Mesh՝ org-chart-ի թատրոն։** Domain-ները slide-ի վրա նկարված և mesh կոչված՝ առանց product owner-ի, contract-ի, SLA-ի կամ steward-ի։ Tell՝ «մենք data mesh ենք անում», մինչ կենտրոնական թիմը դեռ տիրում է ամեն pipeline-ին։
4. **«Lakehouse plus mesh»-ը մեկ որոշման մեջ կապկպած։** Storage ընտրությունն ու operating model-ը միաձուլված մեկ buzzword-ի, ուստի ոչ մեկը իրական ապացույց չի ստանում։ Tell՝ recommendation, որ չի կարող բաժանել table format-ը ownership model-ից։
5. **Survivorship vacuum MDM-ում։** «Golden record», որ չունի կանոն, թե որ source-ն է հաղթում ամեն attribute-ում, ուստի լուռ դառնում է last-writer-wins։ Tell՝ «single customer view»՝ առանց per-attribute survivorship table-ի։
6. **Breaking schema change անհայտ consumer-ներով։** Rename/drop ship արված՝ առանց consumer inventory-ի և migration window-ի։ Tell՝ schema change merge արված՝ առանց compatibility class-ի և, թե ով է կարդում, ցուցակի։
7. **Catalog առանց adoption-ի։** Governance գործիք install արված, մեկ անգամ լցված և երբեք query չարված։ Tell՝ catalog-ի գնում տոնված որպես governance, առանց դրան կապված որոշման։
8. **Metric ownership vacuum։** Նույն metric-ը երկու տեղ տարբեր սահմանված՝ առանց մեկ owner-ի։ Tell՝ երկու «active users» թիվ, երկուսն էլ «ճիշտ», ոչ մեկը authoritative։
9. **Modeling նախասիրությամբ, ոչ պահանջով։** Kimball/Data Vault/3NF ընտրված, որովհետև թիմին դուր է գալիս, ոչ թե grain/change/audit-ը պահանջում է։ Tell՝ model ընտրություն՝ առանց նշված grain-ի կամ change-rate հիմնավորման։
10. **Crawl/walk/run-ը բաց թողնելը։** Փոքր/անհաս թիմին mesh, ավտոմատ contract կամ column-level lineage տրված՝ նախքան մեկ governed warehouse վարելը։ Tell՝ maturity թռիչք՝ առանց միջանկյալ stage-ի և առանց ներքևում սահմանված grain-ի։
11. **Lineage-ի աղմուկ։** Ամեն ինչի column-level lineage, ուստի ոչ ոք չի կարող պատասխանել «եթե X փոխեմ, ո՞վ է կոտրվում»։ Tell՝ lineage graph՝ չափազանց խիտ կարդալու համար, ոչնչի համար օգտագործված։
12. **Հորինված compliance threshold-ներ։** Retention/residency/PII rule-ներ՝ պնդված որպես փաստ՝ առանց jurisdiction-ի կամ source-ի։ Tell՝ «պետք է 7 տարի պահես»՝ առանց վկայակոչված statute-ի։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (decision matrix / data contract / MDM rulebook / modeling որոշում / governance log / maturity roadmap), ոչ generic advice։
- Ամեն fact table և model նշում է իր **grain**-ը մեկ նախադասությամբ. raw/bronze շերտը հայտարարված է immutable/append-only։
- Storage/architecture ընտրությունը վկայակոչում է binding constraint-ը (latency, cost, governance, transactions, schema volatility, ownership), և mesh-ը հաստատվում է միայն իրական domain ownership + contract-ով։
- Schema change-երը կրում են compatibility class, consumer inventory և migration/rollback path. MDM-ը կրում է per-attribute survivorship։
- Թիմի կարողության պատասխանը հերթականացված է crawl → walk → run՝ առանց բաց թողնված stage-ի։
- Compliance/retention/PII պնդումները վկայակոչում են jurisdiction/source կամ նշված են verify-before-use. ոչ մի հորինված threshold։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **architecture fit** (storage ընտրությունը բխում է workload constraint-ից + ownership maturity-ից, ոչ trend-ից) · **modeling mechanism** (grain, history/SCD, dimensions/hubs, lineage, query path բաց) · **contract discipline** (compatibility class, registry, owner-ներ, migration, rollback կոնկրետ) · **master data** (match, merge, survivorship, stewardship, conflict workflow սահմանված) · **leadership tradeoff** (decision rights, standards, adoption path, exception process, և crawl/walk/run հերթականություն ներառված)։

### Խորացում և asset-եր

`manual.md` (mechanism reference՝ warehouse/lake/lakehouse/mesh, Kimball/Data Vault/3NF, medallion, data contract, MDM. որոշման կանոններ. failure-repair playbook. crawl/walk/run coaching) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (platform decision matrix + maturity roadmap) · `output-templates.md` (decision matrix / data contract / MDM rulebook) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
