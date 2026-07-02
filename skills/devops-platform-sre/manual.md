# DevOps, Platform, and SRE manual

## English

### Operating principle

Senior DevOps, Platform, and SRE work is decision-grade only when it converts reliability from a feeling into a measurable, spendable budget, and pairs every claim with an auditable mechanism. The deliverable is one of four shapes: an SLO/error-budget sheet, a rollout/release plan, an incident postmortem, or a platform/capacity-cost review. The single guardrail that governs all four is the error budget: if the budget arithmetic is wrong, every downstream recommendation — alert thresholds, freeze decisions, canary abort lines — is wrong with it. So the first move is always to compute the budget in minutes, then reason from there. Reliability is not the absence of failure; it is failure kept inside an explicit, agreed budget, with the rest of the budget deliberately spent on velocity.

### Mechanism reference

- **Error budgets and burn rate** — Error budgets turn reliability into spendable risk. Budget = (1 − SLO) × window. For 99.9% over 30 days, the budget is 0.1% of 43,200 minutes = **43.2 minutes**. Burn rate = observed error rate / allowed error rate. A **14.4× burn** (1.44% errors vs 0.1% allowed) consumes about **2% of the monthly budget in one hour**; a **6× burn** consumes about **5% over six hours**. Alerts should combine a fast page (short window, high burn) and a slower ticket (long window, lower burn) so you catch both a sudden cliff and a slow leak without flapping.
- **Golden Signals, USE, and RED** — Golden Signals are latency, traffic, errors, and saturation; latency must use percentiles (p95/p99), never the mean, because the mean hides the tail that hurts real users. USE checks utilization, saturation, and errors for resources; RED checks rate, errors, and duration for services. Saturation is a leading indicator: if CPU throttling or queue depth rises during a canary, abort before the error rate spikes — the saturation moved first.
- **Rollout strategies** — Blue-green swaps whole environments (instant cutover, instant rollback, double capacity cost). Canary shifts a small percentage of traffic and bakes while SLOs are watched (graceful, partial blast radius). Feature flags separate deploy from release (ship dark, enable for a cohort, kill instantly). A canary needs traffic weight, bake time, guardrail metrics, an automatic abort threshold, and a tested rollback path. Expand/contract handles schema/data changes that cannot move atomically: ship backward-compatible, dual-write/dual-read, migrate, then contract.
- **Kubernetes platform guardrails** — Readiness probes gate traffic (a bad one sends traffic to broken pods); liveness probes restart hung pods (a wrong one creates restart loops); startup probes protect slow boots. Requests drive scheduling (missing requests break the scheduler's bin-packing); limits cap usage (too-low limits cause CPU throttling and OOM kills). HPA scales on a signal (CPU plus a custom metric like queue depth). PDBs preserve capacity during voluntary disruption (no PDB lets a node drain drop you below quorum). IaC state must be locked and drift-detected.
- **CI/CD and secret hygiene** — A pipeline must control blast radius (who can deploy, to where, with what approval) and never hold long-lived static credentials. Replace static cloud keys with federated **OIDC**: CI exchanges its workload identity for a short-lived, scoped token that expires in minutes. Pin and verify build dependencies; isolate the deploy stage; require approval for production.
- **FinOps / cost discipline** — Cost maps to an owner, a service, a unit metric (cost per request / per tenant / per GB), and a right-sizing action. Right-size against **p99, not just p95**, because the p99 tail is what throttles at peak. Include **egress / data-transfer cost** — cross-AZ, cross-region, and internet egress often dominate a bill and are invisible in instance pricing. Use committed-use/reserved capacity only for steady, owner-approved baseline load.
- **Platform right-sizing** — Match the platform to the team and the workload, not to fashion. Kubernetes earns its operational tax at multi-service scale, with bin-packing needs and a team that can run it. For a one-service, two-engineer system, a managed PaaS or a container runtime delivers the same outcome with a fraction of the toil. Adding Kubernetes there is itself a reliability risk.

### Decision rules

1. Reliability is stated as a feeling → convert it to budget minutes with `(1 − SLO) × window` before anything else; 99.9%/30d = 43.2 min.
2. Define the SLI (good events / valid events) before writing an SLO; an SLO with no SLI is a wish, not a target.
3. Alert on symptoms and multi-window burn rate, not on raw cause; cause alerts fire on non-problems and miss novel failures.
4. A risky release requires a canary with traffic steps, bake time, guardrails (p99, error-burn, saturation, one business metric), an automatic abort threshold, and a tested rollback.
5. When data/schema must cut over atomically, do not canary; use expand/contract with backward-compatible schema and dual-write/dual-read.
6. Change capacity only on observed saturation/utilization evidence; tie each knob to the symptom it fixes.
7. Right-size against p99 (not just p95) and include egress/data-transfer cost; otherwise the bill and the throttling are both wrong.
8. Replace any long-lived static CI/cloud secret with OIDC short-lived scoped credentials; a static key in CI is a standing breach.
9. Right-size the platform to the team: do not run Kubernetes for a two-person, one-service system; choose managed PaaS until scale justifies the tax.
10. Run incidents blameless: severity by user impact, structure as timeline → contributing factors → controls, and ship at least one control change.
11. Treat IaC as the source of truth: review the plan, lock state, detect and reconcile drift, never hand-edit a managed resource.
12. Never treat green CI as verification; observe the live endpoint/metric in the running system before declaring the change done.
13. Eliminate or automate recurring toil instead of relabeling it as "runbook work"; track toil so it cannot grow unseen.
14. Gate irreversible/production changes (data-loss-capable migrations, secret rotation, prod cutover) behind explicit human approval with a stated rollback.

### Failure-repair playbook

1. **Reliability argued by feeling** → stop the debate; compute budget minutes and current burn rate, and let the number decide page vs ticket vs freeze.
2. **Alert uses raw error count** → convert it to burn rate against the SLO with a multi-window (fast page + slow ticket) policy.
3. **Canary watches only averages** → add p99 latency and saturation as guardrails; the mean hides the tail and the leading indicator.
4. **Release has no abort rule** → it is not a release plan yet; add the abort threshold and the tested rollback path before shipping.
5. **Capacity change with no evidence** → block it until an observed saturation/utilization signal (throttling, queue depth, OOM, p99 under load) justifies the resize.
6. **Cost cut against p95/averages** → re-run the right-sizing against p99 and add the egress/data-transfer line; attach an owner and a unit metric.
7. **Long-lived static secret in the pipeline** → rotate it now, then replace with OIDC short-lived credentials and scope the token to the one job.
8. **Kubernetes for a tiny team** → propose the right-sized managed PaaS path and quantify the operational tax being removed; migrate the service, not the resume.
9. **Postmortem names a person** → reframe to timeline → contributing factors → controls; replace "human error" with the missing guardrail.
10. **Cause-based alert storm** → delete cause alerts that are not actionable, keep symptom/burn-rate alerts, and route the rest to dashboards.
11. **IaC drift after a console hot-fix** → import or codify the change back into IaC, lock state, and add drift detection so the next apply is safe.
12. **"Done" on green CI** → before closing, hit the real endpoint / read the real metric in the running system; a passing pipeline is necessary, not sufficient.

### FinOps gate (cost discipline, done right)

When asked to cut cost or right-size: (1) attribute every cost line to an owner, a service, and a unit metric; (2) size compute and limits against the **p99** load profile, not p95/averages, so peak does not throttle; (3) add the **egress/data-transfer** line — cross-AZ, cross-region, and internet egress — which frequently dominates the bill and is invisible in instance pricing; (4) flag any saving that trades reliability (e.g. dropping replicas below the PDB floor) and require the budget owner to approve commitments. A saving with no owner, no unit metric, and no p99/egress check is not a FinOps result; it is a guess.

### Alerting: cause-based vs symptom/burn-rate

Alert on what the user feels (symptoms) and on how fast you are spending the error budget (burn rate), not on every underlying cause. Cause-based alerts (a single CPU spike, one disk filling, one node restarting) fire on conditions that are often not user-impacting, drown on-call in noise, and still miss failure modes nobody predicted. A multi-window burn-rate policy — a fast page for a sharp burn and a slower ticket for a slow leak — catches both the cliff and the drip while staying quiet during healthy operation. Keep cause signals on dashboards for diagnosis, not as pages.

**Multi-window burn-rate recipe (30-day SLO, copy-ready).** Each tier fires only when a long window *and* a shorter confirmation window are both burning above the threshold — the short window stops a recovered blip from paging, the long window stops flapping:

| Budget consumed | Long window | Short (confirm) window | Burn rate | Action |
|---|---|---|---|---|
| 2% | 1 hour | 5 min | 14.4× | **Page** — fast burn (the cliff) |
| 5% | 6 hours | 30 min | 6× | **Page** — medium burn |
| 10% | 3 days | 6 hours | 1× | **Ticket** — slow leak |

Burn rate = `budget-fraction-consumed ÷ (window ÷ SLO-period)`; e.g. 2% in 1h over a 720h month = `0.02 ÷ (1 ÷ 720)` = 14.4×. Scale the windows to the SLO period, not to wall-clock habit. Three well-separated tiers beat a dozen thresholds that all page.

### Publish / gate discipline: verify live, not green CI

Green CI proves that the tests which exist passed. It does not prove the change behaves correctly in the running system, because no test suite covers every path, config, or live dependency. Before calling a change done, observe it in the real system: hit the actual endpoint, read the actual metric, watch the SLI for the canary window. Treating green CI as "verified" is how a change that passed every test still breaks a path no test covered.

## Հայերեն

### Գործառնական սկզբունք

Ավագ DevOps, platform և SRE աշխատանքը decision-grade է միայն այն ժամանակ, երբ հուսալիությունը զգացմունքից վերածում է չափելի, ծախսելի budget-ի և ամեն պնդում զուգում է auditable mechanism-ի հետ։ Deliverable-ը չորս ձևից մեկն է՝ SLO/error-budget sheet, rollout/release plan, incident postmortem կամ հարթակի/capacity-cost review։ Չորսն էլ կառավարող միակ guardrail-ը error budget-ն է․ եթե budget-ի arithmetic-ը սխալ է, ապա ամեն հետընթաց առաջարկ՝ alert threshold, freeze որոշում, canary abort գիծ, սխալ է նրա հետ։ Ուստի առաջին քայլը միշտ budget-ը minute-ով հաշվելն է, հետո՝ դրանից բխեցնելը։ Հուսալիությունը ձախողման բացակայությունը չէ. այն ձախողում է՝ պահված հստակ, համաձայնեցված budget-ի ներսում, իսկ մնացած budget-ը գիտակցորեն ծախսված velocity-ի վրա։

### Մեխանիզմների տեղեկագիր

- **Error budget և burn rate** — Error budget-ը հուսալիությունը դարձնում է ծախսելի risk։ Budget = (1 − SLO) × window։ 99.9%-ի համար 30 օրում budget-ը 43,200 minute-ի 0.1%-ն է = **43.2 minute**։ Burn rate = observed error rate / allowed error rate։ **14.4× burn**-ը (1.44% error ընդդեմ 0.1% allowed-ի) մեկ ժամում սպառում է monthly budget-ի մոտ **2%-ը**. **6× burn**-ը վեց ժամում սպառում է մոտ **5%**։ Alert-ը պետք է զուգի fast page-ը (կարճ window, բարձր burn) և դանդաղ ticket-ը (երկար window, ցածր burn), որ բռնես և՛ կտրուկ անկումը, և՛ դանդաղ արտահոսքը՝ առանց flapping-ի։
- **Golden Signals, USE և RED** — Golden Signals-ն են latency, traffic, errors և saturation. latency-ն պետք է percentile-ով դիտվի (p95/p99), երբեք mean-ով, որովհետև mean-ը թաքցնում է այն tail-ը, որ ցավեցնում է իրական user-ին։ USE-ը resource-ի utilization/saturation/errors-ն է. RED-ը service-ի rate/errors/duration-ը։ Saturation-ը leading indicator է․ եթե canary-ի ժամանակ CPU throttling-ը կամ queue depth-ը բարձրանում է, abort արա նախքան error rate-ի spike-ը՝ saturation-ը շարժվեց առաջինը։
- **Rollout strategy-ներ** — Blue-green-ը փոխում է ամբողջ environment-ը (ակնթարթային cutover, ակնթարթային rollback, կրկնակի capacity ծախս)։ Canary-ն փոքր traffic percentage է տեղափոխում և bake է անում SLO-ի հսկողությամբ (graceful, մասնակի blast radius)։ Feature flag-ը deploy-ը բաժանում է release-ից (ship dark, enable cohort-ի համար, ակնթարթ kill)։ Canary-ին պետք է traffic weight, bake time, guardrail metric-ներ, automatic abort threshold և ստուգված rollback path։ Expand/contract-ը մշակում է schema/data փոփոխությունը, որ չի կարող atomic շարժվել՝ ship backward-compatible, dual-write/dual-read, migrate, հետո contract։
- **Kubernetes հարթակի guardrail-ներ** — Readiness probe-ը gate է անում traffic-ը (վատը traffic է ուղարկում broken pod-ին). liveness probe-ը restart է անում կախված pod-ը (սխալը restart loop է ստեղծում). startup probe-ը պաշտպանում է դանդաղ boot-ը։ Requests-ը driving է scheduling-ը (բացակայությունը կոտրում է scheduler-ի bin-packing-ը). limits-ը սահմանափակում է օգտագործումը (չափազանց ցածրը CPU throttling և OOM kill է բերում)։ HPA-ն scale է անում signal-ով (CPU plus custom metric, օրինակ՝ queue depth)։ PDB-ն պահպանում է capacity-ն voluntary disruption-ի ժամանակ (PDB-ի բացակայությունը node drain-ին թույլ է տալիս quorum-ից ներքև գցել)։ IaC state-ը պետք է lock և drift-detect լինի։
- **CI/CD և secret hygiene** — Pipeline-ը պետք է control անի blast radius-ը (ով կարող է deploy անել, ուր, ինչ approval-ով) և երբեք long-lived static credential չպահի։ Static cloud key-երը փոխարինիր federated **OIDC**-ով․ CI-ը իր workload identity-ն փոխանակում է short-lived, scoped token-ի, որ ժամկետանց է լինում րոպեների ընթացքում։ Pin և verify արա build dependency-ները. մեկուսացրու deploy stage-ը. production-ի համար պահանջիր approval։
- **FinOps / cost discipline** — Cost-ը կապվում է owner-ի, service-ի, unit metric-ի (cost per request / per tenant / per GB) և right-sizing action-ի հետ։ Right-size արա **p99-ի դեմ, ոչ միայն p95-ի**, որովհետև p99 tail-ն է, որ throttle է անում peak-ին։ Ներառիր **egress / data-transfer cost**-ը՝ cross-AZ, cross-region և internet egress, որ հաճախ գերակշռում է bill-ը և instance-ի գնում անտեսանելի է։ Committed-use/reserved capacity օգտագործիր միայն կայուն, owner-հաստատված baseline load-ի համար։
- **Platform right-sizing** — Հարթակը համապատասխանեցրու թիմին և workload-ին, ոչ նորաձևությանը։ Kubernetes-ը արդարացնում է իր operational tax-ը multi-service scale-ին, bin-packing-ի կարիքով և այն վարող թիմով։ Մեկ service-ի, երկու engineer-ի համակարգի համար managed PaaS-ը կամ container runtime-ը նույն արդյունքն է տալիս toil-ի փոքր մասով։ Այնտեղ Kubernetes ավելացնելն ինքնին հուսալիության risk է։

### Որոշման կանոններ

1. Հուսալիությունը զգացմունքով է ասված → ամեն ինչից առաջ վերածիր budget minute-ի՝ `(1 − SLO) × window`. 99.9%/30օր = 43.2 min։
2. Սահմանիր SLI-ն (good events / valid events) մինչև SLO գրելը. SLO առանց SLI-ի ցանկություն է, ոչ թիրախ։
3. Alert արա symptom-ի և multi-window burn rate-ի վրա, ոչ raw cause-ի. cause alert-ը կրակում է ոչ-խնդիրների վրա և բաց է թողնում նոր ձախողումները։
4. Risky release-ը պահանջում է canary՝ traffic step-երով, bake time-ով, guardrail-ներով (p99, error-burn, saturation, մեկ business metric), automatic abort threshold-ով և ստուգված rollback-ով։
5. Երբ data/schema-ն պետք է atomic cutover անի, canary մի՛ արա. օգտագործիր expand/contract՝ backward-compatible schema-ով և dual-write/dual-read-ով։
6. Capacity փոխիր միայն observed saturation/utilization evidence-ի վրա. ամեն knob կապիր այն symptom-ի հետ, որ ուղղում է։
7. Right-size արա p99-ի դեմ (ոչ միայն p95) և ներառիր egress/data-transfer cost-ը. այլապես bill-ն ու throttling-ը երկուսն էլ սխալ են։
8. Ցանկացած long-lived static CI/cloud secret փոխարինիր OIDC short-lived scoped credential-ով. CI-ում static key-ը մշտական breach է։
9. Right-size արա հարթակը թիմին․ Kubernetes մի՛ վարիր երկու հոգանոց, մեկ service-ի համակարգի համար. ընտրիր managed PaaS, մինչև scale-ը արդարացնի tax-ը։
10. Incident-ը վարիր blameless․ severity-ն ըստ user impact-ի, կառուցիր timeline → contributing factors → controls և բեր առնվազն մեկ control փոփոխություն։
11. IaC-ն համարիր source of truth․ ստուգիր plan-ը, lock արա state-ը, detect ու reconcile արա drift-ը, երբեք ձեռքով մի՛ խմբագրիր managed resource-ը։
12. Երբեք green CI-ն verification մի՛ համարիր. դիտիր live endpoint-ը/metric-ը running system-ում մինչև փոփոխությունը done հայտարարելը։
13. Կրկնվող toil-ը վերացրու կամ ավտոմատացրու, ոչ թե վերանվանիր «runbook work». հաշվառիր toil-ը, որ չմեծանա անտեսանելի։
14. Անդառնալի/production change-երը (data-loss-ունակ migration, secret rotation, prod cutover) gate արա հստակ մարդկային approval-ի և նշված rollback-ի հետևում։

### Վերականգնման խաղագիրք

1. **Հուսալիությունը վիճարկվում է զգացմունքով** → կանգնեցրու վեճը. հաշվիր budget minute-ը և current burn rate-ը, և թող թիվը որոշի page-ը, ticket-ը, թե freeze-ը։
2. **Alert-ը raw error count է** → վերածիր burn rate-ի SLO-ի դեմ՝ multi-window (fast page + slow ticket) policy-ով։
3. **Canary-ն միայն average է նայում** → ավելացրու p99 latency և saturation որպես guardrail. mean-ը թաքցնում է tail-ը և leading indicator-ը։
4. **Release-ը abort rule չունի** → այն դեռ release plan չէ. ավելացրու abort threshold-ը և ստուգված rollback path-ը մինչև ship-ը։
5. **Capacity change առանց evidence-ի** → block արա այն, մինչև observed saturation/utilization signal-ը (throttling, queue depth, OOM, p99 load-ի տակ) արդարացնի resize-ը։
6. **Cost cut p95/average-ի դեմ** → վերարա right-sizing-ը p99-ի դեմ և ավելացրու egress/data-transfer տողը. կցիր owner և unit metric։
7. **Long-lived static secret pipeline-ում** → rotate արա հիմա, հետո փոխարինիր OIDC short-lived credential-ով և scope արա token-ը մեկ job-ին։
8. **Kubernetes փոքր թիմի համար** → առաջարկիր right-sized managed PaaS-ի ճանապարհը և քանակացրու հանվող operational tax-ը. migrate արա service-ը, ոչ թե resume-ը։
9. **Postmortem-ը անուն է տալիս** → reframe արա timeline → contributing factors → controls-ի. «human error»-ը փոխարինիր բացակայող guardrail-ով։
10. **Cause-based alert-ի փոթորիկ** → ջնջիր ոչ-actionable cause alert-երը, պահիր symptom/burn-rate alert-երը, մնացածը ուղղորդիր dashboard։
11. **IaC drift console hot-fix-ից հետո** → import կամ codify արա փոփոխությունը հետ IaC, lock արա state-ը և ավելացրու drift detection, որ հաջորդ apply-ն ապահով լինի։
12. **«Done» green CI-ի վրա** → փակելուց առաջ դիպիր իրական endpoint-ին / կարդա իրական metric-ը running system-ում. անցնող pipeline-ը անհրաժեշտ է, ոչ բավարար։

### FinOps gate (cost discipline՝ ճիշտ արված)

Երբ խնդրում են cost կտրել կամ right-size անել․ (1) ամեն cost տող վերագրիր owner-ի, service-ի և unit metric-ի. (2) size արա compute-ը և limit-ները **p99** load profile-ի դեմ, ոչ p95/average-ի, որ peak-ը չ-throttle անի. (3) ավելացրու **egress/data-transfer** տողը՝ cross-AZ, cross-region և internet egress, որ հաճախ գերակշռում է bill-ը և instance-ի գնում անտեսանելի է. (4) flag արա ամեն խնայողություն, որ հուսալիություն է փոխանակում (օրինակ՝ replica-ները PDB floor-ից ներքև գցելը) և պահանջիր, որ budget owner-ը հաստատի commitment-ները։ Խնայողություն՝ առանց owner-ի, unit metric-ի և p99/egress ստուգման, FinOps արդյունք չէ. գուշակություն է։

### Alerting․ cause-based ընդդեմ symptom/burn-rate

Alert արա այն, ինչ user-ը զգում է (symptom) և այն, թե որքան արագ ես ծախսում error budget-ը (burn rate), ոչ ամեն հիմքում ընկած cause-ի։ Cause-based alert-երը (առանձին CPU spike, մեկ disk լցվող, մեկ node restart) կրակում են պայմանների վրա, որ հաճախ user-impacting չեն, խեղդում են on-call-ը աղմուկով և միևնույն է բաց են թողնում չկանխատեսված ձախողումները։ Multi-window burn-rate policy-ն՝ fast page սուր burn-ի համար և դանդաղ ticket դանդաղ արտահոսքի համար, բռնում է և՛ կտրուկ անկումը, և՛ կաթիլը՝ առողջ աշխատանքի ժամանակ լռելով։ Cause signal-ները պահիր dashboard-ում՝ diagnosis-ի համար, ոչ որպես page։

**Multi-window burn-rate recipe (30-օրյա SLO, copy-ready).** Ամեն tier կրակում է միայն, երբ երկար window-ը *և* ավելի կարճ confirmation window-ը երկուսն էլ burn են threshold-ից վեր — կարճ window-ը կանխում է վերականգնված blip-ի page-ը, երկար window-ը՝ flapping-ը․

| Ծախսված budget | Երկար window | Կարճ (confirm) window | Burn rate | Action |
|---|---|---|---|---|
| 2% | 1 ժամ | 5 min | 14.4× | **Page** — fast burn (կտրուկ անկում) |
| 5% | 6 ժամ | 30 min | 6× | **Page** — medium burn |
| 10% | 3 օր | 6 ժամ | 1× | **Ticket** — դանդաղ արտահոսք |

Burn rate = `ծախսված-budget-fraction ÷ (window ÷ SLO-period)`. օր.՝ 2% 1 ժամում 720-ժամյա ամսում = `0.02 ÷ (1 ÷ 720)` = 14.4×։ Window-ները scale արա SLO period-ին, ոչ wall-clock սովորությանը։ Երեք լավ-առանձնացված tier գերազանցում է տասնյակ threshold-ի, որ բոլորն էլ page են անում։

### Publish / gate discipline․ ստուգիր live, ոչ green CI

Green CI-ն ապացուցում է, որ եղած test-երն անցել են։ Չի ապացուցում, որ փոփոխությունը ճիշտ է վարվում running system-ում, որովհետև ոչ մի test suite չի ծածկում ամեն path, config կամ live dependency։ Փոփոխությունը done հայտարարելուց առաջ դիտիր այն իրական համակարգում․ դիպիր իրական endpoint-ին, կարդա իրական metric-ը, հետևիր SLI-ին canary window-ի ընթացքում։ Green CI-ն «verified» համարելն այն ճանապարհն է, որով ամեն test անցած փոփոխությունը միևնույն է կոտրում է path, որ ոչ մի test չի ծածկել։
