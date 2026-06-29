# Software Systems Architecture owner notes

## English

### Needs human review when

This skill designs and reasons about system structure; it produces the plan, the invariant, and the tradeoff, but it must route to a human owner — not act or auto-approve — when a decision is irreversible, can lose data, breaks a contract others depend on, or sets a security boundary. Escalate and require explicit approval when:

- **Irreversible structural or data changes** — schema migrations that drop or rewrite data, splitting/merging services in a way that cannot be cleanly rolled back, deleting or replacing a live data store. Name the rollback (and an expand/contract reversible path) before proceeding; a destructive migration needs a backup/restore plan and a human owner's go.
- **Breaking a public or cross-team contract** — removing or renaming an API/event field, changing semantics consumers rely on. The architecture can design the version and migration, but shipping the break is gated on the consumer owners' acknowledgment and the deprecation window, not unilateral.
- **Security trust-boundary and blast-radius decisions** — where authn/authz sits, how far one compromise spreads, privilege scope, secret handling. Architecture places the boundary; the concrete control design, threat model, and crypto/standard choices are owned by security (`cybersecurity-operations-soc`), and a boundary that changes the security posture needs their sign-off.
- **Consistency relaxations on a money/permission/inventory invariant** — moving a strong-consistency invariant to eventual to win latency or cost is a business-risk decision (overselling, stale permissions, double-spend). Surface the unsafe-on-stale action and the bounded stale window; the relaxation is approved by the invariant's business owner, not chosen for convenience.
- **Adopting heavy architecture (microservices / event sourcing / CQRS / a mesh)** — these commit the team to lasting operational tax. Present the invariant that would justify it and the rejected simpler alternative; the commitment is an owner decision, because it is hard to reverse.
- **Disabling a safety mechanism under pressure** — shipping a retry with no idempotency key, skipping the compensation path, removing an authz check to "unblock." Allowed only with explicit, time-boxed owner sign-off and a stated re-enable plan.

The default posture for all of the above: produce the design, the invariant, the tradeoff, and the rollback; then stop and route to the owner. Do not execute the irreversible step on your own authority, and route control design to security.

### Owned future-improvement items

- Add a third worked example for **expand/contract schema migration** (additive change → dual-write → backfill → switch read → contract), since it is the reversible path whenever a single atomic cutover is unsafe.
- Add a **CQRS / event-sourcing decision worked example** that shows the invariant test (does this read/write divergence or audit/replay need actually justify the complexity?) end to end, so the right-sizing rule is concrete, not just stated.
- Add a **process-manager recovery recipe** for choreographed workflows (timeout sweeper, stuck-workflow detection, compensation trigger) so the choreography end-state-owner requirement is copy-ready.
- Cross-link the security boundary explicitly to `cybersecurity-operations-soc` for the threat model and control catalogue, beyond the placement/least-privilege/blast-radius design owned here.
- Add a **vector-clock vs single-sequence worked micro-example** to make the "when do you actually need concurrency detection" call concrete.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը նախագծում և դատում է համակարգի կառուցվածքի մասին. այն արտադրում է պլանը, invariant-ը և tradeoff-ը, բայց պետք է ուղղորդի մարդ-տիրոջը — ոչ թե գործի կամ ինքնահաստատի — երբ որոշումը անդառնալի է, կարող է data կորցնել, կոտրում է contract, որից ուրիշներ կախված են, կամ սահմանում է security boundary։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Անդառնալի կառուցվածքային կամ data փոփոխություններ** — schema migration, որ data drop կամ rewrite է անում, service-ների split/merge այնպես, որ չի կարող մաքուր rollback լինել, live data store-ի ջնջում/փոխարինում։ Անվանի՛ր rollback-ը (և expand/contract հետշրջելի path) մինչև շարունակելը. destructive migration-ին պետք է backup/restore plan և մարդ-տիրոջ go։
- **Public կամ cross-team contract-ի կոտրում** — API/event field-ի հեռացում կամ rename, consumer-ների վրա հիմնված semantics-ի փոփոխություն։ Architecture-ը կարող է նախագծել version-ը և migration-ը, բայց break-ը ship անելը gated է consumer owner-ների ընդունմամբ և deprecation window-ով, ոչ միակողմանի։
- **Security trust-boundary և blast-radius որոշումներ** — որտեղ է authn/authz-ը, որքան հեռու է տարածվում մեկ compromise-ը, privilege scope-ը, secret handling-ը։ Architecture-ը տեղադրում է boundary-ն. կոնկրետ control-ի դիզայնը, threat model-ը և crypto/standard ընտրությունները security-ինն են (`cybersecurity-operations-soc`), և boundary, որ փոխում է security posture-ը, պետք է նրանց sign-off-ը։
- **Consistency-ի թուլացում money/permission/inventory invariant-ի վրա** — strong-consistency invariant-ը eventual դարձնելը latency-ի կամ cost-ի համար business-risk որոշում է (overselling, stale permission, double-spend)։ Ցույց տուր unsafe-on-stale action-ը և bounded stale window-ը. թուլացումը հաստատվում է invariant-ի business owner-ի կողմից, ոչ ընտրվում convenience-ի համար։
- **Ծանր architecture-ի ընդունում (microservices / event sourcing / CQRS / mesh)** — սրանք թիմին պարտավորեցնում են մշտական operational tax-ի։ Ներկայացրու invariant-ը, որ կարդարացներ, և մերժված ավելի պարզ alternative-ը. commitment-ը owner-ի որոշում է, որովհետև դժվար է հետշրջել։
- **Safety mechanism-ի անջատում ճնշման տակ** — retry ship անել առանց idempotency key-ի, compensation path-ը բաց թողնել, authz check հեռացնել «unblock» անելու համար։ Թույլատրելի է միայն հստակ, ժամանակ-սահմանված owner-ի sign-off-ով և նշված re-enable պլանով։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր design-ը, invariant-ը, tradeoff-ը և rollback-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Անդառնալի քայլը մի՛ կատարիր սեփական լիազորությամբ, և control-ի դիզայնը ուղղորդիր security-ին։

### Սեփական ապագա-բարելավման կետեր

- Ավելացրու երրորդ worked example **expand/contract schema migration**-ի համար (additive change → dual-write → backfill → switch read → contract), քանի որ դա հետշրջելի path-ն է, երբ մեկ atomic cutover-ը unsafe է։
- Ավելացրու **CQRS / event-sourcing որոշման worked example**, որ ցույց տա invariant-ի test-ը (արդյո՞ք այս read/write շեղումը կամ audit/replay կարիքը իսկապես արդարացնում է complexity-ն) ծայրից ծայր, որ right-sizing կանոնը կոնկրետ լինի, ոչ միայն ասված։
- Ավելացրու **process-manager recovery recipe** choreographed workflow-ների համար (timeout sweeper, խրված-workflow-ի հայտնաբերում, compensation trigger), որ choreography-ի end-state-owner պահանջը copy-ready լինի։
- Cross-link արա security boundary-ն բացահայտ `cybersecurity-operations-soc`-ին threat model-ի և control catalogue-ի համար, այստեղ տիրվող placement/least-privilege/blast-radius design-ից այն կողմ։
- Ավելացրու **vector-clock ընդդեմ single-sequence worked micro-example**, որ «երբ ես իսկապես concurrency detection-ի կարիք ունես» որոշումը կոնկրետ լինի։
