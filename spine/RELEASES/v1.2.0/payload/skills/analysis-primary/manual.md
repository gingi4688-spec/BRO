# Analysis — Primary Lens manual

## English

### Operating principle

This is Bro's always-on reasoning lens, not a skill summoned only for "analysis tasks". On any input that is ambiguous, complex, high-stakes, or multi-step, it runs *first* — before any other skill produces an answer — because the most expensive failure in the whole pack is a fluent, well-structured answer to the wrong question. The discipline is a single sequence of four lenses: **Frame** the real decision, **Decompose** it into measurable drivers, **Interrogate** the drivers and the evidence, then **Dispatch** the framed problem to the skill that owns the answer and verify the result in the running system. The famous tools — issue trees, Bayesian updating, Fermi estimation, bias defenses — are not the structure; they live *inside* the four lenses as the means to do each step. An analysis is decision-grade only when it states the real decision, shows its reasoning so another practitioner can reproduce or reject it, names the evidence that would flip the call, and ends by handing the work to an owner with a way to check that it actually worked — not by trusting that it did.

### Mechanism reference

- **The four lenses (the spine)** — **Frame:** name the decision actually on the table, its counterfactual, and the stop rule; reframe a malformed question rather than answering it as-is. **Decompose:** split into MECE-enough, measurable drivers that roll up to the root. **Interrogate:** attack the strongest version of each branch with base rates, Bayesian updating, bias defenses, and a strict observation/inference/judgment split; name the falsifier. **Dispatch:** route the framed problem to the lead skill that owns the domain answer, then verify the result in the running system. Every tool below is used *within* a lens, never as a freestanding flourish.
- **Issue trees and MECE (Decompose)** — split the question into branches that are mutually exclusive enough to avoid double counting and collectively exhaustive enough to cover the decision. The mechanism is not the "MECE" label; it is the arithmetic or logic roll-up from leaves to root. Example: growth = traffic × conversion × average order value × repeat rate; each leaf gets an owner, a baseline, and an evidence gap so the debate moves to a specific assumption instead of general opinion.
- **Bayesian updating (Interrogate)** — start with a base-rate prior, then adjust with evidence strength. Numeric form: posterior odds = prior odds × likelihood ratio, where odds = p / (1 − p). Example: prior 20% that a churn spike is pricing-related → prior odds 0.25; evidence that the spike concentrates in the price-changed segment has LR ≈ 3, so posterior odds 0.75, posterior = 0.75 / 1.75 ≈ **43%**. That is not certainty; it is a rank-ordering for investigation, and the conclusion must not be smuggled into the likelihood ratio.
- **Fermi estimation and expected value (Decompose + Interrogate)** — decompose an unknown into 3–6 estimable, multiplicative drivers, use low/base/high ranges, multiply through, and sensitivity-check the driver that dominates the spread. Expected value = probability × payoff − probability of loss × loss; use a decision tree when choices are staged. Use Fermi when uncertainty cannot be eliminated before the decision, and always surface the one assumption that would flip the choice.
- **Bias defenses (Interrogate)** — anchoring is fought by independent first estimates; survivorship by asking for the missing failures; sunk-cost by evaluating from today forward; availability by base rates; confirmation by building the steelman of the opposite hypothesis. A senior analysis names the specific bias defense it used, not just the conclusion.
- **Observation / inference / judgment separation (Interrogate)** — an *observation* is a measured fact ("churn rose from 4% to 7%"); an *inference* is a derived claim ("the price change caused it"); a *judgment* is a value call ("therefore we should revert"). Wherever a claim could move money, safety, legal exposure, or production, label which of the three it is. Letting an inference wear a fact's costume is the quiet failure that breaks every downstream decision.
- **Dispatch and live verification (Dispatch)** — once framed, hand the problem to the lead skill that owns the answer; this lens owns the reasoning shape, not the specialist content. Then close the loop: a dispatched result is not done because the specialist "ran it" or a function "tested green" — it is done when the real artifact, endpoint, or metric is observed in the running system. "Dispatch-and-trust" is a failure mode; verify-in-the-running-system is the gate.

### Decision rules

1. On ambiguous, complex, or high-stakes input, Frame before answering: state the real decision, its counterfactual, and what would change it, before producing any solution.
2. If the question is malformed, reframe it to the decision the user actually faces and confirm it; do not answer the literal wording.
3. If a solution is on the table before the problem is framed and decomposed, stop and back up; act-before-analyze is a failure mode, not speed.
4. For a broad "why / what's going on" question, build a two-level issue tree: root decision → 3–5 MECE-enough drivers → measurable leaves marked known / estimated / unknown.
5. If two branches share a metric, merge or redefine them; enforce MECE at the roll-up arithmetic, not at the label.
6. When several explanations are plausible, run a Bayesian ledger: base-rate priors, explicit likelihood ratios, posterior ranking, and the single next evidence that would most move it.
7. When a needed number is unknown but the decision can't wait, Fermi-decompose into 3–6 multiplicative drivers with low/base/high ranges, multiply, and sensitivity-check the dominant driver.
8. Reject a single exact number with no range, prior, or sensitivity as false precision; show the band and what would move it.
9. Label every decision-relevant claim as observation, inference, or judgment wherever money, safety, legal, or production is at stake.
10. Distrust any certainty with no falsifier; every confident conclusion must name the evidence that would prove it wrong.
11. Run and name the relevant bias defense before recommending (anchoring, survivorship, sunk-cost, availability, confirmation).
12. Once framed, dispatch to the lead skill that owns the domain answer; do not finish the specialist's work inside this lens.
13. Verify a dispatched result in the running system — observe the real artifact/endpoint/metric; never treat "the specialist ran it" or "function-tested" as verification.
14. Justify fan-out by risk reduction or genuine independence, not by impressiveness; otherwise one careful lead lens end to end.
15. Finish with a flip condition: the number, base rate, or evidence that would change the recommendation.

### Failure-repair playbook

1. **The answer drifts into generic advice** → anchor it back to the named decision and the artifact that must support it (issue tree, Bayesian note, Fermi estimate, decision brief); cut anything that does not change the call.
2. **A solution appeared before the problem was framed** → stop, write the decision statement, its counterfactual, and the driver tree first; only then re-open the options.
3. **The question was answered as-is but was malformed** → reframe to the real decision, confirm the reframe with the user, and redo the analysis against the corrected question.
4. **A confident causal story has no base rate** → attach a reference class and a prior before accepting the narrative; ask "how often does this kind of thing turn out this way".
5. **The issue tree double-counts** → find the two leaves sharing a metric, merge or redefine them, and re-run the roll-up so the total cannot exceed the whole.
6. **A point estimate is presented with no range** → convert it to low/base/high, sensitivity-check the dominant driver, and state the assumption that would flip the choice.
7. **A Bayesian update jumped to near-certainty** → check whether the conclusion was smuggled into the likelihood ratio; re-derive odds = p/(1−p) and posterior odds = prior odds × LR from defensible inputs.
8. **The conclusion has no falsifier** → add the explicit flip condition and the next test that could overturn it; an unfalsifiable conclusion is not finished.
9. **Only confirming evidence was weighed** → build the steelman of the opposite hypothesis and weigh it honestly before recommending.
10. **Observation, inference, and judgment are blurred** → relabel each claim; demote any inference dressed as a measured fact and re-test the decision on the corrected labels.
11. **A framework decorates without deciding** → either give every leaf a number, owner, and evidence gap so it changes the call, or remove the framework; no theater.
12. **Work was dispatched and accepted on trust** → before closing, observe the real artifact/endpoint/metric in the running system; "the agent did it" / "function-tested" / "CI green" is necessary, not sufficient.

### Dispatch discipline: route, then verify live

Framing is not the finish line; it is the setup for the hand-off. Once this lens has named the decision, decomposed the drivers, and interrogated the evidence, it routes the framed problem to the skill that owns the domain answer — reliability to devops, money to finance, statute to legal, model spec to ML — and supplies them the decision frame, the drivers, and the acceptance criteria. The lens does not re-do their domain math; it owns the *shape* of the reasoning, not the specialist content. Then it closes the loop. A dispatched result is not done because a specialist "ran it", a sub-agent reported success, or a function "tested green". It is done when the real artifact, endpoint, or metric is observed behaving correctly in the running system. Treating dispatch as completion — "dispatch-and-trust" — is how a correctly framed problem still ships a broken answer.

### Falsifiers and the flip condition

Every confident conclusion must carry the evidence that would overturn it. The discipline is to write, before recommending, "I would change this call if X" — where X is a measurable, reachable piece of evidence, not a rhetorical hedge. The flip condition does three things: it makes the analysis testable, it tells the owner what to watch, and it exposes a conclusion that is actually unfalsifiable (if no X exists, the analysis stopped too early). An estimate without a range, a Bayesian update without a next-most-informative test, or a recommendation without a flip condition is not decision-grade — it is an opinion wearing analysis's clothes.

## Հայերեն

### Գործառնական սկզբունք

Սա Bro-ի մշտապես-միացած դատողության ոսպնյակն է, ոչ թե skill, որ կանչվում է միայն «վերլուծական task-երի» համար։ Ցանկացած input-ի վրա, որ ambiguous է, բարդ, high-stakes կամ multi-step, այն գործում է *առաջինը* — նախքան որևէ այլ skill պատասխան արտադրի — որովհետև ամբողջ pack-ի ամենաթանկ ձախողումը սահուն, լավ կառուցված պատասխանն է սխալ հարցին։ Կարգապահությունը չորս ոսպնյակի մեկ հերթականություն է․ **Frame** արա իրական որոշումը, **Decompose** արա այն չափելի driver-ների, **Interrogate** արա driver-ներն ու evidence-ը, հետո **Dispatch** արա շրջանակված խնդիրը այն skill-ին, որ տիրում է պատասխանին, և ստուգիր արդյունքը աշխատող համակարգում։ Հանրահայտ գործիքները՝ issue tree, Bayesian update, Fermi estimation, bias defense, կառուցվածքը չեն. դրանք ապրում են չորս ոսպնյակի *ներսում*՝ որպես ամեն քայլն անելու միջոց։ Վերլուծությունը decision-grade է միայն, երբ ասում է իրական որոշումը, ցույց է տալիս իր դատողությունը այնպես, որ մյուս practitioner-ը կարողանա վերարտադրել կամ մերժել, անվանում է այն evidence-ը, որ կշրջի call-ը, և ավարտվում է աշխատանքը owner-ին հանձնելով՝ ստուգելու միջոցով, որ այն իրականում աշխատեց, ոչ թե վստահելով, որ աշխատեց։

### Մեխանիզմների տեղեկագիր

- **Չորս ոսպնյակը (ողնաշարը)** — **Frame.** անվանիր այն որոշումը, որ իրականում սեղանին է, դրա counterfactual-ը և stop rule-ը. malformed հարցը վերաձևակերպիր, ոչ թե պատասխանիր ինչպես կա։ **Decompose.** բաժանիր MECE-ին մոտ, չափելի driver-ների, որ roll up անեն մինչև root։ **Interrogate.** հարձակվիր ամեն branch-ի ամենաուժեղ տարբերակի վրա base rate-ով, Bayesian update-ով, bias defense-ով և observation/inference/judgment-ի խիստ բաժանումով. անվանիր falsifier-ը։ **Dispatch.** ուղղորդիր շրջանակված խնդիրը lead skill-ին, որ տիրում է ոլորտի պատասխանին, հետո ստուգիր արդյունքը աշխատող համակարգում։ Ներքևի ամեն գործիք օգտագործվում է ոսպնյակի *ներսում*, երբեք որպես առանձին զարդ։
- **Issue tree և MECE (Decompose)** — հարցը բաժանիր ճյուղերի, որոնք բավականաչափ mutually exclusive են՝ double counting-ից խուսափելու, և բավականաչափ collectively exhaustive՝ որոշումը ծածկելու։ Մեխանիզմը «MECE» պիտակը չէ. այն leaf-ից root roll-up-ի arithmetic-ն կամ logic-ն է։ Օրինակ՝ growth = traffic × conversion × average order value × repeat rate. ամեն leaf ստանում է owner, baseline և evidence gap, որ վեճը տեղափոխվի կոնկրետ ենթադրության, ոչ ընդհանուր կարծիքի վրա։
- **Bayesian update (Interrogate)** — սկսիր base-rate prior-ից, հետո update արա evidence-ի ուժով։ Թվային ձև՝ posterior odds = prior odds × likelihood ratio, որտեղ odds = p / (1 − p)։ Օրինակ՝ prior 20%, որ churn spike-ը pricing-related է → prior odds 0.25. evidence-ը, որ spike-ը կենտրոնանում է price-changed segment-ում, ունի LR ≈ 3, ուստի posterior odds 0.75, posterior = 0.75 / 1.75 ≈ **43%**։ Դա certainty չէ. այն investigation priority է, և conclusion-ը չպետք է մաքսանենգ մտցվի likelihood ratio-ի մեջ։
- **Fermi estimation և expected value (Decompose + Interrogate)** — անհայտը քայքայիր 3–6 estimable, multiplicative driver-ի, օգտագործիր low/base/high range, multiply արա և sensitivity-check արա այն driver-ը, որ գերակշռում է spread-ը։ Expected value = probability × payoff − probability of loss × loss. staged choice-ի դեպքում կառուցիր decision tree։ Fermi օգտագործիր, երբ uncertainty-ն չի կարող վերանալ որոշումից առաջ, և միշտ բաց նշիր այն մեկ assumption-ը, որ կշրջի ընտրությունը։
- **Bias defense-ներ (Interrogate)** — anchoring-ի դեմ՝ անկախ առաջին estimate-ներ. survivorship-ի դեմ՝ հարցրու բացակայող failure-ները. sunk-cost-ի դեմ՝ գնահատիր այսօրվանից առաջ նայելով. availability-ի դեմ՝ base rate. confirmation-ի դեմ՝ կառուցիր հակադիր hypothesis-ի steelman-ը։ Senior վերլուծությունը անվանում է կիրառված կոնկրետ bias defense-ը, ոչ միայն conclusion-ը։
- **Observation / inference / judgment բաժանում (Interrogate)** — *observation*-ը չափված fact է («churn-ը 4%-ից բարձրացավ 7%»). *inference*-ը ածանցյալ պնդում է («price change-ը պատճառեց դա»). *judgment*-ը value call է («ուստի պետք է revert անենք»)։ Ամենուր, որտեղ պնդումը կարող է շարժել փող, safety, legal ռիսկ կամ production, label արա, թե երեքից որն է։ Inference-ին փաստի հագուստ տալը այն լուռ ձախողումն է, որ կոտրում է ամեն հետընթաց որոշում։
- **Dispatch և live verification (Dispatch)** — շրջանակելուց հետո խնդիրը հանձնիր lead skill-ին, որ տիրում է պատասխանին. այս ոսպնյակը տիրում է դատողության ձևին, ոչ specialist-ի բովանդակությանը։ Հետո փակիր loop-ը․ dispatch արված արդյունքը done չէ, որովհետև specialist-ը «գործարկեց» կամ function-ը «green test արեց» — այն done է, երբ իրական artifact-ը, endpoint-ը կամ metric-ը դիտվում է աշխատող համակարգում։ «Dispatch-and-trust»-ը ձախողման ձև է. verify-in-the-running-system-ը gate-ն է։

### Որոշման կանոններ

1. Ambiguous, բարդ կամ high-stakes input-ի վրա Frame արա նախքան պատասխանելը․ ասա իրական որոշումը, դրա counterfactual-ը և ինչը կփոխի այն՝ նախքան որևէ solution արտադրելը։
2. Եթե հարցը malformed է, վերաձևակերպիր այն դեպի որոշումը, որի առջև user-ն իրականում կանգնած է, և հաստատիր. մի՛ պատասխանիր բառացի ձևակերպմանը։
3. Եթե solution-ը սեղանին է, նախքան խնդիրը շրջանակվեց ու քայքայվեց, կանգնիր և հետ գնա. act-before-analyze-ը ձախողման ձև է, ոչ արագություն։
4. Լայն «ինչու՞ / ինչ է կատարվում» հարցի համար կառուցիր երկմակարդակ issue tree․ root decision → 3–5 MECE-ին մոտ driver → չափելի leaf՝ նշված known / estimated / unknown։
5. Եթե երկու branch կիսում են metric, միացրու կամ վերասահմանիր. MECE-ն կիրառիր roll-up arithmetic-ի վրա, ոչ label-ի։
6. Երբ մի քանի explanation plausible է, գործարկիր Bayesian ledger․ base-rate prior, բացահայտ likelihood ratio, posterior ranking և այն մեկ next evidence-ը, որ ամենաշատը կշարժի այն։
7. Երբ պետք եղած թիվն անհայտ է, բայց որոշումը չի սպասում, Fermi-decompose արա 3–6 multiplicative driver-ի՝ low/base/high range-ով, multiply արա և sensitivity-check արա dominant driver-ը։
8. Մերժիր մեկ exact թիվ՝ առանց range-ի, prior-ի կամ sensitivity-ի, որպես false precision. ցույց տուր band-ը և ինչը կշարժի այն։
9. Label արա ամեն decision-relevant պնդում որպես observation, inference, թե judgment ամենուր, որտեղ money, safety, legal կամ production-ն է վտանգի տակ։
10. Անվստահիր ամեն certainty-ի՝ առանց falsifier-ի. ամեն վստահ conclusion պետք է անվանի այն evidence-ը, որ կապացուցի, թե սխալ է։
11. Recommend անելուց առաջ գործարկիր և անվանիր համապատասխան bias defense-ը (anchoring, survivorship, sunk-cost, availability, confirmation)։
12. Շրջանակելուց հետո dispatch արա lead skill-ին, որ տիրում է ոլորտի պատասխանին. specialist-ի աշխատանքն այս ոսպնյակի ներսում մի՛ ավարտիր։
13. Dispatch արված արդյունքը ստուգիր աշխատող համակարգում — դիտիր իրական artifact/endpoint/metric. երբեք «specialist-ը գործարկեց» կամ «function-tested»-ը verification մի՛ համարիր։
14. Fan-out-ն արդարացրու ռիսկի նվազեցմամբ կամ իսկական անկախությամբ, ոչ տպավորիչությամբ. այլապես մեկ ուշադիր lead lens՝ ծայրից ծայր։
15. Ավարտիր flip condition-ով․ այն թիվը, base rate-ը կամ evidence-ը, որ կփոխեր recommendation-ը։

### Վերականգնման խաղագիրք

1. **Պատասխանը սահում է generic advice-ի** → վերադարձրու այն անվանված որոշմանն ու artifact-ին, որ պետք է աջակցի (issue tree, Bayesian note, Fermi estimate, decision brief). կտրիր այն, ինչը call-ը չի փոխում։
2. **Solution-ը հայտնվեց նախքան խնդիրը շրջանակվեց** → կանգնիր, նախ գրիր որոշման հայտարարությունը, դրա counterfactual-ը և driver tree-ն. միայն հետո վերաբացիր option-ները։
3. **Հարցին պատասխանվեց ինչպես կա, բայց այն malformed էր** → վերաձևակերպիր դեպի իրական որոշում, հաստատիր reframe-ը user-ի հետ և վերարա վերլուծությունը ուղղված հարցի դեմ։
4. **Վստահ պատճառային story-ն base rate չունի** → կցիր reference class և prior նախքան narrative-ն ընդունելը. հարցրու «որքա՞ն հաճախ է այս տիպի բանը այսպես ստացվում»։
5. **Issue tree-ն double-count է անում** → գտիր նույն metric-ը կիսող երկու leaf-ը, միացրու կամ վերասահմանիր և վերագործարկիր roll-up-ը, որ total-ը չգերազանցի ամբողջը։
6. **Point estimate ներկայացված է առանց range-ի** → վերածիր low/base/high, sensitivity-check արա dominant driver-ը և ասա այն assumption-ը, որ կշրջի ընտրությունը։
7. **Bayesian update-ը թռավ մոտ-certainty** → ստուգիր՝ conclusion-ը մաքսանենգ մտցվե՞ց likelihood ratio-ի մեջ. վերածնիր odds = p/(1−p) և posterior odds = prior odds × LR՝ պաշտպանելի input-ներից։
8. **Conclusion-ը falsifier չունի** → ավելացրու բացահայտ flip condition-ը և next test-ը, որ կարող է շրջել այն. unfalsifiable conclusion-ը ավարտված չէ։
9. **Կշռվեց միայն հաստատող evidence-ը** → կառուցիր հակադիր hypothesis-ի steelman-ը և կշռիր ազնվորեն նախքան recommend անելը։
10. **Observation, inference և judgment-ը խառնված են** → relabel արա ամեն պնդում. իջեցրու ամեն inference, որ ներկայացված է որպես չափված fact, և վերա-test արա որոշումը ուղղված label-ների վրա։
11. **Framework-ը զարդարում է՝ առանց որոշելու** → կա՛մ ամեն leaf-ի տուր թիվ, owner և evidence gap, որ այն փոխի call-ը, կա՛մ հանիր framework-ը. ոչ մի theater։
12. **Աշխատանքը dispatch արվեց և ընդունվեց վստահությամբ** → փակելուց առաջ դիտիր իրական artifact/endpoint/metric-ը աշխատող համակարգում. «agent-ն արեց» / «function-tested» / «CI green»-ը անհրաժեշտ է, ոչ բավարար։

### Dispatch կարգապահություն․ ուղղորդիր, հետո ստուգիր live

Framing-ը finish line-ը չէ. այն hand-off-ի setup-ն է։ Երբ այս ոսպնյակը անվանել է որոշումը, քայքայել driver-ները և հարցաքննել evidence-ը, այն ուղղորդում է շրջանակված խնդիրը այն skill-ին, որ տիրում է ոլորտի պատասխանին — reliability-ն devops-ին, money-ն finance-ին, statute-ը legal-ին, model spec-ը ML-ին — և տալիս նրանց որոշման շրջանակը, driver-ները և acceptance criteria-ն։ Ոսպնյակը չի վերա-անում նրանց ոլորտի math-ը. այն տիրում է դատողության *ձևին*, ոչ specialist-ի բովանդակությանը։ Հետո փակում է loop-ը։ Dispatch արված արդյունքը done չէ, որովհետև specialist-ը «գործարկեց», sub-agent-ը success հաղորդեց, կամ function-ը «green test արեց»։ Այն done է, երբ իրական artifact-ը, endpoint-ը կամ metric-ը դիտվում է ճիշտ վարվելիս աշխատող համակարգում։ Dispatch-ը completion համարելը՝ «dispatch-and-trust»-ը, այն է, ինչով ճիշտ շրջանակված խնդիրը միևնույն է ship է անում կոտրված պատասխան։

### Falsifier-ներ և flip condition-ը

Ամեն վստահ conclusion պետք է կրի այն evidence-ը, որ կշրջի այն։ Կարգապահությունը՝ recommend անելուց առաջ գրել «կփոխեի այս call-ը, եթե X» — որտեղ X-ը չափելի, հասանելի evidence է, ոչ հռետորական hedge։ Flip condition-ն անում է երեք բան․ դարձնում է վերլուծությունը testable, ասում է owner-ին՝ ինչին հետևել, և բացահայտում է conclusion, որ իրականում unfalsifiable է (եթե X գոյություն չունի, վերլուծությունը կանգ առավ շատ շուտ)։ Estimate՝ առանց range-ի, Bayesian update՝ առանց next-most-informative test-ի, կամ recommendation՝ առանց flip condition-ի, decision-grade չէ — այն կարծիք է՝ վերլուծության հագուստով։
