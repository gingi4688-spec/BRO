# DevOps, Platform, and SRE red-team gate

## English

This gate extends the skill's final gate for the four artifacts (SLO/error-budget sheet, rollout plan, incident postmortem, platform/capacity-cost review). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Wrong error-budget arithmetic** — budget off the wrong window, burn rate confused with raw error count, or "nines" treated as a feeling. Recompute `(1 − SLO) × window` and `observed/allowed`.
- **Rollout with no abort or untested rollback** — do not approve a release without guardrails, an automatic abort threshold, and a rollback that has actually been run.
- **Capacity change with no saturation/utilization evidence** — do not recommend resizing on vibes; require an observed signal.
- **Green CI treated as verification** — do not let "the pipeline is green" stand in for observing the change in the running system; require a live check.
- **Long-lived static CI secret** — do not approve a pipeline holding a non-expiring cloud key; require OIDC / short-lived scoped credentials.
- **Platform overkill** — do not approve Kubernetes/mesh/multi-cluster for a tiny team and one service; require a right-sizing comparison against managed PaaS.
- **Cause-based alert spam** — do not approve paging on every CPU/disk blip; require symptom/burn-rate alerting with cause signals on dashboards.
- **Right-sizing against p95/averages only** — do not approve a cost cut that ignores the p99 tail and egress/data-transfer cost.
- **Blameful postmortem** — do not approve a review whose "root cause" is a person's name or "human error" with no control change.

### Reviewer probes (ask these of any answer)

- Show the budget math: what is `(1 − SLO) × window` in minutes, and what is `observed/allowed`? If they cannot be shown, the SLO is decorative.
- Is the alert a multi-window burn-rate policy, or is it paging on a raw count / a single cause? Where do cause signals live — page or dashboard?
- Does the rollout have p99 and saturation (not just the mean), an automatic abort, and a rollback that was rehearsed? What happens if the schema is involved?
- For a capacity or cost change: what observed saturation/utilization signal justifies it, is it sized against p99, and is egress/data-transfer included with an owner and unit metric?
- Does the answer rely on green CI, or does it name the live endpoint/metric that confirms the change in the running system?
- Are there long-lived static secrets anywhere in the pipeline, and is the path to OIDC / short-lived credentials stated?
- Is the platform sized to the team and workload, or is it fashion? What operational tax is being added vs removed?
- Is the postmortem a contributing-factors map with a control per factor, or does it blame a human and change nothing?
- Did the answer invent any price, benchmark, or model name, and is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը չորս artifact-ի համար (SLO/error-budget sheet, rollout plan, incident postmortem, հարթակի/capacity-cost review)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Սխալ error-budget arithmetic** — budget սխալ window-ով, burn rate շփոթված raw error count-ի հետ, կամ «իննները» որպես զգացում։ Վերահաշվիր `(1 − SLO) × window` և `observed/allowed`։
- **Rollout առանց abort-ի կամ չստուգված rollback-ով** — release մի՛ approve արա առանց guardrail-ների, automatic abort threshold-ի և rollback-ի, որ իրականում գործարկվել է։
- **Capacity change առանց saturation/utilization evidence-ի** — mood-ով resize մի՛ առաջարկիր. պահանջիր observed signal։
- **Green CI՝ որպես verification ընդունված** — մի՛ թող, որ «pipeline-ը green է» փոխարինի փոփոխությունը running system-ում դիտելուն. պահանջիր live check։
- **Long-lived static CI secret** — մի՛ approve արա pipeline, որ ժամկետ-չունեցող cloud key է պահում. պահանջիր OIDC / short-lived scoped credential։
- **Platform overkill** — մի՛ approve արա Kubernetes/mesh/multi-cluster փոքր թիմի և մեկ service-ի համար. պահանջիր right-sizing համեմատություն managed PaaS-ի դեմ։
- **Cause-based alert spam** — մի՛ approve արա page ամեն CPU/disk blip-ի վրա. պահանջիր symptom/burn-rate alerting՝ cause signal-ները dashboard-ում։
- **Right-sizing միայն p95/average-ի դեմ** — մի՛ approve արա cost cut, որ անտեսում է p99 tail-ը և egress/data-transfer cost-ը։
- **Blame-ով postmortem** — մի՛ approve արա review, որի «root cause»-ը մարդու անուն է կամ «human error»՝ առանց control փոփոխության։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ցույց տուր budget math-ը․ ինչ է `(1 − SLO) × window`-ը minute-ով, և ինչ է `observed/allowed`-ը։ Եթե չեն ցույց տրվում, SLO-ն դեկորատիվ է։
- Alert-ը multi-window burn-rate policy է, թե page է անում raw count-ի / մեկ cause-ի վրա։ Որտեղ են ապրում cause signal-ները՝ page-ո՞ւմ, թե dashboard-ում։
- Rollout-ն ունի՞ p99 և saturation (ոչ միայն mean), automatic abort և rollback, որ rehearsed էր։ Ի՞նչ է լինում, եթե schema-ն ներգրավված է։
- Capacity կամ cost change-ի համար․ ինչ observed saturation/utilization signal է արդարացնում, p99-ի դեմ size-ված է՞, և egress/data-transfer-ը ներառվա՞ծ է owner-ով ու unit metric-ով։
- Պատասխանը հենվու՞մ է green CI-ի վրա, թե անվանում է live endpoint-ը/metric-ը, որ հաստատում է փոփոխությունը running system-ում։
- Pipeline-ում որևէ տեղ կա՞ն long-lived static secret-ներ, և OIDC / short-lived credential-ի ճանապարհը նշվա՞ծ է։
- Հարթակը size-ված է՞ թիմին և workload-ին, թե նորաձևություն է։ Ինչ operational tax է ավելացվում ընդդեմ հանվողի։
- Postmortem-ը contributing-factors քարտեզ է՞՝ control ամեն factor-ին, թե մարդ է մեղադրում և ոչինչ չի փոխում։
- Պատասխանը հորինե՞ց price, benchmark կամ model name, և հայերենը equal-depth ու punctuation-clean է՞։
