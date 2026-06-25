# DevOps, Platform, and SRE domain rubric

## English

Use this DevOps, Platform, and SRE rubric before finalizing SLO/error-budget plan, rollout strategy, incident review, platform guardrail. A score of 5 requires the mechanism, evidence, and a checkable domain artifact.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| SLO math | Reliability is vague. | SLO named. | SLI, SLO, budget minutes, burn rate, and alert windows are calculated correctly. |
| Observability | Logs only. | Golden signals named. | Golden Signals, USE/RED, p99, saturation, and business impact are connected. |
| Rollout safety | Big-bang deploy. | Rollback mentioned. | Canary/blue-green/flag choice has traffic steps, bake, abort, and rollback. |
| Platform guardrails | Cluster knobs random. | Some k8s settings. | Probes, requests/limits, HPA, PDB, IaC drift, and ownership are tuned to symptoms. |
| Cost discipline | Cost ignored. | Rightsizing named. | FinOps maps cost to service owner, unit metric, anomaly, and action. |

## Հայերեն

Այս DevOps, Platform, and SRE rubric-ը կիրառիր SLO/error-budget plan, rollout strategy, incident review, platform guardrail artifact-ը վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և domain-ին հատուկ ստուգելի artifact։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| SLO math | Reliability-ն vague է։ | SLO նշված է։ | SLI, SLO, budget minute, burn rate և alert window-ները ճիշտ են հաշվված։ |
| Observability | Միայն log է։ | Golden signal-ները նշված են։ | Golden Signals, USE/RED, p99, saturation և business impact-ը կապված են։ |
| Rollout safety | Big-bang deploy է։ | Rollback նշված է։ | Canary/blue-green/flag choice-ը ունի traffic step, bake, abort և rollback։ |
| Platform guardrail | Cluster knob-երը random են։ | Որոշ k8s setting կա։ | Probe-երը, requests/limits-ը, HPA-ն, PDB-ն, IaC drift-ը և ownership-ը symptom-ով են tuned։ |
| Cost discipline | Cost-ը անտեսված է։ | Rightsizing նշված է։ | FinOps-ը cost-ը կապում է service owner-ի, unit metric-ի, anomaly-ի և action-ի հետ։ |
