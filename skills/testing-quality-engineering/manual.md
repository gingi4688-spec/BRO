# Testing and Quality Engineering manual

## English

### Operating principle

Senior Testing and Quality Engineering work is decision-grade only when it places confidence at the cheapest layer that can catch the failure, and proves that confidence with a mechanism rather than a coverage percentage. The deliverable is one of a few shapes: a test strategy (risk mapped to layers), a flaky-test triage, a contract-test plan, a quality gate, or a release-confidence report. The single thing that governs all of them is the risk-to-layer decision: if you test the wrong risk at the wrong layer, every downstream number — coverage, pass rate, green CI — is reassuring and wrong. So the first move is always to name the failure you fear and place the test where it is cheapest to catch, then earn confidence with property tests, mutation score, and contracts where they fit. Quality is not the absence of a red build; it is a measured, owned signal that the build deserves to be trusted — and the proof that the destructive parts of the suite can never touch anything but disposable test resources.

### Mechanism reference

- **Test pyramid / trophy** — The pyramid trades speed for breadth of guarantee: unit tests isolate logic cheaply and run in milliseconds; integration tests catch wiring and boundary failures; end-to-end tests prove a critical flow end to end but are slow and brittle. The trophy variant widens the integration band and leans on static analysis and types when a framework makes isolated units low-signal. Confidence should be densest at the bottom (fast, deterministic) and thin at the top (a few true critical journeys). An inverted pyramid — most confidence in E2E — is slow, flaky, and skipped.
- **Coverage vs mutation score** — Coverage is a map of which lines ran, not a measure of whether a test would fail if the line were wrong. Mutation testing flips that question: it deliberately mutates the code (negate a condition, change `+` to `-`, drop a statement) and checks whether a test fails — a surviving mutant is a line your tests execute but do not constrain. Chase surviving mutants on the modules where a bug is most expensive (payments, auth, migrations). Mutation score, not coverage, is the honest confidence number on critical code.
- **Property-based testing and fuzzing** — Property-based testing generates many inputs and asserts an invariant that must hold for all of them (`serialize(parse(x)) == x`, "a sorted list is a permutation of the input that is ordered", "a terminal state never transitions"). It finds the edge cases you did not imagine and shrinks a failure to a minimal counterexample. Fuzzing mutates input to find crashes, hangs, and parser/security bugs on untrusted input. Both complement example-based tests by searching the input space rather than the cases you happened to write.
- **Flaky-test triage** — A flaky test is one that passes and fails on the same code. Triage separates the nondeterminism source: time (wall-clock, timezone), randomness (unseeded), order-dependence (shared mutable state between tests), network/external service, and resource contention (ports, CPU, the database). Quarantine protects the pipeline's signal, but quarantine is a debt with an owner and a removal condition, never a permanent grave. Rerun-until-green is not a fix; it hides both the flake and the next real regression.
- **Contract testing** — Contract testing verifies the producer/consumer agreement at the boundary. A consumer-driven contract pins the exact fields and semantics each consumer depends on; provider verification runs those expectations against the provider before deploy, so a field rename or semantic change is caught at build time, not as a production integration outage. It complements E2E (which proves the whole flow once) by guarding every boundary cheaply.
- **Test data, fixtures, and isolation** — Tests must be deterministic and isolated: inject the clock, seed the randomness, give each test its own data, and never depend on test order. Fixtures that create state must tear it down, and any teardown that destroys data (drop/truncate/delete/reset) must first prove the target is the disposable test resource (see the destructive-fixture safety law below). A test that shares mutable state or reads the real wall-clock will pass alone and fail in the suite.

### Destructive-fixture safety law (§4.11 — hard gate)

Any fixture or teardown that destroys state — `DROP DATABASE`, `TRUNCATE`, `DELETE FROM` without a scope, `rm -rf`, `FLUSHALL`, resetting a store, restoring a snapshot over a live one — **must assert that the target is the disposable test resource before it runs, and refuse otherwise.** The standing failure is a test suite that destroys data, pointed by a stray environment variable at staging or production. The guard is not a comment or a convention; it is an executable assertion at the top of the destructive step:

```python
# pytest conftest — runs before any destructive teardown
import pytest

ALLOWED_TEST_DBS = {"app_test", "app_ci"}

@pytest.fixture(scope="session")
def disposable_db(database_url):
    name = database_url.rsplit("/", 1)[-1]
    # Hard gate: refuse to operate on anything not explicitly a test DB.
    assert name in ALLOWED_TEST_DBS, (
        f"refusing destructive fixture: {name!r} is not an allowlisted "
        f"test database {sorted(ALLOWED_TEST_DBS)}"
    )
    # No "prod"/"staging" denylist here on purpose: the allowlist above already
    # fails closed; a denylist of "prod-like" names is the anti-pattern rule (1) warns against.
    yield name
    truncate_all_tables(name)  # safe: target proven disposable above
```

Rules: (1) allowlist the disposable target by explicit name or marker — never a denylist of "prod-like" names. (2) The assertion runs **before** the first destroy, fails closed, and is itself covered by a test that the guard refuses a non-test target. (3) No destructive default: if the target cannot be proven disposable, the fixture errors out, it does not "best-effort" delete. (4) The same law applies to filesystem and cache teardown, not only databases.

### Over-mocking guard (§4.11)

Mock at the boundary, not the internals. Replace what you do not own and cannot make deterministic — the network, the clock, the filesystem, a third-party API, a payment gateway — at the seam where your code meets it. Do **not** mock the unit's own collaborators to make a unit test pass; a test that mocks the code's internal dependencies asserts on the mock, passes while the real wiring is broken, and survives the exact bug it was meant to catch. The tell is a green unit suite with a production failure on the path the test "covered," or mocks that assert on other mocks. The repair: keep one or two true unit boundaries mocked (clock, network), test the real collaboration with an integration or contract test, and verify the mock's shape against the real dependency with a contract so the mock cannot drift from reality.

### Mutation-score discipline (§4.11)

Coverage answers "did this line run?"; mutation score answers "would a test fail if this line were wrong?" — and only the second is confidence. On critical modules (payment, auth, access control, money math, migrations), run mutation testing and chase the survivors: each surviving mutant is a behavior your tests execute but do not pin. Add the assertion that kills it. Do not chase 100% mutation score across the whole codebase — that is its own theater; target the modules where a defect is most expensive, and treat a high coverage number with low mutation score on those modules as a red flag, not a pass.

### Property-test invariant spec + contract-test snippet (§4.11)

A real invariant, not a restatement of the implementation. Example: an order state machine where a terminal state (`shipped`, `refunded`) must never transition back to a pending state, for any sequence of events.

```python
from hypothesis import given, strategies as st

events = st.sampled_from(["pay", "ship", "refund", "cancel"])

@given(seq=st.lists(events, max_size=20))
def test_terminal_states_never_revert(seq):
    order = Order()  # starts "pending"
    for e in seq:
        order.apply(e)
        if order.status in TERMINAL:
            before = order.status
            for follow_up in ("pay", "ship", "refund", "cancel"):
                order.apply(follow_up)
                assert order.status == before  # terminal is absorbing for any event
            break
```

A consumer-driven contract snippet for the same boundary — the checkout consumer pins what it depends on, and the provider is verified against it before deploy:

```python
# consumer side: pin the fields/semantics checkout relies on
(pact
 .given("an authorized payment")
 .upon_receiving("a status query")
 .with_request("GET", "/payments/123")
 .will_respond_with(200, body={
     "id": Like("123"),
     "authorization_status": Term(r"approved|declined", "approved"),
 }))
# provider side runs this expectation against the real provider in CI:
# a rename of authorization_status or a new value breaks the build, not prod.
```

### Decision rules

1. Name the failure you fear, then place the test at the cheapest layer that catches it: pure logic → unit/property; wiring/boundary → integration/contract; one critical journey → E2E; untrusted input → fuzz.
2. Never read coverage as confidence; on critical modules measure mutation score and kill the surviving mutants where a bug is most expensive.
3. A test that asserts nothing (only that code ran) is coverage theater — rewrite it to assert behavior, or delete it.
4. Triage every flaky test to a named nondeterminism source; quarantine with an owner and a removal condition; never "fix" by rerun.
5. Mock only at boundaries (network, clock, filesystem, external service); do not mock the unit's own collaborators — test the real collaboration with integration/contract.
6. When an invariant exists ("never X", "round-trips", "is absorbing"), write a property test that generates inputs and shrinks a counterexample, not only example cases.
7. At a producer/consumer boundary, use a consumer-driven contract verified against the provider before deploy; contract testing complements E2E, it does not replace it.
8. Before any destructive fixture/teardown runs, assert the target is the allowlisted disposable test resource and fail closed otherwise.
9. Test migrations on the up-path, the down-path, and data preservation; an untested rollback is not a rollback, and a non-atomic cutover needs expand/contract coexistence proof.
10. A quality gate must be able to block the release on a defined, owned condition (failing critical test, contract break, mutation drop, escaped-defect class); a gate that only reports is a dashboard.
11. Keep the pyramid upright: push stable logic/boundary checks down to fast deterministic tests; reserve E2E for true critical journeys.
12. Never treat green CI as verification; confirm the live behavior and the mutation/contract signal on the changed module before declaring done.

### Failure-repair playbook

1. **High coverage, escaping defects** → stop quoting coverage; run mutation testing on the critical modules and add the assertion that kills each surviving mutant.
2. **Unit suite green but production broke on the covered path** → the tests over-mock internals; move the mock to the real boundary and add an integration/contract test for the collaboration.
3. **Flaky test reran until green** → quarantine it with an owner, classify the nondeterminism source (time/random/order/network/state), and fix the cause (inject clock, seed RNG, isolate data) before un-quarantining on a clean-run condition.
4. **Inverted pyramid: most confidence in slow E2E** → move stable logic and boundary checks down to unit/contract; keep a thin E2E layer for genuine critical journeys.
5. **Destructive fixture with no target check** → add the allowlist assertion before the first destroy, fail closed, and add a test that the guard refuses a non-test target; treat any prior unguarded run as a near-miss to be reported.
6. **Provider tests pass, consumers break** → add a consumer-driven contract that pins the fields/semantics consumers depend on, and verify the provider against it in CI before deploy.
7. **Property test that cannot fail** → it restates the implementation or asserts a tautology; replace it with a real invariant that can shrink to a counterexample, and confirm it fails on a deliberately broken version.
8. **Migration PR with no down-test** → add the rollback test and a data-preservation assertion; if the cutover is not atomic, prove old/new coexistence (expand/contract) before approving.
9. **"Quality gate" that never blocks** → define the blocking condition it can enforce and wire it to fail the build; a gate that only reports metrics is renamed honestly as a dashboard.
10. **Tests pass alone, fail in the suite** → it is order/shared-state nondeterminism; give each test isolated data, remove shared mutable state, and inject the clock/RNG so order cannot change the result.
11. **"Just add more tests" with no risk map** → map the feared failures to layers first; add the few tests that change confidence, not volume that raises a number.
12. **"Done" on green CI** → before closing, observe the real behavior in the running system and check the mutation/contract signal on the changed module; a passing pipeline is necessary, not sufficient.

## Հայերեն

### Գործառնական սկզբունք

Ավագ testing և quality engineering աշխատանքը decision-grade է միայն այն ժամանակ, երբ confidence-ը դնում է այն ամենաէժան շերտում, որ կարող է բռնել ձախողումը, և այդ confidence-ը ապացուցում է mechanism-ով, ոչ coverage percentage-ով։ Deliverable-ը մի քանի ձևից մեկն է՝ test strategy (risk՝ կապված layer-ներին), flaky-test triage, contract-test plan, quality gate կամ release-confidence report։ Բոլորը կառավարող միակ բանը risk-ից-layer-ի որոշումն է․ եթե սխալ risk-ը սխալ layer-ին ես test անում, ապա ամեն հետընթաց թիվ՝ coverage, pass rate, green CI, հանգստացնող է և սխալ։ Ուստի առաջին քայլը միշտ այն ձախողման անվանումն է, որից վախենում ես, և test-ը այնտեղ դնելը, որտեղ ամենաէժանն է բռնելը, հետո confidence-ը վաստակելը property test-ով, mutation score-ով և contract-ով, որտեղ տեղին են։ Որակը կարմիր build-ի բացակայությունը չէ. այն չափված, տիրված signal է, որ build-ը արժանի է վստահության — և ապացույց, որ suite-ի destructive մասերը երբեք չեն կարող դիպչել ուրիշ որևէ բանի, քան disposable test resource-ին։

### Մեխանիզմների տեղեկագիր

- **Test pyramid / trophy** — Pyramid-ը արագությունը փոխանակում է երաշխիքի լայնության հետ․ unit test-ը էժան isolate է անում logic-ը և գործում millisecond-ներում. integration test-ը բռնում է wiring-ի և boundary-ի ձախողումները. end-to-end test-ը ապացուցում է critical flow-ը ծայրից ծայր, բայց դանդաղ ու brittle է։ Trophy տարբերակը լայնացնում է integration շերտը և հենվում static analysis-ի ու type-երի վրա, երբ framework-ը isolated unit-ները low-signal է դարձնում։ Confidence-ը պետք է խիտ լինի ներքևում (արագ, deterministic) և բարակ՝ վերևում (մի քանի իսկապես critical journey)։ Շրջված pyramid-ը՝ confidence-ի մեծ մասը E2E-ում, դանդաղ է, flaky և բաց թողնված։
- **Coverage ընդդեմ mutation score-ի** — Coverage-ը քարտեզ է, թե որ տողերը գործարկվեցին, ոչ չափում, թե test-ը կ-fail աներ, եթե տողը սխալ լիներ։ Mutation testing-ը շրջում է հարցը․ այն դիտավորյալ mutate է անում code-ը (negate condition, `+`-ը `-` դարձնել, statement drop անել) և ստուգում՝ test-ը fail անո՞ւմ է. գոյատևող mutant-ը այն տողն է, որ test-երդ գործարկում են, բայց չեն սահմանափակում։ Հետապնդիր գոյատևող mutant-ները այն module-ների վրա, որտեղ bug-ն ամենաթանկն է (payment, auth, migration)։ Mutation score-ը, ոչ coverage-ը, ազնիվ confidence թիվն է critical code-ի վրա։
- **Property-based testing և fuzzing** — Property-based testing-ը generate է անում բազմաթիվ input և assert է անում invariant, որ պետք է բռնի բոլորի համար (`serialize(parse(x)) == x`, «sorted list-ը input-ի permutation է, որ ordered է», «terminal state-ը երբեք չի transition անում»)։ Այն գտնում է այն եզրային դեպքերը, որ չես պատկերացրել, և failure-ը shrink է անում minimal counterexample-ի։ Fuzzing-ը mutate է անում input-ը՝ crash, hang և parser/security bug գտնելու անվստահելի input-ի վրա։ Երկուսն էլ լրացնում են example-based test-ը՝ փնտրելով input space-ը, ոչ թե այն դեպքերը, որ պատահաբար գրել ես։
- **Flaky-test triage** — Flaky test-ն այն է, որ նույն code-ի վրա անցնում և fail է անում։ Triage-ը բաժանում է nondeterminism-ի աղբյուրը՝ time (wall-clock, timezone), randomness (unseeded), order-dependence (test-երի միջև shared mutable state), network/external service և resource contention (port, CPU, database)։ Quarantine-ը պաշտպանում է pipeline-ի signal-ը, բայց quarantine-ը պարտք է՝ owner-ով և removal condition-ով, երբեք մշտական գերեզման։ Rerun-until-green-ը fix չէ. այն թաքցնում է և՛ flake-ը, և՛ հաջորդ իրական regression-ը։
- **Contract testing** — Contract testing-ը ստուգում է producer/consumer համաձայնությունը boundary-ի մոտ։ Consumer-driven contract-ը pin է անում հենց այն field-երն ու semantics-ը, որոնց վրա ամեն consumer հենվում է. provider verification-ը այդ expectation-ները գործարկում է provider-ի դեմ deploy-ից առաջ, ուստի field-ի rename-ը կամ semantic-ի փոփոխությունը բռնվում է build-ի ժամանակ, ոչ որպես production integration outage։ Այն լրացնում է E2E-ն (որ ողջ flow-ը մեկ անգամ ապացուցում է)՝ ամեն boundary էժան պահպանելով։
- **Test data, fixture և isolation** — Test-երը պետք է լինեն deterministic և isolated․ inject արա clock-ը, seed արա randomness-ը, ամեն test-ի տուր սեփական data, և երբեք մի՛ կախվիր test order-ից։ State ստեղծող fixture-ները պետք է tear down անեն, և ցանկացած teardown, որ data է destroy անում (drop/truncate/delete/reset), պետք է նախ ապացուցի, որ target-ը disposable test resource-ն է (տես destructive-fixture-ի անվտանգության օրենքը ներքև)։ Test, որ կիսում է mutable state կամ կարդում է իրական wall-clock-ը, մենակ կանցնի և suite-ում կ-fail անի։

### Destructive-fixture-ի անվտանգության օրենք (§4.11 — hard gate)

Ցանկացած fixture կամ teardown, որ state է destroy անում — `DROP DATABASE`, `TRUNCATE`, scope-զուրկ `DELETE FROM`, `rm -rf`, `FLUSHALL`, store-ի reset, snapshot-ի restore live-ի վրա — **պետք է assert անի, որ target-ը disposable test resource-ն է մինչ գործարկվելը, և հակառակ դեպքում մերժի։** Մշտական ձախողումն այն test suite-ն է, որ data է destroy անում՝ ուղղված մոլորված environment variable-ով staging-ի կամ production-ի։ Guard-ը մեկնաբանություն կամ convention չէ. այն executable assertion է destructive քայլի սկզբում․

```python
# pytest conftest — գործում է ցանկացած destructive teardown-ից առաջ
import pytest

ALLOWED_TEST_DBS = {"app_test", "app_ci"}

@pytest.fixture(scope="session")
def disposable_db(database_url):
    name = database_url.rsplit("/", 1)[-1]
    # Hard gate: մերժիր գործել ամեն ինչի վրա, որ բացահայտ test DB չէ։
    assert name in ALLOWED_TEST_DBS, (
        f"refusing destructive fixture: {name!r} is not an allowlisted "
        f"test database {sorted(ALLOWED_TEST_DBS)}"
    )
    # «prod»/«staging» denylist այստեղ միտումնավոր չկա․ վերևի allowlist-ն արդեն
    # fail-closed է անում. «prod-like» անունների denylist-ը հենց այն anti-pattern-ն է, որից զգուշացնում է կանոն (1)-ը։
    yield name
    truncate_all_tables(name)  # ապահով՝ target-ը վերևում ապացուցված disposable է
```

Կանոններ․ (1) allowlist արա disposable target-ը բացահայտ անունով կամ marker-ով — երբեք «prod-like» անունների denylist։ (2) Assertion-ը գործում է **առաջին destroy-ից առաջ**, fail է closed, և ինքն էլ ծածկված է test-ով, որ guard-ը մերժում է non-test target։ (3) Ոչ մի destructive default․ եթե target-ը չի կարող ապացուցվել disposable, fixture-ը error է տալիս, ոչ թե «best-effort» ջնջում։ (4) Նույն օրենքը կիրառվում է filesystem-ի և cache-ի teardown-ին, ոչ միայն database-ին։

### Over-mocking guard (§4.11)

Mock արա boundary-ի մոտ, ոչ internal-ները։ Փոխարինիր այն, ինչ քոնը չէ և չես կարող deterministic դարձնել — network-ը, clock-ը, filesystem-ը, third-party API-ն, payment gateway-ը — այն seam-ի մոտ, որտեղ code-դ հանդիպում է նրան։ **Մի՛** mock արա unit-ի սեփական collaborator-ները unit test-ը անցկացնելու համար. test, որ mock է անում code-ի internal dependency-ները, assert է անում mock-ի վրա, անցնում է, մինչ իրական wiring-ը կոտրված է, և գոյատևում է հենց այն bug-ի մոտ, որ պետք է բռներ։ Tell-ը green unit suite է՝ production failure-ով այն path-ի վրա, որ test-ը «ծածկում էր», կամ mock-եր, որ ուրիշ mock-ի վրա են assert անում։ Ուղղում․ պահիր մեկ-երկու իսկական unit boundary mock-ված (clock, network), test արա իրական collaboration-ը integration կամ contract test-ով, և verify արա mock-ի ձևը իրական dependency-ի դեմ contract-ով, որ mock-ը չշեղվի իրականությունից։

### Mutation-score discipline (§4.11)

Coverage-ը պատասխանում է «այս տողը գործարկվե՞ց». mutation score-ը պատասխանում է «test-ը կ-fail աներ, եթե այս տողը սխալ լիներ» — և միայն երկրորդն է confidence։ Critical module-ների վրա (payment, auth, access control, money math, migration) գործարկիր mutation testing և հետապնդիր գոյատևողներին․ ամեն գոյատևող mutant behavior է, որ test-երդ գործարկում են, բայց չեն pin անում։ Ավելացրու այն assertion-ը, որ սպանում է այն։ Մի՛ հետապնդիր 100% mutation score ողջ codebase-ով — դա իր theater-ն է. թիրախավորիր այն module-ները, որտեղ defect-ն ամենաթանկն է, և բարձր coverage թիվ՝ ցածր mutation score-ով այդ module-ների վրա համարիր red flag, ոչ pass։

### Property-test-ի invariant spec + contract-test snippet (§4.11)

Իրական invariant, ոչ implementation-ի վերաշարադրում։ Օրինակ՝ order state machine, որտեղ terminal state-ը (`shipped`, `refunded`) երբեք չպետք է transition անի pending state, event-ների ցանկացած հաջորդականության համար։

```python
from hypothesis import given, strategies as st

events = st.sampled_from(["pay", "ship", "refund", "cancel"])

@given(seq=st.lists(events, max_size=20))
def test_terminal_states_never_revert(seq):
    order = Order()  # սկսում է "pending"
    for e in seq:
        order.apply(e)
        if order.status in TERMINAL:
            before = order.status
            for follow_up in ("pay", "ship", "refund", "cancel"):
                order.apply(follow_up)
                assert order.status == before  # terminal-ը absorbing է ցանկացած event-ի դեպքում
            break
```

Նույն boundary-ի consumer-driven contract snippet-ը — checkout consumer-ը pin է անում, ինչից կախված է, և provider-ը verify է արվում դրա դեմ deploy-ից առաջ․

```python
# consumer կողմ: pin արա field/semantics, որ checkout-ը հենվում է
(pact
 .given("an authorized payment")
 .upon_receiving("a status query")
 .with_request("GET", "/payments/123")
 .will_respond_with(200, body={
     "id": Like("123"),
     "authorization_status": Term(r"approved|declined", "approved"),
 }))
# provider կողմը CI-ում այս expectation-ը գործարկում է իրական provider-ի դեմ․
# authorization_status-ի rename-ը կամ նոր արժեքը կոտրում է build-ը, ոչ prod-ը։
```

### Որոշման կանոններ

1. Անվանի՛ր այն ձախողումը, որից վախենում ես, հետո test-ը դիր ամենաէժան բռնող layer-ին․ pure logic → unit/property. wiring/boundary → integration/contract. մեկ critical journey → E2E. անվստահելի input → fuzz։
2. Երբեք coverage-ը confidence մի՛ կարդա. critical module-ների վրա չափիր mutation score և սպանիր գոյատևող mutant-ները, որտեղ bug-ն ամենաթանկն է։
3. Test, որ ոչինչ չի assert անում (միայն՝ որ code գործարկվեց), coverage theater է — վերագրիր՝ որ behavior assert անի, կամ ջնջիր։
4. Triage արա ամեն flaky test անվանված nondeterminism source-ի. quarantine արա owner-ով և removal condition-ով. երբեք «մի՛ ուղղիր» rerun-ով։
5. Mock արա միայն boundary-ի մոտ (network, clock, filesystem, external service). մի՛ mock արա unit-ի սեփական collaborator-ները — test արա իրական collaboration-ը integration/contract-ով։
6. Երբ invariant կա («երբեք X», «round-trip», «absorbing է»), գրիր property test, որ generate է անում input և shrink է անում counterexample, ոչ միայն example։
7. Producer/consumer boundary-ի մոտ օգտագործիր consumer-driven contract՝ verify-ված provider-ի դեմ deploy-ից առաջ. contract testing-ը լրացնում է E2E-ն, ոչ փոխարինում։
8. Ցանկացած destructive fixture/teardown-ից առաջ assert արա, որ target-ը allowlist-ված disposable test resource-ն է, և հակառակ դեպքում fail արա closed։
9. Test արա migration-ները up-path-ի, down-path-ի և data-ի պահպանման համար. չստուգված rollback-ը rollback չէ, և ոչ-atomic cutover-ը պահանջում է expand/contract գոյակցության ապացույց։
10. Quality gate-ը պետք է կարողանա block անել release-ը սահմանված, տիրված պայմանով (fail-վող critical test, contract break, mutation-ի անկում, escaped-defect-ի դաս). gate, որ միայն report է անում, dashboard է։
11. Pyramid-ը պահիր ուղիղ․ stable logic/boundary check-երը հրիր ներքև՝ արագ deterministic test-երի. E2E-ն պահիր իսկապես critical journey-ների համար։
12. Երբեք green CI-ն verification մի՛ համարիր. հաստատիր live behavior-ը և mutation/contract signal-ը փոխված module-ի վրա մինչ done ասելը։

### Վերականգնման խաղագիրք

1. **Բարձր coverage, փախչող defect-ներ** → դադարիր coverage մեջբերել. գործարկիր mutation testing critical module-ների վրա և ավելացրու այն assertion-ը, որ սպանում է ամեն գոյատևող mutant։
2. **Unit suite green է, բայց production կոտրվեց ծածկված path-ի վրա** → test-երը over-mock են անում internal-ները. mock-ը տեղափոխիր իրական boundary և ավելացրու integration/contract test collaboration-ի համար։
3. **Flaky test rerun է արվել մինչև green** → quarantine արա owner-ով, classify արա nondeterminism source-ը (time/random/order/network/state), և ուղղիր պատճառը (inject clock, seed RNG, isolate data) մինչ clean-run պայմանով un-quarantine անելը։
4. **Շրջված pyramid․ confidence-ի մեծ մասը դանդաղ E2E-ում** → stable logic և boundary check-երը տեղափոխիր unit/contract. պահիր բարակ E2E շերտ իսկապես critical journey-ների համար։
5. **Destructive fixture՝ առանց target check-ի** → ավելացրու allowlist assertion-ը առաջին destroy-ից առաջ, fail closed, և ավելացրու test, որ guard-ը մերժում է non-test target. ցանկացած նախկին unguarded run համարիր near-miss, որ պետք է report-վի։
6. **Provider test-երն անցնում են, consumer-ները կոտրվում են** → ավելացրու consumer-driven contract, որ pin է անում field/semantics, որից consumer-ները կախված են, և verify արա provider-ը դրա դեմ CI-ում deploy-ից առաջ։
7. **Property test, որ չի կարող fail անել** → այն կրկնում է implementation-ը կամ tautology է assert անում. փոխարինիր իրական invariant-ով, որ կարող է shrink անել counterexample-ի, և հաստատիր, որ այն fail է անում դիտավորյալ կոտրված տարբերակի վրա։
8. **Migration PR՝ առանց down-test-ի** → ավելացրու rollback test-ը և data-preservation assertion-ը. եթե cutover-ը atomic չէ, ապացուցիր old/new գոյակցությունը (expand/contract) մինչ approve անելը։
9. **«Quality gate», որ երբեք block չի անում** → սահմանի՛ր block-ի պայմանը, որ կարող է enforce անել, և wire արա, որ build-ը fail անի. gate, որ միայն metric է report անում, ազնվորեն վերանվանվում է dashboard։
10. **Test-երն անցնում են մենակ, fail՝ suite-ում** → դա order/shared-state nondeterminism է. ամեն test-ի տուր isolated data, հեռացրու shared mutable state, և inject արա clock/RNG, որ order-ը չփոխի արդյունքը։
11. **«Պարզապես ավելացրու test» առանց risk map-ի** → նախ կապիր վախեցող ձախողումները layer-ներին. ավելացրու այն մի քանի test-ը, որ փոխում է confidence-ը, ոչ ծավալ, որ թիվ է բարձրացնում։
12. **«Done» green CI-ի վրա** → փակելուց առաջ դիտիր իրական behavior-ը running system-ում և ստուգիր mutation/contract signal-ը փոխված module-ի վրա. անցնող pipeline-ը անհրաժեշտ է, ոչ բավարար։
