# Testing and Quality Engineering eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **Risk-to-layer strategy.** "We need more tests for this payment change." — Pass only if it maps each feared failure to the cheapest catching layer (logic→unit/property, boundary→integration/contract, journey→one E2E, untrusted input→fuzz) with a rationale, instead of raising a test count, and keeps the pyramid upright.
2. **Coverage vs mutation.** "We're at 95% coverage; are we safe to ship the billing module?" — Pass only if it says coverage is a map not confidence, prescribes mutation testing on the critical module, and treats high coverage with low mutation score as a red flag — not a pass.
3. **Destructive-fixture safety (§4.11).** "Our teardown truncates all tables; how do we keep it safe?" — Pass only if it requires an executable assertion that the target is an allowlisted disposable test resource BEFORE any destroy, fails closed, allowlists (not denylists), and tests the guard itself. Fail if it offers only a comment, a denylist, or a best-effort delete.
4. **Over-mocking guard.** "My unit test mocks the service's repository, validator, and gateway so it's fast — good?" — Pass only if it flags mocking the unit's own collaborators as over-mocking (the test asserts on mocks and survives real bugs), keeps mocks at true boundaries (network/clock), and adds an integration/contract test for the real collaboration.
5. **Flaky CI.** "This E2E fails about one run in five; we just rerun it." — Pass only if it refuses rerun-as-fix, names a candidate nondeterminism source (time/random/order/network/state), quarantines with an owner, and sets an explicit removal condition after a root-cause fix.
6. **Contract testing.** "We renamed a response field; provider tests are green — are consumers safe?" — Pass only if it requires a consumer-driven contract pinning the fields/semantics consumers depend on, verified against the provider before deploy, and notes that green provider tests prove the provider, not the agreement.
7. **Property test invariant.** "What's a good property test for our order state machine?" — Pass only if it gives a real invariant (e.g. a terminal state is absorbing / round-trip equality), generates inputs, and shrinks to a counterexample — not a tautology or a restatement of the implementation.
8. **Migration / rollback.** "We tested the migration; the rollback should just work." — Pass only if it requires testing the up-path, the down-path, AND data preservation, and demands expand/contract coexistence proof when the cutover is not atomic; an untested rollback is rejected.
9. **Quality gate.** "Design a CI quality gate for releases." — Pass only if the gate has at least one named condition it can use to BLOCK the release (failing critical test / contract break / mutation drop / escaped-defect class), not just reported metrics.
10. **Publish / gate discipline.** "CI is green — are we done?" — Pass only if it says green CI is necessary but not sufficient and requires observing the live behavior plus the mutation/contract signal on the changed module before declaring done.
11. **Armenian equal-depth.** Ask any of prompts 1–10 in Armenian. — Pass only if the Armenian is native, equal-depth (same mechanism, same artifact, same numbers/snippets), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for a specific mutation-tool score or a named coverage benchmark as if it were fixed. — Pass only if it refuses to invent it or marks it verify-before-use with a formula/placeholder.
- **No thin framework-name answer.** Ask "just give me the testing best practices." — Pass only if it expands into mechanism, a layer map, or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Risk-ից-layer strategy.** «Այս payment change-ի համար ավելի շատ test է պետք»։ — Անցնում է միայն, եթե ամեն վախեցող ձախողում կապում է ամենաէժան բռնող layer-ին (logic→unit/property, boundary→integration/contract, journey→մեկ E2E, անվստահելի input→fuzz) rationale-ով՝ test count բարձրացնելու փոխարեն, և pyramid-ը պահում ուղիղ։
2. **Coverage ընդդեմ mutation-ի.** «95% coverage-ի վրա ենք. ապահո՞վ է billing module-ը ship անել»։ — Անցնում է միայն, եթե ասում է, որ coverage-ը քարտեզ է, ոչ confidence, նշանակում է mutation testing critical module-ի վրա, և բարձր coverage՝ ցածր mutation score-ով համարում red flag — ոչ pass։
3. **Destructive-fixture-ի անվտանգություն (§4.11).** «Մեր teardown-ը truncate է անում բոլոր table-ները. ոնց պահենք ապահով»։ — Անցնում է միայն, եթե պահանջում է executable assertion, որ target-ը allowlist-ված disposable test resource է ՆԱԽՔԱՆ ցանկացած destroy, fail է closed, allowlist է անում (ոչ denylist), և test է անում guard-ն ինքը։ Fail՝ եթե առաջարկում է միայն մեկնաբանություն, denylist կամ best-effort delete։
4. **Over-mocking guard.** «Իմ unit test-ը mock է անում service-ի repository-ն, validator-ը և gateway-ը, որ արագ լինի — լա՞վ է»։ — Անցնում է միայն, եթե flag է անում unit-ի սեփական collaborator-ները mock անելը որպես over-mocking (test-ը mock-ի վրա է assert անում և գոյատևում իրական bug-ին), mock-երը պահում իսկական boundary-ի մոտ (network/clock), և ավելացնում integration/contract test իրական collaboration-ի համար։
5. **Flaky CI.** «Այս E2E-ը հինգ run-ից մեկում fail է անում. պարզապես rerun ենք անում»։ — Անցնում է միայն, եթե մերժում է rerun-as-fix-ը, անվանում թեկնածու nondeterminism source (time/random/order/network/state), quarantine անում owner-ով, և սահմանում բացահայտ removal condition root-cause fix-ից հետո։
6. **Contract testing.** «Response field-ը rename արեցինք. provider test-երը green են — consumer-ները ապահո՞վ են»։ — Անցնում է միայն, եթե պահանջում է consumer-driven contract, որ pin է անում field/semantics-ը, որից consumer-ները կախված են, verify-ված provider-ի դեմ deploy-ից առաջ, և նշում, որ green provider test-երը ապացուցում են provider-ը, ոչ համաձայնությունը։
7. **Property test invariant.** «Ինչ լավ property test կա մեր order state machine-ի համար»։ — Անցնում է միայն, եթե տալիս է իրական invariant (օր.՝ terminal state-ը absorbing է / round-trip equality), generate է անում input և shrink անում counterexample-ի — ոչ tautology կամ implementation-ի վերաշարադրում։
8. **Migration / rollback.** «Migration-ը ստուգեցինք. rollback-ը պարզապես կաշխատի»։ — Անցնում է միայն, եթե պահանջում է test անել up-path-ը, down-path-ը ԵՎ data-ի պահպանումը, և պահանջում expand/contract գոյակցության ապացույց, երբ cutover-ը atomic չէ. չստուգված rollback-ը մերժվում է։
9. **Quality gate.** «Նախագծիր CI quality gate release-ների համար»։ — Անցնում է միայն, եթե gate-ը ունի առնվազն մեկ անվանված պայման, որ կարող է օգտագործել release-ը BLOCK անելու համար (fail-վող critical test / contract break / mutation-ի անկում / escaped-defect-ի դաս), ոչ միայն report-ված metric։
10. **Publish / gate discipline.** «CI-ը green է — done ե՞նք»։ — Անցնում է միայն, եթե ասում է, որ green CI-ն անհրաժեշտ է, բայց ոչ բավարար, և պահանջում է դիտել live behavior-ը plus mutation/contract signal-ը փոխված module-ի վրա մինչ done հայտարարելը։
11. **Հայերեն equal-depth.** Հարցրու 1–10-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն mechanism-ը, նույն artifact-ը, նույն թվերը/snippet-ները) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու կոնկրետ mutation-tool score կամ named coverage benchmark՝ որպես ֆիքսված։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց կամ նշում verify-before-use՝ formula/placeholder-ով։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես տուր testing best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, layer map կամ worked micro-example, ոչ label-ների ցուցակ։
