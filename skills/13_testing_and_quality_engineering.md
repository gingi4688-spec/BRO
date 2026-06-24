# Skill 13 — Testing & Quality Engineering
### The pyramid · unit/integration/contract/e2e · property/fuzz/mutation · isolation · CI quality gates

> **EN:** How to build confidence that software is correct, and keep it correct as it changes — at the lowest cost per unit of confidence. The verification sister of Skill 02 (architecture) and Skill 14 (DevOps/SRE); the executable arm of Skill 11's running-system done-check. Written as Bro's own operating manual — decision-ready, not a tutorial. Sources I draw on: **Kent Beck** (*TDD by Example*, the red-green-refactor loop), **Gerard Meszaros** (*xUnit Test Patterns* — the doubles taxonomy, test smells), **Martin Fowler** (*Refactoring*, the Test Pyramid, "mocks aren't stubs", classicist vs mockist), **Kent C. Dodds** (the Testing Trophy), **Gojko Adzic** (*Specification by Example*, *Bridging the Communication Gap*), **Dan North** (BDD/Given-When-Then), **Michael Feathers** (*Working Effectively with Legacy Code* — seams, characterization tests), **W. Edwards Deming** (quality is built-in, not inspected-in), **John Hughes / David MacIver** (property-based testing — QuickCheck/Hypothesis), **Richard Lipton & T.Y. Chen** (mutation & metamorphic testing), Google's *Software Engineering at Google* (Winters/Manshreck/Wright — hermeticity, sizes, flake culture), and the **FIRST** principles (Tim Ottinger / Brett Schuchert). Status: **v1, top-level, 2026-06-24** (living — every scar becomes a layer).
>
> **HY:** Ոնց կառուցել վստահություն, որ software-ը ճիշտ է, ու պահել այն ճիշտ, երբ փոխվում է — ամենացածր գնով մեկ միավոր վստահության դիմաց։ Skill 02-ի (architecture) ու Skill 14-ի (DevOps/SRE) verification-ի քույրն է. Skill 11-ի running-system done-check-ի executable ձեռքը։ Գրված է որպես Bro-ի սեփական operating manual՝ որոշման-պատրաստ, ոչ թե tutorial։ Հենվում եմ canon-ի վրա՝ **Kent Beck** (*TDD by Example*, red-green-refactor), **Meszaros** (*xUnit Test Patterns* — doubles-ի taxonomy-ն, test smell-երը), **Fowler** (*Refactoring*, Test Pyramid, classicist vs mockist), **Kent C. Dodds** (Testing Trophy), **Gojko Adzic** (*Specification by Example*), **Dan North** (BDD/Given-When-Then), **Michael Feathers** (*Working Effectively with Legacy Code* — seams, characterization tests), **Deming** (որակը կառուցվում է ներսից, ոչ թե ստուգմամբ վերջում), **John Hughes** (property-based՝ QuickCheck/Hypothesis), mutation ու metamorphic testing, Google-ի *Software Engineering at Google* (hermeticity, չափսեր, flake-ի մշակույթ), ու **FIRST** սկզբունքները։ Status: **v1, top-level, 2026-06-24** (living — ամեն սպի շերտ է դառնում)։

---

## 0. ՈՐ ՈՍՊՆՅԱԿԸ ԵՐԲ (the four modes of quality work)

**EN:** Testing is not one act. It is four distinct jobs, asked in order. Most quality failures come from doing the wrong one — writing more end-to-end tests when the gap is a missing unit invariant, or chasing coverage when the real leak is escaped defects in prod.

**HY:** Testing-ը մեկ գործողություն չէ։ Չորս առանձին գործ է՝ հարցված հերթականությամբ։ Որակի ձախողումների մեծ մասը գալիս է սխալ մեկը անելուց — ավելի շատ end-to-end test գրել, երբ բացը unit-ի բացակայող invariant է, կամ coverage հետապնդել, երբ իրական արտահոսքը prod-ում escaped defect-ներն են։

| Mode / Ռեժիմ | Horizon | Decides / Որոշում է | The question it asks |
|---|---|---|---|
| **Specify** (test-as-spec) | one behavior | What "correct" even MEANS for this change — the executable contract before/with the code | "What must be true, and how will a machine prove it?" |
| **Verify** (test-as-net) | one system | Does this build actually work — and did this change break anything that worked? | "Does it do what it should, and did I break what already worked?" |
| **Harden** (reliability) | the suite + the system | Are the tests themselves trustworthy, fast, deterministic — and does the system survive load/failure/attack? | "Can I trust the green check, and does it hold under stress?" |
| **Govern** (quality engineering) | the org / the pipeline | Is quality built into the flow — gates, review, static analysis, prod signals, Definition-of-Done | "Is quality a property of how we work, not a phase at the end?" |

**EN — Rule of use:** start at **Specify** (write the check that defines correct), descend to **Verify** (the pyramid that proves this change is safe), **Harden** the suite and the system (kill flakiness; test non-functionals), then **Govern** (gates, review, prod observability, DoD). Skip Specify and you test what you built, not what was needed. Skip Harden and a flaky suite trains everyone to ignore red. Skip Govern and quality stays a heroic afterthought instead of a property of the machine.

**HY — Կիրառման կանոն:** սկսիր **Specify**-ից (գրիր check-ը, որ սահմանում է «ճիշտ»-ը), իջիր **Verify** (pyramid-ը, որ ապացուցում է, որ այս փոփոխությունն ապահով է), **Harden** արա suite-ն ու system-ը (սպանիր flakiness-ը. test արա non-functional-ները), հետո **Govern** (gate-եր, review, prod observability, DoD)։ Բաց թող Specify-ն ու կtest անես այն, ինչ կառուցել ես, ոչ թե այն, ինչ պետք էր։ Բաց թող Harden-ն ու flaky suite-ը բոլորին կսովորեցնի անտեսել կարմիրը։ Բաց թող Govern-ն ու որակը կմնա հերոսական afterthought, ոչ թե մեքենայի հատկություն։

---

## 1. MINDSET — operating principles (govern everything below)

**EN:**
1. **Quality is built-in, not inspected-in (Deming).** You cannot test quality into a product at the end. Testing *reveals* quality; design, review, and types *create* it. A test phase bolted on after coding catches the cheap bugs and misses the structural ones. Shift left: the earliest place a defect can be caught is the cheapest.
2. **A test is three things at once: a spec, a design force, and a regression net.** As a **spec** it says what correct means, executably. As a **design force** it pressures the code toward small, decoupled, injectable units — code that's hard to test is badly designed (the test is the first client). As a **net** it lets you change fearlessly because a break rings a bell.
3. **Tests ship with every change. No exception.** "I'll add tests later" means never. The test is part of the change, written test-first or test-alongside, reviewed in the same diff. A change without a test is a change whose correctness is unproven and whose regression is undefended.
4. **Optimize confidence per test-dollar, not test count.** The metric is *confidence bought per unit of cost* (write-time + run-time + maintenance + flake tax). A thousand brittle, slow, over-mocked tests buy less confidence than fifty sharp ones. Delete tests that cost more than they protect.
5. **Test behavior, not implementation.** Assert on observable outcomes through public seams, not private internals. A test coupled to *how* code works (private methods, call counts, field values) breaks on every refactor and protects nothing — it's a tax on change, the opposite of a test's purpose. Refactor = behavior unchanged → the tests should stay green untouched. If they don't, they were testing the wrong thing.
6. **A test you haven't watched fail is not a test.** Red-green-refactor exists because the only proof a test *can* catch the bug is seeing it go red when the behavior is wrong. A test that was born green never demonstrated it asserts anything. (Mutation testing, §6.3, is the industrial version of this principle.)
7. **Determinism is non-negotiable.** A test must give the same answer every run, in any order, on any machine, offline. Non-determinism (real time, real network, real randomness, shared mutable state, order dependence) is a defect *in the test*, not a quirk to retry past. Flaky tests are worse than no tests — they destroy trust in the whole suite (§7).
8. **"It compiles / it builds" ≠ "it works."** The done-check is behavior in the running artifact, never a green type-checker (mirror of Skill 11 §7 and Skill 02 §1.7). A passing unit suite proves the units; it does not prove the wired, deployed, migrated, running system. Verify against what actually runs.
9. **Coverage is a signal, never a target (Goodhart).** "When a measure becomes a target, it ceases to be a good measure." 100% line coverage with no assertions tests nothing. Coverage tells you what was *executed*, not what was *verified*. Chase escaped defects and mutation score; treat a coverage *drop* as a question, never a coverage *number* as a goal (§9).
10. **A destructive test fixture must never derive its target from the app's real connection.** Pin a disposable target explicitly and guard it. (See §5.4 — this is an invariant earned in blood, not a guideline.)

**HY:**
1. **Որակը կառուցվում է ներսից, ոչ թե ստուգմամբ (Deming).** Չես կարող որակը «test անել» product-ի մեջ վերջում։ Testing-ը *բացահայտում* է որակը. design-ը, review-ն ու type-երը *ստեղծում* են այն։ Կոդից հետո ձգված test-ի փուլը բռնում է էժան bug-երը ու բաց թողնում structural-ները։ Shift left՝ ամենավաղ տեղը, որտեղ defect-ը կարելի է բռնել, ամենաէժանն է։
2. **Test-ը միաժամանակ երեք բան է՝ spec, design-ի ուժ ու regression net.** Որպես **spec**՝ ասում է, թե ինչ է նշանակում «ճիշտ», executable կերպով։ Որպես **design-ի ուժ**՝ ճնշում է կոդը դեպի փոքր, decoupled, injectable միավորներ — test անելը դժվար կոդը վատ design-ված է (test-ը առաջին client-ն է)։ Որպես **net**՝ թույլ է տալիս փոխել առանց վախի, որովհետև կոտրվածը զանգ է հնչեցնում։
3. **Test-երը գալիս են ամեն փոփոխության հետ։ Բացառություն չկա։** «Հետո կավելացնեմ test»-ը նշանակում է երբեք։ Test-ը փոփոխության մասն է՝ գրված test-first կամ test-alongside, review-ված նույն diff-ում։ Առանց test-ի փոփոխությունն այն փոփոխությունն է, որի ճշտությունը չապացուցված է, ու որի regression-ը անպաշտպան։
4. **Optimize արա confidence-ը մեկ test-դոլարի դիմաց, ոչ թե test-ի քանակը։** Չափանիշը *վստահությունն է մեկ միավոր ծախսի դիմաց* (գրելու ժամանակ + run-time + maintenance + flake-ի հարկ)։ Հազար փխրուն, դանդաղ, over-mocked test-ը պակաս վստահություն է գնում, քան հիսուն սուրը։ Ջնջիր այն test-երը, որ ավելի շատ արժեն, քան պաշտպանում են։
5. **Test արա վարքը, ոչ թե implementation-ը։** Assert արա observable արդյունքների վրա public seam-երի միջով, ոչ թե private internal-ների։ Test-ը, որ կապված է, թե *ոնց* է կոդն աշխատում (private method-եր, call count-եր, field-ի արժեքներ), կոտրվում է ամեն refactor-ի ժամանակ ու ոչինչ չի պաշտպանում — փոփոխության հարկ է, test-ի նպատակի հակառակը։ Refactor = վարքը անփոփոխ → test-երը պիտի մնան կանաչ՝ անձեռնմխելի։ Եթե չեն մնում, սխալ բան էին test անում։
6. **Test-ը, որ չես տեսել ձախողվելիս, test չէ։** Red-green-refactor-ը գոյություն ունի, որովհետև միակ ապացույցը, որ test-ը *կարող* է բռնել bug-ը, այն է, որ տեսնում ես այն կարմրելիս, երբ վարքը սխալ է։ Test-ը, որ ծնվել է կանաչ, երբեք չի ցույց տվել, որ որևէ բան assert է անում։ (Mutation testing-ը, §6.3, այս սկզբունքի արդյունաբերական տարբերակն է։)
7. **Determinism-ը չքննարկվող է։** Test-ը պիտի տա նույն պատասխանը ամեն run-ի, ցանկացած հերթականությամբ, ցանկացած մեքենայի վրա, offline։ Non-determinism-ը (իրական ժամանակ, իրական network, իրական randomness, shared mutable state, order dependence) *test-ի մեջ defect է*, ոչ թե quirk, որ retry-ով անցնես։ Flaky test-երը ավելի վատն են, քան test չլինելը — քանդում են վստահությունն ամբողջ suite-ի հանդեպ (§7)։
8. **«Compile է լինում / build է լինում» ≠ «աշխատում է»։** Done-check-ը վարքն է աշխատող artifact-ում, երբեք կանաչ type-checker-ը (Skill 11 §7-ի ու Skill 02 §1.7-ի հայելին)։ Անցնող unit suite-ը ապացուցում է միավորները. չի ապացուցում wired, deployed, migrated, աշխատող system-ը։ Verify արա այն ինչ իրականում run է լինում։
9. **Coverage-ը signal է, երբեք target (Goodhart).** «Երբ չափումը դառնում է target, դադարում է լավ չափում լինել»։ 100% line coverage առանց assertion-ի ոչինչ չի test անում։ Coverage-ը ասում է, թե ինչ է *կատարվել*, ոչ թե ինչ է *verify-ված*։ Հետապնդիր escaped defect-ները ու mutation score-ը. coverage-ի *անկումը* հարց համարիր, երբեք coverage-ի *թիվը*՝ նպատակ (§9)։
10. **Destructive test fixture-ը երբեք պիտի չստանա իր target-ը app-ի իրական connection-ից։** Pin արա disposable target-ը բացահայտ ու guard արա այն։ (Տես §5.4 — սա արյունով վաստակած invariant է, ոչ թե guideline։)

---

## 2. THE SHAPE OF A TEST SUITE (taxonomy & the right ratio)

### 2.1 The test taxonomy (what each level proves)

**EN:**
- **Unit** — one unit of behavior (a function, a method, a small cluster of classes) in isolation from I/O. Fast (sub-millisecond to low-ms), deterministic, runs by the thousand. Proves logic/algorithms/branches/edge cases. The base of the pyramid. *Unit ≠ "one class" — it's one behavior, possibly across a few collaborators (the classicist view, §4).*
- **Integration** — a unit plus a real adjacent dependency (a real DB, a real queue, a real file system, an HTTP server you stand up). Proves the wiring, the SQL, the serialization, the mapping — the things mocks lie about. Slower (tens-to-hundreds of ms), fewer of them. **The Testing Trophy's center of gravity (§2.2).**
- **Component / service** — one deployable service in isolation, with its dependencies stubbed at the network edge (in-memory or contract doubles). Proves the service behaves correctly through its own API without standing up the whole world.
- **Contract** — the agreement between a consumer and a provider, tested independently on each side so they can deploy independently (§8). Proves compatibility without an end-to-end environment.
- **End-to-end (e2e)** — the whole system through the real entry point (the UI, the public API), real services, real data. Proves the critical user journeys actually work wired together. Slow, brittle, expensive — **few, and only for the highest-value paths.**
- **System / acceptance** — the whole product against the business acceptance criteria (often BDD/Gherkin, §3.3). The "does it solve the user's problem" check.

**HY:**
- **Unit** — մեկ միավոր վարք (function, method, փոքր class-կլաստեր)՝ մեկուսացված I/O-ից։ Արագ (ենթա-միլիվայրկյանից ցածր-ms), deterministic, run է լինում հազարներով։ Ապացուցում է logic/ալգորիթմ/branch/edge case։ Pyramid-ի հիմքը։ *Unit ≠ «մեկ class» — մեկ վարք է, հնարավոր է մի քանի collaborator-ի վրայով (classicist տեսակետ, §4)։*
- **Integration** — միավոր + իրական հարակից dependency (իրական DB, queue, file system, HTTP server, որ բարձրացնում ես)։ Ապացուցում է wiring-ը, SQL-ը, serialization-ը, mapping-ը — այն, ինչի մասին mock-երը ստում են։ Ավելի դանդաղ (տասնյակ-հարյուր ms), ավելի քիչ։ **Testing Trophy-ի ծանրության կենտրոնը (§2.2)։**
- **Component / service** — մեկ deployable service մեկուսացված, dependency-ները stub-ված network-ի եզրին (in-memory կամ contract double-եր)։ Ապացուցում է, որ service-ն իր API-ի միջով ճիշտ է վարվում՝ առանց ամբողջ աշխարհը բարձրացնելու։
- **Contract** — consumer-ի ու provider-ի համաձայնությունը՝ test-ված անկախ ամեն կողմում, որ կարողանան independently deploy անել (§8)։ Ապացուցում է compatibility-ն առանց end-to-end environment-ի։
- **End-to-end (e2e)** — ամբողջ system-ը իրական entry point-ի միջով (UI, public API), իրական service-ներ, իրական data։ Ապացուցում է, որ critical user journey-ները իրականում աշխատում են wired-together։ Դանդաղ, փխրուն, թանկ — **քիչ, ու միայն ամենաարժեքավոր path-երի համար։**
- **System / acceptance** — ամբողջ product-ը business-ի acceptance criteria-ի դեմ (հաճախ BDD/Gherkin, §3.3)։ «Լուծո՞ւմ է user-ի խնդիրը» check-ը։

### 2.2 The shape — pyramid vs trophy vs honeycomb

**EN:** There is no single right ratio — there is a right ratio *for your system's risk profile*. Three canonical shapes:

- **Test Pyramid (Mike Cohn, popularized by Fowler/Vocke)** — many unit, fewer integration, very few e2e. The classic default. Optimizes for fast feedback and pinpoint failure localization. Best when the **logic** is the risk (rich domain, algorithms, business rules).
- **Testing Trophy (Kent C. Dodds)** — a fat **integration** middle, a solid static-analysis base (types + lint as the floor), some unit, a thin e2e cap. "Write tests. Not too many. Mostly integration." Best when the risk is in the **wiring** (data-heavy CRUD apps, UI, most web services) — where units pass but the seams between them leak. Modern web work usually lives here.
- **Honeycomb (Spotify)** — for microservices: thin unit cap, fat **integration** body, thin e2e — because in a service the value and the bugs are in how it integrates with its dependencies, not in isolated logic.

**Decide by where YOUR bugs actually escape from.** Look at your last 20 production incidents: if they were logic errors → pyramid; if they were integration/wiring/contract errors → trophy/honeycomb. Let the escaped-defect data pick the shape, not fashion.

**HY:** Միակ ճիշտ հարաբերակցություն չկա — կա ճիշտ հարաբերակցություն *քո system-ի ռիսկի պրոֆիլի համար*։ Երեք canonical ձև՝

- **Test Pyramid (Cohn, Fowler/Vocke-ի տարածմամբ)** — շատ unit, պակաս integration, շատ քիչ e2e։ Classic default-ը։ Optimize է անում արագ feedback-ի ու ճշգրիտ failure localization-ի համար։ Լավագույնն է, երբ ռիսկը **logic**-ն է (հարուստ domain, ալգորիթմներ, business rule-եր)։
- **Testing Trophy (Kent C. Dodds)** — հաստ **integration** մեջտեղ, ամուր static-analysis հիմք (type + lint որպես հատակ), որոշ unit, բարակ e2e գլխարկ։ «Գրիր test-եր։ Ոչ շատ։ Հիմնականում integration»։ Լավագույնն է, երբ ռիսկը **wiring**-ում է (data-ծանր CRUD app-եր, UI, web service-ների մեծ մաս) — որտեղ unit-երն անցնում են, բայց seam-երը արտահոսում են։ Ժամանակակից web-ը սովորաբար այստեղ է։
- **Honeycomb (Spotify)** — microservice-ների համար՝ բարակ unit, հաստ **integration** մարմին, բարակ e2e — որովհետև service-ում արժեքն ու bug-երը այն են, ոնց է ինտեգրվում dependency-ների հետ, ոչ թե մեկուսացված logic-ում։

**Որոշիր ըստ նրա, թե ՔՈ bug-երը իրականում որտեղից են արտահոսում։** Նայիր վերջին 20 production incident-ին՝ եթե logic սխալ էին → pyramid. եթե integration/wiring/contract → trophy/honeycomb։ Թող escaped-defect data-ն ընտրի ձևը, ոչ թե fashion-ը։

### 2.3 The ice-cream cone — why e2e-heavy is an anti-pattern

**EN:** The **ice-cream cone** (the pyramid inverted: a fat e2e top, thin unit bottom, often a manual-QA cherry on top) is the most common and most expensive failure. Why it's an anti-pattern:
- **Slow feedback** — e2e suites run in minutes-to-hours, so they run rarely and late; bugs are found far from where they were introduced (the cost-of-a-bug curve, §3.1, is steepest here).
- **Poor localization** — an e2e failure says "checkout is broken," not "the tax-rounding function returns the wrong cents." You debug the whole stack to find a one-line bug a unit test would have pinpointed.
- **Flaky by nature** — every real network hop, every async wait, every shared environment is a flake source (§7); e2e suites are where flakiness breeds, and flakiness destroys trust in the whole gate.
- **Brittle** — coupled to UI structure and timing; a CSS change breaks "tests" that assert nothing about behavior.

*Fix:* push each test to the **lowest level that can still catch the bug** (the "test at the lowest level" rule). Keep e2e for a handful of critical, money-path journeys; move everything else down to integration and unit.

**HY:** **Ice-cream cone**-ը (շրջված pyramid-ը՝ հաստ e2e վերև, բարակ unit ներքև, հաճախ manual-QA բալ վերևում) ամենատարածված ու ամենաթանկ ձախողումն է։ Ինչու է anti-pattern՝
- **Դանդաղ feedback** — e2e suite-երը run են լինում րոպեներ-ժամեր, ուստի հազվադեպ ու ուշ. bug-երը գտնվում են հեռու այնտեղից, որտեղ ներմուծվել են (bug-ի գնի կորը, §3.1, այստեղ ամենաթեքն է)։
- **Վատ localization** — e2e ձախողումն ասում է «checkout-ը կոտրված է», ոչ թե «tax-rounding function-ը սխալ cent է վերադարձնում»։ Debug ես անում ամբողջ stack-ը՝ մեկ տողանոց bug գտնելու, որ unit test-ը կճշտեր։
- **Բնույթով flaky** — ամեն իրական network hop, ամեն async wait, ամեն shared environment flake-ի աղբյուր է (§7). e2e suite-երն այնտեղն են, որտեղ flakiness-ը բազմանում է, ու flakiness-ը քանդում է վստահությունն ամբողջ gate-ի հանդեպ։
- **Փխրուն** — կապված UI structure-ին ու timing-ին. CSS փոփոխությունը կոտրում է «test»-եր, որ վարքի մասին ոչինչ չեն assert անում։

*Fix:* հրիր ամեն test դեպի **ամենացածր level-ը, որ դեռ կարող է բռնել bug-ը** («test at the lowest level» կանոնը)։ Պահիր e2e-ն մի բուռ critical, money-path journey-ի համար. մնացածը իջեցրու integration ու unit։

### 2.4 Sizing (Google's orthogonal axis)

**EN:** Google separates **size** (resources/isolation: small = in-process, no I/O, deterministic; medium = localhost, one machine; large = multi-machine/network) from **scope** (how much code under test: unit/integration/system). Size governs *speed and hermeticity*; scope governs *what's proven*. Tag tests by size so the fast ones gate every commit and the large ones run on a slower cadence. A "unit-scope" test that hits the network is mis-sized and will rot the fast suite.

**HY:** Google-ը առանձնացնում է **size**-ը (ռեսուրս/մեկուսացում՝ small = in-process, ոչ I/O, deterministic. medium = localhost, մեկ մեքենա. large = multi-machine/network) **scope**-ից (որքան կոդ է test-ի տակ՝ unit/integration/system)։ Size-ը կառավարում է *արագությունն ու hermeticity-ն*. scope-ը՝ *ինչ է ապացուցվում*։ Tag արա test-երը ըստ size-ի, որ արագները gate անեն ամեն commit, իսկ large-երը run լինեն ավելի դանդաղ cadence-ով։ «Unit-scope» test-ը, որ network է խփում, mis-sized է ու կփտեցնի արագ suite-ը։

---

## 3. PHILOSOPHY & DRIVEN DEVELOPMENT (TDD / BDD / ATDD)

### 3.1 The cost-of-a-bug curve & shift-left

**EN:** The cost to fix a defect rises by roughly an order of magnitude at each stage it escapes: caught in the editor (types/lint) ≪ in a unit test ≪ in CI ≪ in code review ≪ in QA ≪ in staging ≪ **in production with a customer**. (Boehm's classic curve; the exact multipliers are debated, the *shape* is not.) **Shift-left** = move detection as early as possible: types and static analysis as you type, unit tests on save, integration in CI, contract before deploy. Every stage you shift a class of bug earlier multiplies the savings. The corollary: **shift-right too** — some defects (load, real-data shapes, rare races) only appear in prod, so observability-driven QA (§11) catches what no pre-prod test can.

**HY:** Defect-ի ուղղման գինը մոտավորապես մեկ կարգով աճում է ամեն փուլում, որ արտահոսում է՝ բռնված editor-ում (type/lint) ≪ unit test-ում ≪ CI-ում ≪ code review-ում ≪ QA-ում ≪ staging-ում ≪ **production-ում client-ի մոտ**։ (Boehm-ի classic կորը. ճշգրիտ multiplier-ները քննարկվում են, *ձևը*՝ ոչ։) **Shift-left** = տեղափոխիր հայտնաբերումը հնարավորինս վաղ՝ type ու static analysis գրելու ընթացքում, unit test save-ի ժամանակ, integration CI-ում, contract deploy-ից առաջ։ Ամեն փուլ, որ bug-ի class-ը ավելի վաղ ես տեղափոխում, բազմապատկում է խնայողությունը։ Corollary՝ **shift-right նույնպես** — որոշ defect-ներ (load, իրական data-ի ձևեր, հազվադեպ race-եր) միայն prod-ում են երևում, ուստի observability-driven QA-ն (§11) բռնում է այն, ինչ ոչ մի pre-prod test չի կարող։

### 3.2 TDD — red-green-refactor

**EN:**
- **The loop (Kent Beck):** **RED** — write a small failing test for the next bit of behavior (and *watch it fail* — §1.6). **GREEN** — write the minimum code to pass, even if ugly. **REFACTOR** — clean up with the net holding you, both code and test. Repeat in tight cycles (minutes, not hours).
- **The Three Laws of TDD (Robert C. Martin):** (1) Write no production code until you have a failing test. (2) Write no more of a test than is sufficient to fail (a compile error counts as failing). (3) Write no more production code than is sufficient to pass. These force the tight loop and prevent "I'll test it later."
- **Why TDD works beyond the net:** it forces **testable design** (small units, injected dependencies, clear seams), gives a **definition of done per step**, and produces a spec that never goes stale because it must pass. TDD is a *design* discipline that happens to leave tests behind.
- **When NOT dogmatic:** spikes/exploration (throw-away code to learn), where the design is genuinely unknown (test-after, then keep the good tests), and pure-UI pixel-tuning. The principle (test-with-the-change) is the law; strict test-first is the default, not a religion.

**HY:**
- **Loop-ը (Kent Beck):** **RED** — գրիր փոքր ձախողվող test հաջորդ վարքի համար (ու *տես այն ձախողվելիս* — §1.6)։ **GREEN** — գրիր նվազագույն կոդը, որ անցնի, թեկուզ տգեղ։ **REFACTOR** — մաքրիր, երբ net-ը պահում է քեզ, ու՛ կոդը, ու՛ test-ը։ Կրկնիր սեղմ cycle-երով (րոպեներ, ոչ ժամեր)։
- **TDD-ի երեք օրենքը (Robert C. Martin):** (1) Production կոդ մի՛ գրիր, քանի դեռ ձախողվող test չունես։ (2) Test-ից ավելին մի՛ գրիր, քան բավական է ձախողվելու համար (compile error-ը հաշվվում է ձախողում)։ (3) Production կոդից ավելին մի՛ գրիր, քան բավական է անցնելու համար։ Սրանք ստիպում են սեղմ loop-ը ու կանխում «հետո կtest անեմ»-ը։
- **Ինչու է TDD-ն աշխատում net-ից բացի:** ստիպում է **testable design** (փոքր միավորներ, injected dependency-ներ, հստակ seam-եր), տալիս է **definition of done յուրաքանչյուր քայլի համար**, ու արտադրում է spec, որ երբեք չի հնանում, որովհետև պիտի անցնի։ TDD-ն *design*-ի կարգապահություն է, որ պատահաբար test-եր է թողնում հետևից։
- **Երբ ոչ dogmatic:** spike/exploration (սովորելու համար throw-away կոդ), որտեղ design-ը իրապես անհայտ է (test-after, հետո պահիր լավ test-երը), ու pure-UI pixel-tuning։ Սկզբունքը (test-with-the-change) օրենք է. խիստ test-first-ը default է, ոչ թե կրոն։

### 3.3 BDD & Specification by Example (ATDD)

**EN:**
- **BDD (Dan North)** reframes tests as **behavior** in business language. The unit of work is a scenario in **Given-When-Then**: *Given* a context, *When* an event, *Then* an outcome. It pushes the conversation up to "what should the system do for the user" before any code.
- **Gherkin** is the structured plain-language format (Feature/Scenario/Given-When-Then) that both humans read and tools (Cucumber/SpecFlow/Behave) execute against step definitions. The Gherkin *is* the living spec.
- **Specification by Example (Gojko Adzic)** — derive the spec from **concrete examples** worked through with the business, distill them into executable acceptance tests, and keep them as **living documentation** that never drifts from the code because the build runs it. The examples pin down ambiguity that prose can't.
- **ATDD (Acceptance-Test-Driven Development)** — write the acceptance test *with the three amigos* (product + dev + tester) **before** building, so "done" is defined and agreed up front. Outer loop = ATDD/BDD acceptance; inner loop = TDD unit cycles (the "double-loop").
- **The trap:** Gherkin/BDD tooling is only worth its overhead when **non-technical stakeholders actually read and shape the scenarios.** If only developers touch them, you've added a slow English-to-code indirection layer for no benefit — write plain tests instead.

**HY:**
- **BDD (Dan North)** test-երը reframe է անում որպես **վարք** business լեզվով։ Աշխատանքի միավորը scenario է **Given-When-Then**-ով՝ *Given* context, *When* event, *Then* արդյունք։ Բարձրացնում է խոսակցությունը մինչև «ինչ պիտի անի system-ը user-ի համար»՝ կոդից առաջ։
- **Gherkin**-ը structured plain-language ֆորմատն է (Feature/Scenario/Given-When-Then), որ ու՛ մարդիկ են կարդում, ու՛ գործիքները (Cucumber/SpecFlow/Behave) execute են անում step definition-ների դեմ։ Gherkin-ը *ինքն է* living spec-ը։
- **Specification by Example (Gojko Adzic)** — spec-ը դուրս բեր **կոնկրետ օրինակներից**՝ business-ի հետ մշակված, distill արա executable acceptance test-երի, ու պահիր որպես **living documentation**, որ երբեք չի շեղվում կոդից, որովհետև build-ը run է անում այն։ Օրինակները ճշտում են երկիմաստությունը, որ prose-ը չի կարող։
- **ATDD** — գրիր acceptance test-ը *երեք amigo-ով* (product + dev + tester) **կառուցելուց առաջ**, որ «done»-ը սահմանված ու համաձայնեցված լինի սկզբից։ Արտաքին loop = ATDD/BDD acceptance. ներքին loop = TDD unit cycle-ներ (double-loop)։
- **Թակարդը:** Gherkin/BDD tooling-ն իր overhead-ի արժեքը ունի միայն, երբ **ոչ-տեխնիկական stakeholder-ները իրականում կարդում ու ձևավորում են scenario-ները**։ Եթե միայն developer-ներն են դիպչում, ավելացրել ես դանդաղ English-to-code indirection շերտ՝ առանց օգուտի — փոխարենը գրիր plain test-եր։

---

## 4. SCHOOLS & STYLE (London vs Detroit, classicist vs mockist)

**EN:**
- **Detroit / Chicago / "classicist" school (Beck, Fowler classicist)** — test through **real collaborators**, mock only the awkward edges (network, time, external services). A "unit" is a behavior, often spanning a few cooperating objects. **State verification:** assert on the resulting state/return value. Tests are coupled to *behavior*, survive refactoring, double as small integration tests. *Cost:* a failure can implicate several classes (worse localization).
- **London / "mockist" school (Freeman & Pryce, *GOOS*)** — test each object in isolation, **mock all its collaborators**, drive design **outside-in** (start at the entry point, discover collaborators by the roles you mock). **Interaction verification:** assert on the calls made to collaborators. Great localization, design pressure toward clean interfaces. *Cost:* tests couple to *implementation* (the call structure), so they break on refactor and can pass while the integrated whole is broken.
- **The synthesis (this is the working stance):** **default classicist** — test real behavior through real collaborators for the domain core; use **mockist** discipline at architectural boundaries (the ports of hexagonal — Skill 02 §2.2) where the collaborator is a true external dependency. Mock at the *seams of your design*, not between every two classes. **Don't mock what you don't own** (§5.3) — wrap third-party libs in your own adapter and mock *that*.

**HY:**
- **Detroit / «classicist» դպրոց (Beck, Fowler-classicist)** — test արա **իրական collaborator-ների** միջով, mock արա միայն անհարմար եզրերը (network, time, արտաքին service)։ «Unit»-ը վարք է, հաճախ մի քանի համագործակցող object-ի վրայով։ **State verification:** assert արա ստացված state-ի/return value-ի վրա։ Test-երը կապված են *վարքին*, գոյատևում են refactoring-ից, կրկնակի աշխատում են որպես փոքր integration test։ *Գին:* ձախողումը կարող է մի քանի class մեղադրել (վատ localization)։
- **London / «mockist» դպրոց (Freeman & Pryce, *GOOS*)** — test արա ամեն object մեկուսացված, **mock արա բոլոր collaborator-ները**, վարիր design-ը **outside-in**։ **Interaction verification:** assert արա collaborator-ներին արված call-երի վրա։ Հիանալի localization, design-ի ճնշում դեպի մաքուր interface-ներ։ *Գին:* test-երը կապվում են *implementation*-ին (call structure-ին), ուստի կոտրվում են refactor-ի ժամանակ ու կարող են անցնել, մինչ ինտեգրված ամբողջը կոտրված է։
- **Սինթեզը (սա է աշխատանքային դիրքը):** **default classicist** — test արա իրական վարքն իրական collaborator-ների միջով domain core-ի համար. օգտագործիր **mockist** կարգապահությունն architectural boundary-ներում (hexagonal-ի port-եր — Skill 02 §2.2), որտեղ collaborator-ը իրական արտաքին dependency է։ Mock արա *քո design-ի seam-երում*, ոչ ամեն երկու class-ի միջև։ **Մի՛ mock արա այն, ինչ քոնը չէ** (§5.3) — փաթաթիր third-party lib-երը քո adapter-ով ու mock արա *դա*։

---

## 5. TEST DOUBLES, ISOLATION & DATA

### 5.1 The doubles taxonomy (Meszaros — precise definitions)

**EN:** "Mock" is colloquially abused for all of these. Use the precise word — it tells the reader what the double *does*:

| Double | What it is | When to use |
|---|---|---|
| **Dummy** | Passed to fill a parameter, never actually used | Satisfy a signature you don't exercise |
| **Stub** | Returns canned answers to calls made during the test | Provide indirect *inputs* (a repo that returns a fixed row) |
| **Spy** | A stub that also *records* how it was called | Verify a side-effect happened, while still returning canned data |
| **Mock** | Pre-programmed with *expectations*; the assertion is on the interaction | Verify the *protocol* of calls to a collaborator (mockist style) |
| **Fake** | A working but lightweight implementation | In-memory DB, in-memory queue — real behavior, fast & hermetic |

**Rule:** prefer **fakes > stubs > mocks** in that order. A fake (e.g. an in-memory repository that actually behaves like the real one) gives real behavior without the brittleness of interaction-asserting mocks. Reach for a mock only when the *interaction itself* is the behavior under test (e.g. "an email is sent exactly once").

**HY:** «Mock»-ը խոսակցականում չարաշահվում է բոլորի համար։ Օգտագործիր ճշգրիտ բառը — ասում է ընթերցողին, թե double-ը *ինչ է անում*՝

| Double | Ինչ է | Երբ |
|---|---|---|
| **Dummy** | Փոխանցվում է parameter-ը լրացնելու, երբեք չի օգտագործվում | Բավարարել signature, որ չես exercise անում |
| **Stub** | Canned պատասխան է վերադարձնում test-ի ընթացքում | Indirect *input* տալ (repo, որ ֆիքսված row է վերադարձնում) |
| **Spy** | Stub, որ նաև *գրանցում* է, ոնց է call-վել | Verify անել, որ side-effect եղավ, դեռ canned data վերադարձնելով |
| **Mock** | Նախածրագրված *expectation*-ներով. assertion-ը interaction-ի վրա է | Verify անել collaborator-ին call-երի *protocol*-ը (mockist) |
| **Fake** | Աշխատող, բայց թեթև implementation | In-memory DB/queue — իրական վարք, արագ ու hermetic |

**Կանոն:** նախընտրիր **fake > stub > mock** այդ հերթականությամբ։ Fake-ը (օր.՝ in-memory repository, որ իրականում վարվում է real-ի պես) տալիս է իրական վարք առանց interaction-assert անող mock-ի փխրունության։ Mock-ի դիմիր միայն, երբ *ինքը interaction-ն* է test-ի տակ դրված վարքը (օր.՝ «email-ը ուղարկվում է ճիշտ մեկ անգամ»)։

### 5.2 The over-mocking anti-pattern

**EN:** Mocking everything produces tests that assert the code calls the methods you wrote — a tautology. They pass when the code is wrong (the mock returns whatever you told it), break when you refactor (the call structure changed), and never catch an integration bug (the mock never matched reality). *Smell:* the test setup is longer than the code under test, and every collaborator is a mock. *Fix:* test through real collaborators (classicist), use fakes for I/O, push the mocks out to the architectural boundary, and add an integration test for the seams the mocks were faking.

**HY:** Ամեն ինչ mock անելը արտադրում է test-եր, որ assert են անում, որ կոդը կանչում է այն method-ները, որ գրել ես — tautology։ Անցնում են, երբ կոդը սխալ է (mock-ը վերադարձնում է ինչ ասել ես), կոտրվում են refactor-ին (call structure-ը փոխվեց), ու երբեք integration bug չեն բռնում (mock-ը երբեք իրականությանը չհամապատասխանեց)։ *Smell:* test-ի setup-ը ավելի երկար է, քան test-ի տակ դրված կոդը, ու ամեն collaborator mock է։ *Fix:* test արա իրական collaborator-ների միջով (classicist), օգտագործիր fake-եր I/O-ի համար, հրիր mock-երն architectural boundary, ու ավելացրու integration test seam-երի համար, որ mock-երը կեղծում էին։

### 5.3 Don't mock what you don't own

**EN:** Mocking a third-party library/API directly couples your tests to *your assumption* of how it behaves — and that assumption is exactly what bugs. When the library changes (or you misread it), the mock stays green and prod breaks. *Rule:* wrap the third-party thing in a **thin adapter you own** (a port), mock the adapter in unit tests, and write **one integration/contract test against the real thing** to prove the adapter is right. You mock your own boundary, you integration-test the foreign one.

**HY:** Third-party library/API ուղիղ mock անելը կապում է test-երդ *քո ենթադրությանը*, թե ոնց է այն վարվում — ու հենց այդ ենթադրությունն է bug-ի աղբյուրը։ Երբ library-ն փոխվում է (կամ սխալ ես կարդացել), mock-ը մնում է կանաչ, prod-ը կոտրվում է։ *Կանոն:* փաթաթիր third-party բանը **բարակ adapter-ով, որ քոնն է** (port), mock արա adapter-ը unit test-երում, ու գրիր **մեկ integration/contract test իրական բանի դեմ**՝ ապացուցելու, որ adapter-ը ճիշտ է։ Mock ես անում քո boundary-ն, integration-test ես անում օտարը։

### 5.4 Isolation, hermeticity & the FIRST principles

**EN:** Good tests are **FIRST** (Ottinger/Schuchert):
- **Fast** — runs in milliseconds; the whole unit suite in seconds. Slow tests don't get run.
- **Isolated/Independent** — no test depends on another, on order, or on shared mutable state. Each sets up its own world and tears it down. Run any subset, any order, in parallel.
- **Repeatable** — same result every time, on any machine, offline. Determinism (§7).
- **Self-validating** — the test asserts pass/fail itself; no human eyeballs a log to decide.
- **Timely** — written with (ideally just before) the code, not bolted on months later.

**Hermeticity (Google):** a test brings up everything it needs and depends on nothing outside its process tree — no shared DB, no live network, no "works on my machine" environment. Hermetic tests are reproducible and parallelizable. Achieve it with: **test containers** (a real Postgres/Redis/Kafka in a throwaway container per suite), **DB-per-test or transaction-rollback** (wrap each test in a transaction that rolls back, or spin a fresh schema), **in-memory fakes** for the fast tier, and **controlled clock/RNG/network** (§7).

**Fixtures vs factories vs builders:**
- **Fixtures** — pre-defined data set up before tests. Simple, but shared fixtures couple tests and cause order-dependence (the *General Fixture* smell). Prefer **fresh, minimal, test-local** data.
- **Factories** — functions that produce valid objects with sensible defaults you override per test (`makeUser({role: 'admin'})`). The default for most setup — readable, only the relevant field is shown.
- **Builders** — fluent step-by-step construction for complex objects (`aUser().withRole('admin').build()`). Use when the object graph is large; the **Object Mother** pattern (named canonical examples) complements them.

**THE HARD INVARIANT — destructive fixtures (a real production-grade lesson):** A test fixture that **drops/truncates/resets** a database must **NEVER derive its target from the application's real connection string/URL/config.** The target must be an **explicitly pinned, disposable** database (a dedicated `_test` DB on a dedicated port/name), and the destructive step must be **guarded** by an assertion that refuses to run unless the target name matches the disposable pattern (e.g. `assert db_name.endswith("_test")` / `assert host == TEST_HOST` → else abort). The mechanism that creates/seeds and the mechanism that destroys must point at the **same pinned disposable target**, never at "whatever the app is configured for." *Why this is a law, not a guideline:* a pre-push test gate that provisioned against the live dev DB and dropped it is exactly the catastrophe this prevents — one config-bleed and a test wipes real data. Pin the target, guard the drop, and isolate the test DB's roles to match CI exactly (a naive port-swap that inherits prod-shaped roles fails on RLS/refnum and tempts people to point back at the real DB). **Isolation is not just for correctness — it's the blast-radius fence.**

**HY:** Լավ test-երը **FIRST** են (Ottinger/Schuchert)՝
- **Fast** — run է լինում միլիվայրկյաններով. ամբողջ unit suite-ը՝ վայրկյաններով։ Դանդաղ test-երը չեն run-վում։
- **Isolated/Independent** — ոչ մի test չի կախված մյուսից, հերթականությունից կամ shared mutable state-ից։ Ամեն մեկն իր աշխարհը set up է անում ու քանդում։ Run արա ցանկացած ենթաբազմություն, ցանկացած հերթականությամբ, parallel։
- **Repeatable** — նույն արդյունքը ամեն անգամ, ցանկացած մեքենայի, offline։ Determinism (§7)։
- **Self-validating** — test-ը ինքն է assert անում pass/fail. մարդ չի նայում log-ին որոշելու։
- **Timely** — գրված կոդի հետ (իդեալում՝ ճիշտ դրանից առաջ), ոչ թե ձգված ամիսներ հետո։

**Hermeticity (Google):** test-ը բարձրացնում է ամեն ինչ, ինչ պետք է, ու չի կախված իր process-tree-ից դուրս ոչնչից — ոչ shared DB, ոչ live network, ոչ «իմ մեքենայի վրա աշխատում է» environment։ Hermetic test-երը reproducible ու parallelizable են։ Հասիր սրան՝ **test container**-ներով (իրական Postgres/Redis/Kafka throwaway container-ում suite-ի համար), **DB-per-test կամ transaction-rollback**-ով (ամեն test փաթաթիր transaction-ով, որ rollback է լինում, կամ թարմ schema), **in-memory fake**-երով արագ tier-ի համար, ու **վերահսկվող clock/RNG/network**-ով (§7)։

**Fixture vs factory vs builder:**
- **Fixture** — նախասահմանված data՝ set up արված test-երից առաջ։ Պարզ, բայց shared fixture-ները կապում են test-երը ու order-dependence են առաջացնում (*General Fixture* smell)։ Նախընտրիր **թարմ, նվազագույն, test-local** data։
- **Factory** — function-ներ, որ վավեր object են արտադրում խելամիտ default-ներով, որ override ես անում ամեն test-ում (`makeUser({role:'admin'})`)։ Default-ը setup-ի մեծ մասի համար — ընթեռնելի, միայն կարևոր field-ն է երևում։
- **Builder** — fluent քայլ-առ-քայլ կառուցում complex object-ների համար (`aUser().withRole('admin').build()`)։ Օգտագործիր, երբ object graph-ը մեծ է. **Object Mother** pattern-ը (անվանված canonical օրինակներ) լրացնում է։

**ԿԱՐԾՐ INVARIANT — destructive fixture-ներ (իրական production-մակարդակի դաս):** Test fixture-ը, որ **drop/truncate/reset** է անում database, **ԵՐԲԵՔ** պիտի չստանա իր target-ը application-ի իրական connection string/URL/config-ից։ Target-ը պիտի լինի **բացահայտ pin արված, disposable** database (առանձին `_test` DB առանձին port/name-ով), ու destructive քայլը պիտի **guard** արված լինի assertion-ով, որ հրաժարվում է run-վելուց, քանի դեռ target-ի անունը չի համընկնում disposable pattern-ին (օր.՝ `assert db_name.endswith("_test")` / `assert host == TEST_HOST` → այլապես abort)։ Մեխանիզմը, որ ստեղծում/seed է անում, ու մեխանիզմը, որ ոչնչացնում է, պիտի ցույց տան **նույն pin արված disposable target-ին**, երբեք «ինչ որ app-ը configured է»-ին։ *Ինչու է սա օրենք, ոչ guideline:* pre-push test gate-ը, որ provision արեց live dev DB-ի դեմ ու drop արեց այն, հենց այս աղետն է, որ սա կանխում է — մեկ config-bleed ու test-ը ջնջում է իրական data։ Pin արա target-ը, guard արա drop-ը, ու isolate արա test DB-ի role-երը ճիշտ CI-ի պես (naive port-swap-ը, որ ժառանգում է prod-ձև role-եր, ձախողվում է RLS/refnum-ի վրա ու գայթակղում մարդկանց ետ ցույց տալ իրական DB-ին)։ **Isolation-ը միայն correctness-ի համար չէ — blast-radius-ի ցանկապատն է։**

---

## 6. ADVANCED TEST GENERATION (beyond hand-picked examples)

### 6.1 Property-based testing (invariants over examples)

**EN:** Example tests check the cases you thought of; **property-based testing (John Hughes, QuickCheck; Hypothesis in Python, fast-check in JS, jqwik in Java)** checks **invariants** over hundreds of machine-generated inputs. You state a property that must hold for *all* valid inputs ("reversing a list twice yields the original," "the parser and serializer round-trip," "the result is always sorted and a permutation of the input"), and the framework hunts for a counter-example, then **shrinks** it to the minimal failing case. *When:* pure functions, parsers/serializers (round-trips), data structures, anything with an algebraic invariant or a reference implementation (metamorphic — §6.5). *Power:* it finds the boundary inputs you'd never enumerate. *Cost:* you must be able to *state* the invariant — the discipline of finding the property often teaches you the spec. Pair with a fixed seed for reproducibility, and persist the failing case as a regression test.

**HY:** Example test-երը ստուգում են այն case-երը, որ մտածել ես. **property-based testing-ը (John Hughes, QuickCheck. Hypothesis Python-ում, fast-check JS-ում, jqwik Java-ում)** ստուգում է **invariant**-ներ հարյուրավոր մեքենայաստեղծ input-ների վրա։ Նշում ես property, որ պիտի պահպանվի *բոլոր* վավեր input-ների համար («ցուցակը երկու անգամ շրջելը տալիս է բնօրինակը», «parser-ն ու serializer-ը round-trip են անում», «արդյունքը միշտ sorted է ու input-ի permutation»), ու framework-ը որսում է counter-example, հետո **shrink** է անում մինչև նվազագույն ձախողվող case-ը։ *Երբ:* pure function-ներ, parser/serializer (round-trip), data structure-ներ, ամեն ինչ algebraic invariant-ով կամ reference implementation-ով (metamorphic — §6.5)։ *Ուժ:* գտնում է boundary input-ները, որ երբեք չէիր թվարկի։ *Գին:* պիտի կարողանաս *նշել* invariant-ը — property-ն գտնելու կարգապահությունը հաճախ սովորեցնում է spec-ը։ Pair արա ֆիքսված seed-ով reproducibility-ի համար, ու persist արա ձախողվող case-ը որպես regression test։

### 6.2 Fuzzing (coverage-guided)

**EN:** **Fuzzing** throws malformed/random/mutated inputs at an entry point to find crashes, hangs, memory-safety bugs, and unhandled exceptions. **Coverage-guided fuzzers (AFL, libFuzzer, Go's native fuzzing, Jazzer)** evolve inputs to maximize code-path coverage, finding deep bugs hand-written tests never reach. *When:* anything that parses untrusted input (file formats, network protocols, deserializers, APIs at the trust boundary — overlaps Skill 12's input-validation playbook). *Practice:* run continuously (OSS-Fuzz model), seed with a valid-input corpus, and turn every crash into a regression test. Property-based testing and fuzzing are cousins — properties assert *correctness*, fuzzing hunts *crashes*; combine them (property-fuzzing) for "no input should ever violate this invariant or crash."

**HY:** **Fuzzing**-ը նետում է malformed/random/mutated input-ներ entry point-ին՝ գտնելու crash, hang, memory-safety bug ու չմշակված exception։ **Coverage-guided fuzzer-ները (AFL, libFuzzer, Go-ի native fuzzing, Jazzer)** evolve են անում input-ները code-path coverage-ը մաքսիմացնելու, գտնելով խորը bug-եր, որ ձեռագիր test-երը երբեք չեն հասնում։ *Երբ:* ամեն ինչ, որ parse է անում untrusted input (file format, network protocol, deserializer, API trust boundary-ում — հատվում է Skill 12-ի input-validation playbook-ի հետ)։ *Պրակտիկա:* run արա շարունակաբար (OSS-Fuzz model), seed արա վավեր-input corpus-ով, ու ամեն crash դարձրու regression test։ Property-based-ն ու fuzzing-ը զարմիկ են — property-ները assert են անում *correctness*, fuzzing-ը որսում է *crash*. համատեղիր (property-fuzzing) «ոչ մի input չպիտի երբեք խախտի այս invariant-ը կամ crash անի» համար։

### 6.3 Mutation testing (the test of the tests)

**EN:** Coverage tells you a line *ran*; **mutation testing (Lipton; tools: Stryker, PIT, mutmut, cargo-mutants)** tells you whether your tests would *catch a bug there*. It injects small faults ("mutants" — flip a `>` to `>=`, `&&` to `||`, delete a statement, change a constant) and reruns the suite. A mutant **killed** (a test went red) means your tests defend that line; a mutant **survived** (all green despite the injected bug) means that line is covered but **not verified** — a hole in your assertions. The **mutation score** (% killed) is a far truer quality signal than coverage. *When:* on critical/high-risk modules (payments, auth, pricing math) where "covered" must mean "verified." *Cost:* slow (N mutants × suite runtime) — scope it to changed/critical code, run it nightly or on the diff, not on every commit. This is §1.6 ("a test you haven't watched fail isn't a test") industrialized.

**HY:** Coverage-ը ասում է, որ տողը *run-վեց*. **mutation testing-ը (Lipton. գործիքներ՝ Stryker, PIT, mutmut, cargo-mutants)** ասում է, թե արդյոք test-երդ կբռնեին bug *այնտեղ*։ Inject է անում փոքր fault-եր («mutant»-ներ — `>`-ը դարձնում `>=`, `&&`-ը `||`, ջնջում statement, փոխում constant) ու վերա-run անում suite-ը։ **Killed** mutant-ը (test-ը կարմրեց) նշանակում է test-երդ պաշտպանում են այդ տողը. **survived** mutant-ը (ամեն ինչ կանաչ inject արված bug-ի չնայած) նշանակում է այդ տողը covered է, բայց **ոչ verified** — անցք assertion-ներում։ **Mutation score**-ը (% killed) շատ ավելի ճշմարիտ որակի signal է, քան coverage-ը։ *Երբ:* critical/high-risk module-ների վրա (payment, auth, pricing math), որտեղ «covered»-ը պիտի նշանակի «verified»։ *Գին:* դանդաղ (N mutant × suite runtime) — scope արա փոխված/critical կոդին, run արա գիշերը կամ diff-ի վրա, ոչ ամեն commit։ Սա §1.6-ի արդյունաբերականացված տարբերակն է։

### 6.4 Golden / approval / snapshot tests (and the staleness trap)

**EN:** **Snapshot/approval/golden tests** capture a known-good output (a rendered component, a serialized payload, a report) and assert future runs match. Cheap to create, great for **characterizing legacy behavior** (Feathers, §10) and large structured outputs where hand-writing assertions is impractical. **The staleness trap:** when a snapshot fails, the path of least resistance is to *re-approve* it (`--update-snapshots`) without reading the diff — which silently blesses a regression. *Discipline:* snapshots must be **small, reviewed, and meaningful**; a 2,000-line snapshot nobody reads is a liability, not a test. Treat snapshot updates as **real code-review artifacts**: the diff must be looked at and justified, not rubber-stamped. Prefer focused assertions on the *behavior that matters* over a giant blind snapshot.

**HY:** **Snapshot/approval/golden test**-երը capture են անում հայտնի-լավ output (render-ված component, serialized payload, report) ու assert անում, որ ապագա run-երը համընկնում են։ Էժան ստեղծվող, հիանալի **legacy վարքը characterize անելու համար** (Feathers, §10) ու մեծ structured output-ների համար, որտեղ ձեռքով assertion գրելն անիրագործելի է։ **Staleness թակարդը:** երբ snapshot-ը ձախողվում է, ամենահեշտ ճանապարհը *վերա-approve* անելն է (`--update-snapshots`) առանց diff-ը կարդալու — որ լուռ օրհնում է regression-ը։ *Կարգապահություն:* snapshot-ները պիտի լինեն **փոքր, review-ված, իմաստալից**. 2000-տողանոց snapshot, որ ոչ ոք չի կարդում, պարտավորություն է, ոչ test։ Վերաբերվիր snapshot-update-ին որպես **իրական code-review artifact**. diff-ը պիտի դիտվի ու հիմնավորվի, ոչ թե rubber-stamp։ Նախընտրիր focused assertion *կարևոր վարքի* վրա հսկա կույր snapshot-ից։

### 6.5 Metamorphic testing (when there's no oracle)

**EN:** The **oracle problem**: sometimes you can't state the expected output (a search ranker, an ML model, a complex numerical sim). **Metamorphic testing (T.Y. Chen)** instead asserts a **relation between outputs**: if you transform the input in a known way, the output must change in a known way. *Examples:* "adding an irrelevant document shouldn't change the top result," "`sin(x) == sin(π − x)`," "translating then back-translating preserves meaning roughly," "scaling all prices by k scales the total by k." You don't need to know the right answer — only the right *relationship*. Invaluable for AI/ML systems (cross-link Skill 15) and any function whose exact output is hard to predict but whose symmetries are known.

**HY:** **Oracle-ի խնդիրը:** երբեմն չես կարող նշել սպասվող output-ը (search ranker, ML model, complex numerical sim)։ **Metamorphic testing-ը (T.Y. Chen)** փոխարենը assert է անում **output-ների միջև հարաբերություն**. եթե input-ը հայտնի ձևով transform ես անում, output-ը պիտի փոխվի հայտնի ձևով։ *Օրինակներ:* «անկապ document ավելացնելը չպիտի փոխի top արդյունքը», «`sin(x) == sin(π − x)`», «թարգմանելն ու ետ-թարգմանելը մոտավորապես պահպանում է իմաստը», «բոլոր գները k-ով scale անելը scale է անում total-ը k-ով»։ Պետք չէ իմանալ ճիշտ պատասխանը — միայն ճիշտ *հարաբերությունը*։ Անգին AI/ML system-ների համար (Skill 15) ու ամեն function-ի, որի ճշգրիտ output-ը դժվար է կանխատեսել, բայց symmetry-ները հայտնի են։

---

## 7. SUITE RELIABILITY — killing flakiness & non-determinism

**EN:** A **flaky test** passes and fails on the same code. Flakiness is the suite's cancer: it trains the team to re-run until green, which means red no longer means "broken" — and a real regression slips through behind the noise (the **cry-wolf** effect). **Treat flakiness as a P1 defect in the test, not a nuisance to retry past.**

**The flaky-test taxonomy (root causes):**
- **Timing / async** — `sleep(500)` hoping the async thing finished; assertions before a promise resolves. *Fix:* wait on a **condition** (poll-until / `waitFor`), never a fixed sleep; await explicitly; use fake/virtual timers.
- **Order dependence** — test B passes only because test A ran first and left state. *Fix:* full isolation (§5.4); randomize test order in CI to *surface* the dependence, then fix it.
- **Concurrency / races** — shared resource touched by parallel tests; non-deterministic thread interleaving. *Fix:* per-test isolation, unique resource names/IDs, deterministic scheduling where possible.
- **Resource leaks** — ports/files/connections not cleaned up, so the next run inherits dirty state. *Fix:* deterministic teardown (try/finally, fixtures with guaranteed cleanup), fresh ephemeral resources.
- **External dependencies** — a real third-party/network call in the test path. *Fix:* mock/fake it (§5.3) or move it to a clearly-quarantined integration tier; never let a flaky network gate a unit suite.
- **Uncontrolled time / randomness / locale** — `now()`, `random()`, timezone, locale, hash-ordering. *Fix:* **inject the clock and the RNG** (pass them as dependencies; freeze/seed in tests), pin timezone & locale, sort before asserting on unordered collections.

**The flake workflow:** **detect** (re-run suites, track per-test flake rate as a first-class metric) → **quarantine** (auto-tag a flaky test as non-gating so it stops blocking everyone, but *file a ticket immediately* — quarantine is a hospital, not a graveyard) → **fix** (find the root cause from the taxonomy above; a quarantined test left to rot is just deleted coverage). **Determinism is a property you engineer, not luck you hope for** (mirror of §1.7).

**HY:** **Flaky test**-ը անցնում ու ձախողվում է նույն կոդի վրա։ Flakiness-ը suite-ի քաղցկեղն է. սովորեցնում է թիմին վերա-run անել մինչև կանաչ, ինչը նշանակում է կարմիրն այլևս չի նշանակում «կոտրված» — ու իրական regression-ը սահում է աղմուկի հետևից (**cry-wolf** էֆեկտ)։ **Վերաբերվիր flakiness-ին որպես P1 defect test-ում, ոչ թե nuisance, որ retry-ով անցնես։**

**Flaky-test-ի taxonomy (արմատային պատճառներ):**
- **Timing / async** — `sleep(500)` հույսով, որ async բանը ավարտվեց. assertion promise-ի resolve-ից առաջ։ *Fix:* սպասիր **condition**-ի (poll-until / `waitFor`), երբեք ֆիքսված sleep-ի. await արա բացահայտ. օգտագործիր fake/virtual timer-ներ։
- **Order dependence** — test B-ն անցնում է միայն, որովհետև A-ն run-վեց առաջ ու state թողեց։ *Fix:* լրիվ isolation (§5.4). randomize արա test order-ը CI-ում՝ *բացահայտելու* dependence-ը, հետո fix։
- **Concurrency / race** — shared resource, որ parallel test-երն են դիպչում. non-deterministic thread interleaving։ *Fix:* per-test isolation, unique resource name/ID, deterministic scheduling հնարավորության դեպքում։
- **Resource leak** — port/file/connection չմաքրված, ուստի հաջորդ run-ը ժառանգում է կեղտոտ state։ *Fix:* deterministic teardown (try/finally, fixture-ներ երաշխավորված cleanup-ով), թարմ ephemeral resource-ներ։
- **External dependency** — իրական third-party/network call test path-ում։ *Fix:* mock/fake արա (§5.3) կամ տեղափոխիր հստակ quarantine-ված integration tier. երբեք թույլ մի տուր flaky network-ին gate անել unit suite-ը։
- **Չվերահսկվող time / randomness / locale** — `now()`, `random()`, timezone, locale, hash-ordering։ *Fix:* **inject արա clock-ն ու RNG-ն** (փոխանցիր որպես dependency. freeze/seed test-երում), pin արա timezone ու locale, sort արա unordered collection-ի վրա assert անելուց առաջ։

**Flake-ի workflow:** **detect** (վերա-run, track արա per-test flake rate որպես first-class metric) → **quarantine** (auto-tag արա flaky test-ը non-gating, որ դադարի բոլորին blocking անել, բայց *անմիջապես ticket բացիր* — quarantine-ը հիվանդանոց է, ոչ գերեզմանոց) → **fix** (գտիր արմատային պատճառը վերի taxonomy-ից. quarantine-ված test, որ թողնում ես փտի, պարզապես ջնջված coverage է)։ **Determinism-ը հատկություն է, որ engineer ես անում, ոչ թե բախտ, որի վրա հույս ես դնում։**

---

## 8. CONTRACT TESTING (independent deployability)

**EN:** When service A calls service B, an e2e environment proving they work together is slow, flaky, and forces lock-step deploys. **Contract testing** breaks that: the **consumer** declares what it needs from the provider (a contract: "for this request, I expect this response shape"); the **provider** verifies it can satisfy every consumer's contract — *independently*, no shared environment.
- **Consumer-Driven Contracts / Pact** — the consumer's expectations *are* the contract; the provider's CI replays them and fails if it would break a real consumer. Lets both sides deploy independently with confidence they won't break each other. **Pairs with API versioning and expand/contract** (Skill 02 §3.2).
- **Schema/compatibility tests** — for APIs and **events**, the schema is a contract (OpenAPI, Protobuf, Avro + a **schema registry** enforcing forward/backward-compatibility rules — Skill 02 §3.2). A CI check that rejects a backward-incompatible schema change is a contract test for the wire format.
- **When to use:** any service-to-service or producer-consumer boundary where the two sides deploy on different cadences. *It replaces the combinatorial explosion of "test every service against every other in one big environment" with N independent, fast checks.*
- **What it does NOT cover:** behavior beyond the contract (a contract test proves the *shape/protocol* matches, not that the business logic is right) — you still need each side's own unit/integration tests.

**HY:** Երբ service A-ն կանչում է service B, e2e environment-ը, որ ապացուցում է, որ նրանք միասին աշխատում են, դանդաղ է, flaky ու ստիպում է lock-step deploy։ **Contract testing**-ը կոտրում է դա. **consumer**-ը հայտարարում է, թե ինչ է պետք provider-ից (contract՝ «այս request-ի համար սպասում եմ այս response-ի ձևը»). **provider**-ը verify է անում, որ կարող է բավարարել ամեն consumer-ի contract-ը — *independently*, առանց shared environment-ի։
- **Consumer-Driven Contracts / Pact** — consumer-ի expectation-ները *ինքն են* contract-ը. provider-ի CI-ն replay է անում ու ձախողվում, եթե կկոտրեր իրական consumer։ Թույլ է տալիս երկու կողմին independently deploy անել՝ վստահ, որ չեն կոտրի իրար։ **Pair-վում է API versioning-ի ու expand/contract-ի հետ** (Skill 02 §3.2)։
- **Schema/compatibility test** — API-ների ու **event**-ների համար schema-ն contract է (OpenAPI, Protobuf, Avro + **schema registry**, որ enforce է անում forward/backward-compatibility — Skill 02 §3.2)։ CI check-ը, որ մերժում է backward-incompatible schema փոփոխությունը, wire format-ի contract test է։
- **Երբ:** ցանկացած service-to-service կամ producer-consumer boundary, որտեղ երկու կողմն այլ cadence-ով են deploy անում։ *Փոխարինում է «ամեն service-ը ամեն մյուսի դեմ մեկ մեծ environment-ում test անելու» combinatorial explosion-ը N independent, արագ check-ով։*
- **Ինչ ՉԻ ծածկում:** contract-ից դուրս վարքը (contract test-ն ապացուցում է, որ *ձևը/protocol*-ը համընկնում է, ոչ թե business logic-ը ճիշտ է) — դեռ պետք են ամեն կողմի սեփական unit/integration test-երը։

---

## 9. TEST-DESIGN TECHNIQUE & COVERAGE DONE RIGHT

### 9.1 Designing the assertions (structure)

**EN:**
- **Arrange-Act-Assert (AAA) / Given-When-Then** — every test has three visible phases: set up the world, perform the one action, assert the one outcome. Keep them separated and visible; a test that interleaves them is hard to read and usually doing too much.
- **One behavior per test (not literally one assert).** A test should fail for exactly one reason. Multiple asserts that all describe *one* behavior are fine; asserting two unrelated behaviors in one test means a failure doesn't tell you which broke. Name the test after the behavior (`returns_zero_for_empty_cart`, not `test_cart_2`) — the name is the spec line.
- **Test the contract, vary the data.** Don't copy-paste a test 12 times; use **parameterized/table-driven tests** (one test body, many input→expected rows) so adding a case is a one-line data change.

**HY:**
- **Arrange-Act-Assert (AAA) / Given-When-Then** — ամեն test-ն ունի երեք տեսանելի փուլ՝ set up արա աշխարհը, արա մեկ action-ը, assert արա մեկ արդյունքը։ Պահիր առանձին ու տեսանելի. test-ը, որ interleave է անում, դժվար ընթեռնելի է ու սովորաբար շատ բան է անում։
- **Մեկ վարք յուրաքանչյուր test-ում (ոչ բառացիորեն մեկ assert)։** Test-ը պիտի ձախողվի ուղիղ մեկ պատճառով։ Մի քանի assert, որ բոլորը նկարագրում են *մեկ* վարք, լավ է. երկու անկապ վարք մեկ test-ում նշանակում է ձախողումը չի ասում, թե որն է կոտրվել։ Անվանիր test-ը ըստ վարքի (`returns_zero_for_empty_cart`, ոչ `test_cart_2`) — անունը spec-ի տողն է։
- **Test արա contract-ը, փոխիր data-ն։** Մի՛ copy-paste արա test-ը 12 անգամ. օգտագործիր **parameterized/table-driven test**-եր (մեկ test body, շատ input→expected row), որ case ավելացնելը մեկ-տողանոց data փոփոխություն լինի։

### 9.2 Choosing the cases (coverage of the input space)

**EN:** You can't test all inputs — choose the *representative and dangerous* ones:
- **Equivalence partitioning** — group inputs that the code treats identically (valid age 18–65, under-18, over-65); test one representative per class, not every value.
- **Boundary-value analysis** — bugs cluster at edges. For each boundary, test *on it, just below, just above* (17/18/19, 0/1, max/max−1/max+1, empty/one/many). Off-by-one lives here.
- **Decision tables** — when output depends on a combination of conditions, tabulate every condition-combination → expected action; ensures no rule is missed.
- **State-transition testing** — for stateful entities (an order: draft→submitted→paid→shipped), test every valid transition AND the invalid ones (can you pay a shipped order?). The illegal transitions are where the bugs and the security holes are.
- **Pairwise / combinatorial (all-pairs)** — when many parameters each have several values, full Cartesian coverage explodes; **pairwise** covers every *pair* of values (catching most interaction bugs) with a fraction of the cases. Use a tool (PICT, AllPairs) to generate the set.

**HY:** Չես կարող բոլոր input-ները test անել — ընտրիր *ներկայացուցչական ու վտանգավորները*՝
- **Equivalence partitioning** — խմբավորիր input-ները, որ կոդը նույն կերպ է մշակում (վավեր age 18–65, under-18, over-65). test արա մեկ ներկայացուցիչ ամեն class-ից, ոչ ամեն արժեք։
- **Boundary-value analysis** — bug-երը կուտակվում են եզրերին։ Ամեն boundary-ի համար test արա *դրա վրա, ճիշտ ներքև, ճիշտ վերև* (17/18/19, 0/1, max/max−1/max+1, empty/one/many)։ Off-by-one-ն այստեղ է։
- **Decision table** — երբ output-ը կախված է condition-ների combination-ից, tabulate արա ամեն condition-combination → սպասվող action. ապահովում է, որ ոչ մի rule բաց չմնա։
- **State-transition testing** — stateful entity-ների համար (order՝ draft→submitted→paid→shipped), test արա ամեն վավեր transition ՈՒ անվավերները (կարո՞ղ ես pay անել shipped order)։ Անօրինական transition-ներն այնտեղն են, որտեղ bug-երն ու security անցքերն են։
- **Pairwise / combinatorial** — երբ շատ parameter ամեն մեկը մի քանի արժեք ունի, լրիվ Cartesian coverage-ը պայթում է. **pairwise**-ը ծածկում է ամեն *զույգ* արժեք (բռնելով interaction bug-երի մեծ մասը) case-երի մի մասով։ Օգտագործիր գործիք (PICT, AllPairs) set-ը գեներացնելու։

### 9.3 Coverage & metrics — signal, not target

**EN:**
- **Coverage types:** **line** (was the line executed) < **branch** (was each if/else path taken) < **condition/MC-DC** (was each boolean sub-condition independently exercised — required in safety-critical) < **mutation score** (would a bug there be caught — §6.3, the truest). Line coverage is the weakest and the most gamed.
- **Coverage is a floor-finder, not a ceiling.** Use it to find code with *zero* tests (a real gap) and to flag a coverage *regression* in review. **Never set a coverage % as a team target** — it's Goodhart bait that produces assertion-free tests gaming the number. The question is never "what's our coverage?" but "do our tests actually catch the bugs that matter?"
- **What to actually measure (the quality scoreboard):** **escaped-defect rate** (bugs found in prod that tests should've caught — the only metric that matters), **MTTR** for defects, **change-failure rate** (DORA — Skill 14), **flake rate** (§7), **suite runtime** (feedback speed), and **mutation score** on critical modules. These measure *outcomes*; coverage measures *activity*.

**HY:**
- **Coverage տեսակներ:** **line** (տողը run-վե՞ց) < **branch** (ամեն if/else path վերցվե՞ց) < **condition/MC-DC** (ամեն boolean ենթա-condition independently exercise-վե՞ց — safety-critical-ում պարտադիր) < **mutation score** (այնտեղ bug-ը կբռնվե՞ր — §6.3, ամենաճշմարիտը)։ Line coverage-ը ամենաթույլն է ու ամենաgame-վողը։
- **Coverage-ը հատակ-գտնող է, ոչ առաստաղ։** Օգտագործիր *զրո* test ունեցող կոդ գտնելու (իրական բաց) ու review-ում coverage *regression* նշելու։ **Երբեք coverage % չդնես որպես թիմի target** — Goodhart-ի խայծ է, որ արտադրում է assertion-ազատ test-եր՝ թիվը game անող։ Հարցը երբեք «ո՞րն է coverage-ը» չէ, այլ «մեր test-երն իրականում բռնո՞ւմ են կարևոր bug-երը»։
- **Ինչ իրականում չափել (որակի scoreboard):** **escaped-defect rate** (prod-ում գտնված bug-եր, որ test-երը պիտի բռնեին — միակ կարևոր metric-ը), defect-ների **MTTR**, **change-failure rate** (DORA — Skill 14), **flake rate** (§7), **suite runtime** (feedback-ի արագություն), ու critical module-ների **mutation score**։ Սրանք չափում են *արդյունքները*. coverage-ը չափում է *գործունեությունը*։

---

## 10. NON-FUNCTIONAL TESTING & LEGACY

### 10.1 Performance, load, stress, soak

**EN:** Functional tests prove "correct"; these prove "correct *under conditions*."
- **Load test** — expected/peak traffic; confirm p50/p95/**p99** latency and throughput meet the SLO (tail latency is the real UX — Skill 02 §5.1). **Little's Law** (L = λW) relates concurrency, arrival rate, and latency — use it to size and to sanity-check results.
- **Stress test** — push *past* capacity to find the breaking point and confirm it **fails gracefully** (sheds load, returns 429/503, doesn't corrupt) rather than collapsing (Skill 02 §4.3 backpressure).
- **Soak / endurance** — sustained load for hours/days to surface leaks, slow degradation, connection-pool exhaustion, memory creep — bugs invisible in a 5-minute run.
- **Spike test** — sudden surge; confirm autoscaling and queues absorb it.
- **Tools:** k6, JMeter, Locust, Gatling. **Discipline:** test a production-like environment with production-like data shapes; measure percentiles not averages; isolate the variable; profile to find the bottleneck before "scaling" (Skill 02 §5.1).

**HY:** Functional test-երը ապացուցում են «ճիշտ». սրանք ապացուցում են «ճիշտ *պայմանների տակ*»։
- **Load test** — սպասվող/peak traffic. հաստատիր, որ p50/p95/**p99** latency-ն ու throughput-ը բավարարում են SLO-ն (tail latency-ն իրական UX-ն է — Skill 02 §5.1)։ **Little's Law** (L = λW) կապում է concurrency-ն, arrival rate-ն ու latency-ն — օգտագործիր size անելու ու արդյունքները sanity-check անելու։
- **Stress test** — հրիր *capacity-ից այն կողմ*՝ գտնելու breaking point-ը ու հաստատելու, որ **graceful** է ձախողվում (shed է անում load, վերադարձնում 429/503, չի corrupt անում), ոչ թե collapse (Skill 02 §4.3 backpressure)։
- **Soak / endurance** — մշտական load ժամերով/օրերով՝ բացահայտելու leak, դանդաղ degradation, connection-pool exhaustion, memory creep — bug-եր, անտեսանելի 5-րոպեանոց run-ում։
- **Spike test** — հանկարծակի surge. հաստատիր, որ autoscaling-ն ու queue-ները կլանում են։
- **Գործիքներ:** k6, JMeter, Locust, Gatling։ **Կարգապահություն:** test արա production-նման environment-ում production-նման data ձևերով. չափիր percentile-ներ, ոչ average. isolate արա variable-ը. profile արա bottleneck-ը գտնելու «scale» անելուց առաջ (Skill 02 §5.1)։

### 10.2 Security, accessibility, chaos, resilience

**EN:**
- **Security testing** — **SAST** (static code analysis for vuln patterns), **DAST** (attack the running app), **SCA** (scan dependencies for known CVEs — Skill 12 supply-chain), **IaC scanning** (misconfig in Terraform/k8s), secret scanning, and the OWASP-driven threat tests. Drive the cases from the threat-class playbook in **Skill 12 / Skill 02 §6.5** (injection, IDOR/authZ, SSRF, SoD self-approval) — for each threat class there should be a *test that tries the attack and asserts it's blocked*. Security bugs are just untested negative behaviors.
- **Accessibility testing** — automated (axe, Lighthouse, WAVE for WCAG contrast/roles/labels) catches ~30–40%; the rest needs **keyboard-only** and **screen-reader** manual passes. Bake the automated a11y checks into CI (cross-link Skill 03).
- **Chaos / fault-injection** — deliberately inject failures (kill a node, add latency, drop a dependency, partition the network) to prove resilience patterns (timeout/retry/circuit-breaker/bulkhead — Skill 02 §4.3) actually fire. Start small, in a controlled blast radius, with a hypothesis ("the system stays available if cache dies"). Tools: Chaos Monkey, Litmus, Gremlin. (Deep ownership in **Skill 14**.)
- **Resilience tests** — assert the *degraded* behavior is the *designed* behavior: dependency down → fallback served; queue backed up → load shed, not collapse; replica lag → read-your-writes routing holds.

**HY:**
- **Security testing** — **SAST** (static code analysis vuln pattern-ների համար), **DAST** (հարձակում աշխատող app-ի վրա), **SCA** (dependency-ների scan հայտնի CVE-ների համար — Skill 12 supply-chain), **IaC scanning** (misconfig Terraform/k8s-ում), secret scanning, ու OWASP-driven threat test-եր։ Վարիր case-երը threat-class playbook-ից **Skill 12 / Skill 02 §6.5**-ում (injection, IDOR/authZ, SSRF, SoD self-approval) — ամեն threat class-ի համար պիտի լինի *test, որ փորձում է հարձակումն ու assert անում, որ block-ված է*։ Security bug-երը պարզապես չtest-ված negative վարքեր են։
- **Accessibility testing** — automated-ը (axe, Lighthouse, WAVE՝ WCAG contrast/role/label-ի համար) բռնում է ~30–40%. մնացածը պետք է **keyboard-only** ու **screen-reader** manual pass։ Bake արա automated a11y check-երը CI-ում (Skill 03)։
- **Chaos / fault-injection** — դիտավորյալ inject արա failure (սպանիր node, ավելացրու latency, գցիր dependency, partition արա network)՝ ապացուցելու, որ resilience pattern-ները (timeout/retry/circuit-breaker/bulkhead — Skill 02 §4.3) իրականում fire են անում։ Սկսիր փոքր, վերահսկվող blast radius-ով, hypothesis-ով («system-ը մնում է available, եթե cache-ը մեռնի»)։ Գործիքներ՝ Chaos Monkey, Litmus, Gremlin։ (Խորը ownership-ը **Skill 14**-ում։)
- **Resilience test** — assert արա, որ *degraded* վարքը *design արված* վարքն է. dependency down → fallback. queue լցված → load shed, ոչ collapse. replica lag → read-your-writes routing-ը պահում է։

### 10.3 Testing legacy & untestable code (Feathers)

**EN:** **Legacy code is code without tests (Feathers' definition).** You can't safely change it because you can't tell what you broke. The way in:
- **Characterization tests** — write tests that pin the *current* behavior (right or wrong), so you have a net before you touch anything. Use approval/golden tests (§6.4) to capture large outputs you can't hand-assert.
- **Find a seam** — a place you can alter behavior without editing in place (a parameter, a subclass override, a link/dependency you can swap). **Break dependencies at the seam** to get the code under test (the *Extract & Override*, *Sprout Method/Class*, *Wrap* techniques).
- **Then refactor under the net.** Once characterized, change safely; tighten the characterization tests into real spec tests as you understand the behavior.

**HY:** **Legacy code-ը test-եր չունեցող կոդն է (Feathers-ի սահմանումը)։** Չես կարող ապահով փոխել, որովհետև չես կարող ասել, թե ինչ կոտրեցիր։ Մուտքի ճանապարհը՝
- **Characterization test** — գրիր test-եր, որ pin են անում *ընթացիկ* վարքը (ճիշտ թե սխալ), որ net ունենաս որևէ բանի դիպչելուց առաջ։ Օգտագործիր approval/golden test (§6.4) մեծ output-ները capture անելու, որ ձեռքով չես կարող assert անել։
- **Գտիր seam** — տեղ, որտեղ կարող ես վարքը փոխել առանց տեղում խմբագրելու (parameter, subclass override, link/dependency, որ swap ես անում)։ **Կոտրիր dependency-ները seam-ում**՝ կոդը test-ի տակ բերելու (*Extract & Override*, *Sprout Method/Class*, *Wrap* տեխնիկաներ)։
- **Հետո refactor արա net-ի տակ։** Երբ characterize-ված է, փոխիր ապահով. ձգիր characterization test-երը իրական spec test-երի, երբ հասկանում ես վարքը։

---

## 11. CI ORCHESTRATION & QUALITY ENGINEERING (quality as a property of the machine)

**EN:**
- **Fast feedback first.** Order the pipeline cheapest-and-fastest-first: lint/format/type-check → unit → integration → contract → e2e → non-functional. Fail fast on the cheap stage; don't make a dev wait 40 minutes to learn a typo broke the build. Run static analysis and unit tests **pre-commit / pre-push** so red never reaches CI.
- **Parallelize & shard.** Split the suite across workers (by file/timing/history) so wall-clock stays short as the suite grows. Hermetic tests (§5.4) are the prerequisite — you can't parallelize tests that share state.
- **Test selection / impact analysis.** On a large monorepo, run only the tests affected by the change (build-graph-aware selection, e.g. Bazel) on the PR, and the full suite on a slower cadence (nightly/merge). Cuts feedback time without losing safety.
- **Quality gates & Definition-of-Done.** A merge is blocked unless: tests pass, coverage didn't regress, no new critical SAST/SCA finding, no lint/type error, and (for risky modules) mutation score holds. The gate encodes the **DoD** — "done" is *machine-checkable*, not a feeling. (Mirror of Skill 02 §1.8: a rule with no automated gate will drift; Skill 11's done-check made enforceable.)
- **The running-system done-check.** Green CI proves the artifact's tests pass — it does **not** prove the *deployed, wired, migrated* system works. The final gate is behavior in the running system: a smoke test against the deployed build, a health endpoint reporting the running version, a critical-path check post-deploy. **"It compiles / CI is green" ≠ "it works"** (Skill 11 §7, Skill 02 §1.7). Verify against the running artifact, then call it done.
- **Quarantine lane & flake budget.** A separate non-gating lane for known-flaky tests (§7) with a ticket each, plus a flake-rate budget that, when exceeded, *stops feature work until the suite is trustworthy again*.

**Quality engineering beyond tests** (the discipline, not the artifact):
- **Code review** — a second set of eyes catches design and intent errors no test asserts; the highest-leverage defect filter that exists. (See `/code-review`.)
- **Static analysis & linters** — the cheapest gate; catches whole bug classes mechanically (null-deref, unused, injection patterns, dependency rules / architectural fitness functions — Skill 02 §1.8).
- **Types as tests.** A strong type system is a proof, checked on every keystroke, that whole classes of bugs *cannot occur* (no null where a value is required, no wrong shape, exhaustive case handling). Make illegal states unrepresentable — the test you never have to write. Types are the base of the Testing Trophy.
- **Observability-driven QA in prod (shift-right).** Some defects only appear with real traffic/data/scale. Instrument for it: structured logs, RED/USE metrics, traces, error tracking (Sentry-class), and **synthetic monitoring** (a robot running the critical journey against prod every minute). Production is a test environment you're already paying for — watch it. (Deep in Skill 14.)
- **Error budgets (Google SRE).** The SLO defines acceptable failure; the **error budget** is the room to spend on velocity. Spend it → slow down and harden; budget intact → ship faster. Quality and speed are *traded explicitly*, not argued about. (Cross-link Skill 14.)

**HY:**
- **Արագ feedback առաջինը։** Դասավորիր pipeline-ը ամենաէժան-ու-արագ-առաջին՝ lint/format/type-check → unit → integration → contract → e2e → non-functional։ Fail fast էժան փուլում. մի՛ ստիպիր dev-ին 40 րոպե սպասել՝ իմանալու, որ typo-ն կոտրեց build-ը։ Run արա static analysis ու unit test **pre-commit / pre-push**, որ կարմիրը երբեք CI չհասնի։
- **Parallelize ու shard։** Բաժանիր suite-ը worker-ների միջև (ըստ file/timing/history), որ wall-clock-ը կարճ մնա suite-ի աճի հետ։ Hermetic test-երը (§5.4) նախապայման են — չես կարող parallelize անել state կիսող test-եր։
- **Test selection / impact analysis։** Մեծ monorepo-ում run արա միայն փոփոխությունից ազդված test-երը (build-graph-aware selection, օր.՝ Bazel) PR-ի վրա, ու լրիվ suite-ը դանդաղ cadence-ով (nightly/merge)։ Կտրում է feedback-ի ժամանակը՝ առանց safety-ն կորցնելու։
- **Quality gate-եր ու Definition-of-Done։** Merge-ը block-ված է, քանի դեռ՝ test-երն անցնում են, coverage-ը regress չարեց, նոր critical SAST/SCA finding չկա, lint/type error չկա, ու (risky module-ների համար) mutation score-ը պահում է։ Gate-ը encode է անում **DoD**-ն — «done»-ը *machine-checkable* է, ոչ զգացողություն։ (Skill 02 §1.8-ի հայելին. Skill 11-ի done-check-ը enforceable դարձրած։)
- **Running-system done-check։** Կանաչ CI-ն ապացուցում է artifact-ի test-երն անցնում են — **չի** ապացուցում, որ *deployed, wired, migrated* system-ն աշխատում է։ Վերջին gate-ը վարքն է աշխատող system-ում՝ smoke test deployed build-ի դեմ, health endpoint, որ ասում է running version-ը, critical-path check post-deploy։ **«Compile է լինում / CI կանաչ է» ≠ «աշխատում է»** (Skill 11 §7, Skill 02 §1.7)։ Verify արա աշխատող artifact-ի դեմ, հետո ասա done։
- **Quarantine lane ու flake budget։** Առանձին non-gating lane հայտնի-flaky test-երի համար (§7) ամեն մեկը ticket-ով, գումարած flake-rate budget, որ գերազանցելիս *կանգնեցնում է feature աշխատանքը, մինչև suite-ը նորից վստահելի լինի*։

**Quality engineering test-երից բացի** (դիսցիպլինը, ոչ artifact-ը):
- **Code review** — երկրորդ զույգ աչքեր բռնում են design-ի ու intent-ի սխալներ, որ ոչ մի test չի assert անում. ամենաբարձր-leverage defect ֆիլտրը, որ կա։ (Տես `/code-review`։)
- **Static analysis ու linter-ներ** — ամենաէժան gate-ը. մեխանիկորեն բռնում է bug-ի ամբողջ class-եր (null-deref, unused, injection pattern, dependency rule / architectural fitness function — Skill 02 §1.8)։
- **Type-երը որպես test։** Ուժեղ type system-ը ապացույց է, ստուգված ամեն keystroke-ի, որ bug-ի ամբողջ class-եր *չեն կարող պատահել* (ոչ null, որտեղ value է պետք, ոչ սխալ ձև, exhaustive case handling)։ Դարձրու անօրինական state-երն աններկայանալի — test-ը, որ երբեք պետք չէ գրել։ Type-երը Testing Trophy-ի հիմքն են։
- **Observability-driven QA prod-ում (shift-right)։** Որոշ defect միայն իրական traffic/data/scale-ով են երևում։ Instrument արա՝ structured log, RED/USE metric, trace, error tracking (Sentry-class), ու **synthetic monitoring** (ռոբոտ, որ critical journey-ն run է անում prod-ի դեմ ամեն րոպե)։ Production-ը test environment է, որի համար արդեն վճարում ես — հետևիր նրան։ (Խորը Skill 14-ում։)
- **Error budget (Google SRE)։** SLO-ն սահմանում է ընդունելի failure-ը. **error budget**-ը velocity-ի վրա ծախսելու տեղն է։ Ծախսեցիր → դանդաղիր ու harden արա. budget-ը անձեռնմխելի → ship արա ավելի արագ։ Որակն ու արագությունը *բացահայտ trade* են արվում, ոչ վիճարկվում։ (Skill 14։)

---

## 12. DECISION RULES (fast, reusable)

**EN:**
- **Write the test first or after?** Test-first by default (TDD forces testable design); test-after is acceptable for genuine exploration, but the test ships in the same diff regardless. No-test ships nothing.
- **What level should this test be?** The **lowest level that can still catch the bug**. Logic → unit. Wiring/SQL/serialization → integration. Cross-service shape → contract. Critical user journey → one e2e. Don't write an e2e for what a unit catches.
- **What's the right shape?** Let your **escaped-defect data** pick: logic-heavy → pyramid; wiring/integration-heavy (most web) → trophy; microservices → honeycomb. Never ice-cream-cone.
- **Mock, fake, or real?** Real collaborators by default (classicist). Fake for I/O (in-memory DB/queue). Mock only when the *interaction itself* is the behavior, and only at architectural boundaries. Never mock what you don't own — wrap and integration-test it.
- **Is this test deterministic?** If it touches real time/random/network/shared-state/order, it's flaky-by-construction — inject the clock & RNG, isolate, fake the network, before you commit it.
- **Property test or example test?** Can you state an invariant over all inputs (round-trip, idempotence, sorted-permutation)? → property-based. Specific known case / regression → example.
- **Snapshot or explicit assertion?** Explicit assertion on the behavior that matters. Snapshot only for large structured output you'll genuinely review on change — never a giant blind blob.
- **Is "covered" enough?** No — covered ≠ verified. On critical modules run mutation testing; if mutants survive, the assertions are missing.
- **Is the suite trustworthy?** Only if the flake rate is near zero. A flaky test is a P1 defect: quarantine + ticket + fix, never "re-run till green."
- **Is it done?** Not when CI is green — when the **running, deployed, migrated** system shows the behavior (the running-system done-check, Skill 11 §7). Green tests are necessary, never sufficient.
- **Should this destructive fixture run?** Only against an explicitly pinned disposable `_test` target, behind a guard that aborts if the target name doesn't match. Never derive it from the app's real connection (§5.4).

**HY:**
- **Test-ը առաջ գրել թե հետո՞** Test-first default-ով (TDD-ն ստիպում է testable design). test-after-ը ընդունելի է իրական exploration-ի համար, բայց test-ը ship է լինում նույն diff-ում, ինչ էլ լինի։ No-test-ը ոչինչ չի ship անում։
- **Ի՞նչ level պիտի լինի այս test-ը։** **Ամենացածր level-ը, որ դեռ կարող է բռնել bug-ը։** Logic → unit. Wiring/SQL/serialization → integration. Cross-service ձև → contract. Critical user journey → մեկ e2e։ Մի՛ գրիր e2e նրա համար, ինչ unit-ը բռնում է։
- **Ո՞ր ձևը։** Թող **escaped-defect data**-ն ընտրի՝ logic-ծանր → pyramid. wiring/integration-ծանր (web-ի մեծ մաս) → trophy. microservice → honeycomb։ Երբեք ice-cream-cone։
- **Mock, fake, թե իրակա՞ն։** Իրական collaborator default-ով (classicist)։ Fake I/O-ի համար (in-memory DB/queue)։ Mock միայն, երբ *ինքը interaction-ն* է վարքը, ու միայն architectural boundary-ներում։ Երբեք մի՛ mock արա այն, ինչ քոնը չէ — փաթաթիր ու integration-test արա։
- **Deterministic է այս test-ը։** Եթե դիպչում է իրական time/random/network/shared-state/order-ին, flaky-by-construction է — inject արա clock-ն ու RNG-ն, isolate արա, fake արա network-ը՝ commit անելուց առաջ։
- **Property test թե example test։** Կարո՞ղ ես invariant նշել բոլոր input-ների վրա (round-trip, idempotence, sorted-permutation) → property-based։ Կոնկրետ հայտնի case / regression → example։
- **Snapshot թե բացահայտ assertion։** Բացահայտ assertion կարևոր վարքի վրա։ Snapshot միայն մեծ structured output-ի համար, որ իրապես review կանես փոփոխության դեպքում — երբեք հսկա կույր blob։
- **«Covered»-ը բավակա՞ն է։** Ոչ — covered ≠ verified։ Critical module-ների վրա run արա mutation testing. եթե mutant-ները survive են, assertion-ները բացակայում են։
- **Suite-ը վստահելի՞ է։** Միայն, եթե flake rate-ը զրոյի մոտ է։ Flaky test-ը P1 defect է՝ quarantine + ticket + fix, երբեք «վերա-run մինչև կանաչ»։
- **Done է՞։** Ոչ, երբ CI-ն կանաչ է — երբ **աշխատող, deployed, migrated** system-ը ցույց է տալիս վարքը (running-system done-check, Skill 11 §7)։ Կանաչ test-երը անհրաժեշտ են, երբեք բավարար։
- **Պիտի՞ run-վի այս destructive fixture-ը։** Միայն բացահայտ pin արված disposable `_test` target-ի դեմ, guard-ի հետևից, որ abort է անում, եթե target-ի անունը չի համընկնում։ Երբեք մի՛ ստացիր app-ի իրական connection-ից (§5.4)։

---

## 13. ANTI-PATTERNS (smell → fix)

**EN:**
- **Ice-cream cone** — e2e-heavy, unit-light, manual QA on top. *Fix:* push each test to the lowest level that catches the bug; pyramid/trophy by escaped-defect data (§2.3).
- **Test-after-never** — "we'll add tests later." *Fix:* the test ships in the same diff; no-test merges nothing (§1.3).
- **Testing implementation** — asserting private methods, call counts, field values; breaks on every refactor. *Fix:* assert observable behavior through public seams (§1.5).
- **Over-mocking / mock theater** — every collaborator mocked; the test asserts the code calls what you wrote (a tautology). *Fix:* classicist real collaborators + fakes for I/O; mocks only at boundaries (§5.2).
- **Mocking what you don't own** — mocking a third-party lib directly. *Fix:* wrap in your adapter, mock the adapter, integration-test the real thing (§5.3).
- **The flaky suite** — tests that pass/fail on the same code; "re-run till green" culture. *Fix:* P1-defect treatment — detect/quarantine+ticket/fix; inject clock/RNG, isolate, fake network (§7).
- **Coverage worship** — chasing a coverage % target, producing assertion-free tests. *Fix:* coverage as a floor-finder/regression-flag only; measure escaped defects + mutation score (§9.3).
- **Born-green test** — a test never seen to fail, asserting nothing real. *Fix:* watch it go red first (§1.6); mutation-test critical paths (§6.3).
- **Giant blind snapshot** — a 2,000-line snapshot rubber-stamped on every change. *Fix:* small, reviewed snapshots; explicit assertions on what matters (§6.4).
- **Shared mutable fixture / order dependence** — test B needs test A to run first. *Fix:* fresh per-test data, full isolation, randomize order in CI to expose it (§5.4, §7).
- **Slow suite** — minutes-to-hours, so nobody runs it locally. *Fix:* size tests (§2.4), parallelize/shard, push down the pyramid, hermetic+fast tier on every commit (§11).
- **Happy-path-only** — no empty/max/error/concurrent/illegal-transition cases. *Fix:* boundary-value + equivalence + state-transition + decision tables (§9.2).
- **Destructive fixture on the real DB** — a reset/drop fixture that targets whatever the app is configured for. *Fix:* pin a disposable `_test` target + a guard that aborts on a non-matching name; CI-exact roles (§5.4 — the real scar).
- **"It compiles, ship it"** — declaring done on a green type-checker/CI. *Fix:* the running-system done-check — verify behavior in the deployed, wired, running artifact (§11, Skill 11 §7).
- **BDD-for-developers** — Gherkin overhead with no business stakeholder reading it. *Fix:* plain tests; reserve Gherkin for when non-technical people genuinely shape the scenarios (§3.3).
- **Assertion-free test** — exercises code, asserts nothing (or just "no exception"). *Fix:* assert the actual outcome; "doesn't throw" is rarely the real spec.
- **Brittle e2e on UI structure** — selectors coupled to CSS/DOM, break on restyle. *Fix:* test by role/accessible-name/data-testid; minimize e2e; push logic down (§2.3).

**HY:**
- **Ice-cream cone** — e2e-ծանր, unit-թեթև, manual QA վերևում։ *Fix:* հրիր ամեն test ամենացածր level, որ բռնում է bug-ը. pyramid/trophy ըստ escaped-defect data-ի (§2.3)։
- **Test-after-never** — «հետո կավելացնենք»։ *Fix:* test-ը ship է լինում նույն diff-ում. no-test-ը ոչինչ չի merge անում (§1.3)։
- **Implementation test անելը** — private method, call count, field value assert անելը. կոտրվում է ամեն refactor-ին։ *Fix:* assert արա observable վարքը public seam-ի միջով (§1.5)։
- **Over-mocking / mock theater** — ամեն collaborator mock. test-ը assert է անում, որ կոդը կանչում է ինչ գրել ես (tautology)։ *Fix:* classicist իրական collaborator + fake I/O-ի համար. mock միայն boundary-ներում (§5.2)։
- **Չքո բանը mock անելը** — third-party lib ուղիղ mock։ *Fix:* փաթաթիր adapter-ով, mock արա adapter-ը, integration-test արա իրականը (§5.3)։
- **Flaky suite** — test-եր, որ pass/fail են նույն կոդով. «վերա-run մինչև կանաչ» մշակույթ։ *Fix:* P1-defect վերաբերմունք — detect/quarantine+ticket/fix. inject արա clock/RNG, isolate, fake network (§7)։
- **Coverage երկրպագություն** — coverage % target հետապնդելը, assertion-ազատ test արտադրելը։ *Fix:* coverage միայն floor-finder/regression-flag. չափիր escaped defect + mutation score (§9.3)։
- **Born-green test** — test, որ երբեք ձախողվելիս չի տեսնվել, ոչ իրական բան assert անող։ *Fix:* տես այն կարմրելիս առաջ (§1.6). mutation-test critical path (§6.3)։
- **Հսկա կույր snapshot** — 2000-տողանոց snapshot, rubber-stamp ամեն փոփոխությանը։ *Fix:* փոքր, review-ված snapshot. բացահայտ assertion կարևորի վրա (§6.4)։
- **Shared mutable fixture / order dependence** — test B-ին պետք է A-ն առաջ run-վի։ *Fix:* թարմ per-test data, լրիվ isolation, randomize order CI-ում՝ բացահայտելու (§5.4, §7)։
- **Դանդաղ suite** — րոպեներ-ժամեր, ուստի ոչ ոք local չի run անում։ *Fix:* size արա test-երը (§2.4), parallelize/shard, հրիր ներքև pyramid-ով, hermetic+արագ tier ամեն commit-ին (§11)։
- **Միայն-happy-path** — ոչ empty/max/error/concurrent/illegal-transition case։ *Fix:* boundary-value + equivalence + state-transition + decision table (§9.2)։
- **Destructive fixture իրական DB-ի վրա** — reset/drop fixture, որ target է անում ինչ app-ը configured է։ *Fix:* pin արա disposable `_test` target + guard, որ abort է անում non-matching անվան վրա. CI-exact role-եր (§5.4 — իրական սպին)։
- **«Compile է լինում, ship արա»** — done հայտարարելը կանաչ type-checker/CI-ի վրա։ *Fix:* running-system done-check — verify արա վարքը deployed, wired, աշխատող artifact-ում (§11, Skill 11 §7)։
- **BDD-developer-ների համար** — Gherkin overhead առանց business stakeholder-ի, որ կարդա։ *Fix:* plain test. պահիր Gherkin-ը, երբ ոչ-տեխնիկական մարդիկ իրապես ձևավորում են scenario-ները (§3.3)։
- **Assertion-ազատ test** — exercise է անում կոդը, ոչինչ չի assert (կամ միայն «exception չկա»)։ *Fix:* assert արա իրական արդյունքը. «չի throw անում»-ը հազվադեպ է իրական spec-ը։
- **Փխրուն e2e UI structure-ի վրա** — selector-ներ կապված CSS/DOM-ին, կոտրվում են restyle-ին։ *Fix:* test արա ըստ role/accessible-name/data-testid. նվազեցրու e2e. հրիր logic-ը ներքև (§2.3)։

---

## 14. CANON QUICK-REFERENCE (named correctly)

**EN:**
- **Kent Beck** — *TDD by Example*; red-green-refactor; "make it work, make it right, make it fast"; test-driven design.
- **Robert C. Martin (Uncle Bob)** — the Three Laws of TDD; clean tests; the test as first-class production artifact.
- **Martin Fowler** — *Refactoring* (the test net that enables it); the **Test Pyramid** (with Vocke/Cohn); "Mocks Aren't Stubs" (classicist vs mockist); test-smell catalog.
- **Gerard Meszaros** — *xUnit Test Patterns*; the **doubles taxonomy** (dummy/stub/spy/mock/fake); test-smell vocabulary (fragile/obscure/slow/erratic tests).
- **Kent C. Dodds** — the **Testing Trophy**; "write tests, not too many, mostly integration"; test behavior not implementation.
- **Gojko Adzic** — *Specification by Example*, *Bridging the Communication Gap*; living documentation; examples as the spec.
- **Dan North** — **BDD**; Given-When-Then; behavior over "test".
- **Freeman & Pryce** — *Growing Object-Oriented Software, Guided by Tests* (**GOOS**); outside-in/London/mockist; "listen to the tests" (test pain = design smell).
- **Michael Feathers** — *Working Effectively with Legacy Code*; legacy = code without tests; **seams**; characterization tests.
- **W. Edwards Deming** — quality is built-in, not inspected-in; cease dependence on mass inspection; *system of profound knowledge*.
- **John Hughes** — **QuickCheck** / property-based testing; invariants + shrinking.
- **T.Y. Chen** — **metamorphic testing** (the oracle problem; metamorphic relations).
- **Tim Ottinger & Brett Schuchert** — the **FIRST** principles (Fast, Isolated, Repeatable, Self-validating, Timely).
- **Winters/Manshreck/Wright** — *Software Engineering at Google*; test sizes vs scopes, hermeticity, flake culture, "the Beyoncé rule" (if you liked it you should've put a test on it).
- **Boehm** — the cost-of-a-bug escalation curve (shift-left economics).
- **Goodhart's Law** — "when a measure becomes a target, it ceases to be a good measure" (coverage as target).
- **Mike Cohn** — *Succeeding with Agile*; origin of the Test Pyramid metaphor. **Spotify** — the Honeycomb (microservice shape).
- **Test techniques (classical)** — equivalence partitioning, boundary-value analysis, decision tables, state-transition, pairwise/combinatorial (BS 7925 / ISTQB lineage).

**HY:**
- **Kent Beck** — *TDD by Example*. red-green-refactor. «make it work, make it right, make it fast». test-driven design։
- **Robert C. Martin** — TDD-ի երեք օրենքը. մաքուր test-եր. test-ը որպես first-class production artifact։
- **Martin Fowler** — *Refactoring* (test net-ը, որ հնարավոր է անում). **Test Pyramid**. «Mocks Aren't Stubs» (classicist vs mockist). test-smell catalog։
- **Gerard Meszaros** — *xUnit Test Patterns*. **doubles taxonomy** (dummy/stub/spy/mock/fake). test-smell բառապաշար։
- **Kent C. Dodds** — **Testing Trophy**. «write tests, not too many, mostly integration». test behavior, ոչ implementation։
- **Gojko Adzic** — *Specification by Example*. living documentation. օրինակները որպես spec։
- **Dan North** — **BDD**. Given-When-Then։
- **Freeman & Pryce** — **GOOS**. outside-in/London/mockist. «listen to the tests» (test-ի ցավը = design smell)։
- **Michael Feathers** — *Working Effectively with Legacy Code*. legacy = test չունեցող կոդ. **seam**-եր. characterization test։
- **Deming** — որակը կառուցվում է ներսից, ոչ ստուգմամբ. դադարեցրու mass inspection-ից կախվածությունը։
- **John Hughes** — **QuickCheck** / property-based. invariant + shrinking։
- **T.Y. Chen** — **metamorphic testing** (oracle-ի խնդիր. metamorphic relation)։
- **Ottinger & Schuchert** — **FIRST** սկզբունքները (Fast, Isolated, Repeatable, Self-validating, Timely)։
- **Software Engineering at Google** — test size vs scope, hermeticity, flake-ի մշակույթ, «Beyoncé rule»։
- **Boehm** — bug-ի գնի escalation կորը (shift-left economics)։
- **Goodhart-ի օրենք** — «երբ չափումը target է դառնում, դադարում է լավ չափում լինել» (coverage որպես target)։
- **Mike Cohn** — Test Pyramid-ի փոխաբերության ծագումը։ **Spotify** — Honeycomb (microservice ձև)։
- **Test տեխնիկաներ (classical)** — equivalence partitioning, boundary-value, decision table, state-transition, pairwise/combinatorial (ISTQB ծագում)։

---

## 15. ԲԱՌԱՐԱՆ / Glossary (bilingual)

**EN:** test-as-spec/design-force/regression-net · shift-left / shift-right · cost-of-a-bug curve · test pyramid / testing trophy / honeycomb / ice-cream cone · unit / integration / component / contract / e2e / system test · size vs scope · TDD / red-green-refactor / Three Laws of TDD · BDD / Given-When-Then / Gherkin · ATDD / three amigos / double-loop · Specification by Example / living documentation · classicist (Detroit) vs mockist (London) · state vs interaction verification · outside-in · test doubles: dummy/stub/spy/mock/fake · don't-mock-what-you-don't-own · over-mocking · Arrange-Act-Assert · one-behavior-per-test · parameterized/table-driven · equivalence partitioning · boundary-value analysis · decision table · state-transition testing · pairwise/combinatorial · property-based testing / invariant / shrinking · fuzzing / coverage-guided / corpus · mutation testing / mutant / killed-survived / mutation score · metamorphic testing / oracle problem / metamorphic relation · golden/approval/snapshot test / staleness trap · FIRST (Fast/Isolated/Repeatable/Self-validating/Timely) · hermeticity / determinism · fixture / factory / builder / Object Mother · test container · DB-per-test / transaction-rollback · pinned disposable target / destructive-fixture guard · flaky test / flake taxonomy / quarantine / cry-wolf · clock & RNG injection · consumer-driven contract / Pact · schema/compatibility test / schema registry · line/branch/condition(MC-DC)/mutation coverage · Goodhart's law · escaped-defect rate / MTTR / change-failure rate / flake rate · load/stress/soak/spike test / Little's Law / p99 · SAST/DAST/SCA/IaC scan · accessibility testing (axe/WCAG) · chaos / fault injection / resilience test · characterization test / seam / legacy code · CI gate / quality gate / Definition-of-Done · test selection / impact analysis / sharding · running-system done-check · types-as-tests / make-illegal-states-unrepresentable · observability-driven QA / synthetic monitoring · error budget · code review · Beyoncé rule.

**HY (հիմնական եզրեր, native):** test-ը որպես spec/design-ուժ/regression-net · shift-left / shift-right (հայտնաբերումը վաղ/ուշ տեղափոխել) · bug-ի գնի կոր · test pyramid / testing trophy / honeycomb / ice-cream cone (շրջված, anti-pattern) · unit / integration / component / contract / e2e / system test · size ընդդեմ scope · TDD / red-green-refactor / TDD-ի երեք օրենք · BDD / Given-When-Then / Gherkin · ATDD / երեք amigo / double-loop · Specification by Example / living documentation · classicist (Detroit) ընդդեմ mockist (London) · state ընդդեմ interaction verification · outside-in · test double-եր՝ dummy/stub/spy/mock/fake · «մի՛ mock արա այն, ինչ քոնը չէ» · over-mocking · Arrange-Act-Assert · մեկ-վարք-մեկ-test · parameterized/table-driven · equivalence partitioning (համարժեքության բաժանում) · boundary-value (եզրային արժեք) · decision table · state-transition (վիճակի անցում) · pairwise/combinatorial · property-based / invariant / shrinking (նվազագույնի բերում) · fuzzing / coverage-guided / corpus · mutation testing / mutant / killed-survived / mutation score · metamorphic testing / oracle-ի խնդիր / metamorphic relation · golden/approval/snapshot / staleness թակարդ · FIRST (Fast/Isolated/Repeatable/Self-validating/Timely) · hermeticity / determinism · fixture / factory / builder / Object Mother · test container · DB-per-test / transaction-rollback · pin արված disposable target / destructive-fixture guard · flaky test / flake-ի taxonomy / quarantine / cry-wolf · clock-ի ու RNG-ի injection · consumer-driven contract / Pact · schema/compatibility test / schema registry · line/branch/condition(MC-DC)/mutation coverage · Goodhart-ի օրենք · escaped-defect rate / MTTR / change-failure rate / flake rate · load/stress/soak/spike test / Little's Law / p99 · SAST/DAST/SCA/IaC scan · accessibility testing (axe/WCAG) · chaos / fault injection / resilience test · characterization test / seam / legacy code · CI gate / quality gate / Definition-of-Done · test selection / impact analysis / sharding · running-system done-check (աշխատող համակարգում ստուգում) · type-երը որպես test / անօրինական state-երը աններկայանալի դարձնել · observability-driven QA / synthetic monitoring · error budget · code review · Beyoncé rule («եթե դուր եկավ, պիտի test դնեիր»)։

---

*EN: Skill 13 v1 — top-level, living. Quality is built-in, not inspected-in. Every change ships with its test, written test-first and watched fail. Test behavior not implementation; push each test to the lowest level that catches the bug; choose the shape by where YOUR defects escape. Determinism is engineered, flakiness is a P1, coverage is a signal never a target. A destructive fixture is pinned and guarded — never derived from the real connection. And it's not done when CI is green — it's done when the running, deployed, migrated system shows the behavior.*
*HY: Skill 13 v1 — top-level, living։ Որակը կառուցվում է ներսից, ոչ ստուգմամբ։ Ամեն փոփոխություն գալիս է իր test-ով՝ գրված test-first ու տեսնված ձախողվելիս։ Test արա վարքը, ոչ implementation-ը. հրիր ամեն test ամենացածր level, որ բռնում է bug-ը. ընտրիր ձևն ըստ նրա, թե ՔՈ defect-ները որտեղից են արտահոսում։ Determinism-ը engineer է արվում, flakiness-ը P1 է, coverage-ը signal է, երբեք target։ Destructive fixture-ը pin ու guard արված է — երբեք ստացված իրական connection-ից։ Ու done չէ, երբ CI-ն կանաչ է — done է, երբ աշխատող, deployed, migrated system-ը ցույց է տալիս վարքը։ 💪🤍*
