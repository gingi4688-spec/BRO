# Product and Project Management eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **PRD (problem-first).** "The CEO says build a guided onboarding wizard; write the PRD." — Pass only if it re-roots the spec in the **problem and an outcome metric** (not the wizard), states **non-goals**, makes every success criterion an **instrumented metric**, and writes acceptance criteria as **verified-in-the-running-product** behaviors, not "merged."
2. **RICE/WSJF prioritization.** "We have several bets and one quarter; pick and prove it." — Pass only if it computes **RICE `(R×I×C)/E`** (or WSJF where a cost-of-delay queue is the right tool) with every input shown, ties **confidence to evidence**, and runs a **sensitivity check** that tests whether the rank survives an honest change. Fail if confidence is pinned at 100% or no sensitivity is shown.
3. **Roadmap.** "Give us a 12-month roadmap with dates." — Pass only if it delivers **bets-with-learning-gates by horizon (now/next/later)**, each with a **hypothesis and proceed/iterate/kill gate**, and names the **critical-path dependency before any date** — not a dated promise list.
4. **Discovery / OST.** "A stakeholder wants feature X built." — Pass only if it builds an **opportunity-solution tree** (outcome → opportunity → solutions → experiment), rejects any solution with no opportunity, and includes **alternatives** (a one-branch tree fails).
5. **PM/PO/PgM role confusion.** "Be our PM, PO, and program manager — give me the roadmap." — Pass only if it **names the three roles distinctly** (PM why/what · PO backlog/acceptance · PgM cross-team schedule) and states which decision/artifact each owns, instead of producing one blurred document.
6. **Definition of Done.** "The PR is merged and CI is green — mark it done." — Pass only if it declines "done on merge" and requires the **acceptance criteria observed in the running product with the success metric instrumented** before closing.
7. **Delivery / critical path.** "We committed a launch date; now a dependency appeared." — Pass only if it maps the **dependency graph and critical path**, re-baselines the date from the critical path, and names what slipped — and notes that the dependency should have been mapped before commitment.
8. **Scope creep.** "Leadership added three features; keep the same date." — Pass only if it makes the **tradeoff explicit** (what slips or what date moves) rather than silently absorbing scope; it must not pretend the unchanged date is free.
9. **Strategy boundary.** "Should we enter the enterprise segment and raise our price?" — Pass only if it **routes the market/pricing decision to `business-strategy-operations`** and keeps PM scoped to how a chosen bet is discovered, sequenced, and delivered — it must not answer the strategy as prioritization.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same mechanism, same artifact, same numbers), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); English tech tokens (RICE, WSJF, PRD, OST) are fine.

Regression checks (run alongside):

- **No invented evidence.** Ask for a specific adoption rate or market size as fact. — Pass only if it refuses to invent it and labels it assumption or verify-before-use with a placeholder.
- **No thin framework-name answer.** Ask "just tell me the product management best practices." — Pass only if it expands into mechanism, a formula, or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **PRD (problem-first).** «CEO-ն ասում է build արա guided onboarding wizard. գրիր PRD-ն»։ — Անցնում է միայն, եթե spec-ը վերա-խարսխում է **problem-ի և outcome metric-ի** վրա (ոչ wizard-ի), նշում է **non-goals**, ամեն success criterion դարձնում **instrumented metric** և acceptance criteria-ն գրում որպես **verified-in-the-running-product** վարք, ոչ «merged»։
2. **RICE/WSJF prioritization.** «Ունենք մի քանի bet և մեկ եռամսյակ. ընտրիր և ապացուցիր»։ — Անցնում է միայն, եթե հաշվում է **RICE `(R×I×C)/E`** (կամ WSJF, որտեղ cost-of-delay queue-ն ճիշտ գործիքն է)՝ ամեն input ցույց տրված, **confidence-ը evidence-ին կապում** և **sensitivity check** անում, որ test է անում՝ rank-ը գոյատևո՞ւմ է ազնիվ փոփոխության։ Fail՝ եթե confidence-ը 100%-ի վրա pin-ված է կամ sensitivity չկա։
3. **Roadmap.** «Տուր 12-ամսյա roadmap date-երով»։ — Անցնում է միայն, եթե մատուցում է **bets-with-learning-gate-ներ horizon-ով (now/next/later)**, ամեն մեկը **hypothesis-ով և proceed/iterate/kill gate-ով**, և անվանում **critical-path dependency-ն ցանկացած date-ից առաջ** — ոչ dated promise list։
4. **Discovery / OST.** «Stakeholder-ն ուզում է feature X կառուցել»։ — Անցնում է միայն, եթե կառուցում է **opportunity-solution tree** (outcome → opportunity → solution-ներ → experiment), reject է անում opportunity չունեցող solution-ը և ներառում **alternative-ներ** (մեկ-ճյուղ tree-ն fail է)։
5. **PM/PO/PgM role confusion.** «Եղիր մեր PM-ը, PO-ն և program manager-ը — տուր roadmap-ը»։ — Անցնում է միայն, եթե **հստակ անվանում է երեք role-ը** (PM why/what · PO backlog/acceptance · PgM cross-team schedule) և նշում, թե որ որոշումը/artifact-ը ամեն մեկը տիրում է, ոչ թե արտադրում մեկ խառնված փաստաթուղթ։
6. **Definition of Done.** «PR-ը merged է և CI-ը green — նշիր done»։ — Անցնում է միայն, եթե հրաժարվում է «done merge-ի վրա»-ից և պահանջում **acceptance criteria-ն դիտված running product-ում՝ success metric-ը instrumented**, նախքան փակելը։
7. **Delivery / critical path.** «Commit արեցինք launch date. հիմա dependency հայտնվեց»։ — Անցնում է միայն, եթե քարտեզագրում է **dependency graph-ը և critical path-ը**, re-baseline է անում date-ը critical path-ից և անվանում, թե ինչ սահեց — և նշում, որ dependency-ն պետք է քարտեզագրվեր commitment-ից առաջ։
8. **Scope creep.** «Leadership-ն ավելացրեց երեք feature. պահիր նույն date-ը»։ — Անցնում է միայն, եթե **tradeoff-ը դարձնում է բացահայտ** (ինչ է սահում կամ որ date-ն է շարժվում), ոչ թե լուռ կլանում scope-ը. չպետք է ձևացնի, թե անփոփոխ date-ն ձրի է։
9. **Strategy boundary.** «Մտնե՞նք enterprise segment և բարձրացնե՞նք price-ը»։ — Անցնում է միայն, եթե **market/pricing որոշումը ուղղորդում է `business-strategy-operations`-ին** և PM-ը պահում, թե ինչպես է ընտրված bet-ը discover, sequence և deliver արվում — չպետք է ստրատեգիան պատասխանի որպես prioritization։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն mechanism, նույն artifact, նույն թվեր) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները (RICE, WSJF, PRD, OST) նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված evidence.** Հարցրու կոնկրետ adoption rate կամ market size որպես fact։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց և label է անում assumption կամ verify-before-use՝ placeholder-ով։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես ասա product management best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, formula կամ worked micro-example, ոչ label-ների ցուցակ։
