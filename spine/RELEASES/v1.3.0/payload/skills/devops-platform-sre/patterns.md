# DevOps, Platform, and SRE patterns

## English

These are canonical DevOps, Platform, and SRE moves. Each is a mechanism for one of the domain's four artifacts (SLO/error-budget sheet, rollout plan, incident postmortem, platform/capacity-cost review). Choose the move that changes the next decision, not the nicest label.

### 1. Error-budget burn sheet

- **Trigger:** A reliability debate is emotional, or an alert is firing on raw counts.
- **Mechanism:** Compute budget minutes `(1 − SLO) × window`, the current burn rate `observed/allowed`, and remaining budget. Set a multi-window alert policy (fast page for a sharp burn, slow ticket for a slow leak). Decide deliberately: page, ticket, freeze risky launches, or spend budget on velocity.
- **Do not use when:** No user-impacting SLO exists yet — define the SLI (good/valid events) first.
- **Failure repair:** If the alert uses a raw error count, convert it to a burn rate against the SLO before it ships.

### 2. Canary abort plan

- **Trigger:** A release is risky and a percentage of traffic can move ahead of the rest.
- **Mechanism:** Set traffic steps (e.g. 5% → 25% → 50%), a bake time per step, and guardrails — p99 latency, error-budget burn, saturation, and one business metric. Define the automatic abort threshold and the tested rollback command. Abort the moment a threshold is crossed; do not wait for a human.
- **Do not use when:** All users must move atomically for data/schema compatibility — use expand/contract instead.
- **Failure repair:** If the canary only watches averages, add p99 and saturation; the mean hides the tail and the leading indicator.

### 3. Kubernetes capacity review

- **Trigger:** Pods restart, throttle, get OOM-killed, or lose capacity during deploys or node drains.
- **Mechanism:** Walk readiness/liveness/startup probes, requests, limits, HPA target, PDB, node pressure, and rollout `maxUnavailable`. Tie each knob to its symptom: shallow readiness → traffic to broken pods; missing requests → broken scheduling; low limits → throttling/OOM; no PDB → capacity lost on drain.
- **Do not use when:** The symptom is an application-level deadlock — read logs and traces first; cluster knobs will not fix a code bug.
- **Failure repair:** If a change is proposed with no saturation/utilization evidence, block it until an observed signal justifies the resize.

### 4. CI/CD secret-hygiene gate (OIDC)

- **Trigger:** A pipeline holds a static cloud key, a deploy stage has broad standing access, or "rotate secrets into the repo for convenience" is proposed.
- **Mechanism:** Replace long-lived static credentials with federated **OIDC**: CI exchanges its workload identity for a short-lived, scoped token that expires in minutes. Isolate the deploy stage, gate production behind approval, scope the token to the one job, and pin/verify build dependencies. Audit who can deploy and to where.
- **Do not use when:** The environment genuinely cannot federate identity — then use a tightly scoped, frequently rotated secret in a managed secret store, never in repo or plain pipeline config, and document the exception.
- **Failure repair:** If a static key exists, rotate it now, then move to OIDC; treat any secret committed to the repo as compromised and rotate it regardless of cause.

### 5. Blameless postmortem map

- **Trigger:** An incident has been mitigated and a review is owed.
- **Mechanism:** Build a timeline (detection → diagnosis → mitigation → recovery), then a contributing-factors map (not a single root cause): what made it possible, what made it worse, what made detection slow, what made recovery slow. For each factor, ship a concrete control change (alert, guardrail, automation, runbook fix). Severity is set by user impact, never by who touched it last.
- **Do not use when:** The incident is still active — stabilize first; postmortem after recovery.
- **Failure repair:** If the "root cause" is a person's name or "human error," reframe it as the missing control or guardrail; a postmortem that blames a human and changes nothing will repeat.

### 6. Platform right-sizing decision

- **Trigger:** A team reaches for Kubernetes, a service mesh, or multi-cluster for a small workload, or the platform's operational tax is dwarfing what it runs.
- **Mechanism:** Match the platform to the team and workload. Score the workload (number of services, scale, bin-packing need) against the team's capacity to operate the platform. Default a one-service, small-team system to a managed PaaS or container runtime; reserve Kubernetes for multi-service scale that genuinely needs it. Quantify the operational tax (on-call, upgrades, control-plane) being added or removed.
- **Do not use when:** The org already runs a healthy fleet on Kubernetes and the new service fits the existing platform — adding it there is the right-sized choice, not overkill.
- **Failure repair:** If a tiny team is being handed a cluster, propose the managed path, migrate the service rather than the resume, and name the toil removed.

## Հայերեն

Սրանք canonical DevOps, Platform, and SRE move-եր են։ Ամեն մեկը mechanism է ոլորտի չորս artifact-ից մեկի համար (SLO/error-budget sheet, rollout plan, incident postmortem, հարթակի/capacity-cost review)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Error-budget burn sheet

- **Երբ է պետք․** Հուսալիության քննարկումը emotional է, կամ alert-ը raw count-ի վրա է կրակում։
- **Մեխանիզմը․** Հաշվիր budget minute-ը `(1 − SLO) × window`, current burn rate-ը `observed/allowed` և remaining budget-ը։ Սահմանիր multi-window alert policy (fast page՝ սուր burn-ի, slow ticket՝ դանդաղ արտահոսքի համար)։ Որոշիր գիտակցորեն՝ page, ticket, risky launch freeze, թե budget ծախսել velocity-ի վրա։
- **Երբ չօգտագործել․** Դեռ user-impacting SLO չկա — նախ սահմանիր SLI-ն (good/valid events)։
- **Ուղղում․** Եթե alert-ը raw error count է, ship-ից առաջ վերածիր burn rate-ի SLO-ի դեմ։

### 2. Canary abort plan

- **Երբ է պետք․** Release-ը risky է, և traffic-ի մի մասը կարող է մյուսներից առաջ շարժվել։
- **Մեխանիզմը․** Սահմանիր traffic step-եր (օր.՝ 5% → 25% → 50%), bake time յուրաքանչյուր step-ի համար և guardrail-ներ՝ p99 latency, error-budget burn, saturation և մեկ business metric։ Սահմանիր automatic abort threshold-ը և ստուգված rollback command-ը։ Abort արա threshold-ը անցնելու պահին, մարդու մի՛ սպասիր։
- **Երբ չօգտագործել․** Երբ բոլոր user-երը պետք է atomic շարժվեն data/schema compatibility-ի համար — փոխարենը օգտագործիր expand/contract։
- **Ուղղում․** Եթե canary-ն միայն average է նայում, ավելացրու p99 և saturation. mean-ը թաքցնում է tail-ը և leading indicator-ը։

### 3. Kubernetes capacity review

- **Երբ է պետք․** Pod-երը restart են լինում, throttle, OOM-kill, կամ deploy/node drain-ի ժամանակ capacity են կորցնում։
- **Մեխանիզմը․** Անցիր readiness/liveness/startup probe-երը, requests, limits, HPA target, PDB, node pressure և rollout `maxUnavailable`-ը։ Ամեն knob կապիր իր symptom-ի հետ․ shallow readiness → traffic broken pod-ին. missing requests → կոտրված scheduling. ցածր limits → throttling/OOM. PDB չկա → capacity կորած drain-ին։
- **Երբ չօգտագործել․** Երբ symptom-ը application-level deadlock է — նախ կարդա log-երը և trace-երը. cluster knob-ը code bug չի ուղղի։
- **Ուղղում․** Եթե փոփոխություն է առաջարկվում առանց saturation/utilization evidence-ի, block արա այն, մինչև observed signal-ը արդարացնի resize-ը։

### 4. CI/CD secret-hygiene gate (OIDC)

- **Երբ է պետք․** Pipeline-ը static cloud key է պահում, deploy stage-ը լայն standing access ունի, կամ առաջարկվում է «convenience-ի համար secret-ները repo-ում rotate անել»։
- **Մեխանիզմը․** Long-lived static credential-ները փոխարինիր federated **OIDC**-ով․ CI-ը workload identity-ն փոխանակում է short-lived, scoped token-ի, որ ժամկետանց է րոպեների ընթացքում։ Մեկուսացրու deploy stage-ը, gate արա production-ը approval-ի հետևում, scope արա token-ը մեկ job-ին, և pin/verify արա build dependency-ները։ Audit արա, ով կարող է deploy անել և ուր։
- **Երբ չօգտագործել․** Երբ environment-ը իսկապես չի կարող federate անել identity — ապա օգտագործիր խստորեն scoped, հաճախ rotate-վող secret managed secret store-ում, երբեք repo-ում կամ բացահայտ pipeline config-ում, և փաստաթղթավորիր բացառությունը։
- **Ուղղում․** Եթե static key կա, rotate արա հիմա, հետո անցիր OIDC-ի. ցանկացած repo-ում commit-ված secret համարիր compromised և rotate արա անկախ պատճառից։

### 5. Blameless postmortem map

- **Երբ է պետք․** Incident-ը mitigate-վել է, և review է պարտք։
- **Մեխանիզմը․** Կառուցիր timeline (detection → diagnosis → mitigation → recovery), հետո contributing-factors քարտեզ (ոչ թե մեկ root cause)․ ինչը հնարավոր դարձրեց, ինչը վատացրեց, ինչը դանդաղեցրեց detection-ը, ինչը դանդաղեցրեց recovery-ն։ Ամեն factor-ի համար ship արա կոնկրետ control փոփոխություն (alert, guardrail, ավտոմատացում, runbook fix)։ Severity-ն սահմանվում է user impact-ով, երբեք ոչ նրանով, ով վերջն է դիպել։
- **Երբ չօգտագործել․** Երբ incident-ը դեռ active է — նախ stabilize արա. postmortem-ը recovery-ից հետո է։
- **Ուղղում․** Եթե «root cause»-ը մարդու անուն է կամ «human error», reframe արա այն որպես բացակայող control կամ guardrail. postmortem, որ մարդ է մեղադրում և ոչինչ չի փոխում, կկրկնվի։

### 6. Platform right-sizing decision

- **Երբ է պետք․** Թիմը ձեռք է մեկնում Kubernetes-ին, service mesh-ին կամ multi-cluster-ին փոքր workload-ի համար, կամ հարթակի operational tax-ը գերազանցում է իր վարածին։
- **Մեխանիզմը․** Համապատասխանեցրու հարթակը թիմին և workload-ին։ Գնահատիր workload-ը (service-ների քանակ, scale, bin-packing-ի կարիք) թիմի՝ հարթակը վարելու կարողության դեմ։ Մեկ service-ի, փոքր թիմի համակարգը լռելյայն ուղղիր managed PaaS-ի կամ container runtime-ի. Kubernetes-ը պահիր multi-service scale-ի համար, որ իսկապես կարիք ունի դրա։ Քանակացրու ավելացվող կամ հանվող operational tax-ը (on-call, upgrade, control-plane)։
- **Երբ չօգտագործել․** Երբ org-ն արդեն առողջ fleet է վարում Kubernetes-ի վրա, և նոր service-ը տեղավորվում է եղած հարթակում — այնտեղ ավելացնելը right-sized ընտրություն է, ոչ overkill։
- **Ուղղում․** Եթե փոքր թիմին cluster են հանձնում, առաջարկիր managed ճանապարհը, migrate արա service-ը, ոչ թե resume-ը, և անվանի՛ր հանվող toil-ը։
