# Software Systems Architecture domain rubric

## English

Use this rubric before finalizing an ADR, integration/event design, resilience sheet, consistency decision, or API/event contract. A score of 5 requires the mechanism, the evidence, and a checkable domain artifact — not vocabulary.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Invariant clarity | Pattern-first; technology chosen before the requirement. | Some requirements named. | The business invariant, stale tolerance, load shape, and failure behavior drive the design, and the ADR rejects a real alternative. |
| Resilience mechanics | Retries everywhere, no thresholds. | Timeouts named. | Timeout, retry+jitter+budget, circuit breaker, bulkhead, backpressure, and fallback are coherent and tied to the dependency's failure mode. |
| Data consistency & ordering | Consistency vague; "eventual" hand-waved. | Eventual/strong named. | Read/write promises, the invariant, the stale window in concrete units, idempotency-vs-ordering, and correlation ids are explicit. |
| Contract integrity | Endpoint/event list only. | Versioning named. | Versioning, idempotency, error model, auth scope, pagination/limits, owner, and a consumer-migration plan for breaking changes are specified. |
| Security & operability | No trust boundary; no runbook. | Some metrics named. | The trust boundary is placed and blast-radius bounded, and logs/metrics/traces/alerts/rollout/rollback are part of the architecture. |

## Հայերեն

Այս rubric-ը կիրառիր ADR, integration/event design, resilience sheet, consistency որոշում, կամ API/event contract վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և domain-ին հատուկ ստուգելի artifact — ոչ vocabulary։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Invariant clarity | Pattern-first. technology-ն ընտրված requirement-ից առաջ։ | Որոշ requirement նշված է։ | Business invariant-ը, stale tolerance-ը, load shape-ը և failure behavior-ը են driving design-ը, և ADR-ը մերժում է իրական alternative։ |
| Resilience mechanics | Retry ամեն տեղ, առանց threshold-ի։ | Timeout նշված է։ | Timeout, retry+jitter+budget, circuit breaker, bulkhead, backpressure և fallback-ը coherent են և կապված dependency-ի failure mode-ին։ |
| Data consistency & ordering | Consistency-ն vague է. «eventual»-ը hand-wave։ | Eventual/strong նշված է։ | Read/write promise-ները, invariant-ը, stale window-ը կոնկրետ միավորով, idempotency-ընդդեմ-ordering-ը և correlation id-ները բացահայտ են։ |
| Contract integrity | Միայն endpoint/event list։ | Versioning նշված է։ | Versioning, idempotency, error model, auth scope, pagination/limit, owner և breaking change-ի consumer-migration plan-ը նշված են։ |
| Security & operability | Trust boundary չկա. runbook չկա։ | Որոշ metric նշված է։ | Trust boundary-ն տեղադրված է և blast-radius-ը սահմանված, և log/metric/trace/alert/rollout/rollback-ը architecture-ի մաս են։ |
