# Software Systems Architecture eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **Distributed workflow / saga.** "Design an order workflow across cart, payment, inventory, and fulfillment." — Pass only if it names the invariant first, uses a saga with per-step compensation, gates retry on payment behind an idempotency key, and rejects 2PC for a concrete reason (the external provider cannot enlist).
2. **Flaky dependency / resilience.** "A downstream service is flaky; make our caller resilient." — Pass only if it sets a per-dependency timeout, retry-on-retryable-with-jitter-and-budget, a circuit breaker, a bulkhead, and backpressure — not a bare retry — and states the idempotency requirement for any retried write.
3. **API / event contract.** "We need to evolve our public order API." — Pass only if it specifies versioning, idempotency, an error model, auth scope, pagination/limits, an owner, and a deprecation window + consumer-migration plan for breaking changes.
4. **Consistency choice.** "Should the account balance and the activity feed use the same consistency model?" — Pass only if it picks strong consistency for the balance (money invariant) and eventual for the feed with a concrete stale window, and names the unsafe-on-stale action (charging on a stale balance).
5. **Idempotency vs ordering.** "Our event consumer sometimes processes duplicates and sometimes applies events out of order — fix it." — Pass only if it separates the two: an idempotency key + dedup store for duplicates, and a per-entity ordering/sequence key (not the idempotency key) for ordering, and explains why one key cannot do both.
6. **Choreography vs orchestration.** "We have a five-step cross-service workflow — should it be event choreography or a central orchestrator?" — Pass only if it chooses on visibility/ordering/coupling (orchestrate for end-to-end visibility/enforced order/central compensation; choreograph for autonomous loose coupling) and names the owner of the end-state plus a recovery path for an incomplete workflow.
7. **Security architecture.** "How do we keep one compromised microservice from taking down the whole system?" — Pass only if it places a trust boundary, scopes each service's credentials to least privilege, keeps secrets out of the repo, bounds the blast-radius, and routes the threat model / control catalogue to security (placement here, controls there) — fail if it just says "use a firewall / encrypt everything."
8. **Boundary / decomposition.** "Should we split this modular monolith into microservices now?" — Pass only if it right-sizes: requires a concrete invariant (independent scaling, audit/replay, divergent models, independent deploy) to justify the split, warns of the distributed-monolith trap, and shows the rejected simpler alternative.
9. **Database-as-integration.** "Two teams both read and write the orders table directly — is that fine?" — Pass only if it flags integration-through-the-database as a hidden unversioned contract / distributed monolith and prescribes an owned API or event contract instead.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same invariant, same mechanism, same artifact), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for a specific broker throughput number or a named latency benchmark. — Pass only if it refuses to invent it or marks it verify-before-use with a formula/placeholder.
- **No thin framework-name answer.** Ask "just tell me the microservices best practices." — Pass only if it expands into mechanism, an invariant-driven tradeoff, or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Distributed workflow / saga.** «Նախագծիր order workflow cart, payment, inventory և fulfillment service-երով»։ — Անցնում է միայն, եթե նախ անվանում է invariant-ը, օգտագործում saga՝ per-step compensation-ով, gate է անում payment-ի retry-ն idempotency key-ի հետևում, և մերժում 2PC-ն կոնկրետ պատճառով (external provider-ը չի կարող enlist լինել)։
2. **Flaky dependency / resilience.** «Downstream service-ը flaky է. դարձրու մեր caller-ը resilient»։ — Անցնում է միայն, եթե դնում է per-dependency timeout, retry-on-retryable-jitter-ով-և-budget-ով, circuit breaker, bulkhead և backpressure — ոչ մերկ retry — և նշում idempotency requirement-ը ցանկացած retry-ված write-ի համար։
3. **API / event contract.** «Պետք է evolve անենք մեր public order API-ն»։ — Անցնում է միայն, եթե նշում է versioning, idempotency, error model, auth scope, pagination/limit, owner և deprecation window + consumer-migration plan breaking change-երի համար։
4. **Consistency choice.** «Account balance-ը և activity feed-ը պետք է նույն consistency model օգտագործե՞ն»։ — Անցնում է միայն, եթե ընտրում է strong consistency balance-ի համար (money invariant) և eventual feed-ի համար՝ կոնկրետ stale window-ով, և անվանում unsafe-on-stale action-ը (stale balance-ով charge անելը)։
5. **Idempotency ընդդեմ ordering.** «Մեր event consumer-ը երբեմն duplicate է մշակում, երբեմն event-ները կիրառում out of order — ուղղիր»։ — Անցնում է միայն, եթե բաժանում է երկուսը․ idempotency key + dedup store duplicate-ների, և per-entity ordering/sequence key (ոչ idempotency key-ը) ordering-ի համար, և բացատրում, թե ինչու մեկ key-ը չի կարող երկուսն էլ անել։
6. **Choreography ընդդեմ orchestration.** «Մենք ունենք հնգ-step cross-service workflow — event choreography պետք է լինի՞ թե կենտրոնական orchestrator»։ — Անցնում է միայն, եթե ընտրում է visibility/ordering/coupling-ով (orchestrate՝ ծայրից-ծայր visibility/enforced order/կենտրոնական compensation. choreograph՝ autonomous loose coupling) և անվանում end-state-ի owner-ը plus incomplete workflow-ի recovery path-ը։
7. **Security architecture.** «Ոնց ենք պահում, որ մեկ compromise-ված microservice-ը ողջ համակարգը չգցի»։ — Անցնում է միայն, եթե տեղադրում է trust boundary, ամեն service-ի credential-ը scope է անում least privilege-ի, secret-ները պահում repo-ից դուրս, սահմանում blast-radius-ը, և threat model / control catalogue-ը ուղղորդում security-ին (տեղադրումն այստեղ, control-ները՝ այնտեղ) — fail՝ եթե միայն ասում է «firewall դիր / ամեն ինչ encrypt արա»։
8. **Boundary / decomposition.** «Պետք է հիմա այս modular monolith-ը microservices-ի բաժանե՞նք»։ — Անցնում է միայն, եթե right-size է անում․ պահանջում է կոնկրետ invariant (անկախ scaling, audit/replay, շեղվող model, անկախ deploy) split-ը արդարացնելու, զգուշացնում distributed-monolith թակարդից, և ցույց տալիս մերժված ավելի պարզ alternative-ը։
9. **Database-as-integration.** «Երկու թիմ էլ ուղիղ կարդում/գրում են orders table-ը — նորմա՞լ է»։ — Անցնում է միայն, եթե flag է անում database-ով integration-ը որպես թաքնված unversioned contract / distributed monolith և նշանակում սեփական API կամ event contract-ը փոխարենը։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն invariant-ը, նույն mechanism-ը, նույն artifact-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու կոնկրետ broker throughput թիվ կամ named latency benchmark։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց կամ նշում verify-before-use՝ formula/placeholder-ով։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես ասա microservices best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, invariant-driven tradeoff, կամ worked micro-example, ոչ label-ների ցուցակ։
