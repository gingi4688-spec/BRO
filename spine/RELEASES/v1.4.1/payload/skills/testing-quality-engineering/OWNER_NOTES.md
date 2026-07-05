# Testing and Quality Engineering owner notes

## English

### Needs human review when

This skill designs and reasons about tests and gates; it must route to a human owner — not act or auto-approve — when a test or fixture can touch real data, when a gate decision releases or blocks shipping, or when the answer would lower a real quality bar. Escalate and require explicit approval when:

- **A destructive fixture/test could reach a non-disposable resource** — any teardown that drops/truncates/deletes/resets/restores where the target is resolved from an environment variable or config. Require the fail-closed allowlist guard and have an owner confirm the test environment before it runs; treat any past unguarded run that could have hit staging/prod as an incident to report.
- **A test runs against shared, staging, or production data** — load/soak tests, tests that read or write a shared environment, or "test in prod" probes. These need an owner's sign-off, a blast-radius statement, and read-only or sandboxed access; never let a suite mutate a shared environment on its own authority.
- **A quality gate is loosened, waived, or bypassed** — lowering a coverage/mutation threshold, waiving a failing critical test, or shipping over a contract break. The release/block decision belongs to the release owner with the residual risk stated, not to a silent gate edit.
- **A flaky test is quarantined on a release path** — quarantining protects the pipeline, but quarantining a check that guards a critical journey is a temporary lowering of the bar; require an owner, a deadline, and a stated residual risk while it is out.
- **A migration/rollback test is skipped under deadline** — a data-loss-capable migration shipped without a tested down-path and data-preservation check is irreversible risk. Route the risk acceptance to an owner with a backup/expand-contract alternative, rather than skipping silently.
- **A real failing test would be deleted or weakened to go green** — removing or softening a test that catches a genuine defect changes the product's safety, not just the suite. The decision to accept that behavior belongs to the product/engineering owner, with the change recorded.

The default posture for all of the above: produce the test plan, the guard, and the evidence; then stop and route to the owner. Do not run a destructive or shared-environment test, or waive a gate, on your own authority.

### Owned future-improvement items

- **✓ DELIVERED (gazan 2026-07-02)** — Add a third worked example for a **consumer-driven contract end-to-end** (consumer pins → provider verification fails on a rename → coordinated version bump), so the contract mechanism is concrete from break to fix.
- Add a **mutation-testing recipe** that names where to scope it (critical modules), how to read surviving mutants, and how to set a mutation-score target — so the discipline is copy-ready, not described.
- Add a **release-confidence report worked instance** filled end to end (layers, mutation score, contract results, open flakes, blocking criteria, residual risk) as a reference deliverable.
- Add a **fuzzing pattern** (corpus, seed, crash triage) for untrusted-input boundaries, beyond the property-test invariant covered here.
- Cross-link the boundary with `devops-platform-sre` explicitly for the deploy gate (what "verified" means at the pipeline) and with `cybersecurity-operations-soc` for security/abuse-input fuzzing and threat modeling.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը նախագծում և դատում է test-երի և gate-երի մասին. այն պետք է ուղղորդի մարդ-տիրոջը — ոչ թե գործի կամ ինքնահաստատի — երբ test-ը կամ fixture-ը կարող է դիպչել իրական data-ի, երբ gate-ի որոշումը ship է անում կամ block, կամ երբ պատասխանը կիջեցներ իրական որակի նշաձող։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Destructive fixture/test-ը կարող է հասնել ոչ-disposable resource-ի** — ցանկացած teardown, որ drop/truncate/delete/reset/restore է անում, որտեղ target-ը resolve է լինում environment variable-ից կամ config-ից։ Պահանջիր fail-closed allowlist guard-ը և թող owner-ը հաստատի test environment-ը մինչ գործարկվելը. ցանկացած նախկին unguarded run, որ կարող էր դիպչել staging/prod-ին, համարիր incident, որ պետք է report-վի։
- **Test-ը գործում է shared, staging կամ production data-ի դեմ** — load/soak test, test, որ shared environment է կարդում կամ գրում, կամ «test in prod» probe-եր։ Սրանք պետք են owner-ի sign-off, blast-radius-ի հայտարարություն և read-only կամ sandbox access. երբեք մի՛ թող, որ suite-ը mutate անի shared environment սեփական լիազորությամբ։
- **Quality gate-ը թուլացվում, waive կամ bypass է լինում** — coverage/mutation threshold-ի իջեցում, fail-վող critical test-ի waive, կամ ship contract break-ի վրայով։ Release/block-ի որոշումը release owner-ինն է՝ residual risk-ը նշված, ոչ լուռ gate-ի խմբագրման։
- **Flaky test-ը quarantine է լինում release path-ի վրա** — quarantine-ը պաշտպանում է pipeline-ը, բայց critical journey-ի check-ը quarantine անելը նշաձողի ժամանակավոր իջեցում է. պահանջիր owner, deadline և նշված residual risk, քանի դեռ դուրս է։
- **Migration/rollback test-ը բաց է թողնվում deadline-ի տակ** — data-loss-ունակ migration՝ ship-ված առանց ստուգված down-path-ի և data-preservation check-ի, անդառնալի risk է։ Risk-ի ընդունումը ուղղորդիր owner-ին՝ backup/expand-contract այլընտրանքով, լուռ բաց թողնելու փոխարեն։
- **Իրական fail-վող test-ը ջնջվում կամ թուլացվում է green-ի համար** — test, որ իրական defect է բռնում, հանելը կամ փափկեցնելը փոխում է product-ի անվտանգությունը, ոչ միայն suite-ը։ Այդ behavior-ը ընդունելու որոշումը product/engineering owner-ինն է՝ փոփոխությունը գրանցված։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր test plan-ը, guard-ը և evidence-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Destructive կամ shared-environment test մի՛ գործարկիր, gate մի՛ waive արա սեփական լիազորությամբ։

### Սեփական ապագա-բարելավման կետեր

- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու երրորդ worked example **consumer-driven contract end-to-end**-ի համար (consumer pin → provider verification fail rename-ի վրա → համակարգված version bump), որ contract mechanism-ը կոնկրետ լինի break-ից fix։
- Ավելացրու **mutation-testing recipe**, որ անվանում է, թե որտեղ scope անել (critical module-ներ), ոնց կարդալ գոյատևող mutant-ները, և ոնց սահմանել mutation-score target — որ discipline-ը copy-ready լինի, ոչ նկարագրված։
- Ավելացրու **release-confidence report-ի worked instance**՝ լրացված ծայրից ծայր (layer-ներ, mutation score, contract result-ներ, open flake-եր, block-ի criteria, residual risk) որպես reference deliverable։
- Ավելացրու **fuzzing pattern** (corpus, seed, crash triage) անվստահելի-input boundary-ների համար, այստեղ ծածկված property-test invariant-ից այն կողմ։
- Cross-link արա boundary-ն `devops-platform-sre`-ի հետ բացահայտ՝ deploy gate-ի համար (ինչ է «verified» նշանակում pipeline-ի մոտ) և `cybersecurity-operations-soc`-ի հետ՝ security/abuse-input fuzzing-ի և threat modeling-ի համար։
