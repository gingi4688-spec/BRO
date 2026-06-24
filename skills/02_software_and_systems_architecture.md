# Skill 02 — Software & Systems Architecture
### Backend · APIs · distributed & event-driven systems · resilience · scaling

> **EN:** How to design software systems that are correct, evolvable, and scale. Sister discipline to Skill 01 (data); this is the application/service side. Written as Bro's own operating manual — decision-ready, not a textbook. Sources I draw on: Fowler (PoEAA, *Refactoring*, microservices canon), Evans & Vernon (DDD / *Implementing DDD*), Newman (*Building Microservices*, *Monolith to Microservices*), Kleppmann (*DDIA*), Nygard (*Release It!*), Hohpe & Woolf (*Enterprise Integration Patterns*), Lewis/Fowler (Strangler Fig), the 12-Factor App, the Reactive Manifesto, AWS/Google Well-Architected, Accelerate/DORA, Conway/Brooks/Lamport/Gray as the canon.
>
> **HY:** Ոնց ձևավորել software համակարգեր, որ ճիշտ են, evolvable ու scale են անում։ Skill 01-ի (data) քույր դիսցիպլինն է. սա application/service կողմն է։ Գրված է որպես Bro-ի սեփական operating manual՝ որոշման-պատրաստ, ոչ թե դասագիրք։ Հենվում եմ canon-ի վրա՝ Fowler, Evans/Vernon (DDD), Newman (microservices), Kleppmann (DDIA), Nygard (Release It!), Hohpe (integration patterns), Strangler Fig, 12-Factor, Reactive Manifesto, Well-Architected, DORA/Accelerate, ու Conway/Brooks/Lamport/Gray-ի օրենքները։

---

## 0. Ո՞Ր ՈՍՊՆՅԱԿԸ ԵՐԲ (the three lenses)

Ինչպես Skill 01-ում՝ իջի՛ր վերևից ներքև։ Մեծ սխալները լինում են, երբ ուղիղ ցատկում ես mechanics-ի (ո՞ր framework-ը) առանց «ինչո՞ւ» ու «fit»-ի։

| Lens | Horizon | Decides | Question it asks |
|---|---|---|---|
| **Solution / System Architect** | one system / technical | *Ոնց է* կառուցված այս service-ը՝ boundaries, contracts, data ownership, failure modes | "Is this correct, evolvable, and does it fail safely?" |
| **Application / Platform Architect** | program / standards | *Ի՞նչ patterns/reference-arch/platform* են governing բոլոր team-երին; tech selection; roadmap | "Does it fit our patterns, our platform, our 3-year direction?" |
| **Engineering / Tech Leadership (CTO-ish)** | org / business | Արդյո՞ք architecture-ը delivery-ն արագացնում է, risk-ը իջեցնում, team-երին ինքնավար դարձնում | "Does this let teams ship safely & independently, and survive scale?" |

**Rule of use:** start from the org question (does this speed delivery / reduce risk / enable teams), descend to the platform question (fit / reuse / standards), land on the system question (boundaries / contracts / failure). Architecture that is locally elegant but org-hostile (Conway-fighting) loses.

**Conway's Law — the master constraint.** A system's structure mirrors the communication structure of the org that builds it. You do not get to pick architecture independently of team topology. **Inverse Conway Maneuver:** design the teams you want the architecture to reflect. Read *Team Topologies* (stream-aligned, platform, enabling, complicated-subsystem teams) as the org-side dual of this skill.

---

## 1. MINDSET — operating principles (govern everything below)

1. **Boundaries first.** Define modules/services by **business capability and data ownership**, not by technical layer. High cohesion inside, loose coupling across. A boundary is right when it can change internally without forcing changes across the line.
2. **Make the implicit explicit.** Contracts, invariants, failure modes, ownership, and SLAs are **written down**, not assumed. An unwritten invariant is a future incident.
3. **Design for change, not for prediction.** You can't foresee requirements; you can keep the **cost of change** low — clear seams, reversible decisions, small blast radius. Optimize for the second derivative (how fast you can change), not the first.
4. **Failure is the normal case.** Every remote call can fail, time out, duplicate, or arrive out of order. Design for it: **timeouts, retries-with-backoff-and-jitter, idempotency, circuit breakers, bulkheads, fallbacks**. The network is not reliable, latency is not zero, bandwidth is not infinite (the **Fallacies of Distributed Computing** — assume all eight are false).
5. **Simplicity is a feature.** The cheapest, most reliable system is the simplest one that meets the requirement. **Earn every piece of complexity.** "You aren't gonna need it" (YAGNI) beats speculative generality; but don't confuse *simple* (few interlocking concepts — Rich Hickey's *Simple Made Easy*) with *easy* (familiar). Aim for simple.
6. **The monolith is a valid default.** Start **modular-monolith**; extract services only when a real force (independent scaling, team autonomy, fault isolation, divergent tech needs) demands it. Distribution is a tax you pay in latency, debuggability, and consistency — pay it for a reason.
7. **The running system is the truth — not the source tree.** Code on disk that isn't deployed/reloaded is NOT live. Always know which version is actually running, and verify behavior against the **running artifact**, not the repo. Reload/restart/migration are first-class ops, not afterthoughts. **(2026-06-23 scar:** edits were on disk but the no-reload backend kept serving OLD code → new frontend + old API contract → 400s.) Corollary: surface the running version (build SHA / `/healthz` with version), and treat "did it actually reload?" as a question to *verify*, never assume.
8. **Make correctness enforceable, not aspirational.** A rule with no automated guard will drift (mirror of Skill 01 §1.5). Contracts → contract tests in CI. Architectural boundaries → fitness functions / dependency-lint. Resilience → chaos/fault-injection tests. SLOs → alerts. If it isn't a gate, it's a wish.
9. **Decentralize execution, centralize the rules of interoperability.** Teams own their services and their quality; the platform owns the standards (auth, observability, contracts, deploy). Same insight as data-mesh, applied to services.
10. **Operability is part of the design, not handed to ops.** A service isn't done when it works on the happy path; it's done when it's observable (logs/metrics/traces), deployable safely (health checks, graceful shutdown, drain), and recoverable (idempotent, replayable). 12-Factor and "you build it, you run it" are the floor.

---

## 2. ARCHITECTURAL STYLES (when each — and when NOT)

### 2.1 Decomposition styles
- **Modular monolith** — one deployable, **strong internal module boundaries** (enforced by package structure + dependency rules, not goodwill). Default for small teams / early products / unclear domain. Simplest ops, one transaction boundary, easiest refactor, in-process calls (no network failure modes). The goal: be *ready* to extract services without *being* distributed. **Smell that you did it wrong:** modules reach into each other's tables.
- **Microservices** — independently deployable services per capability. Buys **team autonomy, independent scaling, fault isolation, polyglot freedom** — at the cost of distributed-systems complexity (network, partial failure, eventual consistency, distributed tracing, data duplication). Adopt for **organizational scale and clear bounded contexts**, not fashion. Newman's test: can you deploy one service without coordinating with others? If no, you have a distributed monolith, not microservices.
- **Service-based / "right-sized services"** — a handful of coarse-grained services (not dozens of nano-services). Often the pragmatic middle: most of the autonomy benefit, far less of the operational tax. Prefer **fewer, larger** services until a force splits one.
- **Serverless / FaaS** — functions + managed services, event-triggered, scale-to-zero. Great for spiky/event glue, cron, low-baseline workloads. Watch: cold starts, vendor lock-in, statelessness requirement, per-invocation cost at high steady load, local-dev friction.

### 2.2 Internal structuring styles
- **Layered / N-tier** — presentation/application/domain/infrastructure. Familiar; degenerates into anemic layers + a fat service layer if domain logic leaks upward. Fine for CRUD-shaped apps.
- **Hexagonal (Ports & Adapters) / Clean / Onion** — domain core isolated from I/O; **dependencies point inward** (the Dependency Rule). Business logic depends on nothing external; DB/HTTP/queues are adapters behind ports. Keeps logic testable and infrastructure swappable. Use when the domain is rich and long-lived. Over-applied to a thin CRUD app, it's ceremony.
- **Vertical slice architecture** — organize by feature (each slice owns its request → domain → persistence), not by horizontal layer. Excellent for reducing cross-cutting change cost; pairs well with CQRS.

### 2.3 Integration / interaction styles
- **Request/response (sync)** — REST/gRPC/GraphQL. Use when the caller needs an **immediate answer** or strong consistency in one operation.
- **Event-driven / choreography** — services react to events on a bus; no central coordinator. Great for **decoupling and fan-out**; harder to trace, harder to reason about end-to-end flow. Pair with an **event catalog + correlation IDs + schema registry**. Mind **eventual consistency** everywhere downstream.
- **Orchestration** — a central coordinator (workflow/saga orchestrator) drives the steps. Easier to see/own the flow and handle compensation; reintroduces a coordinator to own. **Choreography for loose 1–3 step reactions; orchestration when the business process is long, branchy, and must be observable/owned.**
- **CQRS** — separate the **write model** (commands, invariants) from **read models** (denormalized projections per query). Use when read and write shapes/scales diverge sharply. Cost: two models to keep in sync (usually via events) and read-side eventual consistency. Not a default.
- **Event sourcing** — the **event log is the source of truth**; current state is a fold over events. Buys full audit, temporal queries ("state as of T"), and rebuildable projections. Cost: schema/versioning of events forever, snapshotting, replay complexity, "you can't just UPDATE a row." Use when audit/temporality is a hard requirement — **not** because it sounds elegant. Often paired with CQRS, but the two are independent.
- **BFF (Backend-for-Frontend)** — a per-client (web/mobile) aggregation layer so each frontend gets a tailored API without bloating core services. Use when multiple clients have divergent aggregation needs.

### 2.4 Domain-Driven Design (the boundary engine)
DDD is how you *find* the boundaries the styles above assume you already have.
- **Strategic:** **Bounded Context** (a model is consistent and unambiguous only within its boundary — "Customer" means different things in Billing vs Support), **Ubiquitous Language** (code and conversation share one vocabulary per context), **Context Map** (how contexts relate: partnership, customer-supplier, conformist, anti-corruption layer, shared-kernel, published-language). **A bounded context is the natural unit for a microservice.**
- **Tactical:** **Aggregate** (a consistency boundary — one transaction, one aggregate root enforces invariants), **Entity** (identity over time), **Value Object** (immutable, identity-less), **Domain Event** (something meaningful happened, named in past tense), **Repository** (collection-like persistence abstraction), **Domain Service** (logic that isn't a noun). **Aggregate-design rules:** keep aggregates small; reference other aggregates by ID, not object; one transaction = one aggregate; cross-aggregate consistency = eventual, via domain events.
- **Anti-Corruption Layer (ACL):** a translation boundary that keeps a legacy/3rd-party model from leaking into your clean model. Use at every messy integration seam.

---

## 3. API DESIGN

### 3.1 Principles
- **Contract-first.** Define the interface (OpenAPI / Protobuf / GraphQL schema) **before** implementation; it's the agreement between teams and the input to mocks, codegen, and contract tests. The contract is the product surface — design it like UX.
- **Right protocol for the job:**
  - **REST** — resource CRUD, broad reach, HTTP caching, public APIs. Use proper status codes and HTTP semantics (GET safe & idempotent, PUT/DELETE idempotent, POST not).
  - **GraphQL** — client-driven aggregation, avoids over/under-fetching, one endpoint, evolving clients. Cost: caching is harder, N+1 risk (use dataloaders), query-cost limiting is mandatory.
  - **gRPC** — low-latency, high-throughput **internal** service-to-service; strong typing via Protobuf, streaming. Poor browser story.
  - **Async events / messaging** — decoupling, fan-out, spike absorption, multiple consumers.
- **Model resources around the domain, not the database.** The API is a published language; don't leak table shapes or internal IDs you'll regret.

### 3.2 Hard rules
- **Versioning.** Additive changes (new optional field, new endpoint) are safe; **breaking changes get a new version** (URI `/v2`, header, or media-type). Apply **Postel's Law** at the edge (be liberal in what you accept, conservative in what you send) but **consumer-driven contract tests** (Pact) to catch breaks. Never silently break a consumer.
- **Idempotency.** Mutating endpoints accept an **idempotency key**; the server dedups so client retries are safe (the network *will* retry on your behalf). Critical for payments, order creation, any "exactly-once-ish" effect.
- **Pagination** (cursor/keyset over offset for large/changing sets — offset drifts and scans), **filtering, sorting, sparse fieldsets** — first-class.
- **Errors** — consistent machine-readable error shape (RFC 7807 problem+json or equivalent): stable error code, human message, trace/correlation ID, and *what to do*. Don't leak stack traces or internals.
- **Rate-limiting & quotas** with clear headers (limit/remaining/reset) and `429` + `Retry-After`.
- **Auth** — short-lived tokens (OAuth2/OIDC, JWT with rotation), least-privilege scopes, **authorize per resource not just per route**. Validate at the edge AND enforce ownership/tenant in the service.
- **Long-running work** — return `202 Accepted` + a status resource (async job), not a hung connection. Webhooks/callbacks for completion; make webhooks signed and idempotent on the receiver.
- **Compatibility for events too** — event schemas are contracts (Avro/Protobuf/JSON-Schema + registry, with forward/backward compatibility rules). Same discipline as APIs.

---

## 4. DISTRIBUTED-SYSTEMS REALITIES

### 4.1 The laws you don't get to repeal
- **Fallacies of Distributed Computing (8):** the network is reliable; latency is zero; bandwidth is infinite; the network is secure; topology doesn't change; there's one admin; transport cost is zero; the network is homogeneous. **All false. Design accordingly.**
- **CAP / PACELC.** Under a network **P**artition you choose **C**onsistency or **A**vailability. PACELC adds: **E**lse (no partition) you trade **L**atency vs **C**onsistency. Decide **per operation**, not per system — a single product mixes CP and AP paths.
- **Consistency models** — strong (linearizable), sequential, causal, read-your-writes / monotonic-reads (session guarantees), eventual. Pick per use-case; most real systems mix. Know that "eventual" needs a story for the window (stale reads, conflict resolution).
- **Two Generals / FLP / Lamport.** You cannot guarantee agreement over an unreliable channel; consensus has limits. Hence: **logical/vector clocks** for ordering, **quorums** (R+W>N) for tunable consistency, and **consensus protocols (Raft/Paxos)** when you truly need a single agreed value — delegate to proven systems (etcd, ZooKeeper, the DB), don't hand-roll consensus.

### 4.2 Getting effects to happen safely
- **Idempotency + "effectively-once."** True exactly-once delivery doesn't exist over a network. Achieve **effective-once processing** via idempotency keys + dedup store + idempotent handlers. Default messaging is **at-least-once** (so consumers MUST be idempotent); at-most-once loses messages.
- **Outbox pattern.** Write the business row **and** the event in **one local transaction** to an outbox table; a relay publishes the event reliably. Kills **dual-write drift** (the classic "DB committed but the event never published, or vice versa"). Pairs with CDC (Skill 01 §2.3). Inverse on the read side: **inbox/dedup table** for idempotent consumption.
- **Sagas.** Long-running cross-service transactions as a sequence of local transactions with **compensating actions** (semantic undo) instead of distributed locks/2PC. **Choreography saga** (events) for short flows; **orchestration saga** (a coordinator) for long, branchy, observable flows. Design compensations up front; some actions aren't truly reversible (money sent, email delivered) → compensate with a counter-action, not a rollback.
- **Avoid distributed transactions (2PC/XA)** unless a single resource manager forces it — they're slow, lock-heavy, and a coordinator failure wedges everyone. Prefer sagas + idempotency + outbox.

### 4.3 Resilience patterns (Nygard, *Release It!*)
- **Timeout** — every remote call has one. No timeout = unbounded resource hold = the seed of cascading failure.
- **Retry with exponential backoff + jitter** — and only for **retryable** (transient) errors; never retry non-idempotent ops without an idempotency key. Cap attempts; add a **retry budget** so retries can't amplify an outage (retry storms).
- **Circuit breaker** — after N failures, **open** (fail fast) for a cooldown, then **half-open** to probe. Stops hammering a sick dependency and gives it room to recover.
- **Bulkhead** — isolate resource pools (threads/connections) per dependency so one slow dependency can't drown the whole service (the ship-compartment metaphor).
- **Fallback / graceful degradation** — serve cached/default/partial results when a dependency is down. Decide the degraded UX deliberately.
- **Backpressure & load shedding** — when overloaded, push back (reject early, `429`/`503`) rather than collapse. Bounded queues, not infinite ones. **Little's Law** (L = λW) governs queue length vs arrival rate vs latency — an unbounded queue under sustained overload only grows latency to infinity.
- **Idempotent + replayable** consumers so retries and replays are safe.
- **Rate limiting / quotas / fair scheduling** to protect shared resources from a noisy neighbor.

### 4.4 Time, ordering, identity
- Don't trust wall-clock ordering across nodes (clock skew). Use **logical clocks / sequence numbers / event versions**. For "happened-before," vector clocks. For global ordering, a single log (Kafka partition) or a consensus-backed sequencer.
- **Correlation IDs / trace context** propagate through every hop (W3C Trace Context) — non-negotiable for debugging distributed flows.

---

## 5. SCALING & PERFORMANCE

### 5.1 The discipline
- **Measure before you scale. The bottleneck is rarely where you guess.** Profile, trace, find the dominant cost. Amdahl's & the **Universal Scalability Law** (USL: contention *and* coherency/coordination costs cap and even reverse speedup) — adding nodes/threads has diminishing then negative returns once coordination dominates. Reduce coordination before adding capacity.
- **Scale path (cheapest → most invasive):** profile/optimize the hot path → add indexes/fix N+1 (often a data problem, see Skill 01) → cache → read replicas → vertical scale → horizontal scale / shard → async/queue offload → split the service. Don't skip to sharding because it's exciting.
- **Know your numbers.** Latency budgets, p50/p95/p99 (tail latency is the real UX — chase p99, not the average), throughput, and the "back-of-envelope" latency numbers (memory ns, SSD µs, network ms, cross-region tens of ms). Architecture is largely the art of respecting these orders of magnitude.

### 5.2 Levers
- **Statelessness at the service tier** → horizontal scaling is trivial; push state to the data tier, caches, and the client/token. Sticky sessions are a smell.
- **Caching layers** — client, CDN/edge, application (Redis/Memcached), DB query cache / **materialized views**. **Define the invalidation strategy *before* adding a cache** (TTL, write-through, write-behind, cache-aside, explicit bust). The two hard things: naming, and cache invalidation. Watch **stampede/thundering-herd** (single-flight, jittered TTL), **stale-while-revalidate**, and the cache-as-source-of-truth trap.
- **Async over sync** for anything that doesn't need an immediate answer — queues smooth spikes, decouple producers/consumers, and turn a synchronous fan-out into a resilient pipeline.
- **Read/write split** — replicas for reads (mind replica lag → read-your-writes routing when needed); the primary for writes.
- **Sharding/partitioning** — by a key with even distribution and locality; avoid hot keys and cross-shard joins/transactions. This is a one-way-ish door — pick the shard key carefully (Skill 01 territory).
- **Connection & resource pooling** — bound DB connections (a pool, not per-request connections); the DB is usually the first thing to fall over under load.
- **Batching & coalescing** — turn chatty N calls into one; debounce/aggregate where latency budget allows.

### 5.3 Capacity & cost
- Capacity-plan against **p99 + headroom**, autoscale on the *right* signal (queue depth / RPS / latency, not just CPU). Cost is an architectural property — egress, cross-AZ traffic, and idle over-provisioning are silent budget killers. The Well-Architected pillars (operational excellence, security, reliability, performance, cost, sustainability) are a useful checklist, not a religion.

---

## 6. OPERABILITY, RELEASE & EVOLUTION (the part juniors skip)

- **12-Factor floor:** config in env, stateless processes, explicit dependencies, logs as event streams, disposability (fast startup + graceful shutdown), dev/prod parity, port-binding, backing services as attached resources.
- **Observability = logs + metrics + traces** (the three pillars) plus **correlation IDs** binding them. **Structured logs** (not string soup), **RED metrics** (Rate, Errors, Duration) for services and **USE** (Utilization, Saturation, Errors) for resources. You can't operate what you can't see — and per §1.7, the running version must be visible.
- **Health & lifecycle:** liveness vs readiness probes (readiness gates traffic; liveness restarts), graceful drain on shutdown, idempotent startup, run migrations as an explicit, ordered, reversible step (never implicitly at boot in a way that races replicas).
- **Safe release:** small batches, **feature flags** (decouple deploy from release), blue/green or **canary** with automatic rollback on SLO regression, **expand/contract (parallel-change)** for schema & API changes (add new → migrate readers/writers → remove old; never break in one shot). **DORA metrics** (deploy frequency, lead time, change-fail rate, MTTR) are the scoreboard — *Accelerate* shows small, frequent, reversible changes are both faster AND safer.
- **SLI/SLO/error budgets** (Google SRE): define what "good" means (SLIs), the target (SLOs), and spend the **error budget** to balance velocity vs reliability. Alert on **symptoms/SLO burn**, not every cause.
- **Migration & legacy:** **Strangler Fig** (route slice-by-slice from old to new behind a façade; never big-bang rewrite), **branch-by-abstraction**, **parallel-run** (run old+new, compare) for risky cutovers. Reversible, value-delivering increments — mirror of Skill 01's anti-big-bang stance.
- **Security baseline:** least privilege everywhere, secrets in a vault (never in code/env-in-repo), TLS in transit, input validation at the boundary, authZ in the service (not just the gateway), tenant isolation enforced (see Skill 01 RLS), dependency/SBOM scanning, and **the running version pinned & known** (supply-chain + §1.7 scar).

---

## 6.5 APPLICATION SECURITY — the threat-class playbook (decision-ready)

> Added 2026-06-24 while remediating the GAAhex audit (RLS/injection/SSRF/SoD clusters). Security is not a layer you add — it's a property you design in. Two master rules govern all of it: **(a) validate at the boundary AND enforce in the service** (the gateway is not a security control; the service owns its invariants), and **(b) fail CLOSED** — on any doubt, ambiguity, missing input, or error, DENY. An authZ check that defaults to allow on `None` is a vulnerability, not a bug.

**Master operating rules**
1. **Never build an interpreter string from untrusted input.** SQL, shell, OS commands, LDAP, device CLIs, template engines — all are interpreters. *Fix order:* (1) don't call the interpreter; (2) parameterize / use the structured API (bound query, `argv` array — never `shell=True`); (3) if you truly must interpolate, **allowlist the charset and reject** (don't escape-and-hope). For device/OLT/CLI drivers: allowlist serial/MAC/profile to `[A-Za-z0-9:_-]`, reject everything else, build the command from a fixed template with validated tokens.
2. **AuthZ is per-resource, default-DENY, and server-side.** Route-level "is logged in" ≠ "may touch THIS object". Check ownership/tenant/role on the specific resource, in the service. **IDOR** = trusting a client-supplied id without an ownership check. **Tenant isolation** belongs in the DB (RLS + FORCE — Skill 01), not just the query's WHERE. If region/dept/owner all resolve to `None`, DENY (never "no scope → allow all").
3. **Separation of Duties (SoD) / four-eyes.** The actor who *requests* a privileged action (refund, credit note, role grant, customer delete) must not be the one who *approves/executes* it: reject `decided_by == requested_by`. Approve the **binding** (who gets the role/assignment), not only the role definition — self-grant is the classic bypass. No-self-approval is an invariant, enforced + tested, not a UI nicety.
4. **SSRF — treat every server-side fetch as hostile.** Before a server makes an outbound request to any URL influenced by data: **allowlist** the destination if possible; otherwise resolve the host and **block private / loopback / link-local / cloud-metadata (169.254.169.254) / ULA / DNS-rebind** ranges; `follow_redirects=False` (a 302 to `http://169.254…` defeats a pre-check); **re-validate after DNS resolution** (TOCTOU), and re-apply the check on every hop. Prefer a dedicated egress proxy. Re-check the URL *immediately before* the POST, not only at config time.
5. **Transport auth & integrity — verify, never disable.** TLS cert verification ON (never `verify=False`); **SSH host-key verification ON** (`known_hosts` pinned — `known_hosts=None`/`AutoAddPolicy` is a MITM hole), pin strong KEX/ciphers. **Inbound webhooks (Stripe/Twilio/SendGrid): verify the HMAC signature** with the shared secret using a **constant-time compare**, check the **timestamp window** (replay defense), and make the handler **idempotent**. An unsigned/unverified webhook endpoint is an unauthenticated mutation API.
6. **Secrets:** vault/KMS, never in code or committed env; rotate; **never log credentials/enable-passwords/tokens** (scrub before logging to action/audit tables). Field-level encryption for PII at rest where required.
7. **Output & content safety:** sanitize server-side (don't rely on the frontend's DOMPurify as the only line); `Content-Type` sniff + `X-Content-Type-Options: nosniff`; `Content-Disposition: attachment` + AV-scan on uploads; `rel="noopener"` on outbound anchors; scheme-allowlist any `assetUrl`/redirect target. **Constant-time compare** for any secret/token/signature equality.
8. **Resource fencing & money:** DB partial-unique constraints on active resources (IP/MAC/session), parent-validation on assignment, idempotency keys on payment creation, and ledger writes that actually move balances — concurrency (TOCTOU) closed with the fence in the DB, not the app check.

**AuthZ flow (canonical):** authenticate → resolve the actor's scopes/ownership → for the specific resource, `assert_can(actor, action, resource)` default-DENY → enforce tenant via RLS at the DB → log the decision. Edge gateway = depth-in-defence, never the only gate.

**Anti-patterns (security):** string-interpolated SQL/shell/CLI commands · `verify=False` / `known_hosts=None` / `AutoAddPolicy` · webhook handler with no signature check · authZ on the route but not the object (IDOR) · self-approval allowed · `assert_can` that returns allow on missing scope (fail-open) · SSRF check before redirects / before DNS re-resolution · secrets in code/logs · client-side-only validation/sanitization · `==` on secrets (timing leak) · "we'll add security later".

**Reference frames:** OWASP Top 10 (Broken Access Control is #1 — it's almost always authZ), OWASP ASVS (verification checklist), STRIDE (threat-model per trust boundary: Spoofing/Tampering/Repudiation/Info-disclosure/DoS/Elevation), the principle of least privilege, defence in depth, and **assume breach** (limit blast radius; an inner control must hold even if an outer one fails — exactly why FORCE-RLS contains even the table owner).

---

## 7. DECISION RULES (fast, reusable)

- **Monolith or services?** Small team / early / unclear domain → **modular monolith**. Independent scaling + team autonomy + fault isolation + a *clear bounded context* present → extract that one service. Default to fewer, larger services; split on a proven force, never on count.
- **Where to draw the service boundary?** Along a **bounded context / business capability with its own data**. If two "services" share a transaction or a table, they're one service.
- **Sync or async?** Need an immediate answer / strong single-op consistency → **sync API**. Decoupling / fan-out / spike-smoothing / multiple consumers / cross-domain side-effect → **async events**. **Cross-context side-effects → events, not inline calls** (mirrors Skill 01).
- **Choreography or orchestration?** 1–3 loose reactions → **choreography**. Long, branchy, must-be-observable-and-owned business process → **orchestration / saga orchestrator**.
- **REST / GraphQL / gRPC?** Public/resource CRUD/cacheable → REST. Client-driven aggregation, many clients → GraphQL (+ BFF if needed). Internal low-latency hot path → gRPC.
- **SQL or NoSQL?** Relationships + transactions + ad-hoc queries → relational. Known access pattern + massive scale + denormalized → NoSQL. **Default relational until a force says otherwise** (defer to Skill 01).
- **CQRS / event sourcing?** Read & write shapes/scales diverge sharply → CQRS. Audit/temporality is a hard requirement → event sourcing. Otherwise **no** — they are not defaults.
- **Build or buy?** Commodity (auth, payments, mail, queues, observability) → **buy/manage**. Core differentiator / your moat → **build**. Evaluate on fit, TCO, lock-in/exit, security, extensibility, team capacity.
- **Add a cache?** Only with a **measured read bottleneck** *and* a **defined invalidation strategy**. Never "just add Redis."
- **Retry this call?** Only if the error is transient AND the operation is idempotent (or you hold an idempotency key). Always with backoff+jitter and a cap/budget.
- **Reversible vs irreversible?** Two-way door (a flag, a cache, an internal API shape) → decide fast, iterate. One-way door (public API contract, event schema in flight, shard key, primary datastore, tenancy model) → deliberate hard, write an ADR.
- **Is it done?** Not when the happy path works — when it's **observable, deployable safely, idempotent/recoverable, and the running version is verifiable** (§1.7).

---

## 8. ANTI-PATTERNS (smell → fix)

- **Distributed monolith** — services that must deploy together / call each other synchronously in a chain. *Fix:* fix boundaries (DDD contexts), or merge back; make each independently deployable.
- **Chatty services** — N calls per request, N+1 across the network. *Fix:* coarser APIs, batching/coalescing, BFF, or merge the boundary.
- **Shared database across services** — hidden coupling, no real autonomy. *Fix:* one owner per data; integrate via API/events; database-per-service.
- **Dual writes** — app writes the same fact to two stores → drift. *Fix:* **outbox + CDC**, one writer, derive the rest.
- **No timeouts / unbounded retries / unbounded queues** — cascading failure & retry storms. *Fix:* timeouts everywhere, backoff+jitter, retry budgets, circuit breakers, bounded queues + load shedding.
- **Retry storm / thundering herd** — synchronized retries hammer a recovering service into the ground; cold cache stampede. *Fix:* jitter, circuit breakers, single-flight, jittered TTLs, backpressure.
- **Premature microservices** — distributed complexity with no organizational need or clear contexts. *Fix:* modular monolith first; extract on a real force.
- **Nanoservices** — services so fine-grained that a single feature needs a dozen of them in lockstep. *Fix:* right-size up; the boundary is a capability, not a function.
- **God service / anemic boundaries** — everything routes through one service (or one anemic "domain" with logic in a fat service layer). *Fix:* re-derive boundaries from capabilities; push logic into the domain model (rich, not anemic).
- **Synchronous chain of doom** — A→B→C→D in-band; D's latency/failure is everyone's. *Fix:* async hand-offs, bulkheads, fallbacks, or collapse the chain.
- **Leaky/implicit contracts** — consumers depend on undocumented fields/behavior; a "small" change breaks 14 callers. *Fix:* contract-first + consumer-driven contract tests + versioning + expand/contract.
- **Big-bang rewrite/cutover** — flip the whole system at once. *Fix:* **Strangler Fig**, branch-by-abstraction, parallel-run, phased & reversible (mirrors Skill 01).
- **Hardcoded config / secrets in code** — env-specific values and credentials baked in. *Fix:* 12-Factor config in env, secrets in a vault, rotated.
- **Smart pipes / logic in the bus** — business rules living in the message broker / ESB. *Fix:* **smart endpoints, dumb pipes** (Fowler) — logic in services, transport in the bus.
- **Caching without invalidation** — stale data served forever, or cache-as-source-of-truth. *Fix:* defined invalidation (TTL/write-through/bust) + cache-aside; the store is the truth.
- **Observability as an afterthought** — no traces, string logs, can't tell why p99 spiked. *Fix:* structured logs + RED/USE metrics + distributed tracing + correlation IDs from day one.
- **Source-running drift** — assuming edits are live when the process still runs old code (no hot-reload), or config/version drift between repo and deploy. *Fix:* restart/reload, **verify against the running process**, surface the running version (the **2026-06-23 scar**, §1.7).
- **Speculative generality / framework astronaut** — abstraction layers and patterns for requirements that don't exist. *Fix:* YAGNI; build for the real, present force; keep it simple (Hickey-simple).
- **Ignoring Conway's Law** — architecture cuts across team boundaries, so every change needs three teams. *Fix:* align team topology with the desired architecture (Inverse Conway).

---

## 9. CANON QUICK-REFERENCE (named correctly)

- **Conway's Law** — system ≈ org communication structure. **Inverse Conway Maneuver** — shape teams to shape architecture. (*Team Topologies* — Skelton & Pais.)
- **Fallacies of Distributed Computing (8)** — Deutsch/Gosling. Assume all false.
- **CAP** (Brewer) / **PACELC** (Abadi) — partition→C-or-A; else→L-or-C.
- **Fowler / PoEAA** — enterprise patterns; **smart endpoints, dumb pipes**; **StranglerFig**; microservices canon.
- **Evans (DDD) / Vernon** — bounded context, ubiquitous language, aggregates, ACL.
- **Newman** — *Building Microservices*, *Monolith to Microservices* (incremental decomposition, the independent-deployability test).
- **Kleppmann (DDIA)** — the bible for data-intensive distributed systems (replication, partitioning, consistency, stream processing).
- **Nygard (*Release It!*)** — stability patterns (timeout, circuit breaker, bulkhead) & anti-patterns; the production-readiness mindset.
- **Hohpe & Woolf** — *Enterprise Integration Patterns* (messaging vocabulary).
- **12-Factor App** — config/process/disposability discipline for cloud-native services.
- **Reactive Manifesto** — responsive, resilient, elastic, message-driven.
- **Google SRE** — SLI/SLO/error budget, toil, alert-on-symptoms.
- **DORA / Accelerate** — deploy freq, lead time, change-fail rate, MTTR; small & frequent = faster & safer.
- **Well-Architected (AWS/GCP/Azure)** — operational excellence, security, reliability, performance, cost, sustainability.
- **Laws/limits** — Brooks ("no silver bullet", adding people to a late project), Lamport (happened-before, logical clocks), FLP impossibility, Two Generals, Little's Law, Amdahl & Universal Scalability Law, Postel's Law, YAGNI/KISS/DRY, *Simple Made Easy* (Hickey).

---

## 10. ԲԱՌԱՐԱՆ (glossary)

cohesion/coupling · bounded context · ubiquitous language · context map · anti-corruption layer (ACL) · aggregate/entity/value-object · domain event · modular monolith · microservices · service-based · serverless/FaaS · layered/N-tier · hexagonal/ports-adapters · clean/onion · vertical slice · BFF · event-driven · choreography vs orchestration · CQRS · event sourcing · saga (choreographed/orchestrated) · compensating action · outbox/inbox · CDC · 2PC/XA · idempotency key · effectively-once · at-least/at-most-once · dual write · CAP/PACELC · consistency models (strong/causal/eventual/read-your-writes) · linearizability · quorum (R+W>N) · consensus (Raft/Paxos) · logical/vector clock · Two Generals/FLP · Fallacies of Distributed Computing · circuit breaker · bulkhead · timeout · backoff+jitter · retry budget · backpressure · load shedding · fallback/graceful degradation · Little's Law · USL/Amdahl · contract-first · OpenAPI/Protobuf/GraphQL/gRPC · REST semantics · versioning/expand-contract/parallel-change · consumer-driven contract test (Pact) · Postel's Law · cursor/keyset pagination · rate limiting · OAuth2/OIDC/JWT · webhook · schema registry · cache (cache-aside/write-through/write-behind) · invalidation/TTL · thundering herd/single-flight · materialized view · stateless · sharding/partitioning/hot key · read replica/replica lag · connection pool · 12-factor · liveness/readiness · graceful drain · feature flag · blue-green/canary · strangler fig · branch-by-abstraction · DORA metrics · SLI/SLO/error budget · RED/USE · observability (logs/metrics/traces) · correlation/trace ID · W3C Trace Context · Conway's Law / Inverse Conway · smart endpoints dumb pipes · Well-Architected pillars · ADR · fitness function.

---

*EN: Skill 02 v3 — top-level, living. Boundaries first, contracts explicit, failure assumed, complexity earned. Build it correct, evolvable, observable, and only as complex as it must be. The running system is the truth — verify against it.*
*HY: Skill 02 v3 — top-level, living։ Boundaries-ը առաջինը, contract-ները բացահայտ, failure-ը՝ ենթադրված, complexity-ն՝ վաստակած։ Կառուցիր ճիշտ, evolvable, observable ու ճիշտ այնքան complex, որքան պետք է։ Աշխատող system-ն է ճշմարտությունը — դրա դեմ verify արա։ 💪🤍*
