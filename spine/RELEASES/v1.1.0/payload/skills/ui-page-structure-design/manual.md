# ui page structure design manual

## English

### The core model

A page is a decision machine. It has to answer the user's next question at the moment they are ready to ask it, while keeping the business goal and implementation constraints honest.

Use Jesse James Garrett's five planes from The Elements of User Experience as a ladder from abstract to concrete:

1. **Strategy** — who is the page for, what job are they trying to complete, and what outcome must the business enable?
2. **Scope** — what information, actions, proof, controls, and states are in or out?
3. **Structure** — what path does the user take through the page, navigation, progressive disclosure, and branching?
4. **Skeleton** — what layout, section order, component hierarchy, form grouping, CTA placement, and responsive behavior support the structure?
5. **Surface** — what visual hierarchy, language, spacing, affordances, motion, and system tokens make the skeleton understandable?

Do not start at surface unless the user only asks for a visual critique. Most page failures are strategy, scope, or structure failures wearing visual clothing.

### Decision rules

#### 1. Page job before page type

A dashboard, landing page, pricing page, admin panel, and onboarding screen can all fail the same way: they show what the maker wants to display instead of what the user must decide next. Name the job first.

Use this phrasing:

- User job: "I came here to..."
- Business job: "This page must help the business..."
- Page promise: "Within the first screen, the user should understand..."
- Primary action: "The one action this page should make easiest is..."

When not to use: if the user only asks for a tiny component tweak, keep the page job lightweight, but still infer the component's local job.

#### 2. Decision flow beats section inventory

Do not build pages from a list of sections. Build from a sequence of questions. For example, a pricing page usually answers: "Is this for me?" → "Which plan fits?" → "Can I trust it?" → "What happens if I choose wrong?" → "How do I start?"

A section is justified only if it answers a question, removes risk, enables action, or prevents a known failure mode. Decorative sections are debt.

#### 3. One primary action per decision stage

A view may contain multiple actions, but only one should be visually primary for the current stage. Competing primary CTAs create Hick's Law cost and make analytics harder to interpret.

Use secondary actions for learning, comparison, saving, or contacting. Make destructive or irreversible actions visually distinct and confirmation-gated.

#### 4. Progressive disclosure over hidden complexity

Progressive disclosure is not hiding important information. It is sequencing complexity so the user can make the next decision without carrying the whole system in working memory. Use it for advanced filters, secondary settings, optional fields, long comparison details, and expert diagnostics.

Do not use it when legal consent, price-impacting terms, destructive consequences, or required errors would be concealed.

#### 5. Mobile changes the information architecture

Mobile is not a breakpoint afterthought. On mobile, attention is narrower, input cost is higher, hover does not exist, tables collapse poorly, sticky elements can steal space, and long forms feel longer.

For every page, state the mobile plan: what becomes sticky, what collapses, what reorders, what becomes a stepper, what turns into cards, and what content is removed or delayed.

#### 6. State design is page design

The normal happy path is not the product. Design the first-run empty state, loading state, error state, validation state, permission-denied state, partial-data state, success state, and degraded integration state. A page with no state plan is not ready for development.

#### 7. Accessibility is structure, not polish

Accessibility is not an after-pass. It changes heading order, landmark roles, form labels, error association, keyboard order, focus management, target size, motion, contrast, and data visualization alternatives.

When uncertain, state intent instead of pretending exact compliance. Example: "Use semantic headings in visual order and test keyboard completion without a mouse." Avoid invented compliance claims such as "WCAG compliant" unless the work has been audited.

### Common failure modes and fixes

| Failure mode | Why it happens | Fix |
|---|---|---|
| Flat hierarchy | Every element has the same visual weight | Choose one primary user question per screen and make supporting content quieter |
| CTA soup | Product, sales, and support each add their own action | Assign one primary action per stage and demote the rest |
| Proof after the ask | The page asks for conversion before earning trust | Move proof or credibility cues before high-commitment actions |
| Desktop-only design | Teams review wide screens and forget input cost | Define mobile reordering, collapsed components, and touch targets |
| No edge states | Teams design the perfect data scenario | Add a state matrix before implementation |
| Form as database schema | Fields mirror internal objects instead of user effort | Group fields by user mental model and defer optional fields |
| Beautiful ambiguity | Visuals look polished but the user cannot tell what to do | Add signifiers, labels, examples, and clear next action |

### Handoff standard

A handoff-ready answer names:

- page goal and primary user;
- section order and purpose;
- component inventory;
- data inputs and dependencies;
- interaction rules;
- responsive behavior;
- state matrix;
- accessibility notes;
- analytics or evaluation events when relevant;
- acceptance criteria.

## Հայերեն

### Հիմնական մոդել

Էջը որոշման մեքենա է։ Այն պետք է պատասխանի օգտագործողի հաջորդ հարցին այն պահին, երբ նա պատրաստ է այդ հարցը տալ, միաժամանակ ազնիվ պահելով բիզնես նպատակը և իրականացման սահմանափակումները։

Օգտագործիր Jesse James Garrett-ի The Elements of User Experience-ի հինգ հարթությունները որպես սանդուղք՝ վերացականից դեպի կոնկրետ։

1. **Strategy** — ում համար է էջը, ինչ աշխատանք է նա փորձում ավարտել, և ինչ արդյունք պետք է հնարավորություն տա բիզնեսը։
2. **Scope** — որ տեղեկությունը, գործողությունը, ապացույցը, control-ը և վիճակը ներառվում կամ դուրս է մնում։
3. **Structure** — ինչ ճանապարհով է օգտագործողը անցնում էջի, navigation-ի, progressive disclosure-ի և branching-ի միջով։
4. **Skeleton** — որ layout-ը, բաժինների հերթականությունը, component hierarchy-ն, form grouping-ը, CTA-ի տեղադրումը և responsive վարքն են պահում կառուցվածքը։
5. **Surface** — որ visual hierarchy-ն, լեզուն, spacing-ը, affordance-ները, motion-ը և system token-ներն են skeleton-ը դարձնում հասկանալի։

Surface-ից մի սկսիր, եթե օգտագործողը միայն տեսողական critique չի խնդրել։ Էջերի մեծ ձախողումները strategy-ի, scope-ի կամ structure-ի ձախողումներ են, որոնք հագել են visual հագուստ։

### Որոշման կանոններ

#### 1. Էջի գործը էջի տեսակից առաջ

Dashboard-ը, landing page-ը, pricing page-ը, admin panel-ը և onboarding screen-ը կարող են նույն ձևով ձախողվել․ ցույց տալ ստեղծողի ուզածը, ոչ թե այն, ինչ օգտագործողը պետք է հաջորդը որոշի։ Նախ անվանիր գործը։

Օգտագործիր այս ձևակերպումը․

- Օգտագործողի գործը՝ «Ես եկել եմ այստեղ, որ...»։
- Բիզնես գործը՝ «Այս էջը պետք է օգնի բիզնեսին...»։
- Էջի խոստումը՝ «Առաջին էկրանին օգտագործողը պետք է հասկանա...»։
- Գլխավոր գործողությունը՝ «Այն մեկ գործողությունը, որը էջը պետք է դարձնի ամենահեշտը, ... է»։

Երբ չօգտագործել․ եթե օգտագործողը խնդրում է շատ փոքր component փոփոխություն, էջի գործը պահիր թեթև, բայց component-ի տեղային գործը միևնույն է եզրակացրու։

#### 2. Որոշման հոսքը ուժեղ է բաժինների ցուցակից

Էջեր մի կառուցիր բաժինների ցուցակից։ Կառուցիր հարցերի հերթականությունից։ Օրինակ՝ pricing page-ը հաճախ պատասխանում է․ «Սա ինձ համա՞ր է» → «Որ plan-ն է հարմար» → «Կարո՞ղ եմ վստահել» → «Ի՞նչ կլինի, եթե սխալ ընտրեմ» → «Ինչպե՞ս սկսեմ»։

Բաժինը արդարացված է միայն, եթե պատասխանում է հարցի, նվազեցնում է ռիսկ, թույլ է տալիս գործողություն կամ կանխում է հայտնի ձախողման ռեժիմ։ Դեկորատիվ բաժինը պարտք է։

#### 3. Մեկ գլխավոր գործողություն յուրաքանչյուր որոշման փուլում

View-ը կարող է ունենալ մի քանի գործողություն, բայց տվյալ փուլի համար միայն մեկը պետք է տեսողականորեն գլխավոր լինի։ Մրցող primary CTA-ները ստեղծում են Hick-ի օրենքի ծախս և դժվարացնում են analytics-ի մեկնաբանումը։

Երկրորդական գործողությունները օգտագործիր սովորելու, համեմատելու, պահելու կամ կապ հաստատելու համար։ Վնասակար կամ անդառնալի գործողությունները դարձրու տեսողականորեն տարբեր և confirmation-gated։

#### 4. Progressive disclosure, ոչ թե թաքցված բարդություն

Progressive disclosure-ը կարևոր տեղեկությունը թաքցնել չէ։ Դա բարդության հերթականացումն է, որպեսզի օգտագործողը հաջորդ որոշումը կայացնի առանց ամբողջ համակարգը working memory-ում պահելու։ Օգտագործիր այն advanced filter-ների, secondary setting-ների, optional field-երի, երկար comparison detail-ների և expert diagnostic-ների համար։

Մի օգտագործիր, երբ իրավական համաձայնությունը, գնի վրա ազդող պայմանը, վնասակար հետևանքը կամ պարտադիր error-ը կթաքցվի։

#### 5. Mobile-ը փոխում է information architecture-ը

Mobile-ը breakpoint-ից հետո եկող մանրուք չէ։ Mobile-ում ուշադրությունը նեղ է, input-ի արժեքը բարձր է, hover չկա, table-ները վատ են collapse լինում, sticky element-ները կարող են տարածք գողանալ, իսկ երկար form-երը ավելի երկար են զգացվում։

Յուրաքանչյուր էջի համար ասա mobile պլանը․ ինչն է դառնում sticky, ինչն է collapse լինում, ինչն է վերադասավորվում, ինչն է դառնում stepper, ինչն է դառնում card, և որ content-ն է հանվում կամ ուշացվում։

#### 6. Վիճակների դիզայնը էջի դիզայն է

Նորմալ happy path-ը product-ը չէ։ Նախագծիր first-run empty state-ը, loading state-ը, error state-ը, validation state-ը, permission-denied state-ը, partial-data state-ը, success state-ը և degraded integration state-ը։ Էջը առանց state plan-ի պատրաստ չէ development-ի։

#### 7. Մատչելիությունը կառուցվածք է, ոչ polish

Մատչելիությունը վերջում ավելացվող շերտ չէ։ Այն փոխում է heading order-ը, landmark role-երը, form label-ները, error association-ը, keyboard order-ը, focus management-ը, target size-ը, motion-ը, contrast-ը և data visualization-ի այլընտրանքները։

Երբ վստահ չես, նշիր intent-ը՝ ճշգրիտ compliance հորինելու փոխարեն։ Օրինակ՝ «Օգտագործել semantic heading-ներ visual հերթականությամբ և ստուգել keyboard completion-ը առանց mouse-ի»։ Խուսափիր հորինված compliance պնդումներից, ինչպիսիք են «WCAG compliant», եթե աշխատանքը audit չի անցել։

### Հաճախակի ձախողման ռեժիմներ և շտկումներ

| Ձախողման ռեժիմ | Ինչու է լինում | Շտկում |
|---|---|---|
| Հարթ hierarchy | Ամեն տարր ունի նույն visual քաշը | Ընտրիր մեկ գլխավոր օգտագործողի հարց յուրաքանչյուր էկրանին և աջակցող content-ը դարձու ավելի հանգիստ |
| CTA խառնաշփոթ | Product-ը, sales-ը և support-ը յուրաքանչյուրը ավելացնում են իրենց գործողությունը | Յուրաքանչյուր փուլին տուր մեկ գլխավոր գործողություն և մնացածը իջեցրու |
| Ապացույցը հարցումից հետո | Էջը conversion է խնդրում մինչև վստահություն վաստակելը | Ապացույցը կամ credibility cue-երը տեղափոխիր բարձր commitment գործողությունից առաջ |
| Միայն desktop դիզայն | Թիմերը դիտում են լայն էկրաններ և մոռանում input-ի արժեքը | Սահմանիր mobile վերադասավորում, collapsed component-ներ և touch target-ներ |
| Edge state-երի բացակայություն | Թիմերը դիզայն են անում perfect data scenario-ի համար | Իրականացումից առաջ ավելացրու state matrix |
| Form-ը որպես database schema | Field-երը կրկնում են ներքին object-ները, ոչ թե user effort-ը | Field-երը խմբավորիր ըստ օգտագործողի mental model-ի և optional field-երը հետաձգիր |
| Գեղեցիկ անորոշություն | Visual-ը polished է, բայց օգտագործողը չի հասկանում ինչ անել | Ավելացրու signifier-ներ, label-ներ, օրինակներ և հստակ հաջորդ գործողություն |

### Handoff չափանիշ

Handoff-ի պատրաստ պատասխանը անվանում է․

- էջի նպատակը և գլխավոր օգտագործողը․
- բաժինների հերթականությունը և նպատակը․
- component inventory-ն․
- data input-ները և dependency-ները․
- interaction rule-երը․
- responsive վարքը․
- state matrix-ը․
- մատչելիության նշումները․
- analytics կամ evaluation event-երը, երբ տեղին են․
- ընդունման չափանիշները։
