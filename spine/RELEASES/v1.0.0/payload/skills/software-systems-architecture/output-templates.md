# Software Systems Architecture output templates

## English

Three domain-shaped deliverables. Fill the real fields; derive every structural choice from the invariant, and never assert a volatile fact (price, benchmark, model name) you cannot verify.

### Template 1 — Architecture Decision Record (ADR)

- **Title & status:** (proposed / accepted / superseded)
- **Context — invariant first:** the business invariant that must always hold; the load shape; the failure modes; the data ownership; the change rate
- **Decision:** the chosen structure (boundaries, integration style, consistency model)
- **Rejected alternatives (≥1):** the strongest option(s) not chosen — and the tradeoff each loses
- **Consistency & ordering:** model per data class (strong / read-your-writes / monotonic / eventual) + stale window in concrete units + the unsafe-on-stale action; idempotency keys and ordering/sequence keys where writes/events occur
- **Resilience & failure handling:** timeouts, retry policy (+ idempotency requirement), circuit breaker, compensation/saga path
- **Contracts touched:** APIs/events affected, versioning impact, consumers, migration plan for any break
- **Security boundary:** where authn/authz sits, least-privilege scope, blast-radius of a compromise (control design → security)
- **Consequences:** what gets cheaper, what gets harder, what to watch
- **Acceptance & verification:** the load-bearing claim to exercise in the running system (duplicate delivery, ordering, lag, compensation) — not "tests pass"

### Template 2 — Resilience sheet (per dependency)

- **Dependency & call:** what we call, sync/async, criticality
- **Idempotency:** is the write idempotent? key + request-hash→result store (required before any retry)
- **Timeout:** per-call budget (never unbounded)
- **Retry policy:** which errors are retryable; jitter; max attempts; retry budget
- **Circuit breaker:** open threshold (failure ratio), half-open probe rule, fallback behavior
- **Bulkhead:** isolated pool/limits so this dependency cannot exhaust shared threads
- **Backpressure / load-shed:** what we reject/slow before queues collapse
- **Ordering (if events):** per-entity partition / sequence number / clock; out-of-sequence handling
- **Correlation:** correlation id (+ causation id) propagated and logged
- **Acceptance:** no bare retry on a non-idempotent write · timeout + budget present · breaker + fallback defined · verified under duplicate/slow/failed dependency

### Template 3 — API / event contract

- **Name & owner:** the interface and the team/service that owns it
- **Shape:** request/response or event payload; required vs optional fields
- **Versioning policy:** how versions are expressed; additive vs breaking rule
- **Idempotency semantics:** which operations are idempotent; idempotency-key header/field
- **Error model:** error codes, shapes, retryable vs terminal
- **Pagination & limits:** page/cursor model; rate limits
- **Auth scope:** required scopes/roles; where the authz check is enforced
- **Compatibility & migration:** deprecation window; consumer list; migration plan for any breaking change
- **Acceptance:** owner named · versioning + error model + auth scope specified · breaking change has a migration plan · idempotency stated for writes

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն կառուցվածքային ընտրություն բխեցրու invariant-ից, և երբեք մի՛ պնդիր volatile fact (price, benchmark, model name), որ չես կարող verify անել։

### Template 1 — Architecture Decision Record (ADR)

- **Title & status․** (proposed / accepted / superseded)
- **Context — invariant-ը առաջինը․** business invariant-ը, որ պետք է միշտ պահվի. load shape-ը. failure mode-ները. data ownership-ը. change rate-ը
- **Decision․** ընտրված կառուցվածքը (boundary-ներ, integration style, consistency model)
- **Մերժված alternative-ներ (≥1)․** չընտրված ամենաուժեղ option(ներ)ը — և tradeoff-ը, որ ամեն մեկը կորցնում է
- **Consistency & ordering․** model ամեն data class-ի (strong / read-your-writes / monotonic / eventual) + stale window կոնկրետ միավորով + unsafe-on-stale action-ը. idempotency key-եր և ordering/sequence key-եր, որտեղ write/event կա
- **Resilience & failure handling․** timeout-ներ, retry policy (+ idempotency requirement), circuit breaker, compensation/saga path
- **Contract-ներ, որ դիպչում են․** ազդակիր API/event-ներ, versioning ազդեցություն, consumer-ներ, migration plan ցանկացած break-ի համար
- **Security boundary․** որտեղ է authn/authz-ը, least-privilege scope-ը, compromise-ի blast-radius-ը (control-ի դիզայնը → security)
- **Consequences․** ինչն է էժանանում, ինչն է դժվարանում, ինչին հետևել
- **Acceptance & verification․** load-bearing պնդումը, որ պետք է exercise անել running system-ում (duplicate delivery, ordering, lag, compensation) — ոչ «test-երն անցան»

### Template 2 — Resilience sheet (ամեն dependency-ի)

- **Dependency & call․** ինչ ենք կանչում, sync/async, criticality
- **Idempotency․** write-ը idempotent է՞. key + request-hash→result store (պարտադիր ցանկացած retry-ից առաջ)
- **Timeout․** per-call budget (երբեք unbounded)
- **Retry policy․** որ error-ներն են retryable. jitter. max attempt. retry budget
- **Circuit breaker․** open threshold (failure ratio), half-open probe rule, fallback behavior
- **Bulkhead․** մեկուսացված pool/limit, որ այս dependency-ն չսպառի կիսված thread-երը
- **Backpressure / load-shed․** ինչ ենք reject/slow անում նախքան queue-ի collapse-ը
- **Ordering (եթե event)․** per-entity partition / sequence number / clock. out-of-sequence handling
- **Correlation․** correlation id (+ causation id) propagate-ված և log-ված
- **Acceptance․** ոչ մի մերկ retry non-idempotent write-ի վրա · timeout + budget կա · breaker + fallback սահմանված · verified duplicate/slow/failed dependency-ի տակ

### Template 3 — API / event contract

- **Name & owner․** interface-ը և թիմը/service-ը, որ տիրում է
- **Shape․** request/response կամ event payload. required ընդդեմ optional field-եր
- **Versioning policy․** ոնց են version-ները արտահայտվում. additive ընդդեմ breaking rule
- **Idempotency semantics․** որ operation-ներն են idempotent. idempotency-key header/field
- **Error model․** error code-եր, shape-եր, retryable ընդդեմ terminal
- **Pagination & limit․** page/cursor model. rate limit
- **Auth scope․** պահանջվող scope/role. որտեղ է authz check-ը enforce-ված
- **Compatibility & migration․** deprecation window. consumer list. migration plan ցանկացած breaking change-ի
- **Acceptance․** owner անվանված · versioning + error model + auth scope նշված · breaking change-ը ունի migration plan · idempotency-ն նշված write-երի համար
