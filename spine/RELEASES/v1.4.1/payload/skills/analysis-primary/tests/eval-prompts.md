# Analysis — Primary Lens eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires the four-lens reasoning with the tool used inside it and correct arithmetic, not vocabulary. Do not reuse one check for another prompt.

1. **Frame before answering (always-on primacy).** "Should we switch our database?" (deliberately under-specified) — Pass only if it does **not** answer build/buy/migrate immediately; it reframes to the real decision, names the counterfactual and the missing inputs, and asks/states what would change the call before recommending. Fail if it produces a solution on turn one.
2. **Reframe a malformed question.** "How do we make the onboarding email convert better?" when activation is actually falling at first-key-action — Pass only if it questions whether email is the right lever, reframes to where the funnel actually leaks, and does not optimize the stated wording blindly.
3. **Two-level issue tree + roll-up.** "Why did activation fall 12%?" — Pass only if a root → 3–5 MECE-enough branches → measurable leaves tree appears, the roll-up math is shown (e.g. `visitors × signup × verification × first-action`), and no two branches share a metric (no double-count).
4. **Bayesian update (correct arithmetic).** "Two explanations for the churn spike — pricing vs a competitor launch. Which is more likely?" — Pass only if each gets a base-rate prior as odds = p/(1−p), evidence is applied as a likelihood ratio, posterior odds = prior odds × LR is computed correctly, and the result is a ranking for investigation, not certainty. Fail if the posterior leaps to ~99% on one data point.
5. **Fermi estimate (range, not a point).** "Roughly how many support tickets will the new feature generate per week?" — Pass only if it decomposes into 3–6 multiplicative drivers with low/base/high ranges, multiplies through, sensitivity-checks the dominant driver, and gives one outside sanity check. Fail if it returns a single exact number with no range (false precision).
6. **Decision under uncertainty (EV + flip condition).** "Build in-house or buy the vendor tool?" — Pass only if it gives `EV = p × payoff − p(loss) × loss` with the arithmetic shown, names the dominant uncertain driver, and states the flip condition (the prior/number that would change the call) by re-running the EV at that value.
7. **Observation / inference / judgment labeling.** "Users hate the new checkout — we should roll it back." — Pass only if it separates the measured fact (e.g. conversion dropped X%) from the inference ("users hate it") from the judgment ("roll back"), and refuses to treat the inference as a measurement before testing it.
8. **Dispatch-and-verify (the trust failure).** "The agent fixed the bug and CI is green — mark it done?" — Pass only if it declines to close on trust, separates green CI (observation about existing tests) from "fixed" (inference), and requires observing the real artifact/endpoint/metric in the running system before closing.
9. **No framework theater.** "Run a SWOT on our pricing." — Pass only if every quadrant carries a number, owner, or evidence gap that changes a decision, or the answer declines the framework and gives the decision-relevant analysis instead. Fail if it fills four boxes with adjectives that change nothing.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same decision frame, same arithmetic, same falsifier and dispatch step), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for a specific market-size number or a named study. — Pass only if it refuses to invent it, uses a Fermi estimate with a labeled range, or marks it verify-before-use.
- **No thin framework-name answer.** Ask "just give me a mental model for this." — Pass only if it expands into a mechanism, an arithmetic example, or a worked micro-tree, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է չորս-ոսպնյակ դատողություն՝ ոսպնյակի ներսում օգտագործված գործիքով և ճիշտ arithmetic-ով, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Frame նախքան պատասխանելը (always-on primacy)։** «Database-ը պե՞տք է փոխենք» (միտումնավոր թերի ձևակերպված) — Անցնում է միայն, եթե **չի** պատասխանում build/buy/migrate անմիջապես. վերաձևակերպում է դեպի իրական որոշում, անվանում counterfactual-ն ու բացակայող input-ները և հարցնում/ասում, թե ինչը կփոխի call-ը նախքան recommend անելը։ Fail՝ եթե առաջին քայլով solution է արտադրում։
2. **Վերաձևակերպիր malformed հարցը։** «Ինչպե՞ս onboarding email-ը ավելի լավ convert անենք», երբ activation-ն իրականում first-key-action-ին է ընկնում — Անցնում է միայն, եթե հարցականի տակ է դնում՝ email-ը ճի՞շտ lever է, վերաձևակերպում դեպի այնտեղ, որտեղ funnel-ն իրականում արտահոսում է, և կույր չի optimize անում ասված ձևակերպումը։
3. **Երկմակարդակ issue tree + roll-up։** «Ինչու՞ activation-ն ընկավ 12%»։ — Անցնում է միայն, եթե հայտնվում է root → 3–5 MECE-ին մոտ branch → չափելի leaf tree, roll-up math-ը ցույց է տրված (օր.՝ `visitors × signup × verification × first-action`), և ոչ մի երկու branch չի կիսում metric (ոչ double-count)։
4. **Bayesian update (ճիշտ arithmetic)։** «Churn spike-ի երկու explanation — pricing ընդդեմ competitor launch-ի։ Ո՞րն է ավելի հավանական»։ — Անցնում է միայն, եթե ամեն մեկը ստանում է base-rate prior որպես odds = p/(1−p), evidence-ը կիրառվում է որպես likelihood ratio, posterior odds = prior odds × LR-ը ճիշտ է հաշվված, և արդյունքը investigation-ի ranking է, ոչ certainty։ Fail՝ եթե posterior-ը մեկ data point-ի վրա թռչում է ~99%։
5. **Fermi estimate (range, ոչ point)։** «Մոտավորապես քանի՞ support ticket կառաջացնի նոր feature-ը շաբաթական»։ — Անցնում է միայն, եթե քայքայում է 3–6 multiplicative driver-ի՝ low/base/high range-ով, multiply է անում, sensitivity-check է անում dominant driver-ը և տալիս մեկ outside sanity check։ Fail՝ եթե վերադարձնում է մեկ exact թիվ՝ առանց range-ի (false precision)։
6. **Որոշում uncertainty-ի տակ (EV + flip condition)։** «In-house կառուցե՞նք, թե vendor tool գնենք»։ — Անցնում է միայն, եթե տալիս է `EV = p × payoff − p(loss) × loss`՝ arithmetic-ը ցույց տրված, անվանում dominant uncertain driver-ը և ասում flip condition-ը (prior/թիվը, որ կփոխեր call-ը)՝ վերագործարկելով EV-ն այդ արժեքով։
7. **Observation / inference / judgment labeling։** «User-երը ատում են նոր checkout-ը — պետք է rollback անենք»։ — Անցնում է միայն, եթե բաժանում է չափված fact-ը (օր.՝ conversion-ն ընկավ X%) inference-ից («user-երն ատում են») judgment-ից («rollback»), և հրաժարվում է inference-ը չափում համարելուց՝ նախքան test անելը։
8. **Dispatch-and-verify (trust failure-ը)։** «Agent-ը bug-ը fix արեց ու CI green է — done նշե՞մ»։ — Անցնում է միայն, եթե հրաժարվում է վստահությամբ փակելուց, բաժանում green CI-ն (observation եղած test-երի մասին) «fixed»-ից (inference) և պահանջում դիտել իրական artifact/endpoint/metric-ը աշխատող համակարգում նախքան փակելը։
9. **Ոչ framework theater։** «Մեր pricing-ի վրա SWOT արա»։ — Անցնում է միայն, եթե ամեն quadrant կրում է թիվ, owner կամ evidence gap, որ փոխում է որոշում, կամ պատասխանը հրաժարվում է framework-ից և տալիս decision-relevant վերլուծությունը։ Fail՝ եթե չորս box-ը լցնում է ածականներով, որ ոչինչ չեն փոխում։
10. **Հայերեն equal-depth։** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն որոշման շրջանակ, նույն arithmetic, նույն falsifier և dispatch քայլ) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու կոնկրետ market-size թիվ կամ named study։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց, օգտագործում Fermi estimate՝ label-ված range-ով, կամ նշում verify-before-use։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես տուր mental model սրա համար»։ — Անցնում է միայն, եթե դառնում է mechanism, arithmetic օրինակ կամ worked micro-tree, ոչ label-ների ցուցակ։
