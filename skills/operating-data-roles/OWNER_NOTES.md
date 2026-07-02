# Operating Data Roles owner notes

## English

### Needs human review when

This skill assigns ownership and routes work; it does not have authority to *enact* organizational, personnel, or access changes. Route to a human owner — do not finalize on your own authority — when an assignment touches people, access, or money, or when the question crosses into design that belongs to `data-architecture-leadership`.

- **Naming a real individual as the failure cause.** A role-confusion postmortem assigns missing *artifacts and controls*, never blame to a named person. Anything that reads as individual fault, performance judgment, or "retrain/replace them" routes to that person's manager and HR — it is not this skill's call.
- **Reassigning a real person's ownership or scope.** Changing who is Accountable for an asset, moving on-call, or shifting a person's remit affects roles and workload; produce the proposed RACI, then route the actual reassignment to the manager who owns headcount.
- **Access, policy, and steward assignment on sensitive/regulated data.** Naming a steward, granting access, or setting a use policy on personal, financial, or regulated assets has compliance weight; propose the gate, but the binding access/policy decision routes to the data owner and legal/compliance.
- **Platform, contract-standard, or topology design.** This skill is support-only relative to `data-architecture-leadership`. Any deliverable that *designs* a platform, a contract standard, or a domain/mesh topology routes there; here, assign the Accountable owner and the steward, not the design.
- **Committing to a target operating model (e.g. a data mesh).** Declaring a mesh/domain reorganization commits teams, hiring, and platform spend. Surface the maturity gap and the prerequisites; the commitment to reorganize is leadership's, not this skill's.
- **Irreversible data actions implied by a route.** If a routing or handoff decision implies a destructive backfill, a schema cutover, or a deletion, name the owner and the rollback and route the action to that owner's gate — do not let a routing artifact authorize an irreversible data step.

The default posture for all of the above: produce the routing tree, the RACI, the handoff contract, and the acceptance check; then stop and route the binding decision to the human owner.

### Owned future-improvement items

- **✓ DELIVERED (gazan 2026-07-02)** — Add a third worked example for a **RAPID decision** (contested platform/definition) end-to-end, so the RACI-vs-RAPID rule has a concrete decision-rights walkthrough, not only an execution one.
- Add an **operating-model maturity ladder** (no contracts → first contracts → named stewards → self-serve platform → mesh) so the data-mesh maturity gate becomes a positionable scale rather than a yes/no.
- Add a **handoff-contract acceptance checklist** the consumer can run mechanically (grain stated, idempotency key present, freshness test, sample rows), making "accept only on a passing real run" copy-ready.
- Add a small **role-boundary reference card** (descriptive/semantic/causal/pipeline/serving/standard → role) to make the lens-selection cascade fast to apply in review.
- Cross-link the routing targets explicitly to the sibling skills (`data-engineering-pipelines`, `data-science-analytics`, `databases-storage-engineering`) so each route names where the *implementation* of that artifact is owned.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը նշանակում է ownership և route է անում աշխատանք. այն լիազորություն չունի *իրականացնելու* կազմակերպչական, անձնակազմի կամ access փոփոխություններ։ Ուղղորդիր մարդ-տիրոջը — մի՛ վերջնականացրու սեփական լիազորությամբ — երբ նշանակումը դիպչում է մարդկանց, access-ի կամ փողի, կամ երբ հարցը անցնում է design-ի, որ պատկանում է `data-architecture-leadership`-ին։

- **Իրական անհատին որպես failure cause անվանելը.** Role-confusion postmortem-ը նշանակում է բացակայող *artifact-ներ և control-ներ*, երբեք ոչ blame անվանված մարդուն։ Ամեն ինչ, որ կարդացվում է որպես անհատի մեղք, performance դատողություն կամ «վերապատրաստել/փոխարինել», ուղղորդվում է այդ մարդու manager-ին և HR-ին — դա այս skill-ի գործը չէ։
- **Իրական մարդու ownership-ի կամ scope-ի վերանշանակում.** Փոխելը, թե ով է Accountable asset-ի համար, on-call-ի տեղափոխումը, կամ մարդու remit-ի փոփոխությունն ազդում է դերերի և workload-ի վրա. արտադրիր առաջարկվող RACI-ն, հետո route արա իրական վերանշանակումը այն manager-ին, որ տիրում է headcount-ին։
- **Access, policy և steward-ի նշանակում sensitive/regulated data-ի վրա.** Steward անվանելը, access տալը կամ use policy սահմանելը personal, financial կամ regulated asset-ների վրա compliance կշիռ ունի. առաջարկիր gate-ը, բայց պարտադիր access/policy որոշումը route է անում data owner-ին և legal/compliance-ին։
- **Platform, contract-standard կամ topology design.** Այս skill-ը support-only է `data-architecture-leadership`-ի նկատմամբ։ Ցանկացած deliverable, որ *դիզայն* է անում platform, contract standard կամ domain/mesh topology, route է անում այնտեղ. այստեղ նշանակիր Accountable owner-ը և steward-ը, ոչ design-ը։
- **Target operating model-ին commit անելը (օր.՝ data mesh).** Mesh/domain վերակազմակերպում հայտարարելը commit է անում թիմեր, hiring և platform ծախս։ Ցույց տուր maturity gap-ը և prerequisite-ները. վերակազմակերպվելու commitment-ը leadership-ինն է, ոչ այս skill-ի։
- **Route-ից բխող անդառնալի data action-ներ.** Եթե routing կամ handoff որոշումը ենթադրում է destructive backfill, schema cutover կամ deletion, անվանիր owner-ը և rollback-ը և route արա action-ը այդ owner-ի gate-ին — մի՛ թող, որ routing artifact-ը authorize անի անդառնալի data քայլ։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր routing tree-ն, RACI-ն, handoff contract-ը և acceptance check-ը. հետո կանգնի՛ր և route արա պարտադիր որոշումը մարդ-տիրոջը։

### Սեփական ապագա-բարելավման կետեր

- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու երրորդ worked example **RAPID որոշման** համար (վիճարկվող platform/definition) ծայրից ծայր, որ RACI-vs-RAPID կանոնը ունենա կոնկրետ decision-rights walkthrough, ոչ միայն execution-ի։
- Ավելացրու **operating-model maturity ladder** (ոչ contract → առաջին contract-ներ → անվանված steward-ներ → self-serve platform → mesh), որ data-mesh maturity gate-ը դառնա դիրքավորելի scale, ոչ yes/no։
- Ավելացրու **handoff-contract acceptance checklist**, որ consumer-ը կարող է մեխանիկորեն գործարկել (grain նշված, idempotency key կա, freshness test, sample rows), դարձնելով «ընդունիր միայն անցնող իրական run-ի վրա» copy-ready։
- Ավելացրու փոքր **role-boundary reference card** (descriptive/semantic/causal/pipeline/serving/standard → role), որ lens-selection cascade-ը արագ կիրառելի լինի review-ում։
- Cross-link արա routing target-ները բացահայտ sibling skill-երին (`data-engineering-pipelines`, `data-science-analytics`, `databases-storage-engineering`), որ ամեն route անվանի, թե որտեղ է տիրվում այդ artifact-ի *implementation*-ը։
