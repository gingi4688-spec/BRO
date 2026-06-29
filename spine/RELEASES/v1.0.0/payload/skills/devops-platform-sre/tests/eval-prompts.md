# DevOps, Platform, and SRE eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **SLO + burn-rate alerting.** "Design alerting for a 99.9%/30d service." — Pass only if budget = 43.2 min is computed from `(1 − SLO) × window`, burn rate = `observed/allowed`, and the alert is a multi-window burn-rate policy (fast page + slow ticket), not a raw-count alarm.
2. **Canary abort.** "Roll out a risky change safely." — Pass only if it gives traffic steps, bake time, guardrails including **p99 and saturation** (not just averages), an **automatic abort threshold**, and a **rehearsed rollback** path.
3. **Kubernetes capacity.** "Pods are throttling and restarting during deploys." — Pass only if it ties readiness/liveness/startup probes, requests, limits, HPA, and PDB each to a specific symptom, and does not change capacity without evidence.
4. **FinOps right-sizing.** "Our cloud bill is too high; cut it." — Pass only if it right-sizes against **p99 (not just p95)**, explicitly includes **egress/data-transfer cost**, and attaches an owner + unit metric. Fail if it sizes on averages or ignores egress.
5. **CI secret hygiene.** "Our pipeline uses a long-lived AWS access key. Is that fine?" — Pass only if it flags the static key as a standing breach and prescribes **OIDC / short-lived scoped credentials**; fail if it just says "store it in a secret manager" and stops.
6. **Platform overkill.** "Two of us, one service — should we run Kubernetes?" — Pass only if it right-sizes the platform **down** to managed PaaS / a container runtime and names the operational tax avoided; fail if it sets up a cluster by default.
7. **Publish / gate discipline.** "CI is green — are we done?" — Pass only if it says green CI is necessary but not sufficient and requires observing the **live endpoint/metric** in the running system before declaring done.
8. **IaC state / drift.** "Someone hot-fixed prod in the console; we use Terraform. Now what?" — Pass only if it names **drift**, reconciles via plan → codify/import → plan-shows-no-changes, **locks state**, and adds **drift detection**.
9. **Blameless postmortem.** "Write the postmortem for a 38-min outage caused by a bad config push." — Pass only if severity is by user impact, structure is timeline → contributing factors → controls, **no individual is named as the cause**, and each factor ships a control.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same numbers, same mechanism, same artifact), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for a specific instance price or a named benchmark. — Pass only if it refuses to invent it or marks it verify-before-use with a formula/placeholder.
- **No thin framework-name answer.** Ask "just tell me the SRE best practices." — Pass only if it expands into mechanism, formula, or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **SLO + burn-rate alerting.** «Նախագծիր alerting 99.9%/30օր service-ի համար»։ — Անցնում է միայն, եթե budget = 43.2 min հաշված է `(1 − SLO) × window`-ից, burn rate = `observed/allowed`, և alert-ը multi-window burn-rate policy է (fast page + slow ticket), ոչ raw-count alarm։
2. **Canary abort.** «Roll out արա risky change-ը անվտանգ»։ — Անցնում է միայն, եթե կան traffic step-եր, bake time, guardrail-ներ՝ ներառյալ **p99 և saturation** (ոչ միայն average), **automatic abort threshold** և **rehearsed rollback** path։
3. **Kubernetes capacity.** «Pod-երը throttle և restart են լինում deploy-ի ժամանակ»։ — Անցնում է միայն, եթե readiness/liveness/startup probe-երը, requests, limits, HPA և PDB-ն ամեն մեկը կապված է կոնկրետ symptom-ի հետ, և capacity-ն չի փոխվում առանց evidence-ի։
4. **FinOps right-sizing.** «Cloud bill-ը շատ բարձր է. կտրիր»։ — Անցնում է միայն, եթե right-size է անում **p99-ի դեմ (ոչ միայն p95)**, բացահայտ ներառում է **egress/data-transfer cost**-ը և կցում owner + unit metric։ Fail՝ եթե average-ով է size անում կամ egress-ը անտեսում։
5. **CI secret hygiene.** «Pipeline-ը long-lived AWS access key է օգտագործում։ Նորմա՞լ է»։ — Անցնում է միայն, եթե flag է անում static key-ը որպես standing breach և նշանակում **OIDC / short-lived scoped credential**. fail՝ եթե միայն ասում է «secret manager-ում պահիր» և կանգնում։
6. **Platform overkill.** «Երկու հոգի ենք, մեկ service — Kubernetes վարե՞նք»։ — Անցնում է միայն, եթե right-size է անում հարթակը **ներքև**՝ managed PaaS / container runtime, և անվանում է խուսափած operational tax-ը. fail՝ եթե լռելյայն cluster է կանգնեցնում։
7. **Publish / gate discipline.** «CI-ը green է — done ե՞նք»։ — Անցնում է միայն, եթե ասում է, որ green CI-ն անհրաժեշտ է, բայց ոչ բավարար, և պահանջում է **live endpoint/metric** դիտել running system-ում մինչև done հայտարարելը։
8. **IaC state / drift.** «Ինչ-որ մեկը prod-ը console-ում hot-fix արեց. Terraform ենք օգտագործում։ Հիմա ի՞նչ»։ — Անցնում է միայն, եթե անվանում է **drift**-ը, reconcile է անում plan → codify/import → plan-ցույց-է-տալիս-no-changes, **lock է անում state**-ը և ավելացնում **drift detection**։
9. **Blameless postmortem.** «Գրիր postmortem 38-րոպեանոց outage-ի համար՝ վատ config push-ից»։ — Անցնում է միայն, եթե severity-ն user impact-ով է, կառուցվածքը՝ timeline → contributing factors → controls, **ոչ մի անհատ չի անվանվում որպես cause**, և ամեն factor ship է անում control։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն թվերը, նույն mechanism-ը, նույն artifact-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու կոնկրետ instance price կամ named benchmark։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց կամ նշում է verify-before-use՝ formula/placeholder-ով։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես ասա SRE best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, formula կամ worked micro-example, ոչ label-ների ցուցակ։
