# Testing and Quality Engineering patterns

## English

These are canonical Testing and Quality Engineering moves. Each is a mechanism for one of the domain's artifacts (test strategy / risk-to-layer matrix, flaky-triage card, contract-test plan, quality gate, release-confidence report). Choose the move that changes the next decision, not the nicest label.

### 1. Risk-to-layer confidence map

- **Trigger:** A team asks for "more tests," or coverage is high while defects keep escaping.
- **Mechanism:** List the failures you fear, then map each to the cheapest layer that catches it — pure logic → unit/property, wiring/boundary → integration/contract, one critical journey → E2E, untrusted input → fuzz. Attach an owner and the failure signal each test watches. The output is a matrix, not a test count.
- **Do not use when:** A known production defect already names the missing layer — go straight to that layer instead of re-mapping everything.
- **Failure repair:** If most confidence sits in slow E2E, move stable logic/boundary checks down the pyramid and keep E2E thin for true critical journeys.

### 2. Mutation-score hunt on critical code

- **Trigger:** Coverage is high on a critical module (payment, auth, money math, migration) but you do not trust it, or defects escape from "covered" code.
- **Mechanism:** Run mutation testing on the module; each surviving mutant is a behavior the tests execute but do not constrain. For each survivor, add the assertion that kills it (the missing edge, the boundary, the error path). Report mutation score, not coverage, as the confidence number on that module.
- **Do not use when:** The whole codebase is the target — chasing 100% mutation score everywhere is its own theater; scope it to the modules where a defect is most expensive.
- **Failure repair:** If coverage is high and mutation score is low on critical code, treat it as a red flag — the tests do not pin behavior — and add killing assertions before trusting the gate.

### 3. Flake quarantine card

- **Trigger:** CI fails intermittently on unchanged code; the suite is being reran until green.
- **Mechanism:** Record seed/time/order/environment, last clean pass, the failure cluster, the suspected nondeterminism source (time, randomness, order-dependence, network, external service, shared state, resource contention), the quarantine status, the owner, and the explicit removal condition (e.g. 20 clean runs after the cause is fixed).
- **Do not use when:** The "flake" reproduces deterministically — it is a real bug, not nondeterminism; fix it, do not quarantine it.
- **Failure repair:** If rerun is the only thing making it pass, the quality signal is corrupt; fix the cause (inject clock, seed RNG, isolate data) before un-quarantining.

### 4. Contract-break gate

- **Trigger:** A provider API changes a field or semantic and consumers are at risk, or an integration broke on a rename that provider tests did not catch.
- **Mechanism:** Capture each consumer's expectations as a consumer-driven contract (the fields and semantics it depends on). Verify the provider against those contracts in CI before deploy; a rename or new value breaks the build, not production. Add versioning/backward-compatibility and the test fixture.
- **Do not use when:** The function is private with no external consumer — a contract there is overhead; a unit/property test fits.
- **Failure repair:** If the provider passes its own tests but a consumer contract fails, block the release; the provider suite proves the provider, not the agreement.

### 5. Destructive-fixture safety guard

- **Trigger:** A fixture or teardown destroys state — `DROP`/`TRUNCATE`/`DELETE`/`rm -rf`/`FLUSHALL`/reset/restore — and the target is chosen from an environment variable or config.
- **Mechanism:** Before the first destroy, assert the target is on an explicit allowlist of disposable test resources (by name or marker) and fail closed otherwise; add `prod`/`staging` exclusion as a second belt. Cover the guard itself with a test that it refuses a non-test target. No destructive default: if the target cannot be proven disposable, error out — do not best-effort delete.
- **Do not use when:** Never skip it — there is no destructive fixture that is exempt; the same law applies to filesystem and cache teardown, not only databases.
- **Failure repair:** If a destructive step has no target check, add the allowlist assertion now and report any prior unguarded run as a near-miss; treat a teardown that pointed at staging/prod as an incident.

### 6. Migration up/down/preserve test

- **Trigger:** A schema or data migration is proposed; a rollback is claimed but untested.
- **Mechanism:** Test three things — the forward migration applies cleanly, the down-path (rollback) restores the prior schema, and data is preserved across both. If the cutover is not atomic, prove old and new coexist (expand/contract: backward-compatible schema, dual-write/dual-read) before contracting. Tie the migration to a quality gate that blocks on a failed down-test or a data-preservation failure.
- **Do not use when:** The change is purely additive and reversible by drop with no data dependency — a single forward test plus a documented drop may suffice; still confirm no consumer reads the new field before it exists.
- **Failure repair:** If only the up-path is tested, add the rollback and data-preservation tests before approval; an untested rollback is not a rollback.

## Հայերեն

Սրանք canonical Testing and Quality Engineering move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (test strategy / risk-ից-layer matrix, flaky-triage card, contract-test plan, quality gate, release-confidence report)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Risk-ից-layer confidence map

- **Երբ է պետք․** Թիմը «ավելի շատ test» է ուզում, կամ coverage-ը բարձր է, մինչ defect-ները շարունակում են փախչել։
- **Մեխանիզմը․** Թվարկիր այն ձախողումները, որոնցից վախենում ես, հետո ամեն մեկը կապիր ամենաէժան բռնող layer-ին — pure logic → unit/property, wiring/boundary → integration/contract, մեկ critical journey → E2E, անվստահելի input → fuzz։ Կցիր owner և այն failure signal-ը, որ ամեն test հսկում է։ Արդյունքը matrix է, ոչ test count։
- **Երբ չօգտագործել․** Երբ հայտնի production defect-ն արդեն անվանում է missing layer-ը — գնա՛ ուղիղ այդ layer, ոչ թե ամեն ինչ վերա-քարտեզագրիր։
- **Ուղղում․** Եթե confidence-ի մեծ մասը դանդաղ E2E-ում է, stable logic/boundary check-երը հրիր pyramid-ով ներքև և E2E-ն պահիր բարակ իսկապես critical journey-ների համար։

### 2. Mutation-score-ի որս critical code-ի վրա

- **Երբ է պետք․** Coverage-ը բարձր է critical module-ի վրա (payment, auth, money math, migration), բայց չես վստահում, կամ defect-ները փախչում են «ծածկված» code-ից։
- **Մեխանիզմը․** Գործարկիր mutation testing module-ի վրա. ամեն գոյատևող mutant behavior է, որ test-երը գործարկում են, բայց չեն սահմանափակում։ Ամեն գոյատևողի համար ավելացրու այն assertion-ը, որ սպանում է այն (բացակայող եզր, boundary, error path)։ Report արա mutation score-ը, ոչ coverage-ը, որպես այդ module-ի confidence թիվ։
- **Երբ չօգտագործել․** Երբ թիրախը ողջ codebase-ն է — 100% mutation score ամենուր հետապնդելը իր theater-ն է. scope արա այն module-ներին, որտեղ defect-ն ամենաթանկն է։
- **Ուղղում․** Եթե coverage-ը բարձր է, mutation score-ը՝ ցածր critical code-ի վրա, համարիր red flag — test-երը behavior չեն pin անում — և ավելացրու սպանող assertion-ներ մինչ gate-ին վստահելը։

### 3. Flake quarantine card

- **Երբ է պետք․** CI-ը intermittent fail է տալիս չփոխված code-ի վրա. suite-ը rerun է արվում մինչև green։
- **Մեխանիզմը․** Գրիր seed/time/order/environment, վերջին clean pass-ը, failure cluster-ը, կասկածվող nondeterminism source-ը (time, randomness, order-dependence, network, external service, shared state, resource contention), quarantine status-ը, owner-ը և բացահայտ removal condition-ը (օր.՝ 20 clean run պատճառը ուղղելուց հետո)։
- **Երբ չօգտագործել․** Երբ «flake»-ը deterministic reproduce է լինում — դա իրական bug է, ոչ nondeterminism. ուղղի՛ր, մի՛ quarantine արա։
- **Ուղղում․** Եթե rerun-ն է միակ բանը, որ անցկացնում է, quality signal-ը corrupt է. ուղղիր պատճառը (inject clock, seed RNG, isolate data) մինչ un-quarantine անելը։

### 4. Contract-break gate

- **Երբ է պետք․** Provider API-ն փոխում է field կամ semantic, և consumer-ները ռիսկի տակ են, կամ integration-ը կոտրվեց rename-ից, որ provider test-երը չբռնեցին։
- **Մեխանիզմը․** Capture արա ամեն consumer-ի expectation-ները որպես consumer-driven contract (field-եր և semantics, որից կախված է)։ Verify արա provider-ը այդ contract-ների դեմ CI-ում deploy-ից առաջ. rename-ը կամ նոր արժեքը կոտրում է build-ը, ոչ production-ը։ Ավելացրու versioning/backward-compatibility և test fixture-ը։
- **Երբ չօգտագործել․** Երբ function-ը private է՝ առանց external consumer-ի — այնտեղ contract-ը overhead է. unit/property test է տեղին։
- **Ուղղում․** Եթե provider-ն անցնում է իր test-երը, բայց consumer contract-ը fail է, block արա release-ը. provider suite-ը ապացուցում է provider-ը, ոչ համաձայնությունը։

### 5. Destructive-fixture-ի անվտանգության guard

- **Երբ է պետք․** Fixture կամ teardown state է destroy անում — `DROP`/`TRUNCATE`/`DELETE`/`rm -rf`/`FLUSHALL`/reset/restore — և target-ը ընտրվում է environment variable-ից կամ config-ից։
- **Մեխանիզմը․** Առաջին destroy-ից առաջ assert արա, որ target-ը disposable test resource-ների բացահայտ allowlist-ում է (անունով կամ marker-ով) և հակառակ դեպքում fail արա closed. ավելացրու `prod`/`staging`-ի բացառումը որպես երկրորդ գոտի։ Ծածկիր guard-ն ինքը test-ով, որ մերժում է non-test target։ Ոչ մի destructive default․ եթե target-ը չի կարող ապացուցվել disposable, error տուր — մի՛ best-effort ջնջիր։
- **Երբ չօգտագործել․** Երբեք մի՛ բաց թող — չկա destructive fixture, որ ազատված է. նույն օրենքը կիրառվում է filesystem-ի և cache-ի teardown-ին, ոչ միայն database-ին։
- **Ուղղում․** Եթե destructive քայլը target check չունի, ավելացրու allowlist assertion-ը հիմա և report արա ցանկացած նախկին unguarded run որպես near-miss. teardown, որ ուղղված էր staging/prod-ին, համարիր incident։

### 6. Migration-ի up/down/preserve test

- **Երբ է պետք․** Schema կամ data migration է առաջարկվում. rollback-ը հայտարարված է, բայց չստուգված։
- **Մեխանիզմը․** Test արա երեք բան — forward migration-ը կիրառվում է մաքուր, down-path-ը (rollback) վերականգնում է նախորդ schema-ն, և data-ն պահպանվում է երկուսի ընթացքում։ Եթե cutover-ը atomic չէ, ապացուցիր, որ հինն ու նորը գոյակցում են (expand/contract՝ backward-compatible schema, dual-write/dual-read) մինչ contract անելը։ Կապիր migration-ը quality gate-ի, որ block է անում fail-վող down-test-ի կամ data-preservation failure-ի վրա։
- **Երբ չօգտագործել․** Երբ փոփոխությունը զուտ additive է և reversible drop-ով՝ առանց data dependency-ի — մեկ forward test plus փաստաթղթավորված drop կարող է բավարարի. այնուամենայնիվ հաստատիր, որ ոչ մի consumer չի կարդում նոր field-ը մինչ այն գոյություն ունենա։
- **Ուղղում․** Եթե միայն up-path-ն է ստուգված, ավելացրու rollback-ի և data-preservation test-երը մինչ approve-ը. չստուգված rollback-ը rollback չէ։
