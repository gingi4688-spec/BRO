# Software Systems Architecture patterns

## English

These are canonical software-systems-architecture moves. Each is a mechanism for one of the domain's artifacts (ADR, integration/event design, resilience sheet, consistency decision, API/event contract). Choose the move that changes the next decision, not the nicest label.

### 1. Invariant-first ADR

- **Trigger:** An architecture debate opens with a technology or pattern choice ("should we use Kafka / microservices / event sourcing?").
- **Mechanism:** Before choosing anything, write the business invariant (what must always be true), the load shape, the failure mode, the data ownership, and the change rate. Derive the structure from those. The ADR must name and reject at least one plausible alternative, stating the tradeoff it loses.
- **Do not use when:** It is a trivial, reversible, local refactor with no cross-team or invariant impact — an ADR there is ceremony.
- **Failure repair:** If the ADR has no invariant, it is preference dressed as architecture — add the invariant and re-derive. If it has no rejected alternative, it is a conclusion, not a decision — add the option you did not pick and why.

### 2. Retry / circuit-breaker resilience sheet

- **Trigger:** A dependency is flaky, slow, or occasionally down, and the caller must stay healthy.
- **Mechanism:** Classify errors (retryable vs not), set a per-dependency timeout, retry only retryable errors with jitter and a retry budget, define the circuit-breaker open/half-open rule (open on failure ratio, probe in half-open), add a bulkhead to isolate the pool, a fallback, and backpressure/load-shed before queues collapse. State the idempotency requirement for any retried write.
- **Do not use when:** The write is non-idempotent and has no idempotency key — fix that first; a bare retry there double-applies.
- **Failure repair:** If retries amplify load during an outage (a retry storm), add the timeout, the budget, the circuit breaker, and backpressure; a retry without a timeout and budget is a load amplifier, not resilience.

### 3. Saga map (with compensations)

- **Trigger:** A workflow crosses service boundaries and a single database transaction (or 2PC) is unavailable or too brittle.
- **Mechanism:** For each step list the local transaction, the emitted event, the compensating action, the timeout, the owner, and the user-visible state. Decide orchestration vs choreography for running it. Place any uncompensatable step last (or gate it behind human review), and name the owner of the workflow's end-state.
- **Do not use when:** A single local transaction is available and sufficient — use it; a saga adds compensation complexity you do not need.
- **Failure repair:** If a compensation cannot truly undo a step (money moved, email sent), move that step to the end or gate it; if no component owns the end-state, add a process manager / timeout sweeper that detects and recovers stuck workflows.

### 4. Choreography vs orchestration decision

- **Trigger:** A multi-service workflow needs to be coordinated, and you must decide how — a central coordinator or event reactions.
- **Mechanism:** Score the workflow on visibility, ordering, and coupling. Orchestrate (a central coordinator/saga holds state, calls steps, enforces order, compensates centrally) when you need end-to-end visibility, enforced sequencing, central compensation, or a single owner of the end-state. Choreograph (services react to events and emit their own) when steps are autonomous and you want loose coupling and independent evolution. Either way, name the owner of the end-state and the recovery path for an incomplete workflow.
- **Do not use when:** It is a single synchronous request-response with no real workflow — neither choreography nor orchestration applies; a direct call is correct.
- **Failure repair:** If you chose choreography but no one owns completion, add a process manager, a timeout sweeper, or an event-log audit so orphaned/stuck workflows are detected and compensated rather than lost.

### 5. Event-ordering & idempotency design

- **Trigger:** Services exchange events (or messages) over a transport that may duplicate, reorder, or redeliver them, and state correctness depends on identity and order.
- **Mechanism:** Separate the two questions. For "applied already?" attach a stable **idempotency key** and a dedup store so a duplicate returns the first result. For "in what order?" use a per-entity partition (serialize all events for one entity) or a version/sequence number, and reject or reorder out-of-sequence events explicitly; use logical/vector clocks where concurrent writers must be detected. Thread a correlation id (and causation id) through every event for tracing.
- **Do not use when:** The events are independent and order/duplication cannot corrupt state — do not pay for ordering you do not need.
- **Failure repair:** If the system dedups but still applies events out of order (e.g. "cancel" before "create"), add the per-entity ordering key; an idempotency key alone catches duplicates, not reordering.

### 6. Contract & versioning gate

- **Trigger:** An API or event is consumed across teams/services, or a change to its shape is proposed.
- **Mechanism:** Treat the API/event as an owned contract: specify versioning policy, idempotency semantics, an error model, pagination/limits, auth scope, and a backward-compatibility rule. Prefer additive (expand/contract) evolution; for any breaking change, require a deprecation window, a consumer list, and a migration plan. Assign an owner.
- **Do not use when:** The interface is purely internal to one service with one consumer and no cross-boundary commitment — versioning ceremony there is overhead.
- **Failure repair:** If a breaking change is shipped as "cleanup" with no consumer migration, treat it as an outage: roll back or re-add the old shape behind a version, publish a deprecation window, and migrate consumers before removal.

## Հայերեն

Սրանք canonical software-systems-architecture move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (ADR, integration/event design, resilience sheet, consistency որոշում, API/event contract)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Invariant-first ADR

- **Երբ է պետք․** Architecture-ի վեճը սկսվում է technology կամ pattern ընտրությամբ («Kafka / microservices / event sourcing օգտագործե՞նք»)։
- **Մեխանիզմը․** Որևէ բան ընտրելուց առաջ գրիր business invariant-ը (ինչ պետք է միշտ ճիշտ լինի), load shape-ը, failure mode-ը, data ownership-ը և change rate-ը։ Կառուցվածքը բխեցրու դրանցից։ ADR-ը պետք է անվանի և մերժի առնվազն մեկ plausible alternative՝ նշելով tradeoff-ը, որ կորցնում է։
- **Երբ չօգտագործել․** Trivial, reversible, local refactor է՝ առանց cross-team կամ invariant ազդեցության — ADR-ն այնտեղ ceremony է։
- **Ուղղում․** Եթե ADR-ում invariant չկա, դա preference է architecture-ի հագուստով — ավելացրու invariant-ը և վերաբխեցրու։ Եթե մերժված alternative չկա, դա եզրակացություն է, ոչ որոշում — ավելացրու option-ը, որ չընտրեցիր, և ինչու։

### 2. Retry / circuit-breaker resilience sheet

- **Երբ է պետք․** Dependency-ն flaky է, դանդաղ, կամ երբեմն down, և caller-ը պետք է առողջ մնա։
- **Մեխանիզմը․** Classify արա error-ները (retryable ընդդեմ ոչ), դիր per-dependency timeout, retry արա միայն retryable error-ները jitter-ով և retry budget-ով, սահմանիր circuit-breaker open/half-open rule-ը (բացվում է failure ratio-ի վրա, probe է անում half-open-ում), ավելացրու bulkhead՝ pool-ը մեկուսացնելու, fallback, և backpressure/load-shed՝ նախքան queue-ի collapse-ը։ Նշիր idempotency requirement-ը ցանկացած retry-ված write-ի համար։
- **Երբ չօգտագործել․** Write-ը non-idempotent է և idempotency key չունի — նախ ուղղիր այդ. մերկ retry-ն այնտեղ double-apply է անում։
- **Ուղղում․** Եթե retry-ները outage-ի ժամանակ load են ուժեղացնում (retry storm), ավելացրու timeout-ը, budget-ը, circuit breaker-ը և backpressure-ը. retry առանց timeout-ի և budget-ի load amplifier է, ոչ resilience։

### 3. Saga map (compensation-ներով)

- **Երբ է պետք․** Workflow-ն անցնում է service boundary-ներ, և մեկ database transaction (կամ 2PC) անհասանելի կամ չափազանց brittle է։
- **Մեխանիզմը․** Ամեն step-ի համար թվարկիր local transaction-ը, emitted event-ը, compensating action-ը, timeout-ը, owner-ը և user-visible state-ը։ Որոշիր orchestration ընդդեմ choreography-ի՝ այն run անելու համար։ Ցանկացած չ-compensate-վող step դիր վերջում (կամ gate արա մարդկային review-ով), և անվանի՛ր workflow-ի end-state-ի owner-ը։
- **Երբ չօգտագործել․** Մեկ local transaction-ը հասանելի և բավարար է — օգտագործիր այն. saga-ն ավելացնում է compensation complexity, որ պետք չէ։
- **Ուղղում․** Եթե compensation-ը իրականում չի կարող undo անել step-ը (փող տեղափոխված, email ուղարկված), այդ step-ը տեղափոխիր վերջ կամ gate արա. եթե ոչ մի component չի տիրում end-state-ին, ավելացրու process manager / timeout sweeper, որ հայտնաբերի և վերականգնի խրված workflow-ները։

### 4. Choreography ընդդեմ orchestration որոշում

- **Երբ է պետք․** Multi-service workflow-ը պետք է coordinate-վի, և պետք է որոշես ոնց — կենտրոնական coordinator թե event reaction-ներ։
- **Մեխանիզմը․** Գնահատիր workflow-ը visibility-ով, ordering-ով և coupling-ով։ Orchestrate արա (կենտրոնական coordinator/saga-ն պահում է state, կանչում step-եր, enforce է անում order, կենտրոնացված compensate), երբ պետք է ծայրից-ծայր visibility, enforced sequencing, կենտրոնական compensation, կամ end-state-ի մեկ owner։ Choreograph արա (service-երը react են անում event-ներին և emit իրենը), երբ step-երը autonomous են, և ուզում ես loose coupling ու անկախ evolution։ Ամեն դեպքում անվանի՛ր end-state-ի owner-ը և incomplete workflow-ի recovery path-ը։
- **Երբ չօգտագործել․** Մեկ synchronous request-response է՝ առանց իրական workflow-ի — ո՛չ choreography, ո՛չ orchestration չի կիրառվում. ուղիղ call-ը ճիշտ է։
- **Ուղղում․** Եթե ընտրեցիր choreography, բայց ոչ ոք չի տիրում completion-ին, ավելացրու process manager, timeout sweeper, կամ event-log audit, որ orphaned/խրված workflow-ները հայտնաբերվեն և compensate-վեն, ոչ կորչեն։

### 5. Event-ordering & idempotency design

- **Երբ է պետք․** Service-երը event (կամ message) են փոխանակում transport-ով, որ կարող է duplicate, reorder կամ redeliver անել, և state-ի ճշտությունը կախված է identity-ից և order-ից։
- **Մեխանիզմը․** Բաժանիր երկու հարցը։ «Արդեն կիրառվա՞ծ է»-ի համար կցիր կայուն **idempotency key** և dedup store, որ duplicate-ը վերադարձնի առաջին result-ը։ «Ինչ հերթականությա՞մբ»-ի համար օգտագործիր per-entity partition (serialize արա մեկ entity-ի բոլոր event-ները) կամ version/sequence number, և reject կամ reorder արա out-of-sequence event-ները բացահայտ. օգտագործիր logical/vector clock, որտեղ պետք է concurrent writer-ները հայտնաբերել։ Անցկացրու correlation id (և causation id) ամեն event-ով՝ tracing-ի համար։
- **Երբ չօգտագործել․** Event-ները անկախ են, և order/duplication չի կարող corrupt անել state-ը — մի՛ վճարիր ordering-ի համար, որ պետք չէ։
- **Ուղղում․** Եթե համակարգը dedup է անում, բայց միևնույն է event-ները կիրառում out of order (օր.՝ «cancel» «create»-ից առաջ), ավելացրու per-entity ordering key-ը. idempotency key-ը մենակ բռնում է duplicate-ները, ոչ reordering-ը։

### 6. Contract & versioning gate

- **Երբ է պետք․** API կամ event սպառվում է թիմերի/service-ների միջև, կամ առաջարկվում է փոփոխություն իր shape-ին։
- **Մեխանիզմը․** API/event-ը համարիր սեփականատեր ունեցող contract․ նշիր versioning policy, idempotency semantics, error model, pagination/limit, auth scope և backward-compatibility rule։ Նախընտրիր additive (expand/contract) evolution. ցանկացած breaking change-ի համար պահանջիր deprecation window, consumer list և migration plan։ Նշանակիր owner։
- **Երբ չօգտագործել․** Interface-ը զուտ internal է մեկ service-ի մեջ՝ մեկ consumer-ով և առանց cross-boundary commitment-ի — versioning ceremony-ն այնտեղ overhead է։
- **Ուղղում․** Եթե breaking change ship է «cleanup»-ի անունով՝ առանց consumer migration-ի, համարիր outage․ roll back արա կամ վերադարձրու հին shape-ը version-ի հետևում, հրապարակիր deprecation window, և migrate արա consumer-ները նախքան հեռացնելը։
