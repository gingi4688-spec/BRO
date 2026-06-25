# Testing and Quality Engineering red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (test strategy / risk-to-layer matrix, flaky-triage card, contract-test plan, quality gate, release-confidence report). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Coverage treated as confidence** — a high coverage number standing in for proof. Require mutation score on the critical modules and assertion-bearing tests, not line counts.
- **Over-mocked internals** — a unit test that mocks the code's own collaborators and passes while the real wiring is broken. Require boundary-only mocks and a real integration/contract test for the collaboration.
- **Flake reran to green** — an intermittent failure hidden by retries. Require a named nondeterminism source, an owner, a quarantine, and a removal condition; reject rerun-as-fix.
- **Destructive fixture with no target guard** — any `DROP`/`TRUNCATE`/`DELETE`/`rm -rf`/`FLUSHALL`/reset/restore that does not assert its target is the disposable test resource before destroying. Require the fail-closed allowlist guard.
- **Inverted pyramid** — most confidence in slow, flaky E2E. Require stable logic/boundary checks pushed down and a thin E2E layer.
- **Contract drift unguarded** — a provider change with no consumer-driven contract; consumers break in production. Require a contract verified against the provider before deploy.
- **Untested migration/rollback** — a forward migration with no down-test and no data-preservation assertion. Require both, plus expand/contract proof for a non-atomic cutover.
- **Property test that cannot fail** — an invariant that restates the implementation or is a tautology. Require a real invariant that shrinks to a counterexample and fails on a deliberately broken version.
- **Quality gate that cannot block** — a "gate" that only reports metrics. Require a named blocking criterion it can enforce.
- **Green CI mistaken for verification** — shipping on a passing pipeline with no live check and no mutation/contract evidence on the changed module.

### Reviewer probes (ask these of any answer)

- Is each feared failure mapped to the cheapest catching layer with a rationale, or is the answer just "add more tests"? Is the pyramid upright?
- Where does confidence on the critical path come from — coverage percentage, or mutation score with the surviving mutants chased? Show the mutation result on the money/auth/migration code.
- What exactly is mocked, and at what seam? Are any of the unit's own collaborators mocked (over-mocking), and is the real collaboration tested by integration/contract?
- For every flaky item: what is the named nondeterminism source, who owns it, what is the removal condition — and is anything being reran-to-green?
- Does every destructive fixture/teardown assert the target is an allowlisted disposable test resource before it destroys, and does it fail closed? Is the guard itself tested?
- At each producer/consumer boundary, is there a consumer-driven contract verified against the provider before deploy — or does the answer rely on E2E to catch a field rename?
- For a migration: are the up-path, the down-path, and data preservation all tested, and is there expand/contract coexistence proof if the cutover is non-atomic?
- Is the property test a real invariant that can shrink to a counterexample, or does it restate the code and thus never fail?
- Can the quality gate actually block the release, and on what named condition?
- Does the answer rely on green CI, or does it name the live behavior/metric and the mutation/contract evidence that confirm the change? Is the Armenian equal-depth and punctuation-clean (correct `․`/`։`/«», no homoglyphs)?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (test strategy / risk-ից-layer matrix, flaky-triage card, contract-test plan, quality gate, release-confidence report)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Coverage-ը՝ confidence ընկալված** — բարձր coverage թիվ՝ ապացույցի փոխարեն։ Պահանջիր mutation score critical module-ների վրա և assertion ունեցող test-եր, ոչ line count։
- **Over-mock-ված internal-ներ** — unit test, որ mock է անում code-ի սեփական collaborator-ները և անցնում է, մինչ իրական wiring-ը կոտրված է։ Պահանջիր միայն-boundary mock և իրական integration/contract test collaboration-ի համար։
- **Flake-ը rerun-ով green** — intermittent failure թաքցված retry-ով։ Պահանջիր անվանված nondeterminism source, owner, quarantine և removal condition. մերժիր rerun-as-fix-ը։
- **Destructive fixture՝ առանց target guard-ի** — ցանկացած `DROP`/`TRUNCATE`/`DELETE`/`rm -rf`/`FLUSHALL`/reset/restore, որ չի assert անում, որ իր target-ը disposable test resource-ն է մինչ destroy անելը։ Պահանջիր fail-closed allowlist guard-ը։
- **Շրջված pyramid** — confidence-ի մեծ մասը դանդաղ, flaky E2E-ում։ Պահանջիր stable logic/boundary check-երը ներքև հրած և բարակ E2E շերտ։
- **Contract drift՝ unguarded** — provider-ի փոփոխություն՝ առանց consumer-driven contract-ի. consumer-ները production-ում կոտրվում են։ Պահանջիր contract՝ verify-ված provider-ի դեմ deploy-ից առաջ։
- **Չստուգված migration/rollback** — forward migration՝ առանց down-test-ի և data-preservation assertion-ի։ Պահանջիր երկուսն էլ, plus expand/contract ապացույց ոչ-atomic cutover-ի համար։
- **Property test, որ չի կարող fail անել** — invariant, որ կրկնում է implementation-ը կամ tautology է։ Պահանջիր իրական invariant, որ shrink է անում counterexample-ի և fail է անում դիտավորյալ կոտրված տարբերակի վրա։
- **Quality gate, որ չի կարող block անել** — «gate», որ միայն metric է report անում։ Պահանջիր անվանված block-ի criterion, որ կարող է enforce անել։
- **Green CI-ն շփոթված verification-ի հետ** — ship անցնող pipeline-ի վրա՝ առանց live check-ի և mutation/contract evidence-ի փոխված module-ի վրա։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ամեն վախեցող ձախողում կապվա՞ծ է ամենաէժան բռնող layer-ին rationale-ով, թե պատասխանը պարզապես «ավելացրու test» է։ Pyramid-ը ուղի՞ղ է։
- Որտեղի՞ց է գալիս confidence-ը critical path-ի վրա — coverage percentage, թե mutation score՝ գոյատևող mutant-ները հետապնդված։ Ցույց տուր mutation result-ը money/auth/migration code-ի վրա։
- Ինչ է հենց mock-ված, և որ seam-ի մոտ։ Unit-ի սեփական collaborator-ներից որևէ մեկը mock-ված է՞ (over-mocking), և իրական collaboration-ը test-ված է՞ integration/contract-ով։
- Ամեն flaky item-ի համար․ ինչ է անվանված nondeterminism source-ը, ով է տիրում, ինչ է removal condition-ը — և որևէ բան rerun-ով-green է արվու՞մ։
- Ամեն destructive fixture/teardown assert է անու՞մ, որ target-ը allowlist-ված disposable test resource-ն է մինչ destroy անելը, և fail է անու՞մ closed։ Guard-ն ինքը test-ված է՞։
- Ամեն producer/consumer boundary-ի մոտ կա՞ consumer-driven contract՝ verify-ված provider-ի դեմ deploy-ից առաջ — թե պատասխանը հենվում է E2E-ի վրա field-ի rename բռնելու համար։
- Migration-ի համար․ up-path-ը, down-path-ը և data-ի պահպանումը բոլորը test-վա՞ծ են, և կա՞ expand/contract գոյակցության ապացույց, եթե cutover-ը ոչ-atomic է։
- Property test-ը իրական invariant է՞, որ կարող է shrink անել counterexample-ի, թե կրկնում է code-ը և այդպես երբեք չի fail անում։
- Quality gate-ը իրականում կարո՞ղ է block անել release-ը, և որ անվանված պայմանով։
- Պատասխանը հենվու՞մ է green CI-ի վրա, թե անվանում է live behavior-ը/metric-ը և mutation/contract evidence-ը, որ հաստատում են փոփոխությունը։ Հայերենը equal-depth ու punctuation-clean է՞ (ճիշտ `․`/`։`/«», առանց homoglyph-ի)։
