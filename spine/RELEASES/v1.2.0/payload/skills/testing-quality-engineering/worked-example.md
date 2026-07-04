# Testing and Quality Engineering worked examples

## English

### Example A — test strategy + flaky triage

**Prompt.** A payment API change adds an `authorization_status` field returned to checkout. Build a senior-quality test strategy, and the current E2E test is flaky — design that too.

**Senior answer.** Map risk to the cheapest catching layer, not a test count:

- **Unit** — status mapping (`approved`/`declined`/`pending` from the gateway codes); fast, deterministic, the bulk of the cases.
- **Property** — an invariant: a terminal status (`approved`/`declined`) is absorbing — for any sequence of events the order never transitions back to `pending`. Generate event sequences and assert it (see `manual.md` §property-test snippet).
- **Contract (consumer-driven)** — checkout depends on `authorization_status` matching `approved|declined`; pin it as a consumer-driven contract and verify the provider against it in CI, so a rename or a new enum value breaks the build, not production.
- **Integration** — one test against the payment sandbox to prove the real wiring (mock only the gateway at the network boundary, not checkout's own collaborators).
- **E2E** — exactly one happy-path purchase journey; do not push the matrix of statuses up here.
- **Mutation** — run mutation testing on the decline-handling and status-mapping code (where a bug means charging or refusing wrongly); chase surviving mutants and add the killing assertions. Report mutation score on these modules, not coverage.

**Flaky triage.** The E2E fails only around midnight UTC. Source is a wall-clock/timezone fixture, not a product bug — a date rolls over mid-test. Quarantine for 48h with an owner; replace the wall-clock with an injected clock so the test is deterministic; remove from quarantine after 20 clean runs on the fix. It is recorded on a flake card (source = time, owner, removal condition), never reran-to-green.

**Why this passes.** It maps each feared failure to the cheapest layer that catches it (mapping → unit, invariant → property, boundary → contract, wiring → integration, journey → one E2E) instead of asking for "more tests," so the pyramid stays upright. It does not trust coverage on the money path: it names mutation testing on decline-handling and reports mutation score there, the honest confidence number. The contract is consumer-driven and provider-verified in CI, so the field rename that would have been a production integration outage becomes a build failure. The integration test mocks only the gateway at the network boundary — not checkout's internal collaborators — so it cannot pass while the real wiring is broken. And the flake is triaged to a named source (timezone), fixed at the cause (injected clock), and gated by a removal condition — not reran until green.

### Example B — destructive-fixture safety

**Prompt.** Our integration tests truncate all tables in teardown so each run starts clean. A teammate ran them locally with `DATABASE_URL` still pointed at the shared staging database and wiped it. How should the test suite be built so this can never happen again?

**Senior answer.** The teardown destroys data, so the target must be proven disposable before any destroy — this is a hard gate, not a convention. Add an executable guard at the top of the destructive fixture:

1. **Allowlist the disposable target by explicit name/marker**, not a denylist of "prod-like" names. Maintain `ALLOWED_TEST_DBS = {"app_test", "app_ci"}` and assert the connection's database name is in it before truncating; add a `prod`/`staging` exclusion as a second belt.
2. **Fail closed.** If the target is not provably a test database, the fixture raises and the suite stops — no best-effort delete, no "warn and continue."
3. **Cover the guard with a test** that it refuses a non-test target (point it at `staging` in a test and assert it raises before any destroy runs).
4. **Apply the same law to filesystem/cache teardown** (`rm -rf`, `FLUSHALL`) — every destructive step asserts its target first.
5. **Report the wipe as a near-miss/incident**, restore staging from backup, and add the missing guard so the class of failure is closed, not just this instance.

The guarded fixture (see `manual.md` §destructive-fixture safety law) refuses to run unless the database name is on the allowlist, so a stray `DATABASE_URL` errors out instead of wiping a real environment.

**Why this passes.** It treats the wipe as a class of failure to design out, not a one-off human mistake to scold — the fix is an executable assertion that makes the destructive step impossible to point at staging/prod. It allowlists the disposable target (fail-closed) rather than denylisting dangerous names, which is the only direction that is safe against an unforeseen environment. It covers the guard with its own test, so the safety mechanism itself cannot silently rot. It extends the rule to filesystem/cache teardown, closing the whole destructive surface, not just the database. And it handles the existing damage (restore from backup) while shipping the control, so the same stray variable can never wipe a real environment again.

### Example C — consumer-driven contract, end to end

**Prompt.** The `checkout` service (consumer) calls the `pricing` service (provider). Pricing renamed a field `amount` → `total_cents` and shipped it; checkout broke in production even though both services' own unit tests were green. Design the test that would have caught it, end to end.

**Senior answer.** Green unit tests on each side cannot catch this — the bug lives in the **integration contract** between them, and each side's mocks do not reflect the other's reality. The fix is a **consumer-driven contract (CDC)** test (Pact-style): the consumer declares what it depends on, and the provider is verified against that declaration *before it can deploy*.

1. **Consumer pins the contract.** In checkout's suite, write a consumer test that stands up a mock of pricing and asserts the exact request checkout sends and the exact response fields it *relies on* — e.g. "given a valid cart, `GET /price` returns a body with `amount` (integer)." This emits a **pact file** listing only the fields checkout actually uses, not the whole schema.
2. **Publish the contract** to a broker (or shared artifact), tagged with the consumer version.
3. **Verify the provider against it in CI.** Pricing's pipeline runs **provider verification**: replay every interaction in the pact against the real pricing service and check the response still satisfies the consumer's expectations. When pricing renames `amount` → `total_cents`, provider verification **fails** — "checkout expected `amount`, got `total_cents`" — and the pricing deploy is blocked. The break is caught in pricing's CI, before prod, by the *consumer's* expectation, which no provider-side unit test encodes.
4. **Coordinated version bump (expand/contract).** To ship the rename safely: pricing adds `total_cents` **alongside** `amount` (both in the response) → verification passes (old contract still satisfied) → checkout migrates to read `total_cents` and publishes a new pact → once no consumer pact references `amount`, pricing removes it and re-verifies. The contract is what tells pricing it is safe to drop the old field: "no consumer depends on it anymore."

**Why this passes.** It diagnoses the failure precisely — green unit tests on both sides cannot catch a **contract** break because each side mocks the other, so the mocks drift from reality — and prescribes a **consumer-driven contract** where the consumer's real expectations are verified against the real provider in CI *before deploy*. It shows the mechanism **from break to fix**: the rename fails provider verification (the exact missing signal), and the safe path is an **expand/contract coordinated bump** (add-alongside → migrate consumer → drop when no pact references the old field), with the contract itself gating the drop. It closes the gap the prompt named — a change that passed every unit test still broke the integration — by moving the check to the seam where the two services actually meet.

## Հայերեն

### Օրինակ A — test strategy + flaky triage

**Prompt.** Payment API-ի փոփոխությունը ավելացնում է `authorization_status` field, որ վերադարձվում է checkout-ին։ Կառուցիր senior-quality test strategy, և current E2E test-ը flaky է — դա էլ նախագծիր։

**Senior պատասխան.** Risk-ը կապիր ամենաէժան բռնող layer-ին, ոչ test count-ի․

- **Unit** — status mapping-ը (`approved`/`declined`/`pending` gateway code-երից). արագ, deterministic, դեպքերի մեծ մասը։
- **Property** — invariant․ terminal status-ը (`approved`/`declined`) absorbing է — event-ների ցանկացած հաջորդականության համար order-ը երբեք չի վերադառնում `pending`։ Generate արա event sequence-ներ և assert արա այն (տես `manual.md` §property-test snippet)։
- **Contract (consumer-driven)** — checkout-ը կախված է `authorization_status`-ից, որ համապատասխանում է `approved|declined`-ի. pin արա այն որպես consumer-driven contract և verify արա provider-ը դրա դեմ CI-ում, որ rename-ը կամ նոր enum արժեքը կոտրի build-ը, ոչ production-ը։
- **Integration** — մեկ test payment sandbox-ի դեմ՝ իրական wiring-ը ապացուցելու (mock արա միայն gateway-ը network boundary-ի մոտ, ոչ checkout-ի սեփական collaborator-ները)։
- **E2E** — հենց մեկ happy-path purchase journey. status-ների matrix-ը այստեղ վեր մի՛ հրիր։
- **Mutation** — գործարկիր mutation testing decline-handling-ի և status-mapping code-ի վրա (որտեղ bug-ը նշանակում է սխալ charge կամ մերժում). հետապնդիր գոյատևող mutant-ները և ավելացրու սպանող assertion-ները։ Report արա mutation score-ը այս module-ների վրա, ոչ coverage-ը։

**Flaky triage.** E2E-ը fail է անում միայն midnight UTC-ի շուրջ։ Աղբյուրը wall-clock/timezone fixture է, ոչ product bug — ամսաթիվը roll-over է անում test-ի մեջտեղում։ Quarantine արա 48ժ owner-ով. փոխարինիր wall-clock-ը injected clock-ով, որ test-ը deterministic լինի. հանիր quarantine-ից 20 clean run-ից հետո fix-ի վրա։ Այն գրանցված է flake card-ի վրա (source = time, owner, removal condition), երբեք rerun-ով-green չի արվում։

**Ինչու է անցնում gate-ը.** Այն ամեն վախեցող ձախողում կապում է ամենաէժան բռնող layer-ին (mapping → unit, invariant → property, boundary → contract, wiring → integration, journey → մեկ E2E)՝ «ավելի շատ test» խնդրելու փոխարեն, ուստի pyramid-ը մնում է ուղիղ։ Այն coverage-ին չի վստահում money path-ի վրա․ անվանում է mutation testing decline-handling-ի վրա և report է անում mutation score-ը այնտեղ՝ ազնիվ confidence թիվը։ Contract-ը consumer-driven է և provider-verified CI-ում, ուստի field-ի rename-ը, որ production integration outage կլիներ, դառնում է build failure։ Integration test-ը mock է անում միայն gateway-ը network boundary-ի մոտ — ոչ checkout-ի internal collaborator-ները — ուստի չի կարող անցնել, մինչ իրական wiring-ը կոտրված է։ Եվ flake-ը triage-ված է անվանված source-ի (timezone), ուղղված է պատճառով (injected clock) և gate-ված removal condition-ով — ոչ rerun մինչև green։

### Օրինակ B — destructive-fixture-ի անվտանգություն

**Prompt.** Մեր integration test-երը teardown-ում truncate են անում բոլոր table-ները, որ ամեն run մաքուր սկսի։ Թիմակիցը դրանք գործարկեց local-ում՝ `DATABASE_URL`-ը դեռ ուղղված shared staging database-ին, և wipe արեց այն։ Ոնց պետք է կառուցվի test suite-ը, որ սա երբեք չկրկնվի։

**Senior պատասխան.** Teardown-ը data է destroy անում, ուստի target-ը պետք է ապացուցվի disposable մինչ ցանկացած destroy — սա hard gate է, ոչ convention։ Ավելացրու executable guard destructive fixture-ի սկզբում․

1. **Allowlist արա disposable target-ը բացահայտ անունով/marker-ով**, ոչ «prod-like» անունների denylist։ Պահիր `ALLOWED_TEST_DBS = {"app_test", "app_ci"}` և assert արա, որ connection-ի database անունը դրա մեջ է մինչ truncate անելը. ավելացրու `prod`/`staging`-ի բացառումը որպես երկրորդ գոտի։
2. **Fail closed.** Եթե target-ը ապացուցելիորեն test database չէ, fixture-ը raise է անում, և suite-ը կանգնում է — ոչ best-effort delete, ոչ «warn and continue»։
3. **Ծածկիր guard-ը test-ով**, որ մերժում է non-test target (ուղղիր այն `staging`-ին test-ում և assert արա, որ raise է անում մինչ ցանկացած destroy գործարկվելը)։
4. **Կիրառիր նույն օրենքը filesystem/cache teardown-ին** (`rm -rf`, `FLUSHALL`) — ամեն destructive քայլ նախ assert է անում իր target-ը։
5. **Report արա wipe-ը որպես near-miss/incident**, restore արա staging-ը backup-ից և ավելացրու բացակայող guard-ը, որ failure-ի դասը փակվի, ոչ միայն այս դեպքը։

Guard-ված fixture-ը (տես `manual.md` §destructive-fixture-ի անվտանգության օրենք) մերժում է գործարկվել, քանի դեռ database անունը allowlist-ում չէ, ուստի մոլորված `DATABASE_URL`-ը error է տալիս՝ իրական environment wipe անելու փոխարեն։

**Ինչու է անցնում gate-ը.** Այն wipe-ը համարում է failure-ի դաս, որ պետք է design-ով հանվի, ոչ թե մեկանգամյա մարդկային սխալ, որ պետք է կշտամբվի — fix-ը executable assertion է, որ destructive քայլը անհնար է դարձնում ուղղել staging/prod-ին։ Այն allowlist է անում disposable target-ը (fail-closed)՝ վտանգավոր անունները denylist անելու փոխարեն, որը միակ ուղղությունն է, որ ապահով է չկանխատեսված environment-ի դեմ։ Այն ծածկում է guard-ը իր սեփական test-ով, ուստի անվտանգության մեխանիզմն ինքը չի կարող լուռ փտել։ Այն ընդլայնում է կանոնը filesystem/cache teardown-ին՝ փակելով ողջ destructive surface-ը, ոչ միայն database-ը։ Եվ այն մշակում է եղած վնասը (restore backup-ից)՝ control-ը ship անելու հետ, ուստի նույն մոլորված variable-ը երբեք չի կարող կրկին wipe անել իրական environment։

### Օրինակ C — consumer-driven contract, ծայրից ծայր

**Prompt.** `checkout` service-ը (consumer) կանչում է `pricing` service-ը (provider)։ Pricing-ը rename արեց `amount` → `total_cents` դաշտը և ship արեց. checkout-ը կոտրվեց production-ում, թեև երկու service-ի սեփական unit test-երը green էին։ Նախագծիր test-ը, որ կբռներ այն, ծայրից ծայր։

**Senior պատասխան.** Green unit test-երը ամեն կողմում չեն կարող սա բռնել — bug-ը ապրում է նրանց միջև **integration contract**-ում, և ամեն կողմի mock-ները չեն արտացոլում մյուսի իրականությունը։ Fix-ը **consumer-driven contract (CDC)** test է (Pact-ոճ)․ consumer-ը հայտարարում է, թե ինչից է կախված, և provider-ը verify է լինում այդ հայտարարության դեմ *նախքան deploy անելը*։

1. **Consumer-ը pin է անում contract-ը.** checkout-ի suite-ում գրիր consumer test, որ բարձրացնում է pricing-ի mock և պնդում ճշգրիտ request-ը, որ checkout-ն ուղարկում է, և ճշգրիտ response դաշտերը, որոնց վրա *հենվում* է — օր.՝ «valid cart-ի դեպքում `GET /price` վերադարձնում է body `amount`-ով (integer)»։ Սա արտադրում է **pact file**, որ թվարկում է միայն այն դաշտերը, որ checkout-ն իրականում օգտագործում է, ոչ ողջ schema-ն։
2. **Publish արա contract-ը** broker-ին (կամ shared artifact), tagged consumer version-ով։
3. **Verify արա provider-ը դրա դեմ CI-ում.** Pricing-ի pipeline-ը գործարկում է **provider verification**․ replay արա pact-ի ամեն interaction-ը իրական pricing service-ի դեմ և ստուգիր, որ response-ը դեռ բավարարում է consumer-ի expectation-ները։ Երբ pricing-ը rename է անում `amount` → `total_cents`, provider verification-ը **fail** է անում — «checkout-ը սպասում էր `amount`, ստացավ `total_cents`» — և pricing-ի deploy-ը block-վում է։ Break-ը բռնվում է pricing-ի CI-ում, prod-ից առաջ, *consumer*-ի expectation-ով, որ ոչ մի provider-side unit test չի կոդավորում։
4. **Coordinated version bump (expand/contract).** Rename-ը ապահով ship անելու․ pricing-ը ավելացնում է `total_cents`-ը `amount`-ի **կողքին** (երկուսն էլ response-ում) → verification-ն անցնում է (հին contract-ը դեռ բավարարված) → checkout-ը migrate է անում `total_cents` կարդալու և publish նոր pact → երբ ոչ մի consumer pact `amount` չի reference անում, pricing-ը հանում է այն և re-verify անում։ Contract-ն է ասում pricing-ին, որ ապահով է հին դաշտը drop անել․ «ոչ մի consumer այլևս կախված չէ դրանից»։

**Ինչու է անցնում gate-ը.** Այն ճշգրիտ ախտորոշում է failure-ը — green unit test-երը երկու կողմում չեն կարող **contract** break բռնել, որովհետև ամեն կողմ mock է անում մյուսին, ուստի mock-ները drift են անում իրականությունից — և նշանակում է **consumer-driven contract**, որտեղ consumer-ի իրական expectation-ները verify են լինում իրական provider-ի դեմ CI-ում *նախքան deploy*։ Այն ցույց է տալիս մեխանիզմը **break-ից fix**․ rename-ը fail է անում provider verification-ը (հենց բացակայող signal-ը), և ապահով path-ը **expand/contract coordinated bump** է (add-alongside → migrate consumer → drop երբ ոչ մի pact հին դաշտը չի reference), contract-ն ինքը gate անելով drop-ը։ Այն փակում է prompt-ի անվանած gap-ը — փոփոխություն, որ անցավ ամեն unit test, միևնույն է կոտրեց integration-ը — check-ը տեղափոխելով seam, որտեղ երկու service-ն իրականում հանդիպում են։
