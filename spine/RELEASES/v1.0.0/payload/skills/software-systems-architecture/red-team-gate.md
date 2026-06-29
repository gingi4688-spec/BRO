# Software Systems Architecture red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (ADR, integration/event design, resilience sheet, consistency decision, API/event contract). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Retry on a non-idempotent write with no key** — never approve a retry policy on a write (charge/order/transfer) without an idempotency key and a request-hash→result store.
- **Idempotency conflated with ordering** — do not let one idempotency key stand in for ordering; if reordering can corrupt state, require a per-entity ordering/sequence key.
- **ADR with no rejected alternative** — do not accept a "decision" that names no option it rejected and no tradeoff.
- **"Eventual" with no stale window** — do not accept eventual consistency invoked on money/permissions/inventory with no bound and no unsafe-on-stale action stated.
- **Database as the integration layer** — do not approve two services sharing one writable table as the integration; require an owned API/event contract.
- **Choreography with no end-state owner** — do not approve a multi-service workflow where nothing detects or recovers an incomplete run.
- **Resilience theater** — do not approve retries with no timeout, no jitter, no budget, no circuit breaker; they amplify outages.
- **Unowned / unversioned breaking contract change** — do not approve a payload break with no owner, no deprecation window, and no consumer-migration plan.
- **Diffused security boundary** — do not approve an architecture with inconsistent authz, over-privileged services, secrets in the repo, or an unbounded blast radius.
- **Premature complexity** — do not approve event sourcing / CQRS / a service split with no invariant that demands it and no rejected simpler alternative.

### Reviewer probes (ask these of any answer)

- What is the invariant, and does every structural choice derive from it? If the answer started from a technology, send it back.
- Which alternative did the ADR reject, and what tradeoff does the chosen option lose? If none, it is a conclusion, not a decision.
- For every retried write: where is the idempotency key and the request-hash→result store? A retry without one double-applies in production.
- Is idempotency separated from ordering? If events can reorder, what is the per-entity ordering/sequence key, and how is an out-of-sequence event handled?
- Is this workflow choreographed or orchestrated, and who owns the end-state? If choreographed, what detects and recovers a stuck/orphaned run?
- For each consistency choice: which model, what stale window in concrete units, and what action is unsafe on a stale read?
- For a flaky dependency: is the full resilience set present (timeout, retry+jitter+budget, circuit breaker, bulkhead, backpressure, fallback), or just a bare retry?
- For any cross-team API/event change: is there an owner, a version policy, a deprecation window, and a consumer-migration plan? Is a correlation id propagated for tracing?
- Where is the trust boundary, how is each service scoped to least privilege, and what is the blast-radius of one compromised service or stolen token? (Control design routes to security.)
- Did the answer reach for microservices / event sourcing / CQRS without an invariant that requires it — and does the ADR show the rejected simpler alternative?
- Did the answer invent any price, benchmark, or model name, and is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (ADR, integration/event design, resilience sheet, consistency որոշում, API/event contract)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Retry non-idempotent write-ի վրա՝ առանց key-ի** — երբեք մի՛ approve արա retry policy write-ի վրա (charge/order/transfer) առանց idempotency key-ի և request-hash→result store-ի։
- **Idempotency-ն շփոթված ordering-ի հետ** — մի՛ թող, որ մեկ idempotency key փոխարինի ordering-ին. եթե reordering-ը կարող է corrupt անել state-ը, պահանջիր per-entity ordering/sequence key։
- **ADR առանց մերժված alternative-ի** — մի՛ ընդունիր «որոշում», որ ոչ մի մերժած option և ոչ մի tradeoff չի անվանում։
- **«Eventual»՝ առանց stale window-ի** — մի՛ ընդունիր eventual consistency, որ վկայակոչված է money/permissions/inventory-ի վրա՝ առանց bound-ի և առանց unsafe-on-stale action-ի։
- **Database՝ որպես integration layer** — մի՛ approve արա երկու service՝ մեկ writable table կիսելով որպես integration. պահանջիր սեփական API/event contract։
- **Choreography՝ առանց end-state-ի տիրոջ** — մի՛ approve արա multi-service workflow, որտեղ ոչինչ չի հայտնաբերում կամ վերականգնում incomplete run-ը։
- **Resilience theater** — մի՛ approve արա retry՝ առանց timeout-ի, jitter-ի, budget-ի, circuit breaker-ի. դրանք ուժեղացնում են outage-ները։
- **Անտեր / unversioned breaking contract change** — մի՛ approve արա payload break՝ առանց owner-ի, deprecation window-ի և consumer-migration plan-ի։
- **Ցրված security boundary** — մի՛ approve արա architecture՝ անհետևողական authz-ով, over-privileged service-երով, repo-ում secret-ներով, կամ անսահման blast radius-ով։
- **Վաղաժամ complexity** — մի՛ approve արա event sourcing / CQRS / service split՝ առանց invariant-ի, որ պահանջում է, և առանց մերժված ավելի պարզ alternative-ի։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ինչ է invariant-ը, և ամեն կառուցվածքային ընտրությո՞ւն բխում է դրանից։ Եթե պատասխանը սկսել է technology-ից, հետ ուղարկիր։
- Որ alternative-ը մերժեց ADR-ը, և ինչ tradeoff է կորցնում ընտրված option-ը։ Եթե ոչ մեկը, դա եզրակացություն է, ոչ որոշում։
- Ամեն retry-ված write-ի համար․ որտեղ է idempotency key-ը և request-hash→result store-ը։ Retry առանց դրա double-apply է production-ում։
- Idempotency-ն բաժանվա՞ծ է ordering-ից։ Եթե event-ները կարող են reorder-վել, ինչ է per-entity ordering/sequence key-ը, և ոնց է out-of-sequence event-ը handle-վում։
- Այս workflow-ն choreographed է՞ թե orchestrated, և ով է տիրում end-state-ին։ Եթե choreographed, ինչ է հայտնաբերում և վերականգնում խրված/orphaned run-ը։
- Ամեն consistency ընտրության համար․ որ model-ը, ինչ stale window կոնկրետ միավորով, և ինչ action է unsafe stale read-ի դեպքում։
- Flaky dependency-ի համար․ ամբողջ resilience set-ը կա՞ (timeout, retry+jitter+budget, circuit breaker, bulkhead, backpressure, fallback), թե միայն մերկ retry։
- Ցանկացած cross-team API/event change-ի համար․ կա՞ owner, version policy, deprecation window և consumer-migration plan։ Correlation id propagate-վա՞ծ է tracing-ի համար։
- Որտեղ է trust boundary-ն, ոնց է ամեն service scope-ված least privilege-ի, և ինչ է մեկ compromise-ված service-ի կամ գողացված token-ի blast-radius-ը։ (Control-ի դիզայնը ուղղորդվում է security-ին։)
- Պատասխանը ձեռք մեկնե՞ց microservices / event sourcing / CQRS-ին՝ առանց invariant-ի, որ պահանջում է — և ADR-ը ցույց տալիս է՞ մերժված ավելի պարզ alternative-ը։
- Պատասխանը հորինե՞ց price, benchmark կամ model name, և հայերենը equal-depth ու punctuation-clean է՞։
