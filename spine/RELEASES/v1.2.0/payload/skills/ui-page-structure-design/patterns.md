# ui page structure patterns

## English

### 1. SaaS dashboard homepage

Use when the page's job is daily triage. The user arrives asking: "What changed, what needs me, and what should I do first?"

Recommended structure:

1. Status strip: current health, freshness timestamp, critical exceptions.
2. Priority queue: the few items requiring action now, sorted by urgency and confidence.
3. Work modules: grouped by job, not database entity.
4. Trend or performance context: enough to explain why the queue matters.
5. Team or ownership view: who owns follow-up and what is blocked.
6. Secondary exploration: filters, reports, exports, and settings.

When not to use: if the dashboard is mainly an executive reporting surface, lead with narrative metrics and variance explanation instead of triage.

Failure mode: dashboard becomes a wall of charts. Fix by asking which decisions happen daily and removing charts that do not change action.

### 2. Landing page

Use when the page's job is conversion under uncertainty. The user arrives asking: "Is this relevant, credible, worth my effort, and safe to try?"

Recommended structure:

1. Hero with specific promise, user fit, and one primary CTA.
2. Problem recognition or before-state, written in the user's language.
3. Mechanism: how the product creates the promised outcome.
4. Proof before commitment: examples, logos, quotes, metrics only if verified.
5. Use cases or role paths.
6. Objection handling: risk, setup effort, switching cost, security, support.
7. Final CTA with expectation-setting.

When not to use: if the user already has high intent and needs configuration or plan selection, use a pricing or signup flow pattern instead.

Failure mode: vague hero plus long form. Fix by moving the form after relevance and proof unless the form is the page's only job.

### 3. Pricing page

Use when the page's job is plan selection. The user arrives asking: "Which option fits me, what will it cost, and what happens if I choose wrong?"

Recommended structure:

1. Fit statement: who each plan is for.
2. Plan cards with comparable dimensions and one recommended default only if justified.
3. Feature comparison grouped by decision criteria, not internal feature taxonomy.
4. Trust and risk reducers: trial, cancellation, migration, support, security notes if verified.
5. Edge-case path: enterprise, high usage, procurement, or custom limits.
6. FAQ focused on objections that block selection.

When not to use: if price is highly custom and the real job is lead qualification, use a consultation flow with transparent expectation-setting.

Failure mode: feature grid becomes the page. Fix by leading with buyer fit and moving detailed comparison lower.

### 4. Onboarding flow

Use when the page's job is activation. The user arrives asking: "What must I do now, why, and how much is left?"

Recommended structure:

1. Welcome or orientation tied to the first value moment.
2. Short task sequence with visible progress.
3. Required setup fields only; defer nice-to-have fields.
4. Inline validation and recoverable errors.
5. Skip or later path when safe.
6. Success state that routes to the next meaningful action.

When not to use: if the user must complete legal, payment, or security setup before access, do not hide those requirements behind celebratory onboarding.

Failure mode: onboarding collects internal profile data before user value. Fix by moving optional enrichment after first success.

### 5. Admin or settings page

Use when the page's job is controlled change. The user arrives asking: "What can I change, what will it affect, and can I recover?"

Recommended structure:

1. Navigation by mental model: account, team, billing, security, integrations, notifications.
2. Current state summary before controls.
3. Grouped controls with descriptions and defaults.
4. Risk labels for irreversible, permission-changing, or billing-impacting actions.
5. Save, cancel, undo, audit, and confirmation behavior.
6. Permission-denied and read-only states.

When not to use: if the page is mostly operational monitoring, use dashboard or triage patterns.

Failure mode: settings mirror backend configuration. Fix by grouping controls by user intent and adding consequence text.

## Հայերեն

### 1. SaaS dashboard-ի գլխավոր էջ

Օգտագործիր, երբ էջի գործը ամենօրյա triage-ն է։ Օգտագործողը գալիս է հարցնելով․ «Ի՞նչ է փոխվել, ինչը իմ կարիքն ունի, և ինչից սկսեմ»։

Խորհուրդ տրվող կառուցվածք․

1. Status strip՝ ընթացիկ առողջություն, freshness timestamp, critical exception-ներ։
2. Priority queue՝ այն քիչ item-ները, որոնք հիմա action են պահանջում՝ դասավորված urgency-ով և confidence-ով։
3. Work module-ներ՝ խմբավորված ըստ աշխատանքի, ոչ database entity-ի։
4. Trend կամ performance context՝ այնքան, որ բացատրի queue-ի կարևորությունը։
5. Team կամ ownership view՝ ով է follow-up-ի տերը և ինչն է blocked։
6. Secondary exploration՝ filter-ներ, report-ներ, export-ներ և setting-ներ։

Երբ չօգտագործել․ եթե dashboard-ը հիմնականում executive reporting surface է, սկսիր narrative metric-ներից և variance explanation-ից, ոչ թե triage-ից։

Ձախողման ռեժիմ․ dashboard-ը դառնում է chart-երի պատ։ Շտկում․ հարցրու՝ որ որոշումներն են կայացվում ամեն օր, և հանիր այն chart-երը, որոնք action չեն փոխում։

### 2. Landing page

Օգտագործիր, երբ էջի գործը անորոշության պայմաններում conversion-ն է։ Օգտագործողը գալիս է հարցնելով․ «Սա արդյո՞ք ինձ վերաբերում է, վստահելի՞ է, արժե՞ իմ ջանքը, և անվտանգ է փորձել»։

Խորհուրդ տրվող կառուցվածք․

1. Hero՝ կոնկրետ խոստումով, user fit-ով և մեկ primary CTA-ով։
2. Problem recognition կամ before-state՝ գրված օգտագործողի լեզվով։
3. Mechanism՝ ինչպես product-ը ստեղծում է խոստացված արդյունքը։
4. Ապացույց commitment-ից առաջ՝ օրինակներ, logo-ներ, մեջբերումներ, metric-ներ միայն ստուգված լինելու դեպքում։
5. Use case-եր կամ role path-եր։
6. Objection handling՝ ռիսկ, setup effort, switching cost, security, support։
7. Վերջնական CTA՝ expectation-setting-ով։

Երբ չօգտագործել․ եթե օգտագործողը արդեն բարձր intent ունի և պետք է configuration կամ plan selection, օգտագործիր pricing կամ signup flow pattern։

Ձախողման ռեժիմ․ vague hero և երկար form վերևում։ Շտկում․ form-ը տեղափոխիր relevance-ից և proof-ից հետո, եթե form-ը էջի միակ գործը չէ։

### 3. Pricing page

Օգտագործիր, երբ էջի գործը plan selection-ն է։ Օգտագործողը գալիս է հարցնելով․ «Որ տարբերակն է ինձ հարմար, ինչ կարժենա, և ինչ կլինի, եթե սխալ ընտրեմ»։

Խորհուրդ տրվող կառուցվածք․

1. Fit statement՝ ում համար է յուրաքանչյուր plan-ը։
2. Plan card-եր՝ համեմատելի dimension-ներով և մեկ recommended default-ով միայն, եթե դա հիմնավորված է։
3. Feature comparison՝ խմբավորված ըստ որոշման չափանիշների, ոչ ներքին feature taxonomy-ի։
4. Trust և risk reducer-ներ՝ trial, cancellation, migration, support, security note-եր, եթե ստուգված են։
5. Edge-case path՝ enterprise, high usage, procurement կամ custom limit-ներ։
6. FAQ՝ կենտրոնացած selection-ը արգելակող objection-ների վրա։

Երբ չօգտագործել․ եթե գինը խիստ custom է, և իրական գործը lead qualification-ն է, օգտագործիր consultation flow՝ հստակ expectation-setting-ով։

Ձախողման ռեժիմ․ feature grid-ը դառնում է ամբողջ էջը։ Շտկում․ սկսիր buyer fit-ից և մանրամասն comparison-ը իջեցրու ներքև։

### 4. Onboarding flow

Օգտագործիր, երբ էջի գործը activation-ն է։ Օգտագործողը գալիս է հարցնելով․ «Ինչ պետք է անեմ հիմա, ինչու, և որքան է մնացել»։

Խորհուրդ տրվող կառուցվածք․

1. Welcome կամ orientation՝ կապված առաջին value moment-ի հետ։
2. Կարճ task sequence՝ տեսանելի progress-ով։
3. Միայն պարտադիր setup field-եր․ nice-to-have field-երը հետաձգիր։
4. Inline validation և recoverable error-ներ։
5. Skip կամ later path, երբ անվտանգ է։
6. Success state, որը տանում է հաջորդ իմաստալից գործողությանը։

Երբ չօգտագործել․ եթե օգտագործողը պետք է ավարտի legal, payment կամ security setup մինչև access ստանալը, այդ պահանջները մի թաքցրու celebratory onboarding-ի հետևում։

Ձախողման ռեժիմ․ onboarding-ը հավաքում է ներքին profile data մինչև user value-ն։ Շտկում․ optional enrichment-ը տեղափոխիր առաջին success-ից հետո։

### 5. Admin կամ settings page

Օգտագործիր, երբ էջի գործը controlled change-ն է։ Օգտագործողը գալիս է հարցնելով․ «Ինչ կարող եմ փոխել, ինչի վրա կազդի, և կարո՞ղ եմ վերականգնել»։

Խորհուրդ տրվող կառուցվածք․

1. Navigation ըստ mental model-ի՝ account, team, billing, security, integrations, notifications։
2. Current state summary control-ներից առաջ։
3. Խմբավորված control-ներ՝ նկարագրություններով և default-ներով։
4. Risk label-ներ irreversible, permission-changing կամ billing-impacting գործողությունների համար։
5. Save, cancel, undo, audit և confirmation վարք։
6. Permission-denied և read-only վիճակներ։

Երբ չօգտագործել․ եթե էջը հիմնականում operational monitoring է, օգտագործիր dashboard կամ triage pattern։

Ձախողման ռեժիմ․ settings-ը կրկնում է backend configuration-ը։ Շտկում․ control-ները խմբավորիր ըստ user intent-ի և ավելացրու consequence text։
