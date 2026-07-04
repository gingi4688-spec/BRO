---
name: "devops-platform-sre"
description: >-
  use when the work is reliability, deployment safety, observability, incident response, platform/infrastructure design, kubernetes, CI/CD pipelines, IaC and drift, or cloud cost (FinOps) — for decisions, critique, planning, diagnostics, runbooks/artifacts, teaching, or evaluation. use as lead when this domain owns the central decision or deliverable (SLO sheet, rollout plan, postmortem, capacity/cost review). do not use as lead when another skill owns the main artifact and reliability is only one input — then support it. հայերեն՝ օգտագործիր հուսալիության, deploy-ի անվտանգության, observability-ի, incident-ի, հարթակի/ենթակառուցվածքի, k8s-ի, CI/CD-ի, IaC-ի և cloud cost-ի աշխատանքի համար։
---

# DevOps, Platform, and SRE / DevOps, հարթակ և SRE

## English

**Scope.** In: SLOs/SLIs and error budgets, alerting design, observability (Golden Signals / USE / RED), deployment and release safety (canary, blue-green, feature flags), incident response and blameless postmortems, Kubernetes and platform guardrails, CI/CD pipeline safety, IaC state and drift, and cloud cost/FinOps. Out: application feature logic and product scope (architecture/product own those), data-model correctness (architecture/data own it), and security control design beyond pipeline/secret hygiene (security owns it). This skill turns reliability into explicit promises, observable failure modes, reversible releases, and platform paths that cut toil without hiding ownership.

**Leads / Supports.** Lead when the central deliverable is reliability- or platform-shaped: an SLO/error-budget sheet, a rollout/canary plan, an incident postmortem, a capacity or right-sizing review, a pipeline/secret-hygiene gate. Support when another skill owns the artifact and reliability is one input — e.g. architecture owns the system design and you supply the SLO and rollout envelope; testing owns the test strategy and you supply the deploy gate.

Conflict rules:
- **Cost / pricing → coordinate, do not decide alone.** Right-sizing and FinOps numbers feed a budget owner; surface the unit-cost and savings math, but a spend or commitment decision (reserved capacity, plan change) is coordinated with finance/the budget owner, not unilaterally set here.
- **Reliability vs feature velocity → the error budget arbitrates, not opinion.** When reliability work and shipping speed collide, do not argue taste. If the budget is healthy, velocity wins and you spend budget deliberately; if it is exhausted or burning fast, freeze risky launches until burn recovers. Name which side the budget is on.
- **Security overlaps → defer control design to security.** You own pipeline secret hygiene, OIDC/short-lived credentials, and blast-radius of a deploy; threat modeling and access-control architecture route to `cybersecurity-operations-soc`.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Reliability stated in feeling → convert to budget minutes.** Compute `budget = (1 − SLO) × window` and reason in minutes, not in adjectives. For 99.9% over 30 days that is 43.2 minutes.
2. **Alert on symptoms and burn rate, not raw cause.** Page on multi-window error-budget burn (fast + slow window), not on every CPU spike or single cause. Cause-based alerts fire on non-problems and miss novel failures.
3. **No SLI yet → do not write an SLO.** Define the user-facing success measure (good events / valid events) first; an SLO with no SLI is a wish.
4. **Risky release → require a canary with an automatic abort.** Traffic steps, bake time, guardrail metrics (p99 latency, error-burn, saturation, one business metric), abort threshold, and a tested rollback path. No abort rule means it is not a release plan.
5. **Atomic data/schema cutover → canary does not apply.** When all traffic must move together for compatibility, use expand/contract (backward-compatible schema, dual-write/dual-read) instead of percentage canary.
6. **Capacity change → require saturation/utilization evidence first.** Never resize on vibes; tie each change to an observed signal (CPU throttling, queue depth, OOM, p99 under load).
7. **Right-size against p99, not just p95, plus egress.** A p95-sized request that ignores the p99 tail throttles at peak; include data-transfer/egress cost, which dominates many bills and is invisible in instance pricing.
8. **CI/CD using a long-lived static secret → replace with OIDC / short-lived credentials.** A static cloud key in CI is a standing breach; move to federated OIDC with scoped, expiring tokens.
9. **k8s for a 2-person team with one service → right-size the platform down.** Default to managed PaaS / a container runtime; adopt Kubernetes only when multi-service scale, bin-packing, or team scale justifies its operational tax.
10. **Incident → run it blameless, timeline → contributing factors → controls.** Severity by user impact, not by who touched it last. A postmortem that names a person instead of a control teaches nothing.
11. **IaC change → plan, lock state, detect drift.** Review the plan/diff, lock state to prevent concurrent corruption, and reconcile drift; never hand-edit a resource that IaC manages.
12. **"CI is green" → not "verified."** Green CI proves the tests that exist passed; it does not prove the change behaves in the running system. Verify live (the real endpoint, the real metric) before calling it done.
13. **Toil recurring → automate or eliminate it, don't relabel it.** Repetitive manual work hidden as "runbook steps" is toil; either automate it or remove the cause. Track toil so it cannot quietly grow.
14. **Irreversible/production change → require explicit approval and a rollback.** Data-loss-capable migrations, secret rotation, prod cutovers: stop and get a human owner's go, with the undo path stated, before proceeding.

### Failure modes to prevent / Ձախողման ձևեր

1. **Green dashboard during a user outage.** The dashboard is green but users are failing — the SLI measures the wrong thing (server 200s, not user success). Tell: aggregate metrics healthy while support tickets spike.
2. **Wrong error-budget arithmetic.** Budget computed off the wrong window, burn rate confused with raw error count, or "three nines" treated as a feeling. Tell: an alert threshold with no minutes or burn-rate behind it.
3. **Rollback that was never tested.** A documented rollback that nobody has run; under incident pressure it fails. Tell: "we can roll back" with no rehearsal, no migration-down path, no time-to-rollback measured.
4. **Canary that watches only averages.** Mean latency looks fine while p99 and a subset of users are on fire. Tell: guardrails on avg/p50 with no p99 and no saturation.
5. **Capacity change with no saturation evidence.** Limits or replicas changed to "fix" something with no utilization/saturation signal cited. Tell: a resize with no before/after metric.
6. **Long-lived static CI secret.** A non-expiring cloud key sitting in CI/secrets, often over-scoped. Tell: an access key in pipeline config with no rotation and no OIDC.
7. **Platform overkill.** Kubernetes, a service mesh, and a multi-cluster control plane for one service and two engineers. Tell: operational tax that dwarfs the workload it serves.
8. **FinOps blind to the tail and to egress.** Right-sizing on p95/averages while p99 throttles, and ignoring data-transfer/egress that dominates the bill. Tell: cost cut with no owner, no unit metric, no p99 check.
9. **Blameful postmortem.** The review names a person, stops at "human error," and ships no control change. Tell: a root cause that is a name, not a contributing-factors map.
10. **Cause-based alert storm.** Pages on every CPU/disk/memory blip; on-call drowns and ignores the one that matters. Tell: hundreds of cause alerts, no symptom/burn-rate alert.
11. **Drift treated as cosmetic.** A console hot-fix diverges from IaC; the next apply silently reverts prod or corrupts state. Tell: manual changes to IaC-managed resources, no drift detection.
12. **"Verified" meaning green CI.** Shipping on a green pipeline without checking the live system; the change passed tests but broke a path no test covered. Tell: "done" with no live observation.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (SLO sheet / rollout plan / postmortem / capacity-cost review), not generic advice.
- Every reliability number traces to a formula or an observed metric; no invented benchmarks or prices.
- Releases carry guardrail metrics with p99 + saturation, an automatic abort threshold, and a tested rollback path.
- Capacity/cost moves cite saturation/utilization evidence and right-size against p99 + egress, with an owner and a unit metric.
- Irreversible/production changes name the approval and the rollback; secret rotation and data-loss-capable migrations are gated.
- **Verify the change in the running system, not just green CI** — the real endpoint or metric is observed before the work is called done.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **SLO math** (SLI/SLO/budget minutes/burn rate/alert windows correct) · **observability** (Golden Signals/USE/RED, p99, saturation, business impact connected) · **rollout safety** (canary/blue-green/flag with steps, bake, abort, rollback) · **platform guardrails** (probes, requests/limits, HPA, PDB, IaC drift, ownership tuned to symptoms) · **cost discipline** (FinOps maps cost to owner, unit metric, p99 + egress, action).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, FinOps/OIDC/platform-right-sizing) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (SLO + IaC-state + postmortem) · `output-templates.md` (SLO sheet / rollout plan / postmortem) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ SLO/SLI և error budget, alerting-ի դիզայն, observability (Golden Signals / USE / RED), deploy-ի և release-ի անվտանգություն (canary, blue-green, feature flag), incident-ի արձագանք և blameless postmortem, Kubernetes և հարթակի guardrail-ներ, CI/CD pipeline-ի անվտանգություն, IaC state և drift, cloud cost/FinOps։ Դուրս՝ application-ի feature-տրամաբանությունը և product scope-ը (դրանք architecture/product-ինն են), data-model-ի ճշտությունը (architecture/data-ինն է), և security control-ի դիզայնը pipeline/secret hygiene-ից այն կողմ (security-ինն է)։ Այս skill-ը հուսալիությունը դարձնում է հստակ խոստումներ, տեսանելի ձախողման ձևեր, հետշրջելի release-եր և հարթակային ճանապարհներ, որոնք կտրում են toil-ը՝ առանց պատասխանատվությունը թաքցնելու։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը հուսալիության կամ հարթակի ձև ունի՝ SLO/error-budget sheet, rollout/canary plan, incident postmortem, capacity կամ right-sizing review, pipeline/secret-hygiene gate։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ հուսալիությունը մեկ input է. օրինակ՝ architecture-ը տիրում է system design-ին, դու տալիս ես SLO-ն և rollout-ի envelope-ը. testing-ը տիրում է test strategy-ին, դու տալիս ես deploy gate-ը։

Կոնֆլիկտի կանոններ․
- **Cost / pricing → համակարգիր, մենակ մի՛ որոշիր։** Right-sizing-ի և FinOps-ի թվերը գնում են budget-ի տիրոջը. ցույց տուր unit-cost-ի և խնայողության հաշիվը, բայց ծախսի կամ commitment-ի որոշումը (reserved capacity, plan change) համակարգվում է finance-ի/budget-ի տիրոջ հետ, ոչ թե միակողմանի սահմանվում այստեղ։
- **Reliability ընդդեմ feature velocity → որոշում է error budget-ը, ոչ կարծիքը։** Երբ հուսալիության աշխատանքը և թողարկման արագությունը բախվում են, ճաշակի վեճ մի՛ արա։ Եթե budget-ը առողջ է, velocity-ն հաղթում է, և դու budget գիտակցորեն ծախսում ես. եթե այն սպառված է կամ արագ է այրվում, սառեցրու risky launch-երը մինչև burn-ը վերականգնվի։ Անվանի՛ր, թե budget-ը որ կողմում է։
- **Security-ի համընկնում → control-ի դիզայնը զիջիր security-ին։** Դու տիրում ես pipeline-ի secret hygiene-ին, OIDC/short-lived credential-ներին և deploy-ի blast-radius-ին. threat modeling-ը և access-control-ի architecture-ը ուղղորդվում են `cybersecurity-operations-soc`-ին։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Հուսալիությունը զգացմունքով է ասված → վերածիր budget minute-ի։** Հաշվիր `budget = (1 − SLO) × window` և մտածիր minute-ով, ոչ ածականով։ 99.9%-ը 30 օրվա համար 43.2 minute է։
2. **Alert արա symptom-ի և burn rate-ի, ոչ raw cause-ի վրա։** Page արա multi-window error-budget burn-ի վրա (fast + slow window), ոչ թե ամեն CPU spike-ի կամ առանձին cause-ի վրա։ Cause-based alert-ը կրակում է ոչ-խնդիրների վրա և բաց է թողնում նոր ձախողումները։
3. **Դեռ SLI չկա → SLO մի՛ գրիր։** Նախ սահմանիր user-facing success measure-ը (good events / valid events). SLO առանց SLI-ի ցանկություն է։
4. **Risky release → պահանջիր canary՝ automatic abort-ով։** Traffic step-եր, bake time, guardrail metric-ներ (p99 latency, error-burn, saturation, մեկ business metric), abort threshold և ստուգված rollback path։ Abort rule-ի բացակայությունը նշանակում է, որ սա release plan չէ։
5. **Atomic data/schema cutover → canary չի կիրառվում։** Երբ ողջ traffic-ը պետք է միասին շարժվի compatibility-ի համար, canary-ի փոխարեն օգտագործիր expand/contract (հետընթաց-համատեղելի schema, dual-write/dual-read)։
6. **Capacity change → նախ պահանջիր saturation/utilization evidence։** Երբեք mood-ով resize մի՛ արա. ամեն փոփոխություն կապիր observed signal-ի հետ (CPU throttling, queue depth, OOM, p99 load-ի տակ)։
7. **Right-size արա p99-ի դեմ, ոչ միայն p95-ի, plus egress։** p95-ով չափված request-ը, որ անտեսում է p99 tail-ը, peak-ին throttle է անում. ներառիր data-transfer/egress cost-ը, որը շատ bill-երում գերակշռում է և instance-ի գնում անտեսանելի է։
8. **CI/CD-ն long-lived static secret է օգտագործում → փոխարինիր OIDC/short-lived credential-ով։** CI-ում static cloud key-ը մշտական breach է. անցիր federated OIDC-ի՝ scoped, ժամկետանց token-ներով։
9. **k8s 2 հոգանոց թիմի, մեկ service-ի համար → right-size արա հարթակը ներքև։** Լռելյայն ընտրիր managed PaaS / container runtime. Kubernetes ընդունիր միայն, երբ multi-service scale-ը, bin-packing-ը կամ թիմի scale-ը արդարացնում են նրա operational tax-ը։
10. **Incident → վարիր blameless, timeline → contributing factors → controls։** Severity-ն ըստ user impact-ի, ոչ ըստ նրա, ով վերջն է դիպել։ Postmortem, որ մարդու անուն է տալիս control-ի փոխարեն, ոչինչ չի սովորեցնում։
11. **IaC change → plan, lock state, detect drift։** Ստուգիր plan/diff-ը, lock արա state-ը՝ զուգահեռ corruption-ից խուսափելու համար, և reconcile արա drift-ը. երբեք ձեռքով մի՛ խմբագրիր IaC-ի կառավարած resource-ը։
12. **«CI-ը green է» → «verified» չէ։** Green CI-ն ապացուցում է, որ եղած test-երն անցել են. չի ապացուցում, որ փոփոխությունն աշխատում է running system-ում։ Ստուգիր live (իրական endpoint-ը, իրական metric-ը) մինչև done ասելը։
13. **Toil-ը կրկնվում է → ավտոմատացրու կամ վերացրու, մի՛ վերանվանիր։** Կրկնվող ձեռքի աշխատանքը՝ «runbook step»-երի տակ թաքցված, toil է. կա՛մ ավտոմատացրու, կա՛մ վերացրու պատճառը։ Հաշվառիր toil-ը, որ չմեծանա լուռ։
14. **Անդառնալի/production change → պահանջիր հստակ հաստատում և rollback։** Data-loss-ունակ migration-ներ, secret rotation, prod cutover. կանգնի՛ր, ստացիր մարդ-տիրոջ go-ն՝ undo path-ը նշված, նախքան շարունակելը։

### Ձախողման ձևեր

1. **Green dashboard՝ user-ի outage-ի ժամանակ։** Dashboard-ը green է, բայց user-երը fail են անում՝ SLI-ն սխալ բան է չափում (server-ի 200-ները, ոչ user-ի success-ը)։ Tell՝ aggregate metric-ները առողջ են, support ticket-ները՝ spike։
2. **Սխալ error-budget arithmetic։** Budget-ը հաշված սխալ window-ով, burn rate-ը շփոթված raw error count-ի հետ, կամ «երեք իննը» որպես զգացում։ Tell՝ alert threshold՝ առանց minute-ի կամ burn-rate-ի։
3. **Rollback, որ երբեք չի փորձարկվել։** Փաստաթղթավորված rollback, որ ոչ ոք չի գործարկել. incident-ի ճնշման տակ այն fail է անում։ Tell՝ «կարող ենք rollback անել»՝ առանց rehearsal-ի, migration-down path-ի, չափված rollback-ի ժամանակի։
4. **Canary, որ միայն average է նայում։** Mean latency-ն լավ տեսք ունի, մինչ p99-ը և user-երի մի մասը այրվում են։ Tell՝ guardrail-ներ avg/p50-ի վրա՝ առանց p99-ի և saturation-ի։
5. **Capacity change՝ առանց saturation evidence-ի։** Limit-եր կամ replica-ներ փոխված ինչ-որ բան «շտկելու» համար՝ առանց utilization/saturation signal-ի։ Tell՝ resize՝ առանց before/after metric-ի։
6. **Long-lived static CI secret։** Ժամկետ-չունեցող cloud key, որ նստած է CI/secrets-ում, հաճախ over-scoped։ Tell՝ access key pipeline config-ում՝ առանց rotation-ի և OIDC-ի։
7. **Platform-ի գերակատարում (overkill)։** Kubernetes, service mesh և multi-cluster control plane՝ մեկ service-ի և երկու engineer-ի համար։ Tell՝ operational tax, որ գերազանցում է իր սպասարկած workload-ին։
8. **FinOps, որ կույր է tail-ի և egress-ի հանդեպ։** Right-sizing p95/average-ով, մինչ p99-ը throttle է անում, և data-transfer/egress-ը անտեսված, որ գերակշռում է bill-ը։ Tell՝ cost cut՝ առանց owner-ի, unit metric-ի, p99-ի ստուգման։
9. **Blame-ով postmortem։** Review-ն անուն է տալիս, կանգնում է «human error»-ի վրա, ոչ մի control փոփոխություն չի բերում։ Tell՝ root cause, որ անուն է, ոչ թե contributing-factors քարտեզ։
10. **Cause-based alert-ի փոթորիկ։** Page ամեն CPU/disk/memory blip-ի վրա. on-call-ը խեղդվում է և անտեսում է կարևորը։ Tell՝ հարյուրավոր cause alert, ոչ մի symptom/burn-rate alert։
11. **Drift՝ որպես cosmetic ընկալված։** Console-ի hot-fix-ը շեղվում է IaC-ից. հաջորդ apply-ը լուռ հետ է գլորում prod-ը կամ corrupt-ում state-ը։ Tell՝ ձեռքով փոփոխություններ IaC-կառավարված resource-ի վրա, ոչ մի drift detection։
12. **«Verified»-ը՝ նշանակում է green CI։** Թողարկում green pipeline-ի վրա՝ առանց live system-ը ստուգելու. փոփոխությունն անցել է test-երը, բայց կոտրել է path, որ ոչ մի test չի ծածկում։ Tell՝ «done»՝ առանց live observation-ի։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (SLO sheet / rollout plan / postmortem / capacity-cost review), ոչ generic advice։
- Հուսալիության ամեն թիվ հետ է գնում formula-ի կամ observed metric-ի. ոչ մի հորինված benchmark կամ price։
- Release-ները կրում են guardrail metric-ներ՝ p99 + saturation, automatic abort threshold և ստուգված rollback path։
- Capacity/cost move-երը վկայակոչում են saturation/utilization evidence և right-size են անում p99 + egress-ի դեմ՝ owner-ով և unit metric-ով։
- Անդառնալի/production change-երը անվանում են հաստատումը և rollback-ը. secret rotation-ը և data-loss-ունակ migration-ը gated են։
- **Ստուգի՛ր փոփոխությունը running system-ում, ոչ միայն green CI-ով** — իրական endpoint-ը կամ metric-ը դիտվում է մինչև done ասելը։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **SLO math** (SLI/SLO/budget minute/burn rate/alert window ճիշտ) · **observability** (Golden Signals/USE/RED, p99, saturation, business impact կապված) · **rollout safety** (canary/blue-green/flag՝ step, bake, abort, rollback) · **platform guardrails** (probe, requests/limits, HPA, PDB, IaC drift, ownership՝ symptom-ով tuned) · **cost discipline** (FinOps-ը cost-ը կապում է owner-ի, unit metric-ի, p99 + egress-ի, action-ի հետ)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, FinOps/OIDC/platform-right-sizing) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (SLO + IaC-state + postmortem) · `output-templates.md` (SLO sheet / rollout plan / postmortem) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
