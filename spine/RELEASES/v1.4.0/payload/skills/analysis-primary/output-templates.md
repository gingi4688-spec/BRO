# Analysis — Primary Lens output templates

## English

Three reasoning artifacts shaped by the four-lens spine. Fill the real fields; every number traces to a formula or an observed input. Do not invent volatile facts. Each template ends with a dispatch line and a verify-in-the-running-system step, because framing is the setup for a hand-off, not the finish line.

### Template 1 — Issue tree (Frame + Decompose)

- **Real decision (Frame):** the actual call on the table (not the literal wording) + its counterfactual + stop rule
- **Root question:** the measurable thing being explained or chosen
- **Driver branches (3–5, MECE-enough):**
  - Branch 1 → leaves: ___ (known / estimated / unknown · owner · evidence gap)
  - Branch 2 → leaves: ___
  - Branch 3 → leaves: ___
- **Roll-up:** how leaves combine to the root (the math or logic, e.g. `A × B × C`) — and a check that no two branches share a metric (no double-count)
- **Biggest uncertain leaf:** the one to size or test next
- **Falsifier / next test:** the single evidence that would most change the picture
- **Dispatch:** which lead skill owns the answer once the tree points somewhere
- **Verify live:** the real artifact/metric to observe before acting on the tree

### Template 2 — Bayesian evidence ledger (Interrogate)

- **Decision it serves:** what the ranking is for
- **Hypotheses & priors (odds = p/(1−p)):**
  - H1: prior ___% → odds ___
  - H2: prior ___% → odds ___
  - H3: prior ___% → odds ___
- **Evidence & likelihood ratios:** each item, which hypothesis it favors, LR (strong/medium/weak or numeric), and *why that LR* (guard against smuggling the conclusion in)
- **Posterior ranking:** `posterior odds = prior odds × LR` → posterior % per hypothesis, ranked
- **Observation / inference / judgment:** label the key claims so an inference is not read as a fact
- **Next-most-informative evidence:** the one test that would most move the ranking
- **Dispatch:** who gathers that evidence; **Verify live:** the real signal to read, not a proxy

### Template 3 — Decision brief (Interrogate + Dispatch)

- **Decision & default (Frame):** the choice + the reversible default + stop rule
- **Options:** 2–4 real options, not strawmen
- **Expected value / threshold:** `EV = p(success) × payoff − p(loss) × loss` (or a decision tree for staged choices), arithmetic shown
- **Dominant uncertain driver:** the input the EV is most sensitive to
- **Bias defense applied (named):** base rate / steelman / missing failures / sunk-cost reset — and what it changed
- **Steelman of the rejected option:** the strongest honest case against the recommendation
- **Flip condition:** the number/base rate/evidence that would change the call (re-run the EV at that value)
- **Recommendation:** the choice, contingent on the flip condition holding
- **Dispatch & verify live:** the lead skill that executes + the real artifact/metric that confirms it worked (not "function-tested")

### Template 4 — Base-rate library (the outside view)

Ground the inside-view story in a reference class before trusting a causal narrative.

| Question | Reference class (comparable population) | Base rate | Source + date | Adjust for this case (and why) |
|---|---|---|---|---|

- **Rule:** start from the base rate, then adjust for case-specific evidence — never the reverse. A confident "this time is different" must earn the deviation.
- **Watch:** survivorship (the failures are not in your sample), small-N reference classes, and a base rate quietly asserted from memory — mark it verify-before-use or fetch it.

## Հայերեն

Երեք դատողության artifact՝ ձևավորված չորս-ոսպնյակ ողնաշարով։ Լրացրու իրական field-երը. ամեն թիվ հետ է գնում formula-ի կամ observed input-ի։ Մի՛ հորինիր volatile fact։ Ամեն template ավարտվում է dispatch տողով և verify-in-the-running-system քայլով, որովհետև framing-ը hand-off-ի setup-ն է, ոչ finish line-ը։

### Template 1 — Issue tree (Frame + Decompose)

- **Իրական որոշում (Frame).** սեղանի իրական call-ը (ոչ բառացի ձևակերպումը) + դրա counterfactual-ը + stop rule-ը
- **Root question.** չափելի բանը, որ բացատրվում կամ ընտրվում է
- **Driver branch-եր (3–5, MECE-ին մոտ).**
  - Branch 1 → leaf-եր․ ___ (known / estimated / unknown · owner · evidence gap)
  - Branch 2 → leaf-եր․ ___
  - Branch 3 → leaf-եր․ ___
- **Roll-up.** ինչպես են leaf-երը միանում root-ին (math-ը կամ logic-ը, օր.՝ `A × B × C`) — և ստուգում, որ ոչ մի երկու branch չի կիսում metric (ոչ double-count)
- **Ամենամեծ uncertain leaf.** այն, որ պետք է size կամ test անել հաջորդը
- **Falsifier / next test.** այն մեկ evidence-ը, որ ամենաշատը կփոխի պատկերը
- **Dispatch.** որ lead skill-ն է տիրում պատասխանին, երբ tree-ն ուղղություն ցույց տա
- **Verify live.** իրական artifact/metric-ը, որ պետք է դիտել նախքան tree-ի վրա գործելը

### Template 2 — Bayesian evidence ledger (Interrogate)

- **Որ որոշմանն է ծառայում.** ինչի համար է ranking-ը
- **Hypothesis-ներ և prior-ներ (odds = p/(1−p)).**
  - H1․ prior ___% → odds ___
  - H2․ prior ___% → odds ___
  - H3․ prior ___% → odds ___
- **Evidence և likelihood ratio-ներ.** ամեն item, որ hypothesis-ին է favor անում, LR (strong/medium/weak կամ numeric) և *ինչու այդ LR-ը* (պաշտպանվիր conclusion-ը մաքսանենգ մտցնելուց)
- **Posterior ranking.** `posterior odds = prior odds × LR` → posterior % ամեն hypothesis-ի, դասավորված
- **Observation / inference / judgment.** label արա հիմնական պնդումները, որ inference-ը fact չկարդացվի
- **Next-most-informative evidence.** այն մեկ test-ը, որ ամենաշատը կշարժի ranking-ը
- **Dispatch.** ով է հավաքում այդ evidence-ը. **Verify live.** իրական signal-ը, որ պետք է կարդալ, ոչ proxy

### Template 3 — Decision brief (Interrogate + Dispatch)

- **Որոշում և default (Frame).** ընտրությունը + հետշրջելի default-ը + stop rule-ը
- **Option-ներ.** 2–4 իրական option, ոչ strawman
- **Expected value / threshold.** `EV = p(success) × payoff − p(loss) × loss` (կամ decision tree staged choice-ի համար), arithmetic-ը ցույց տրված
- **Dominant uncertain driver.** input-ը, որին EV-ն ամենազգայունն է
- **Կիրառված bias defense (անվանված).** base rate / steelman / missing failures / sunk-cost reset — և ինչ փոխեց
- **Մերժված option-ի steelman.** ամենաուժեղ ազնիվ case-ը recommendation-ի դեմ
- **Flip condition.** թիվը/base rate-ը/evidence-ը, որ կփոխեր call-ը (վերագործարկիր EV-ն այդ արժեքով)
- **Recommendation.** ընտրությունը՝ կախված flip condition-ի պահելուց
- **Dispatch & verify live.** lead skill-ը, որ կատարում է + իրական artifact/metric-ը, որ հաստատում է, որ աշխատեց (ոչ «function-tested»)

### Template 4 — Base-rate library (outside view-ը)

Խարսխի՛ր inside-view-ի պատմությունը reference class-ում՝ նախքան causal narrative-ին վստահելը։

| Հարց | Reference class (համեմատելի population) | Base rate | Source + date | Ճշգրտում այս case-ի համար (և ինչու) |
|---|---|---|---|---|

- **Կանոն․** սկսի՛ր base rate-ից, հետո ճշգրտիր case-specific evidence-ով — երբեք հակառակը։ Վստահ «այս անգամ ուրիշ է»-ն պիտի վաստակի շեղումը։
- **Ուշադրություն․** survivorship (failure-ները քո sample-ում չեն), small-N reference class-եր, և base rate՝ լուռ պնդված հիշողությունից — նշիր verify-before-use կամ fetch արա։
