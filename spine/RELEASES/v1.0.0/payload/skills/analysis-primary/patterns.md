# Analysis — Primary Lens patterns

## English

These are canonical moves of the four-lens spine (Frame → Decompose → Interrogate → Dispatch). Each is a mechanism, not a label; choose the move that changes the next decision. The first and last patterns bracket every engagement — Frame opens it, Dispatch-and-verify closes it — and the middle four are the tools used inside Decompose and Interrogate.

### 1. Decision reframe (Frame)

- **Trigger:** The question is vague, loaded, or aimed at a decision the user does not actually face — or a solution is already being debated before the problem is stated.
- **Mechanism:** Write the real decision as a one-line statement, its counterfactual (what happens if we do nothing), and the stop rule (when is the analysis "enough"). Confirm the reframe with the user before proceeding. If the original wording was malformed, answer the corrected question, not the literal one.
- **Do not use when:** The request is a genuine one-step factual lookup with no decision behind it — answer it directly.
- **Failure repair:** If a solution is already on the table with no stated decision, stop and back up to the frame; act-before-analyze means the frame was skipped.

### 2. Two-level issue tree (Decompose)

- **Trigger:** A broad "why / what's going on" question is swallowing the decision.
- **Mechanism:** Write the root decision, split into 3–5 MECE-enough driver branches, then give each branch measurable leaves. Roll the leaves up by math or logic; mark each leaf known, estimated, or unknown, and give it an owner and an evidence gap.
- **Do not use when:** The user needs a single factual answer, not a structure — a tree is overkill.
- **Failure repair:** If two branches share the same metric, merge or redefine them so the roll-up cannot double-count; if the leaf totals exceed the whole, the tree is not MECE.

### 3. Bayesian evidence ledger (Interrogate)

- **Trigger:** Several explanations are plausible and the team is arguing by vote or by vividness.
- **Mechanism:** Give each hypothesis a base-rate prior (odds = p/(1−p)), then update with explicit likelihood ratios — strong/medium/weak or numeric — to a posterior ranking (posterior odds = prior odds × LR). Name the single next piece of evidence that would most change the ranking.
- **Do not use when:** The prior is genuinely unknowable and the question is purely normative — a probability theater adds false rigor.
- **Failure repair:** If the posterior leaps to near-certainty from weak evidence, the conclusion was smuggled into the likelihood; re-derive the LR from defensible inputs.

### 4. Fermi driver sizing (Decompose + Interrogate)

- **Trigger:** A number is unknown but the decision cannot wait for exact data.
- **Mechanism:** Break the quantity into 3–6 multiplicative drivers, estimate low/base/high for each, multiply through, then sensitivity-check the driver that dominates the spread. Add one outside-base-rate sanity check.
- **Do not use when:** Exact internal data is available now — use the data, not an estimate.
- **Failure repair:** If the output is one precise number with no range, it is false precision; restore the band and name the assumption that would flip the choice.

### 5. Steelman & falsifier (Interrogate)

- **Trigger:** The analysis is leaning one way and only confirming evidence has been weighed.
- **Mechanism:** Build the strongest honest version of the opposite conclusion (not a strawman), weigh it, and then state the falsifier of your own call: "I would change this if X", where X is measurable and reachable. Separate observation, inference, and judgment so the steelman attacks the real claim, not a value dressed as a fact.
- **Do not use when:** Never skip it on a high-stakes call — but on a trivial, reversible decision a full steelman can be a one-line note.
- **Failure repair:** If the conclusion has no falsifier, it is unfalsifiable and unfinished; add the flip condition and the next test before recommending.

### 6. Dispatch-and-verify (Dispatch)

- **Trigger:** The problem is framed and decomposed, and a specialist skill (or sub-agent) owns the domain answer.
- **Mechanism:** Hand the lead skill the decision frame, the drivers, and the acceptance criteria; let it fill the domain content. When the result comes back, verify it in the running system — observe the real artifact, endpoint, or metric — before the decision closes. Fan out to parallel agents only when the work is too big for one context or genuinely independent.
- **Do not use when:** This lens itself owns the deliverable (the reasoning *is* the artifact) — then there is nothing to dispatch.
- **Failure repair:** If a result was accepted because "the agent did it" or "function-tested green", that is dispatch-and-trust; reopen it and observe the live behavior before calling it done.

## Հայերեն

Սրանք չորս-ոսպնյակ ողնաշարի (Frame → Decompose → Interrogate → Dispatch) canonical move-երն են։ Ամեն մեկը mechanism է, ոչ label. ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը։ Առաջին և վերջին pattern-ները շրջանակում են ամեն engagement — Frame-ը բացում է, Dispatch-and-verify-ը փակում — իսկ միջին չորսը Decompose-ի և Interrogate-ի ներսում օգտագործվող գործիքներն են։

### 1. Decision reframe (Frame)

- **Երբ է պետք․** Հարցը vague է, loaded, կամ ուղղված որոշման, որի առջև user-ը իրականում չի կանգնած — կամ solution-ն արդեն քննարկվում է, նախքան խնդիրը ձևակերպվել է։
- **Մեխանիզմը․** Գրիր իրական որոշումը մեկ տողով, դրա counterfactual-ը (ինչ կլինի, եթե ոչինչ չանենք) և stop rule-ը (երբ է վերլուծությունը «բավարար»)։ Հաստատիր reframe-ը user-ի հետ նախքան շարունակելը։ Եթե սկզբնական ձևակերպումը malformed էր, պատասխանիր ուղղված հարցին, ոչ բառացի։
- **Երբ չօգտագործել․** Երբ հարցումը իրական մեկ քայլ factual lookup է՝ առանց հետևում որոշման — պատասխանիր ուղիղ։
- **Ուղղում․** Եթե solution-ն արդեն սեղանին է՝ առանց հայտարարված որոշման, կանգնիր և հետ գնա frame-ի. act-before-analyze-ը նշանակում է՝ frame-ը բաց է թողնվել։

### 2. Երկմակարդակ issue tree (Decompose)

- **Երբ է պետք․** Լայն «ինչու՞ / ինչ է կատարվում» հարցը կուլ է տալիս որոշումը։
- **Մեխանիզմը․** Գրիր root decision-ը, բաժանիր 3–5 MECE-ին մոտ driver branch-ի, հետո ամեն branch-ին տուր չափելի leaf-եր։ Leaf-երը roll up արա math-ով կամ logic-ով. ամեն leaf նշիր known, estimated, թե unknown, և տուր owner ու evidence gap։
- **Երբ չօգտագործել․** Երբ user-ին պետք է մեկ factual պատասխան, ոչ կառուցվածք — tree-ն ավելորդ է։
- **Ուղղում․** Եթե երկու branch կիսում են նույն metric-ը, միացրու կամ վերասահմանիր, որ roll-up-ը double-count չանի. եթե leaf-երի total-ը գերազանցում է ամբողջը, tree-ն MECE չէ։

### 3. Bayesian evidence ledger (Interrogate)

- **Երբ է պետք․** Մի քանի explanation plausible է, և թիմը վիճում է քվեով կամ վառությամբ։
- **Մեխանիզմը․** Ամեն hypothesis-ի տուր base-rate prior (odds = p/(1−p)), հետո update արա բացահայտ likelihood ratio-ով՝ strong/medium/weak կամ numeric, մինչև posterior ranking (posterior odds = prior odds × LR)։ Անվանիր այն մեկ next evidence-ը, որ ամենաշատը կփոխի ranking-ը։
- **Երբ չօգտագործել․** Երբ prior-ը իսկապես անհնար է իմանալ, և հարցը purely normative է — probability theater-ը false rigor է ավելացնում։
- **Ուղղում․** Եթե posterior-ը թույլ evidence-ից թռչում է մոտ-certainty, conclusion-ը մաքսանենգ մտցվել է likelihood-ի մեջ. վերածնիր LR-ը պաշտպանելի input-ներից։

### 4. Fermi driver sizing (Decompose + Interrogate)

- **Երբ է պետք․** Թիվն անհայտ է, բայց որոշումը չի կարող սպասել exact data-ի։
- **Մեխանիզմը․** Քանակը բաժանիր 3–6 multiplicative driver-ի, ամեն մեկին estimate արա low/base/high, multiply արա, հետո sensitivity-check արա այն driver-ը, որ գերակշռում է spread-ը։ Ավելացրու մեկ outside-base-rate sanity check։
- **Երբ չօգտագործել․** Երբ exact internal data-ն հիմա հասանելի է — օգտագործիր data-ն, ոչ estimate-ը։
- **Ուղղում․** Եթե output-ը մեկ ճշգրիտ թիվ է՝ առանց range-ի, դա false precision է. վերականգնիր band-ը և անվանիր այն assumption-ը, որ կշրջի ընտրությունը։

### 5. Steelman & falsifier (Interrogate)

- **Երբ է պետք․** Վերլուծությունը թեքվում է մեկ կողմ, և կշռվել է միայն հաստատող evidence-ը։
- **Մեխանիզմը․** Կառուցիր հակառակ conclusion-ի ամենաուժեղ ազնիվ տարբերակը (ոչ strawman), կշռիր այն, հետո ասա քո call-ի falsifier-ը․ «կփոխեի սա, եթե X», որտեղ X-ը չափելի և հասանելի է։ Բաժանիր observation, inference և judgment, որ steelman-ը հարձակվի իրական պնդման վրա, ոչ fact-ի հագնված value-ի։
- **Երբ չօգտագործել․** Երբեք մի՛ բաց թող high-stakes call-ի վրա — բայց չնչին, հետշրջելի որոշման դեպքում լրիվ steelman-ը կարող է մեկ տողանոց note լինել։
- **Ուղղում․** Եթե conclusion-ը falsifier չունի, այն unfalsifiable է և անավարտ. ավելացրու flip condition-ը և next test-ը նախքան recommend անելը։

### 6. Dispatch-and-verify (Dispatch)

- **Երբ է պետք․** Խնդիրը շրջանակված է և քայքայված, և specialist skill-ը (կամ sub-agent-ը) տիրում է ոլորտի պատասխանին։
- **Մեխանիզմը․** Lead skill-ին հանձնիր որոշման շրջանակը, driver-ները և acceptance criteria-ն. թող այն լրացնի ոլորտի բովանդակությունը։ Երբ արդյունքը վերադառնում է, ստուգիր այն աշխատող համակարգում — դիտիր իրական artifact-ը, endpoint-ը կամ metric-ը — նախքան որոշումը փակելը։ Fan out արա զուգահեռ agent-ների միայն, երբ աշխատանքը մեկ համատեքստի համար շատ մեծ է կամ իսկապես անկախ։
- **Երբ չօգտագործել․** Երբ այս ոսպնյակն ինքն է տիրում deliverable-ին (դատողությունն *ինքն* է artifact-ը) — ապա dispatch անելու բան չկա։
- **Ուղղում․** Եթե արդյունքն ընդունվեց, որովհետև «agent-ն արեց» կամ «function-tested green», դա dispatch-and-trust է. վերաբացիր և դիտիր live վարքը նախքան done ասելը։
