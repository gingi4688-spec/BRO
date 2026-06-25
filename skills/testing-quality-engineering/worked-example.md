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
