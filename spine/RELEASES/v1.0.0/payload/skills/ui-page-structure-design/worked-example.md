# worked example

## English

### Prompt

Design a SaaS dashboard homepage for sales managers tracking AI-qualified leads, urgent follow-ups, and team performance. Include layout, states, mobile, and developer handoff.

### Answer

#### Page frame

Facts: the user asked for a dashboard homepage for sales managers. The lead objects are AI-qualified leads, urgent follow-ups, and team performance.

Assumptions: this is a B2B SaaS product; the manager's daily job is triage and coaching, not deep data exploration; "AI-qualified" means the system assigns a confidence or reason code, but exact model details are unknown and must not be invented.

User job: "I need to see what requires action today, trust why it is urgent, and help my team follow up."

Business job: increase timely follow-up and manager confidence without overstating AI accuracy.

Page promise: within the first screen, the manager understands priority, risk, and next action.

Primary action: review and assign urgent follow-ups.

#### Decision flow and layout

1. **Freshness and risk bar**
   - Purpose: prevent blind trust in stale or partial data.
   - Content: last sync time, connected sources, number of failed integrations, and a neutral confidence note.
   - Action: "View sync issues" as secondary.
   - Risk handled: managers do not act on stale CRM data without warning.

2. **Urgent follow-up queue**
   - Purpose: answer "what needs me now?"
   - Content: lead/company, urgency reason, owner, due time, AI confidence label, last touch, recommended next step.
   - Primary action: assign or approve follow-up.
   - Secondary actions: snooze, open lead, mark not urgent with reason.
   - Rule: show no more than the top actionable set above the fold; deep backlog belongs lower or behind filters.

3. **AI-qualified leads summary**
   - Purpose: answer "what pipeline did the system surface?"
   - Content: new qualified leads, qualification reasons, confidence distribution, source, and owner coverage.
   - Action: review new leads.
   - Risk handled: AI output is explainable enough for manager judgment without pretending certainty.

4. **Team performance coaching panel**
   - Purpose: answer "who needs help?"
   - Content: overdue follow-ups, response time, conversion movement, workload imbalance.
   - Action: open coaching view or reassign workload.
   - Rule: avoid shame dashboards; frame as coaching and operational support.

5. **Trend context**
   - Purpose: answer "is today unusual?"
   - Content: simple trend for urgent items, completion rate, and qualification volume.
   - Action: view report.
   - Rule: charts explain the queue; they do not replace the queue.

#### Component inventory

| Component | Purpose | Data needed | States | Notes |
|---|---|---|---|---|
| Data freshness bar | Show trust boundary | Sync timestamp, source status | normal, stale, failed, partial | Never hide stale data behind green styling |
| Follow-up queue | Daily triage | lead, owner, due time, reason, confidence, next step | loading, empty, error, partial, permission | Primary component above fold |
| Lead qualification cards | Explain new AI-surfaced leads | score band, reason codes, source, owner | loading, no new leads, low confidence | Use "confidence" not "truth" language |
| Team coaching panel | Manager action | owner, SLA, workload, outcomes | empty team, permission-limited | Avoid punitive wording |
| Trend strip | Context | aggregate counts over selected period | no history, stale, loading | Keep compact |

#### State matrix

| State | UI behavior | Recovery |
|---|---|---|
| First-run empty | Explain setup, show sample structure clearly labeled as sample | Connect CRM or import leads |
| No urgent follow-ups | Celebrate current clear queue and route to new qualified leads | Review new leads |
| Stale CRM sync | Keep data visible but show warning and timestamp | Open sync issue panel |
| AI service unavailable | Replace AI reason with "qualification unavailable" | Allow manual filters and retry |
| Permission-limited manager | Show team aggregate only, hide restricted lead details | Request access or switch team |
| Assignment success | Inline confirmation, updated owner, undo window | Undo reassignment |
| Assignment error | Preserve attempted change visually and explain failure | Retry or copy lead link |

#### Responsive behavior

Desktop: three-zone layout — freshness bar full width, urgent queue left wide column, summary and coaching panels right column, trend strip below.

Tablet: urgent queue remains first, right-column panels stack below it, filters move into a collapsible sheet.

Mobile: show freshness, then a card-based urgent queue. Each card includes lead, urgency reason, owner, due time, and one primary action. Team performance becomes a summary card with drill-in. Tables are not squeezed; they become cards with hidden secondary metadata under disclosure.

#### Accessibility notes

Use one `h1` for the dashboard title and ordered `h2` sections matching the visual order. Queue cards need accessible names that include lead, urgency, owner, and due time. Assignment controls must be keyboard reachable, with visible focus and undo announced through an appropriate status region. Confidence indicators cannot rely on color alone. Motion in queue updates should respect reduced-motion preferences.

#### Acceptance criteria

- A sales manager can identify the top urgent follow-up within five seconds from loaded state.
- The page shows data freshness and degraded-state warnings before action-heavy modules.
- Every urgent item displays a reason and a confidence label without claiming the AI is certainly correct.
- Mobile uses cards and disclosure instead of squeezed tables.
- Assignment success and failure states are designed with undo or recovery.
- Keyboard-only users can review, assign, and undo a follow-up without losing focus.

## Հայերեն

### Prompt

Նախագծիր SaaS dashboard-ի գլխավոր էջ sales manager-ների համար, ովքեր հետևում են AI-qualified lead-երին, urgent follow-up-ներին և թիմի performance-ին։ Ներառիր layout, վիճակներ, mobile և developer handoff։

### Պատասխան

#### Էջի շրջանակ

Փաստեր․ օգտագործողը խնդրել է dashboard-ի գլխավոր էջ sales manager-ների համար։ Գլխավոր object-ներն են AI-qualified lead-երը, urgent follow-up-ները և թիմի performance-ը։

Ենթադրություններ․ սա B2B SaaS product է․ manager-ի ամենօրյա գործը triage և coaching է, ոչ թե խոր data exploration․ «AI-qualified» նշանակում է, որ համակարգը տալիս է confidence կամ reason code, բայց ճշգրիտ model detail-ները անհայտ են և չպետք է հորինվեն։

Օգտագործողի գործը․ «Պետք է տեսնեմ, ինչն է այսօր action պահանջում, վստահեմ՝ ինչու է urgent, և օգնեմ թիմիս follow-up անել»։

Բիզնես գործը․ բարձրացնել ժամանակին follow-up-ը և manager-ի վստահությունը՝ առանց AI accuracy-ն չափազանցնելու։

Էջի խոստումը․ առաջին էկրանին manager-ը հասկանում է priority-ն, ռիսկը և հաջորդ action-ը։

Գլխավոր գործողությունը․ urgent follow-up-ների review և assignment։

#### Որոշման հոսք և layout

1. **Freshness և risk bar**
   - Նպատակ․ կանխել stale կամ partial data-ին կույր վստահելը։
   - Content․ last sync time, connected source-ներ, failed integration-ների քանակ և չեզոք confidence note։
   - Գործողություն․ «View sync issues» որպես secondary։
   - Կառավարվող ռիսկ․ manager-ները չեն գործում հին CRM data-ի վրա առանց զգուշացման։

2. **Urgent follow-up queue**
   - Նպատակ․ պատասխանել «ինչն է հիմա իմ կարիքն ունի» հարցին։
   - Content․ lead կամ company, urgency reason, owner, due time, AI confidence label, last touch, recommended next step։
   - Գլխավոր գործողություն․ assign կամ approve follow-up։
   - Երկրորդական գործողություններ․ snooze, open lead, mark not urgent՝ reason-ով։
   - Կանոն․ վերևում ցույց տալ միայն ամենագործարկելի top set-ը․ խորը backlog-ը թողնել ներքևում կամ filter-ների հետևում։

3. **AI-qualified leads summary**
   - Նպատակ․ պատասխանել «ինչ pipeline է system-ը վեր հանել» հարցին։
   - Content․ նոր qualified lead-եր, qualification reason-ներ, confidence distribution, source և owner coverage։
   - Գործողություն․ review new leads։
   - Կառավարվող ռիսկ․ AI output-ը բավարար բացատրելի է manager-ի դատողության համար՝ առանց certainty ձևացնելու։

4. **Team performance coaching panel**
   - Նպատակ․ պատասխանել «ում է պետք օգնություն» հարցին։
   - Content․ overdue follow-up-ներ, response time, conversion movement, workload imbalance։
   - Գործողություն․ բացել coaching view կամ reassign workload։
   - Կանոն․ խուսափել shame dashboard-ից․ ներկայացնել որպես coaching և operational support։

5. **Trend context**
   - Նպատակ․ պատասխանել «այսօրը սովորականի՞ց տարբեր է» հարցին։
   - Content․ urgent item-ների պարզ trend, completion rate և qualification volume։
   - Գործողություն․ view report։
   - Կանոն․ chart-երը բացատրում են queue-ն․ չեն փոխարինում queue-ին։

#### Component inventory

| Component | Նպատակ | Պահանջվող data | Վիճակներ | Նշումներ |
|---|---|---|---|---|
| Data freshness bar | Ցույց տալ trust boundary | Sync timestamp, source status | normal, stale, failed, partial | Stale data-ն երբեք մի թաքցրու կանաչ styling-ի հետևում |
| Follow-up queue | Ամենօրյա triage | lead, owner, due time, reason, confidence, next step | loading, empty, error, partial, permission | Գլխավոր component վերևում |
| Lead qualification cards | Բացատրել AI-ի բարձրացրած lead-երը | score band, reason code-ներ, source, owner | loading, no new leads, low confidence | Օգտագործիր «confidence», ոչ «truth» լեզու |
| Team coaching panel | Manager action | owner, SLA, workload, outcome-ներ | empty team, permission-limited | Խուսափիր պատժող wording-ից |
| Trend strip | Context | Aggregate count-եր ընտրված period-ում | no history, stale, loading | Պահիր compact |

#### Վիճակների մատրիցա

| Վիճակ | UI վարք | Վերականգնում |
|---|---|---|
| First-run empty | Բացատրել setup-ը, ցույց տալ sample structure՝ հստակ sample պիտակով | Connect CRM կամ import leads |
| No urgent follow-ups | Նշել, որ queue-ն մաքուր է, և տանել նոր qualified lead-երի կողմ | Review new leads |
| Stale CRM sync | Data-ն թողնել տեսանելի, բայց ցույց տալ warning և timestamp | Բացել sync issue panel |
| AI service unavailable | AI reason-ը փոխարինել «qualification unavailable» նշումով | Թույլ տալ manual filter-ներ և retry |
| Permission-limited manager | Ցույց տալ միայն team aggregate, թաքցնել restricted lead detail-ները | Request access կամ switch team |
| Assignment success | Inline confirmation, updated owner, undo window | Undo reassignment |
| Assignment error | Տեսանելի պահել փորձված change-ը և բացատրել failure-ը | Retry կամ copy lead link |

#### Responsive վարք

Desktop․ երեք գոտի՝ freshness bar ամբողջ լայնքով, urgent queue լայն ձախ column-ում, summary և coaching panel-ներ աջ column-ում, trend strip ներքևում։

Tablet․ urgent queue-ն մնում է առաջինը, աջ column-ի panel-ները stack են լինում դրա տակ, filter-ները տեղափոխվում են collapsible sheet։

Mobile․ ցույց տալ freshness-ը, հետո card-based urgent queue։ Յուրաքանչյուր card ներառում է lead, urgency reason, owner, due time և մեկ primary action։ Team performance-ը դառնում է summary card՝ drill-in-ով։ Table-ները չեն սեղմվում․ դառնում են card-եր՝ secondary metadata-ն disclosure-ի տակ։

#### Մատչելիության նշումներ

Օգտագործիր մեկ `h1` dashboard title-ի համար և ordered `h2` բաժիններ՝ visual հերթականությանը համապատասխան։ Queue card-երը պետք է ունենան accessible name, որը ներառում է lead-ը, urgency-ն, owner-ը և due time-ը։ Assignment control-ները պետք է հասանելի լինեն keyboard-ով, ունենան տեսանելի focus, իսկ undo-ն հայտարարվի համապատասխան status region-ի միջոցով։ Confidence indicator-ները չեն կարող հենվել միայն գույնի վրա։ Queue update-ների motion-ը պետք է հարգի reduced-motion նախընտրությունները։

#### Ընդունման չափանիշներ

- Sales manager-ը loaded state-ից կարող է գտնել top urgent follow-up-ը հինգ վայրկյանի ընթացքում։
- Էջը ցույց է տալիս data freshness և degraded-state warning action-heavy module-ներից առաջ։
- Յուրաքանչյուր urgent item ցույց է տալիս reason և confidence label՝ առանց պնդելու, որ AI-ը հաստատ ճիշտ է։
- Mobile-ը օգտագործում է card-եր և disclosure, ոչ squeezed table-ներ։
- Assignment success և failure վիճակները նախագծված են undo-ով կամ recovery-ով։
- Keyboard-only օգտագործողները կարող են review անել, assign անել և undo անել follow-up-ը առանց focus կորցնելու։
