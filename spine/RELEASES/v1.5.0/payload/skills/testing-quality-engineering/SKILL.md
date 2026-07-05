---
name: "testing-quality-engineering"
description: >-
  use when the work is test strategy, test-layer choice (unit/integration/contract/E2E/property/fuzz), flaky-test triage, mutation testing, coverage interpretation, contract testing, test data and fixtures, CI quality gates, or release-confidence reporting — for decisions, critique, planning, diagnostics, test-suite design, teaching, or evaluation. use as lead when this domain owns the central decision or deliverable (test strategy, risk-to-layer matrix, flaky-triage card, quality gate, release-confidence report). do not use as lead when another skill owns the main artifact and test confidence is only one input — then support it. հայերեն՝ օգտագործիր թեստավորման ռազմավարության, test-շերտի ընտրության, flaky-test-ի triage-ի, mutation testing-ի, coverage-ի մեկնաբանման, contract testing-ի, test data-ի, CI quality gate-ի և release-confidence-ի աշխատանքի համար։
---

# Testing and Quality Engineering / Թեստավորում և որակի ճարտարագիտություն

## English

**Scope.** In: test strategy and the risk-to-layer decision (unit, integration, contract, end-to-end, property-based, fuzz, mutation), flaky-test triage, coverage interpretation vs mutation score, consumer-driven contract testing, test data and fixtures (including destructive-fixture safety), CI quality gates, and release-confidence reporting. Out: deployment/rollout safety and SLO/error-budget design (DevOps/SRE own those — you supply the gate that feeds them), product acceptance criteria and prioritization (product owns those — you turn them into tests), and system/data-model correctness as a design question (architecture owns it — you prove or disprove it with tests). This skill places confidence at the cheapest layer that can catch the failure, and makes quality measurable before, during, and after release — never by coverage percentage alone.

**Leads / Supports.** Lead when the central deliverable is testing-shaped: a test strategy, a risk-to-layer matrix, a flaky-triage card, a quality gate, a contract-test plan, a release-confidence report. Support when another skill owns the artifact and test confidence is one input — e.g. architecture owns the migration design and you supply the migration test and rollback verification; DevOps owns the rollout and you supply the deploy gate's pass criteria; product owns the acceptance criteria and you turn each into a checkable test.

Conflict rules:
- **Release/deploy safety → coordinate with DevOps/SRE, do not own the rollout.** You define what "verified" means at the gate (which tests, which mutation/contract results, which live check); the canary, abort threshold, and SLO arbitration belong to `devops-platform-sre`. A green test gate is a precondition, not a release decision.
- **Test scope vs ship date → risk arbitrates, not test count.** When coverage work collides with a deadline, do not argue thoroughness as taste. Rank by user-facing risk and test the highest-risk paths to a senior bar; explicitly name what is deferred and the residual risk. More tests is not the answer — the right tests at the right layer is.
- **Security/abuse-input testing → defer threat modeling to security.** You own fuzzing for crashes/parser bugs and property tests for invariants; the threat model, exploit classes, and security control design route to `cybersecurity-operations-soc`.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **"More tests" requested → map risk to the cheapest catching layer first.** Pure logic → unit/property; boundary/wiring → integration/contract; one critical user journey → E2E; parser/untrusted input → fuzz. A test at the wrong layer is slow, brittle, or blind.
2. **High coverage but defects escaping → coverage is a map, not confidence; measure mutation score on critical modules.** Coverage proves a line ran, not that a test would fail if the line were wrong. Chase surviving mutants where a bug costs the most.
3. **Test asserts nothing / only that code ran → it is coverage theater; rewrite to assert behavior.** A test with no meaningful assertion raises the number and catches nothing.
4. **Flaky test → triage to a named nondeterminism source; never "fix" by rerun.** Time, randomness, order-dependence, network, external service, shared state, resource contention. Quarantine with an owner and a removal condition; rerun-as-fix corrupts the signal.
5. **Mocking past the boundary → mock only at seams, not internals.** Mock the network, clock, filesystem, or external service at the edge; mocking the unit's own collaborators tests the mock, not the code, and survives real bugs.
6. **Invariant exists ("never X", "round-trips") → write a property test, not just examples.** Generate inputs and assert the invariant; example tests only cover the cases you imagined.
7. **Producer/consumer API boundary → use a consumer-driven contract, not only E2E.** Pin the fields and semantics consumers depend on; verify the provider against them before deploy. Contract testing complements E2E, it does not replace it.
8. **Destructive fixture (drop/truncate/delete/reset) → assert the target is the disposable test resource BEFORE any destroy.** Guard on an explicit allowlisted test name/marker and refuse to run against anything else. This is a hard gate — see §4.11.
9. **Migration / schema change → test the up-path, the down-path, and data preservation.** An untested rollback is not a rollback. Prove old and new coexist if the cutover is not atomic (expand/contract).
10. **Quality gate → it must be able to block the release on a defined, owned criterion.** A gate that only reports and never blocks is a dashboard. Name the blocking condition (failing critical test, contract break, mutation drop, escaped-defect class).
11. **Slow/brittle E2E suite → push stable checks down the pyramid.** Keep a thin layer of E2E for true critical journeys; move logic and boundary checks to unit/contract where they are fast and deterministic.
12. **"CI is green" → not "verified."** Green CI proves the tests that exist passed; it does not prove the change behaves in the running system, nor that the suite tests the right things. Confirm the real behavior (and the mutation/contract signal) before calling it done.

### Failure modes to prevent / Ձախողման ձևեր

1. **Coverage theater.** A high coverage number with assertion-free or boundary-blind tests; defects sail through. Tell: 90%+ coverage, escaped-defect rate flat or rising, no mutation score.
2. **Over-mocking the internals.** Tests mock the unit's own collaborators, so they pass while the real integration is broken. Tell: a green unit suite and a production failure on the exact path the test "covered"; mocks asserting on mocks.
3. **Flake treated as noise.** Intermittent failures are reran until green and ignored; the suite stops being trusted and a real regression hides among the flakes. Tell: a retry count in CI config, no nondeterminism source named, no quarantine ledger.
4. **Brittle E2E pyramid inversion.** Most confidence sits in slow, flaky end-to-end tests; the suite is slow and unstable, so people skip it. Tell: hours-long E2E runs, few unit/contract tests, "just rerun it."
5. **Destructive fixture hits a real resource.** A teardown drops/truncates a database or deletes files, and a misconfigured env points it at staging or prod. Tell: a `DROP`/`truncate`/`rm -rf`/`flushall` in setup or teardown with no assertion that the target is the disposable test resource.
6. **Contract drift unnoticed.** The provider changes a field/semantic; provider tests pass, consumers break in production. Tell: provider suite green, no consumer-driven contract, an integration outage on a field rename.
7. **Mutation blind spot on critical code.** Coverage is high but the tests do not actually constrain behavior; mutants survive on the modules where a bug is most expensive. Tell: no mutation run on the payment/auth/migration code, surviving mutants unexamined.
8. **Untested migration / rollback.** The forward migration is tested, the down-path and data preservation are not; the rollback fails under incident pressure. Tell: a migration PR with no down-test and no data-preservation assertion.
9. **Property test with a trivial or wrong invariant.** A property is asserted that is always true (or restates the implementation), so it generates inputs but proves nothing. Tell: a property that mirrors the code, or one that never shrinks to a counterexample because it cannot fail.
10. **Quality gate that cannot block.** The "gate" reports metrics but has no condition that stops a bad release. Tell: a dashboard called a gate; releases ship over red.
11. **Non-deterministic / shared test data.** Tests share mutable state or real wall-clock/random/network, so order and timing change the result. Tell: passing in isolation, failing in the suite; midnight-only or CI-only failures.
12. **Green CI mistaken for verification.** A change ships on a passing pipeline without confirming the live behavior or the strength of the tests. Tell: "done" with no live observation, no mutation/contract evidence on the changed module.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (test strategy / risk-to-layer matrix / flaky-triage card / quality gate / contract-test plan / release-confidence report), not generic advice.
- Risk is mapped to the cheapest catching layer with a rationale; the pyramid is not inverted into all-E2E.
- Confidence claims rest on mechanism, not coverage percentage alone: mutation score is cited on critical modules; mocking is at boundaries only.
- Flaky items carry a named nondeterminism source, an owner, and a removal condition — never rerun-as-fix.
- Every destructive fixture asserts the target is the disposable test resource before any destroy; no exception.
- Contract boundaries have a consumer-driven contract; migrations test up-path, down-path, and data preservation.
- The quality gate names a blocking condition it can enforce.
- **Verify the change in the running system, not just green CI** — real behavior and the mutation/contract signal are observed before the work is called done.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled; no invented benchmarks, prices, or model names.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **risk coverage** (risk mapped to unit/property/integration/contract/E2E/fuzz with rationale, pyramid not inverted) · **signal quality** (flake source/quarantine/owner/removal explicit; no rerun-as-fix) · **mechanism depth** (property, fuzz, mutation score, contract, and the destructive-fixture guard used where they fit) · **release gate** (gate ties tests, coverage gaps, mutation/contract results, and a blocking criterion) · **developer usability** (fast local path, deterministic data, boundary-only mocks, failure messages that aid repair).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, destructive-fixture safety law, over-mocking guard, mutation-score discipline, property/contract snippets) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (test strategy + flaky triage + destructive-fixture guard) · `output-templates.md` (test strategy / flaky-triage card / release-confidence report) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ test strategy և risk-ից-layer-ի որոշումը (unit, integration, contract, end-to-end, property-based, fuzz, mutation), flaky-test triage, coverage-ի մեկնաբանումը ընդդեմ mutation score-ի, consumer-driven contract testing, test data և fixture-ներ (ներառյալ destructive-fixture-ի անվտանգությունը), CI quality gate-եր և release-confidence report։ Դուրս՝ deploy-ի/rollout-ի անվտանգությունը և SLO/error-budget-ի դիզայնը (դրանք DevOps/SRE-ինն են — դու տալիս ես gate-ը, որ սնում է դրանք), product-ի acceptance criteria-ն և priority-ն (product-ինն են — դու դրանք դարձնում ես test), և system/data-model-ի ճշտությունը՝ որպես design հարց (architecture-ինն է — դու ապացուցում կամ հերքում ես այն test-երով)։ Այս skill-ը confidence-ը դնում է այն ամենաէժան շերտում, որ կարող է բռնել ձախողումը, և որակը դարձնում է չափելի թողարկումից առաջ, ընթացքում և հետո — երբեք միայն coverage percentage-ով։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը test-ի ձև ունի՝ test strategy, risk-ից-layer matrix, flaky-triage card, quality gate, contract-test plan, release-confidence report։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ test confidence-ը մեկ input է. օրինակ՝ architecture-ը տիրում է migration-ի design-ին, դու տալիս ես migration test-ը և rollback-ի ստուգումը. DevOps-ը տիրում է rollout-ին, դու տալիս ես deploy gate-ի pass criteria-ն. product-ը տիրում է acceptance criteria-ին, դու ամեն մեկը դարձնում ես ստուգելի test։

Կոնֆլիկտի կանոններ․
- **Release/deploy-ի անվտանգություն → համակարգիր DevOps/SRE-ի հետ, rollout-ը մի՛ տիրիր։** Դու սահմանում ես, թե ինչ է «verified» նշանակում gate-ի մոտ (որ test-երը, որ mutation/contract result-ը, որ live check-ը). canary-ն, abort threshold-ը և SLO-ի arbitration-ը `devops-platform-sre`-ինն են։ Green test gate-ը նախապայման է, ոչ release-ի որոշում։
- **Test scope ընդդեմ ship date-ի → որոշում է risk-ը, ոչ test count-ը։** Երբ coverage-ի աշխատանքը բախվում է deadline-ի հետ, մանրակրկիտությունը ճաշակ մի՛ դարձրու։ Դասակարգիր user-facing risk-ով և ամենաբարձր-risk path-երը test արա senior նշաձողի։ Բացահայտ անվանի՛ր, թե ինչ է հետաձգվում և մնացորդային risk-ը։ Ավելի շատ test-ը պատասխանը չէ — ճիշտ test-ը ճիշտ layer-ին է։
- **Security/abuse-input testing → threat modeling-ը զիջիր security-ին։** Դու տիրում ես crash/parser bug-ի fuzzing-ին և invariant-ի property test-ին. threat model-ը, exploit-ի դասերը և security control-ի դիզայնը ուղղորդվում են `cybersecurity-operations-soc`-ին։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **«Ավելի շատ test» են խնդրում → նախ risk-ը կապիր ամենաէժան բռնող layer-ին։** Pure logic → unit/property. boundary/wiring → integration/contract. մեկ critical user journey → E2E. parser/անվստահելի input → fuzz։ Սխալ layer-ի test-ը դանդաղ է, brittle կամ կույր։
2. **Coverage-ը բարձր է, բայց defect-ները փախչում են → coverage-ը քարտեզ է, ոչ confidence. չափիր mutation score-ը critical module-ների վրա։** Coverage-ն ապացուցում է, որ տողը գործարկվեց, ոչ թե որ test-ը կ-fail աներ, եթե տողը սխալ լիներ։ Հետապնդիր գոյատևող mutant-ները այնտեղ, որտեղ bug-ը ամենաթանկն է։
3. **Test-ը ոչինչ չի assert անում / միայն՝ որ code-ը գործարկվեց → դա coverage theater է. վերագրիր՝ որ behavior assert անի։** Իմաստալից assertion չունեցող test-ը թիվը բարձրացնում է և ոչինչ չի բռնում։
4. **Flaky test → triage արա անվանված nondeterminism source-ի. երբեք «մի՛ ուղղիր» rerun-ով։** Time, randomness, order-dependence, network, external service, shared state, resource contention։ Quarantine արա owner-ով և removal condition-ով. rerun-as-fix-ը corrupt է անում signal-ը։
5. **Boundary-ից այն կողմ mock անելը → mock արա միայն seam-ի մոտ, ոչ internal-ները։** Mock արա network-ը, clock-ը, filesystem-ը կամ external service-ը եզրին. unit-ի սեփական collaborator-ները mock անելը test է անում mock-ը, ոչ code-ը, և գոյատևում է իրական bug-ի մոտ։
6. **Invariant կա («երբեք X», «round-trip») → գրիր property test, ոչ միայն example։** Generate արա input-ներ և assert արա invariant-ը. example test-ը ծածկում է միայն այն դեպքերը, որ պատկերացրել ես։
7. **Producer/consumer API boundary → օգտագործիր consumer-driven contract, ոչ միայն E2E։** Pin արա այն field-երն ու semantics-ը, որոնց վրա consumer-ը հենվում է. verify արա provider-ը դրանց դեմ deploy-ից առաջ։ Contract testing-ը լրացնում է E2E-ն, ոչ փոխարինում։
8. **Destructive fixture (drop/truncate/delete/reset) → assert արա, որ target-ը disposable test resource-ն է ՆԱԽՔԱՆ ցանկացած destroy։** Guard արա բացահայտ allowlist-ված test-անվան/marker-ի վրա և մերժիր ուրիշ որևէ բանի դեմ գործարկվելը։ Սա hard gate է — տես §4.11։
9. **Migration / schema change → test արա up-path-ը, down-path-ը և data-ի պահպանումը։** Չստուգված rollback-ը rollback չէ։ Ապացուցիր, որ հինն ու նորը գոյակցում են, եթե cutover-ը atomic չէ (expand/contract)։
10. **Quality gate → այն պետք է կարողանա block անել release-ը սահմանված, տիրված criterion-ով։** Gate, որ միայն report է անում և երբեք block չի անում, dashboard է։ Անվանի՛ր block-ի պայմանը (fail-վող critical test, contract break, mutation-ի անկում, escaped-defect-ի դաս)։
11. **Դանդաղ/brittle E2E suite → stable check-երը հրիր pyramid-ով ներքև։** Պահիր բարակ E2E շերտ իսկապես critical journey-ների համար. logic-ի և boundary-ի check-երը տեղափոխիր unit/contract, որտեղ արագ ու deterministic են։
12. **«CI-ը green է» → «verified» չէ։** Green CI-ն ապացուցում է, որ եղած test-երն անցել են. չի ապացուցում, որ փոփոխությունն աշխատում է running system-ում, ոչ էլ՝ որ suite-ը ճիշտ բաներ է test անում։ Հաստատիր իրական behavior-ը (և mutation/contract signal-ը) մինչև done ասելը։

### Ձախողման ձևեր

1. **Coverage theater։** Բարձր coverage թիվ՝ assertion-զուրկ կամ boundary-կույր test-երով. defect-ները անցնում են։ Tell՝ 90%+ coverage, escaped-defect rate-ը հարթ կամ աճող, ոչ մի mutation score։
2. **Internal-ների over-mocking։** Test-երը mock են անում unit-ի սեփական collaborator-ները, ուստի անցնում են, մինչ իրական integration-ը կոտրված է։ Tell՝ green unit suite և production failure հենց այն path-ի վրա, որ test-ը «ծածկում էր». mock-եր, որ mock-ի վրա են assert անում։
3. **Flake-ը՝ որպես աղմուկ ընկալված։** Intermittent failure-ները rerun են արվում մինչև green և անտեսվում. suite-ը դադարում է վստահելի լինել, և իրական regression-ը թաքնվում է flake-երի մեջ։ Tell՝ retry count CI config-ում, ոչ մի անվանված nondeterminism source, ոչ մի quarantine ledger։
4. **Brittle E2E pyramid-ի շրջում։** Confidence-ի մեծ մասը նստած է դանդաղ, flaky end-to-end test-երում. suite-ը դանդաղ ու անկայուն է, ուստի մարդիկ բաց են թողնում։ Tell՝ ժամերով E2E run, քիչ unit/contract test, «պարզապես rerun արա»։
5. **Destructive fixture-ը դիպչում է իրական resource-ի։** Teardown-ը drop/truncate է անում database կամ ջնջում է ֆայլեր, և սխալ-կարգավորված env-ը ուղղում է այն staging-ի կամ prod-ի։ Tell՝ `DROP`/`truncate`/`rm -rf`/`flushall` setup-ում կամ teardown-ում՝ առանց assertion-ի, որ target-ը disposable test resource-ն է։
6. **Contract drift՝ աննկատ։** Provider-ը փոխում է field/semantic. provider test-երն անցնում են, consumer-ները production-ում կոտրվում են։ Tell՝ provider suite green, ոչ մի consumer-driven contract, integration outage field-ի rename-ից։
7. **Mutation-ի կույր կետ critical code-ի վրա։** Coverage-ը բարձր է, բայց test-երն իրականում behavior չեն սահմանափակում. mutant-ները գոյատևում են այն module-ների վրա, որտեղ bug-ն ամենաթանկն է։ Tell՝ ոչ մի mutation run payment/auth/migration code-ի վրա, գոյատևող mutant-ները չ-ուսումնասիրված։
8. **Չստուգված migration / rollback։** Forward migration-ը ստուգված է, down-path-ը և data-ի պահպանումը՝ ոչ. rollback-ը fail է անում incident-ի ճնշման տակ։ Tell՝ migration PR՝ առանց down-test-ի և data-preservation assertion-ի։
9. **Property test՝ trivial կամ սխալ invariant-ով։** Assert է արվում property, որ միշտ ճիշտ է (կամ կրկնում է implementation-ը), ուստի input է generate անում, բայց ոչինչ չի ապացուցում։ Tell՝ property, որ հայելի է code-ին, կամ որ երբեք counterexample-ի չի shrink անում, որովհետև չի կարող fail անել։
10. **Quality gate, որ չի կարող block անել։** «Gate»-ը metric է report անում, բայց չունի պայման, որ կանգնեցնի վատ release-ը։ Tell՝ dashboard, որ gate է կոչվում. release-ները ship են լինում կարմիրի վրայով։
11. **Non-deterministic / shared test data։** Test-երը կիսում են mutable state կամ իրական wall-clock/random/network, ուստի order-ն ու timing-ը փոխում են արդյունքը։ Tell՝ մեկուսացած անցնում, suite-ում fail. միայն-midnight կամ միայն-CI failure-ներ։
12. **Green CI-ն շփոթված verification-ի հետ։** Փոփոխությունը ship է լինում անցնող pipeline-ի վրա՝ առանց live behavior-ը կամ test-երի ուժը հաստատելու։ Tell՝ «done»՝ առանց live observation-ի, առանց mutation/contract evidence-ի փոխված module-ի վրա։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (test strategy / risk-ից-layer matrix / flaky-triage card / quality gate / contract-test plan / release-confidence report), ոչ generic advice։
- Risk-ը կապված է ամենաէժան բռնող layer-ին rationale-ով. pyramid-ը շրջված չէ all-E2E-ի։
- Confidence-ի պնդումները հենվում են mechanism-ի վրա, ոչ միայն coverage percentage-ի. mutation score-ը վկայակոչված է critical module-ների վրա. mocking-ը միայն boundary-ի մոտ է։
- Flaky item-ները կրում են անվանված nondeterminism source, owner և removal condition — երբեք rerun-as-fix։
- Ամեն destructive fixture assert է անում, որ target-ը disposable test resource-ն է մինչև ցանկացած destroy. բացառություն չկա։
- Contract boundary-ները ունեն consumer-driven contract. migration-ները test են անում up-path, down-path և data-ի պահպանում։
- Quality gate-ը անվանում է block-ի պայման, որ կարող է enforce անել։
- **Ստուգի՛ր փոփոխությունը running system-ում, ոչ միայն green CI-ով** — իրական behavior-ը և mutation/contract signal-ը դիտվում են մինչև done ասելը։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված. ոչ մի հորինված benchmark, price կամ model name։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **risk coverage** (risk-ը կապված unit/property/integration/contract/E2E/fuzz-ին rationale-ով, pyramid-ը չ-շրջված) · **signal quality** (flake source/quarantine/owner/removal բացահայտ. ոչ rerun-as-fix) · **mechanism depth** (property, fuzz, mutation score, contract և destructive-fixture guard-ը կիրառված ըստ տեղին) · **release gate** (gate-ը կապում է test-երը, coverage gap-ը, mutation/contract result-ը և block-ի criterion-ը) · **developer usability** (fast local path, deterministic data, միայն-boundary mock, failure message-ներ, որ օգնում են repair-ին)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, destructive-fixture-ի անվտանգության օրենք, over-mocking guard, mutation-score discipline, property/contract snippet-ներ) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (test strategy + flaky triage + destructive-fixture guard) · `output-templates.md` (test strategy / flaky-triage card / release-confidence report) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
