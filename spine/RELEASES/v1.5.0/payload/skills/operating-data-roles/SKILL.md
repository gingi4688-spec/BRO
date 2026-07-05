---
name: "operating-data-roles"
description: >-
  use when the work is deciding which data role owns a problem, routing a data issue to the right team, drawing a RACI/RAPID across data roles, designing a handoff contract between teams, mapping a data-team operating model, or diagnosing role confusion (analysts running pipelines, scientists owning prod, stewards treated as owners) — for decisions, critique, planning, diagnostics, routing trees/RACI/handoff artifacts, teaching, or evaluation. use as lead when the central deliverable is the routing/ownership/handoff artifact itself. this skill is SUPPORT-ONLY relative to data-architecture-leadership: it routes and assigns ownership, it does not design the platform, contracts, or standards — when the artifact is the architecture decision, that skill leads and this one supports. հայերեն՝ օգտագործիր, երբ պետք է որոշել, թե որ data-դերն է տիրում խնդրին, ուղղորդել data-խնդիրը ճիշտ թիմին, կազմել RACI/RAPID, նախագծել թիմերի handoff contract, կամ ախտորոշել role-confusion-ը։
---

# Operating Data Roles / Տվյալների դերերի ուղղորդում

## English

**Scope.** In: routing a data problem from its symptom to the role that owns it (data engineering, analytics engineering, data science, analyst, ML engineering, and the architect/steward functions); building a RACI or RAPID across data roles; writing the handoff contract between two roles (the boundary conditions a producer owes a consumer); mapping a data-team operating model; and diagnosing role confusion. Out: the platform, contract, and standards *design* itself (that is `data-architecture-leadership`'s deliverable), pipeline *implementation* (`data-engineering-pipelines`), statistical/causal *method* (`data-science-analytics`), and storage/engine *internals* (`databases-storage-engineering`). This skill decides **who owns what, on which boundary, with which acceptance check** — it does not build the thing each role owns.

**This skill is support-only relative to `data-architecture-leadership`.** Routing and ownership assignment are not architecture. When the central deliverable is a platform choice, a contract *standard*, a domain/mesh topology, or an enterprise data model, `data-architecture-leadership` leads and this skill supports it by assigning RACI and naming the steward — never the reverse. State this boundary explicitly whenever the question drifts from "who owns it" toward "how should it be designed."

**Leads / Supports.** Lead when the central deliverable is a routing/ownership/handoff artifact: a symptom→role routing tree, a RACI/RAPID grid, a handoff contract, a role-confusion postmortem, or a data-team operating map. Support when another skill owns the artifact and role-ownership is one input — architecture owns the standard and you assign its steward and RACI; engineering owns the pipeline and you write the handoff contract that bounds it; data science owns the method and you place it correctly between analyst (descriptive/diagnostic) and scientist (causal/modeling).

Conflict rules:
- **Design vs ownership → defer design to `data-architecture-leadership`.** If the answer needs a platform, a contract standard, a mesh/domain topology, or an enterprise model *designed*, that is architecture's call; here you assign the **Accountable** owner and the **steward** for it, not the design.
- **Metric meaning vs metric mechanics → analyst defines business meaning, analytics engineer owns the semantic model.** Do not let engineering decide what a metric *means*, and do not let an analyst silently own the pipeline that computes it. Split definition (Consulted: analyst/stakeholder) from implementation (Responsible: analytics engineer) in one RACI row.
- **Steward vs owner → never collapse them.** A **steward** safeguards quality, definition, and policy for a data asset (Accountable for *correctness and meaning*); an **owner** is Accountable for *delivery and the SLA*. The same asset usually has both, and conflating them is a top failure mode — see below.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep boundaries, make the output an executable artifact, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Route from the symptom, not the job title or seniority.** Broken ingestion/freshness/duplicates → data engineering; ambiguous metric *definition* → analytics engineering; causal question/experiment/model → data science; "what happened / which slice" → analyst; model serving/feature drift → ML engineering; cross-domain standard/contract/platform → `data-architecture-leadership`.
2. **Every routing decision carries three things → the owning role, the artifact it must produce, and one acceptance check.** A route with no artifact and no acceptance check is a guess, not a routing decision.
3. **Split Accountable from Responsible the moment two roles touch one asset.** Responsible does the work; Accountable owns the outcome and has the final say. Two Accountables on one decision is the bug; zero Accountable is the worse bug.
4. **Separate the steward from the owner on every governed asset.** Steward = Accountable for definition, quality, and policy; owner = Accountable for delivery and SLA. Name both; if you can only name one, you have not finished the RACI.
5. **Use RACI for execution boundaries; use RAPID when the hard part is the *decision itself*.** RAPID (Recommend, Agree, Perform, Input, Decide) routes a contested decision (a metric definition, a platform choice); RACI routes who does and owns the *work*. Picking the wrong frame is its own failure.
6. **Pick the smallest framework that changes a decision.** One RACI row that splits two fighting roles beats a full nine-box grid nobody reads. Skip framework theater.
7. **A handoff is a contract, not a meeting.** A producer hands a consumer an artifact with boundary conditions: grain, SLA/freshness, schema-change policy, backfill rule, idempotency key, tests, and the escalation owner. A handoff without acceptance criteria is just a conversation.
8. **Match the framework's vocabulary to the org's maturity.** Do not impose data-mesh terms (domain ownership, data products, federated governance, self-serve platform) on a team that has no platform, no contracts, and no stewards — naming the target operating model is not the same as having it.
9. **Do not move governance after the leak.** If an asset is sensitive or regulated, the steward, the access policy, and the acceptance gate are assigned *before* data flows, not bolted on after an incident.
10. **When the symptom is "everyone assumed someone else owned it," write the artifact, not another status meeting.** Name the failed artifact, the absent role, the missing decision right, and the earliest signal; then assign RACI for prevention.
11. **Route the *ownership* question here; route the *design* question to architecture.** "Who owns the contract?" is this skill. "What should the contract standard be?" is `data-architecture-leadership` — say so and hand the design boundary across.
12. **Verify the routing in the running operating model, not on the chart.** A RACI is real only when the named owner accepts the artifact and the acceptance check passes on a real run — the org chart is not evidence the work is owned.

### Failure modes to prevent / Ձախողման ձևեր

1. **Steward-vs-owner confusion.** Treating the steward (definition/quality/policy) and the owner (delivery/SLA) as one role, or assigning only one of them. Tell: a governed asset with a single "owner" and no one Accountable for what the data *means*, or a freshness incident where the steward is paged for a delivery miss they do not control.
2. **Data-mesh vocabulary before maturity.** Importing "data products / domain ownership / federated governance / self-serve platform" onto a team with no platform, no contracts, and no stewards. Tell: a mesh operating model proposed with zero existing handoff contracts and no one who can run a self-serve platform — vocabulary standing in for capability.
3. **Routing by seniority or convenience.** The senior person or the least-busy person gets the problem, regardless of which role's artifact it actually is. Tell: a pipeline freshness miss handed to an analyst because they "know the dashboard," with no data engineer in the RACI.
4. **Analyst becomes pipeline owner.** With no ingestion SLA and no data-engineering owner, the analyst quietly inherits the pipeline. Tell: an analyst answering "is the data fresh?" by manually re-running a job — owning infra that has no contract.
5. **Scientist becomes production owner.** With ML engineering absent, the data scientist owns model serving, monitoring, and on-call. Tell: a notebook in production with the scientist as the de-facto SRE and no serving/drift owner.
6. **Architect/steward as approval bottleneck.** Standards exist but have no self-service path, so every change queues behind one person. Tell: a steward who is Consulted on everything and the actual blocker for routine handoffs.
7. **RACI with no Accountable (or two).** Everyone is Responsible, no one is Accountable — or two roles are both Accountable for the same decision. Tell: "everyone owns quality" as the operating model; a decision with two final-say owners and a standing deadlock.
8. **Handoff that is a meeting, not a contract.** Work crosses a boundary with no grain, SLA, tests, or acceptance gate. Tell: the receiving role asks "can I trust this?" and there is no contract that answers it.
9. **Metric meaning decided by the wrong role.** Engineering decides what a metric *means*, or an analyst silently owns the semantic model that computes it. Tell: a churn number with no analyst-owned definition and no analytics-engineer-owned grain/test.
10. **Governance added after the leak.** Steward, access policy, and acceptance gate assigned only after a sensitive asset has already flowed. Tell: an access-control RACI written in the postmortem, not before the pipeline.
11. **Framework theater.** A full nine-box RACI/RAPID where one row would change the decision; vocabulary and grids substituted for a real ownership split. Tell: a beautiful grid that no role accepted and no acceptance check tests.
12. **Lens used past its boundary.** This skill kept leading after the question turned into platform/contract/standard *design* — it should have handed the seam to `data-architecture-leadership`. Tell: a "routing" answer that quietly designs the architecture instead of assigning its owner.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (routing tree / RACI or RAPID grid / handoff contract / operating map / role-confusion postmortem), not generic advice.
- Every routing decision names the owning role, the artifact it produces, and one acceptance check.
- Every governed asset names **both** a steward (definition/quality/policy) and an owner (delivery/SLA); RACI has exactly one Accountable per decision.
- Handoff contracts carry grain, SLA/freshness, schema-change policy, backfill rule, idempotency key, tests, and an escalation owner.
- The framework fits the org's maturity (no data-mesh vocabulary without the platform/contracts/stewards to back it) and is the smallest one that changes the decision.
- The design/ownership boundary is explicit: anything that is platform/contract-standard/topology *design* is routed to `data-architecture-leadership` with the steward named, not designed here.
- **Verify in the running operating model**, not on the chart — the named owner accepts the artifact and the acceptance check passes on a real run.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **routing precision** (symptom→role→artifact→acceptance→escalation, not a title list) · **role boundaries** (descriptive/semantic/causal/pipeline/ML/architecture separated; analyst≠scientist≠engineer) · **RACI/RAPID quality** (one Accountable per decision, steward and owner both named, the grid changes a real handoff) · **handoff contracts** (grain, SLA, tests, owner, backfill, idempotency, escalation) · **operating repair** (fixes the missing artifact / decision right / monitoring signal, not "communicate better").

### Deep dive & assets

`manual.md` (mechanism reference, glossary, decision rules, failure-repair playbook, steward-vs-owner, data-mesh maturity gate, lens-selection cascade, seam boundary) · `patterns.md` (5 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (routing/RACI + steward-vs-owner) · `output-templates.md` (routing tree / RACI / handoff contract) · `red-team-gate.md` (domain reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ data-խնդիրը symptom-ից ուղղորդել այն դերին, որ տիրում է դրան (data engineering, analytics engineering, data science, analyst, ML engineering և architect/steward ֆունկցիաները). RACI կամ RAPID կազմել data-դերերի վրա. երկու դերի միջև handoff contract գրել (boundary condition-ները, որ producer-ը պարտք է consumer-ին). data-team-ի operating model-ը քարտեզել. և role-confusion-ը ախտորոշել։ Դուրս՝ հենց հարթակի, contract-ի և standard-ի *դիզայնը* (դա `data-architecture-leadership`-ի deliverable-ն է), pipeline-ի *իրականացումը* (`data-engineering-pipelines`), վիճակագրական/causal *մեթոդը* (`data-science-analytics`) և storage/engine-ի *ներքինը* (`databases-storage-engineering`)։ Այս skill-ը որոշում է՝ **ով ինչ է տիրում, որ boundary-ի վրա, որ acceptance check-ով** — այն չի կառուցում այն, ինչ ամեն դեր տիրում է։

**Այս skill-ը support-only է `data-architecture-leadership`-ի նկատմամբ։** Ուղղորդումը և ownership-ի նշանակումը architecture չեն։ Երբ կենտրոնական deliverable-ը հարթակի ընտրությունն է, contract-ի *standard*-ը, domain/mesh topology-ն կամ enterprise data model-ը, `data-architecture-leadership`-ն է առաջատարը, իսկ այս skill-ը աջակցում է՝ RACI նշանակելով և steward-ին անվանելով — երբեք հակառակը։ Անվանի՛ր այս սահմանը բացահայտ, երբ հարցը «ով է տիրում»-ից շեղվում է դեպի «ինչպես պետք է դիզայն արվի»։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը ուղղորդման/ownership-ի/handoff artifact է՝ symptom→role routing tree, RACI/RAPID grid, handoff contract, role-confusion postmortem կամ data-team operating map։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ role-ownership-ը մեկ input է. architecture-ը տիրում է standard-ին, դու նշանակում ես նրա steward-ը և RACI-ն. engineering-ը տիրում է pipeline-ին, դու գրում ես handoff contract-ը, որ սահմանում է այն. data science-ը տիրում է մեթոդին, դու ճիշտ ես տեղադրում այն analyst-ի (descriptive/diagnostic) և scientist-ի (causal/modeling) միջև։

Կոնֆլիկտի կանոններ․
- **Design ընդդեմ ownership → design-ը զիջիր `data-architecture-leadership`-ին։** Եթե պատասխանին պետք է *դիզայն արված* հարթակ, contract standard, mesh/domain topology կամ enterprise model, դա architecture-ի գործն է. այստեղ դու նշանակում ես **Accountable** owner-ը և **steward**-ը դրա համար, ոչ թե design-ը։
- **Metric-ի իմաստ ընդդեմ metric-ի մեխանիկայի → analyst-ը սահմանում է business իմաստը, analytics engineer-ը տիրում է semantic model-ին։** Մի՛ թող, որ engineering-ը որոշի, թե metric-ը ինչ է *նշանակում*, և մի՛ թող, որ analyst-ը լուռ տիրի այն pipeline-ին, որ հաշվում է այն։ Մեկ RACI row-ով բաժանիր սահմանումը (Consulted՝ analyst/stakeholder) իրականացումից (Responsible՝ analytics engineer)։
- **Steward ընդդեմ owner → երբեք մի՛ միացրու։** **Steward**-ը պաշտպանում է data asset-ի որակը, սահմանումը և policy-ն (Accountable՝ *ճշտության և իմաստի* համար). **owner**-ը Accountable է *delivery-ի և SLA-ի* համար։ Նույն asset-ը սովորաբար ունի երկուսն էլ, և դրանք շփոթելը թոփ failure mode է — տես ներքևում։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր սահմանները, արդյունքը դարձրու կիրառելի artifact, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Ուղղորդիր symptom-ից, ոչ job title-ից կամ seniority-ից։** Կոտրված ingestion/freshness/duplicate → data engineering. metric-ի *սահմանման* երկիմաստություն → analytics engineering. causal հարց/experiment/model → data science. «ինչ եղավ / որ slice» → analyst. model serving/feature drift → ML engineering. cross-domain standard/contract/platform → `data-architecture-leadership`։
2. **Ամեն ուղղորդման որոշում կրում է երեք բան → տիրող դերը, artifact-ը, որ պետք է արտադրի, և մեկ acceptance check։** Ուղղորդում առանց artifact-ի և acceptance check-ի գուշակություն է, ոչ ուղղորդման որոշում։
3. **Բաժանի՛ր Accountable-ը Responsible-ից այն պահին, երբ երկու դեր են դիպչում մեկ asset-ի։** Responsible-ը կատարում է գործը. Accountable-ը տիրում է արդյունքին և ունի վերջին խոսքը։ Մեկ որոշման վրա երկու Accountable-ը bug է. զրո Accountable-ը՝ ավելի վատ bug։
4. **Ամեն governed asset-ի վրա բաժանի՛ր steward-ը owner-ից։** Steward = Accountable սահմանման, որակի և policy-ի համար. owner = Accountable delivery-ի և SLA-ի համար։ Անվանի՛ր երկուսն էլ. եթե կարող ես միայն մեկն անվանել, RACI-ն չես ավարտել։
5. **RACI օգտագործիր execution-ի boundary-ների համար. RAPID՝ երբ դժվարը հենց *որոշումն* է։** RAPID-ը (Recommend, Agree, Perform, Input, Decide) ուղղորդում է վիճարկվող որոշումը (metric-ի սահմանում, platform choice). RACI-ն ուղղորդում է, թե ով է *աշխատանքն* անում և տիրում։ Սխալ frame ընտրելն ինքնին failure է։
6. **Ընտրիր ամենափոքր framework-ը, որ փոխում է որոշումը։** Մեկ RACI row, որ բաժանում է երկու վիճող դեր, ավելի լավն է, քան ինը-վանդակ grid, որ ոչ ոք չի կարդում։ Framework theater մի՛ արա։
7. **Handoff-ը contract է, ոչ meeting։** Producer-ը consumer-ին հանձնում է artifact՝ boundary condition-ներով՝ grain, SLA/freshness, schema-change policy, backfill rule, idempotency key, tests և escalation owner։ Handoff առանց acceptance criteria-ի պարզապես խոսակցություն է։
8. **Framework-ի vocabulary-ն համապատասխանեցրու org-ի maturity-ին։** Մի՛ պարտադրիր data-mesh տերմինները (domain ownership, data products, federated governance, self-serve platform) թիմին, որ չունի հարթակ, contract-ներ կամ steward-ներ — target operating model-ը անվանելը նույնը չէ, ինչ ունենալը։
9. **Governance-ը leak-ից հետո մի՛ տեղափոխիր։** Եթե asset-ը sensitive կամ regulated է, steward-ը, access policy-ն և acceptance gate-ը նշանակվում են *նախքան* data-ի հոսքը, ոչ incident-ից հետո կպցվում։
10. **Երբ symptom-ը «բոլորը կարծում էին ուրիշն է տիրում» է, գրի՛ր artifact-ը, ոչ թե ևս մեկ status meeting։** Անվանի՛ր ձախողված artifact-ը, բացակայող դերը, missing decision right-ը և ամենավաղ signal-ը. հետո prevention-ի համար RACI նշանակիր։
11. **Ուղղորդիր *ownership*-ի հարցը այստեղ. *design*-ի հարցը՝ architecture-ին։** «Ով է տիրում contract-ին» — այս skill-ն է։ «Ինչ պետք է լինի contract standard-ը» — `data-architecture-leadership`-ն է. ասա՛ դա և հանձնի՛ր design-ի boundary-ն այն կողմ։
12. **Ստուգի՛ր ուղղորդումը գործող operating model-ում, ոչ chart-ի վրա։** RACI-ն իրական է միայն, երբ անվանված owner-ը ընդունում է artifact-ը, և acceptance check-ն անցնում է իրական run-ի վրա — org chart-ը ապացույց չէ, որ գործը տիրվում է։

### Ձախողման ձևեր

1. **Steward-vs-owner confusion։** Steward-ը (սահմանում/որակ/policy) և owner-ը (delivery/SLA) որպես մեկ դեր ընկալելը, կամ նրանցից միայն մեկը նշանակելը։ Tell՝ governed asset մեկ «owner»-ով և ոչ ոք Accountable չէ, թե data-ն ինչ է *նշանակում*. կամ freshness incident, որտեղ steward-ը page է ստանում delivery miss-ի համար, որ չի վերահսկում։
2. **Data-mesh vocabulary maturity-ից առաջ։** «Data products / domain ownership / federated governance / self-serve platform»-ը ներմուծել թիմին, որ չունի հարթակ, contract-ներ կամ steward-ներ։ Tell՝ mesh operating model առաջարկված զրո առկա handoff contract-ով և ոչ ոք, ով կարող է self-serve platform վարել — vocabulary capability-ի փոխարեն։
3. **Ուղղորդում seniority-ով կամ հարմարությամբ։** Senior-ը կամ ամենաազատ մարդը ստանում է խնդիրը, անկախ նրանից, թե որ դերի artifact-ն է իրականում։ Tell՝ pipeline-ի freshness miss հանձնված analyst-ին, որովհետև «նա dashboard-ը գիտի», առանց data engineer-ի RACI-ում։
4. **Analyst-ը դառնում է pipeline owner։** Առանց ingestion SLA-ի և data-engineering owner-ի, analyst-ը լուռ ժառանգում է pipeline-ը։ Tell՝ analyst, որ «data-ն fresh է՞» հարցին պատասխանում է job-ը ձեռքով վերագործարկելով — տիրում է infra-ի, որ contract չունի։
5. **Scientist-ը դառնում է production owner։** ML engineering-ի բացակայության դեպքում, data scientist-ը տիրում է model serving-ին, monitoring-ին և on-call-ին։ Tell՝ notebook production-ում, scientist-ը՝ de-facto SRE, serving/drift owner չկա։
6. **Architect/steward-ը՝ approval bottleneck։** Standards կա, բայց self-service path չունի, ուստի ամեն փոփոխություն հերթ է կանգնում մեկ մարդու հետևում։ Tell՝ steward, որ Consulted է ամեն ինչում և routine handoff-ների իրական blocker-ն է։
7. **RACI առանց Accountable-ի (կամ երկուսով)։** Բոլորը Responsible են, ոչ ոք Accountable — կամ երկու դեր երկուսն էլ Accountable են նույն որոշման համար։ Tell՝ «բոլորը quality-ի owner են» որպես operating model. որոշում երկու վերջին-խոսք owner-ով և մշտական deadlock։
8. **Handoff, որ meeting է, ոչ contract։** Աշխատանքը հատում է boundary-ն առանց grain-ի, SLA-ի, tests-ի կամ acceptance gate-ի։ Tell՝ ստացող դերը հարցնում է «սրան կարելի՞ է վստահել», և contract չկա, որ պատասխանի։
9. **Metric-ի իմաստը որոշում է սխալ դերը։** Engineering-ը որոշում է, թե metric-ը ինչ է *նշանակում*, կամ analyst-ը լուռ տիրում է այն semantic model-ին, որ հաշվում է այն։ Tell՝ churn թիվ առանց analyst-տիրած սահմանման և առանց analytics-engineer-տիրած grain/test-ի։
10. **Governance ավելացված leak-ից հետո։** Steward, access policy և acceptance gate նշանակված միայն այն բանից հետո, երբ sensitive asset-ն արդեն հոսել է։ Tell՝ access-control RACI գրված postmortem-ում, ոչ pipeline-ից առաջ։
11. **Framework theater։** Ամբողջական ինը-վանդակ RACI/RAPID, որտեղ մեկ row-ը կփոխեր որոշումը. vocabulary և grid՝ իրական ownership-ի բաժանման փոխարեն։ Tell՝ գեղեցիկ grid, որ ոչ մի դեր չընդունեց և ոչ մի acceptance check չի ստուգում։
12. **Lens-ը կիրառված իր boundary-ից այն կողմ։** Այս skill-ը շարունակեց առաջատար մնալ այն բանից հետո, երբ հարցը դարձավ platform/contract/standard *design* — պետք է seam-ը հանձներ `data-architecture-leadership`-ին։ Tell՝ «routing» պատասխան, որ լուռ դիզայն է անում architecture-ը՝ նրա owner-ին նշանակելու փոխարեն։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (routing tree / RACI կամ RAPID grid / handoff contract / operating map / role-confusion postmortem), ոչ generic advice։
- Ամեն ուղղորդման որոշում անվանում է տիրող դերը, artifact-ը, որ արտադրում է, և մեկ acceptance check։
- Ամեն governed asset անվանում է **և՛** steward (սահմանում/որակ/policy), **և՛** owner (delivery/SLA). RACI-ն ունի ճիշտ մեկ Accountable ամեն որոշման համար։
- Handoff contract-ները կրում են grain, SLA/freshness, schema-change policy, backfill rule, idempotency key, tests և escalation owner։
- Framework-ը համապատասխանում է org-ի maturity-ին (ոչ data-mesh vocabulary առանց հարթակի/contract-ների/steward-ների, որ հենում են այն) և ամենափոքրն է, որ փոխում է որոշումը։
- Design/ownership boundary-ն բացահայտ է․ ամեն ինչ, որ platform/contract-standard/topology *design* է, ուղղորդվում է `data-architecture-leadership`-ին՝ steward-ը անվանված, ոչ թե այստեղ դիզայն արված։
- **Ստուգի՛ր գործող operating model-ում**, ոչ chart-ի վրա — անվանված owner-ը ընդունում է artifact-ը, և acceptance check-ն անցնում է իրական run-ի վրա։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **routing precision** (symptom→role→artifact→acceptance→escalation, ոչ title-ների ցուցակ) · **role boundaries** (descriptive/semantic/causal/pipeline/ML/architecture բաժանված. analyst≠scientist≠engineer) · **RACI/RAPID quality** (մեկ Accountable ամեն որոշման, steward և owner երկուսն էլ անվանված, grid-ը փոխում է իրական handoff) · **handoff contract** (grain, SLA, tests, owner, backfill, idempotency, escalation) · **operating repair** (շտկում է բացակայող artifact-ը / decision right-ը / monitoring signal-ը, ոչ «ավելի լավ շփվել»)։

### Խորացում և asset-եր

`manual.md` (mechanism reference, glossary, որոշման կանոններ, failure-repair playbook, steward-vs-owner, data-mesh maturity gate, lens-selection cascade, seam boundary) · `patterns.md` (5 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (routing/RACI + steward-vs-owner) · `output-templates.md` (routing tree / RACI / handoff contract) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
