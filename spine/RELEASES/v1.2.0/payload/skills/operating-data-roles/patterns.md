# Operating Data Roles patterns

## English

These are canonical operating-data-roles moves. Each is a mechanism for one of the domain's artifacts (routing tree, RACI/RAPID grid, handoff contract, operating map, role-confusion postmortem). Choose the move that changes the next decision, not the nicest label.

### 1. Symptom-to-owner router

- **Trigger:** A data problem could plausibly land on several teams, and people are routing by who is closest or most senior.
- **Mechanism:** Classify the *symptom* first: freshness / duplicates / schema break → data engineer; metric meaning / grain → analytics engineer; causal lift / experiment / model → data scientist; dashboard "what happened / which slice" → analyst; model drift / serving → ML engineer; cross-domain standard / contract / platform → `data-architecture-leadership`. Emit the owning role *plus* the artifact it must produce *plus* one acceptance check. Use the lens-selection cascade (descriptive → semantic → causal → pipeline → serving → standard) to place the symptom before naming the role.
- **Do not use when:** One person explicitly owns the end-to-end system, has capacity, and the boundary is not contested — a router invents handoffs that do not exist.
- **Failure repair:** If two roles fight over ownership, split Accountable from Responsible in a one-row RACI; if the fight is over a *decision* (definition, platform), switch to a RAPID row naming who Decides.

### 2. Handoff contract

- **Trigger:** Work crosses a boundary — build → analysis, pipeline → model, model → serving — and the receiving role asks "can I trust this?"
- **Mechanism:** Write the contract: producer, consumer, grain, SLA/freshness, schema-change policy, backfill procedure, idempotency key, tests, and the escalation owner. The receiving role accepts only when the tests and sample rows prove the contract on a real run. Name both accountabilities the contract implies: the **owner** (Accountable for delivery/SLA) and, if the asset is governed, the **steward** (Accountable for definition/quality/policy).
- **Do not use when:** The work is exploratory scratch that will be discarded — a contract on throwaway analysis is overhead, not safety.
- **Failure repair:** If downstream still asks "can I trust this?", the contract is incomplete — the missing field is usually grain, the idempotency key, or who is paged when the SLA breaks.

### 3. RACI / RAPID split

- **Trigger:** Two or more roles touch one asset or one contested decision, and the operating model is "everyone owns quality."
- **Mechanism:** For *execution* boundaries, write a RACI with exactly one Accountable per decision, Responsible for the doer, Consulted for pre-decision input, Informed for after. For a *contested decision* (what a metric means, which platform), write a RAPID row naming who Decides versus who Recommends, Agrees, Performs, and gives Input. On any governed asset, name the steward and the owner separately. Keep it to the smallest grid that changes the decision.
- **Do not use when:** There is genuinely one owner and no boundary — a full grid is theater that no role will accept.
- **Failure repair:** If the grid has two Accountables, collapse to one via a RAPID "Decide"; if it has none, assign one before anything ships.

### 4. Steward-vs-owner split

- **Trigger:** A governed or sensitive asset (a key metric, a regulated table, a shared dimension) has a single "owner," or a freshness incident pages someone who controls meaning but not delivery.
- **Mechanism:** Separate the two accountabilities on the asset. The **steward** is Accountable for definition, quality, and policy — the canonical meaning, the tests that protect it, and who may use it. The **owner** is Accountable for delivery and the SLA — that the asset is produced, fresh, and on contract. Write both into the RACI, route the on-call so a delivery miss pages the owner and a wrong-meaning bug pages the steward, and give the steward a self-service acceptance path so they are not a bottleneck.
- **Do not use when:** The asset is ungoverned throwaway data with no consumers and no policy surface — one owner is enough.
- **Failure repair:** If only one accountability is named, add the missing one; an owner with no steward ships fresh wrong data, a steward with no owner defines a metric nobody delivers.

### 5. Operating-model maturity gate

- **Trigger:** Someone proposes a data-mesh operating model (domain ownership, data products, federated governance, self-serve platform) for the team's target state.
- **Mechanism:** Gate the vocabulary against the substrate. Check for the prerequisites the mesh presupposes: working handoff *contracts* between teams, named *stewards* per domain, and a *self-serve platform* a team can actually run. If they are absent, do not adopt the mesh language; name the *first* missing prerequisite as the next concrete step (one contract, one steward, or the platform owner), and map the path to the target model instead of declaring it already reached.
- **Do not use when:** The org already runs contracts, stewards, and a self-serve platform — then the mesh vocabulary is describing what exists, not papering over a gap.
- **Failure repair:** If a mesh map has been drawn with zero contracts and no platform owner, strip it to the one prerequisite that unblocks the next handoff, and route the platform *design* to `data-architecture-leadership`.

## Հայերեն

Սրանք canonical operating-data-roles move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (routing tree, RACI/RAPID grid, handoff contract, operating map, role-confusion postmortem)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Symptom-ից owner router

- **Երբ է պետք․** Data-խնդիրը կարող է հավանաբար ընկնել մի քանի թիմի վրա, և մարդիկ ուղղորդում են ըստ նրա, ով մոտ է կամ senior։
- **Մեխանիզմը․** Նախ classify արա *symptom*-ը․ freshness / duplicate / schema break → data engineer. metric meaning / grain → analytics engineer. causal lift / experiment / model → data scientist. dashboard «ինչ եղավ / որ slice» → analyst. model drift / serving → ML engineer. cross-domain standard / contract / platform → `data-architecture-leadership`։ Արձակիր տիրող դերը *plus* artifact-ը, որ պետք է արտադրի, *plus* մեկ acceptance check։ Օգտագործիր lens-selection cascade-ը (descriptive → semantic → causal → pipeline → serving → standard)՝ symptom-ը տեղադրելու համար, նախքան դերն անվանելը։
- **Երբ չօգտագործել․** Երբ մեկ մարդը explicit end-to-end owner է, capacity ունի, և boundary-ն վիճարկված չէ — router-ը հորինում է handoff-ներ, որ գոյություն չունեն։
- **Ուղղում․** Եթե երկու դեր ownership-ի վրա վիճում են, մեկ RACI row-ով բաժանիր Accountable-ը Responsible-ից. եթե վեճը *որոշման* շուրջ է (սահմանում, platform), անցիր RAPID row-ի՝ անվանելով, ով է Decide անում։

### 2. Handoff contract

- **Երբ է պետք․** Աշխատանքը հատում է boundary — build → analysis, pipeline → model, model → serving — և ստացող դերը հարցնում է «սրան կարելի՞ է վստահել»։
- **Մեխանիզմը․** Գրիր contract-ը․ producer, consumer, grain, SLA/freshness, schema-change policy, backfill procedure, idempotency key, tests և escalation owner։ Ստացող դերը ընդունում է միայն, երբ tests-ը և sample rows-ը ապացուցում են contract-ը իրական run-ի վրա։ Անվանիր երկու accountability-ն, որ contract-ը ենթադրում է․ **owner**-ը (Accountable delivery/SLA-ի համար) և, եթե asset-ը governed է, **steward**-ը (Accountable definition/quality/policy-ի համար)։
- **Երբ չօգտագործել․** Երբ աշխատանքը exploratory scratch է, որ discard է լինելու — throwaway analysis-ի վրա contract-ը overhead է, ոչ safety։
- **Ուղղում․** Եթե downstream-ը դեռ հարցնում է «սրան կարելի՞ է վստահել», contract-ը թերի է — բացակայող field-ը սովորաբար grain-ն է, idempotency key-ն, կամ ով է page ստանում, երբ SLA-ն breach է լինում։

### 3. RACI / RAPID բաժանում

- **Երբ է պետք․** Երկու կամ ավելի դեր են դիպչում մեկ asset-ի կամ մեկ վիճարկվող որոշման, և operating model-ը «բոլորը quality-ի owner են» է։
- **Մեխանիզմը․** *Execution*-ի boundary-ների համար գրիր RACI՝ ճիշտ մեկ Accountable ամեն որոշման, Responsible՝ անողի, Consulted՝ pre-decision input-ի, Informed՝ հետո։ *Վիճարկվող որոշման* համար (ինչ է metric-ը նշանակում, որ platform) գրիր RAPID row՝ անվանելով, ով է Decide անում ընդդեմ նրա, ով Recommend, Agree, Perform է անում և Input տալիս։ Ամեն governed asset-ի վրա անվանիր steward-ը և owner-ը առանձին։ Պահիր ամենափոքր grid-ը, որ փոխում է որոշումը։
- **Երբ չօգտագործել․** Երբ իսկապես մեկ owner է և boundary չկա — ամբողջական grid-ը theater է, որ ոչ մի դեր չի ընդունի։
- **Ուղղում․** Եթե grid-ը երկու Accountable ունի, միացրու մեկի RAPID «Decide»-ով. եթե ոչ մեկը չունի, նշանակիր մեկը նախքան որևէ բան ship անելը։

### 4. Steward-vs-owner բաժանում

- **Երբ է պետք․** Governed կամ sensitive asset-ը (key metric, regulated table, shared dimension) ունի մեկ «owner», կամ freshness incident-ը page է անում մեկին, ով վերահսկում է իմաստը, բայց ոչ delivery-ն։
- **Մեխանիզմը․** Բաժանիր երկու accountability-ն asset-ի վրա։ **Steward**-ը Accountable է definition-ի, quality-ի և policy-ի համար — canonical իմաստը, tests-ը, որ պաշտպանում են այն, և ով կարող է օգտագործել։ **Owner**-ը Accountable է delivery-ի և SLA-ի համար — որ asset-ը արտադրվում է, fresh է և contract-ի վրա է։ Գրիր երկուսն էլ RACI-ում, route արա on-call-ը, որ delivery miss-ը page անի owner-ին, իսկ wrong-meaning bug-ը՝ steward-ին, և տուր steward-ին self-service acceptance path, որ նա bottleneck չլինի։
- **Երբ չօգտագործել․** Երբ asset-ը ungoverned throwaway data է՝ առանց consumer-ի և policy surface-ի — մեկ owner-ը բավ է։
- **Ուղղում․** Եթե միայն մեկ accountability է անվանված, ավելացրու բացակայողը. owner առանց steward-ի fresh սխալ data է ship անում, steward առանց owner-ի սահմանում է metric, որ ոչ ոք չի delivery անում։

### 5. Operating-model maturity gate

- **Երբ է պետք․** Ինչ-որ մեկը առաջարկում է data-mesh operating model (domain ownership, data products, federated governance, self-serve platform) թիմի target state-ի համար։
- **Մեխանիզմը․** Gate արա vocabulary-ն substrate-ի դեմ։ Ստուգիր prerequisite-ները, որ mesh-ը ենթադրում է․ աշխատող handoff *contract*-ներ թիմերի միջև, անվանված *steward*-ներ ամեն domain-ի, և *self-serve platform*, որ թիմը իրականում կարող է վարել։ Եթե բացակայում են, mesh language-ը մի՛ ընդունիր. անվանիր *առաջին* բացակայող prerequisite-ը որպես հաջորդ կոնկրետ քայլ (մեկ contract, մեկ steward, կամ platform-ի owner), և քարտեզիր ճանապարհը դեպի target model՝ արդեն հասածը հայտարարելու փոխարեն։
- **Երբ չօգտագործել․** Երբ org-ն արդեն վարում է contract-ներ, steward-ներ և self-serve platform — այդ դեպքում mesh vocabulary-ն նկարագրում է այն, ինչ կա, ոչ թե ծածկում gap-ը։
- **Ուղղում․** Եթե mesh map է գծվել զրո contract-ով և առանց platform owner-ի, կտրիր այն մինչև այն մեկ prerequisite-ը, որ unblock է անում հաջորդ handoff-ը, և ուղղորդիր platform-ի *design*-ը `data-architecture-leadership`-ին։
