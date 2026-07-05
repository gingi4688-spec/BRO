# Analysis — Primary Lens red-team gate

## English

This gate extends the skill's final gate for the reasoning artifacts (issue tree, Bayesian update note, Fermi estimate, decision brief, assumption ledger, diagnosis). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`. It tests the four-lens spine: did the answer Frame, Decompose, Interrogate, and Dispatch — with the tools used inside the lenses, not as decoration.

### Domain failure cases (must be caught)

- **Answered the literal question, never reframed.** The output solves the wording, not the real decision; no counterfactual, no stop rule. Reframe to the decision the user actually faces.
- **Solution before framing (act-before-analyze).** Fixes or options appear before there is a stated decision, a driver tree, or a falsifier. Stop and frame first.
- **Issue tree double-counts.** Two branches share a metric, or leaf totals exceed the whole. Merge/redefine and re-roll-up.
- **False precision.** A single exact number with no range, prior, or sensitivity. Restore the band and the flip condition.
- **Conclusion smuggled into the likelihood.** A Bayesian posterior leaps to near-certainty from weak evidence because the LR was chosen to fit. Re-derive odds = p/(1−p) and posterior odds = prior odds × LR from defensible inputs.
- **No falsifier.** A confident conclusion with no evidence that could overturn it and no next test. Add the flip condition.
- **Observation/inference/judgment blurred.** An inference or a value call is presented as a measured fact where money/safety/legal/production is at stake. Relabel.
- **Dispatch-and-trust.** A result is accepted because a specialist "ran it", a sub-agent reported success, or a function "tested green" — with no observation of the live artifact/endpoint/metric. Require verification in the running system.
- **Framework theater.** A named framework decorates the answer but changes no decision; no leaf has a number, owner, or evidence gap.

### Reviewer probes (ask these of any answer)

- What is the **real decision** here, and what is its counterfactual? If the answer only restates the literal question, it skipped Frame.
- Is there a **solution on the table before the problem was decomposed**? If options precede the driver tree and the falsifier, it is act-before-analyze.
- Do any two branches of the tree **share a metric**, and does the roll-up arithmetic stay within the whole? Show the `A × B × C` and the no-double-count check.
- For every estimate: where is the **range, prior, or sensitivity**, and which driver dominates the spread? A single exact number is false precision.
- For any Bayesian step: show **odds = p/(1−p)** and **posterior odds = prior odds × LR**. Why that LR? Does the posterior leap to certainty on one data point (conclusion smuggled into the likelihood)?
- What is the **falsifier / flip condition** — the number or evidence that would change the call? If none exists, the conclusion is unfalsifiable and unfinished.
- Are **observation, inference, and judgment labeled** where the call carries money/safety/legal/production risk, or is an inference wearing a fact's costume?
- Where does the answer **dispatch** to a lead skill, and how is the result **verified in the running system** — not "function-tested / CI green"? Name the real artifact/endpoint/metric.
- Did the framework **change a decision**, or is it theater? Remove it: does the recommendation change?
- Did the answer invent any price, benchmark, statute, or model name, and is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը դատողության artifact-ների համար (issue tree, Bayesian update note, Fermi estimate, decision brief, assumption ledger, diagnosis)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։ Այն ստուգում է չորս-ոսպնյակ ողնաշարը․ արդյո՞ք պատասխանը Frame, Decompose, Interrogate և Dispatch արեց — գործիքները ոսպնյակների ներսում օգտագործված, ոչ որպես զարդ։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Պատասխանեց բառացի հարցին, երբեք չվերաձևակերպեց։** Output-ը լուծում է ձևակերպումը, ոչ իրական որոշումը. ոչ counterfactual, ոչ stop rule։ Վերաձևակերպիր դեպի որոշումը, որի առջև user-ն իրականում կանգնած է։
- **Solution նախքան framing (act-before-analyze)։** Fix-եր կամ option-ներ հայտնվում են, նախքան կա հայտարարված որոշում, driver tree կամ falsifier։ Կանգնիր և նախ շրջանակիր։
- **Issue tree-ն double-count է անում։** Երկու branch կիսում են metric, կամ leaf-երի total-ը գերազանցում է ամբողջը։ Միացրու/վերասահմանիր և վերա-roll-up արա։
- **False precision։** Մեկ exact թիվ՝ առանց range-ի, prior-ի կամ sensitivity-ի։ Վերականգնիր band-ն ու flip condition-ը։
- **Conclusion-ը մաքսանենգ մտցված likelihood-ի մեջ։** Bayesian posterior-ը թույլ evidence-ից թռչում է մոտ-certainty, որովհետև LR-ն ընտրվել է տեղավորվելու համար։ Վերածնիր odds = p/(1−p) և posterior odds = prior odds × LR՝ պաշտպանելի input-ներից։
- **Falsifier չկա։** Վստահ conclusion՝ առանց evidence-ի, որ կարող է շրջել, և առանց next test-ի։ Ավելացրու flip condition-ը։
- **Observation/inference/judgment-ը խառնված։** Inference կամ value call ներկայացված է որպես չափված fact, որտեղ money/safety/legal/production-ն է վտանգի տակ։ Relabel արա։
- **Dispatch-and-trust։** Արդյունքն ընդունված է, որովհետև specialist-ը «գործարկեց», sub-agent-ը success հաղորդեց, կամ function-ը «green test արեց» — առանց live artifact/endpoint/metric-ի դիտման։ Պահանջիր verification աշխատող համակարգում։
- **Framework theater։** Անվանված framework-ը զարդարում է պատասխանը, բայց ոչ մի որոշում չի փոխում. ոչ մի leaf թիվ, owner կամ evidence gap չունի։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ո՞րն է **իրական որոշումը** այստեղ, և ո՞րն է դրա counterfactual-ը։ Եթե պատասխանը միայն վերաշարադրում է բառացի հարցը, այն բաց է թողել Frame-ը։
- **Solution կա՞ սեղանին, նախքան խնդիրը քայքայվեց**։ Եթե option-ները նախորդում են driver tree-ին և falsifier-ին, դա act-before-analyze է։
- Tree-ի որևէ երկու branch **կիսու՞մ են metric**, և roll-up arithmetic-ը մնո՞ւմ է ամբողջի ներսում։ Ցույց տուր `A × B × C`-ն և no-double-count ստուգումը։
- Ամեն estimate-ի համար․ որտե՞ղ է **range-ը, prior-ը կամ sensitivity-ն**, և որ driver-ն է գերակշռում spread-ը։ Մեկ exact թիվը false precision է։
- Ամեն Bayesian քայլի համար․ ցույց տուր **odds = p/(1−p)** և **posterior odds = prior odds × LR**։ Ինչու՞ այդ LR-ը։ Posterior-ը թռչու՞մ է certainty մեկ data point-ի վրա (conclusion-ը մաքսանենգ մտցված likelihood-ի մեջ)։
- Ո՞րն է **falsifier-ը / flip condition-ը** — թիվը կամ evidence-ը, որ կփոխեր call-ը։ Եթե չկա, conclusion-ը unfalsifiable է և անավարտ։
- **Observation, inference և judgment label-վա՞ծ են**, որտեղ call-ը կրում է money/safety/legal/production ռիսկ, թե՞ inference-ը փաստի հագուստ է հագել։
- Որտե՞ղ է պատասխանը **dispatch** անում lead skill-ին, և ինչպե՞ս է արդյունքը **ստուգվում աշխատող համակարգում** — ոչ «function-tested / CI green»։ Անվանիր իրական artifact/endpoint/metric-ը։
- Framework-ը **փոխե՞ց որոշում**, թե theater է։ Հանիր այն․ recommendation-ը փոխվու՞մ է։
- Պատասխանը հորինե՞ց price, benchmark, statute կամ model name, և հայերենը equal-depth ու punctuation-clean է՞։
