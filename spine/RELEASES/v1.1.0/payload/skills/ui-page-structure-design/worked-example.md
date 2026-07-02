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

### Example B — role-gated views (server-enforced)

**Prompt.** A team "Settings → Billing & Members" page is seen by three roles from the same organization entity: **Owner/Admin** (manage billing, invite/remove members, change roles), **Member** (view members, edit own profile, no billing), **Billing-viewer** (see invoices, no member management). Design the page so each role gets the right view — safely.

**Answer.**

*The one rule that governs everything:* **role gating is an authorization decision enforced on the server, per request and per object — not a CSS/visibility trick.** The client renders what the server's role-scoped response contains; it never receives restricted data and hides it. "Hide the button" is not access control — a hidden button's endpoint is still callable, and DOM-hidden data is still in the payload.

*Per-role page shape (same route `/settings/billing`, three server-scoped responses):*

| Section | Owner/Admin | Member | Billing-viewer |
|---|---|---|---|
| Billing summary (plan, next charge) | full + **edit** | not returned | read-only |
| Invoices list / download | yes + manage | not returned | yes (download only) |
| Payment method | view + **edit** | not returned | not returned |
| Members list | full + **role/remove** | names/roles only | not returned |
| Invite member | yes | not returned | not returned |
| Own profile | edit | edit | edit |
| Danger zone (close account) | yes (confirm + typed name) | not returned | not returned |

*Design decisions:*
- The **server returns a capabilities object** for the current actor (`{canEditBilling, canManageMembers, canDownloadInvoice, …}`); the UI renders sections and actions from it. Restricted sections are **absent from the response**, not greyed out.
- Every mutating control maps to an endpoint that **re-checks the same permission server-side** on the specific object (this org, this member) — an admin of org A cannot manage org B by swapping an id.
- **Empty-because-restricted ≠ empty-because-no-data.** A Member does not see a greyed "Billing (no access)" that advertises what they lack; the section simply is not there. A Billing-viewer with zero invoices sees a true empty state ("No invoices yet") — a different thing.
- **Role change is itself gated and audited:** only an Owner can change roles; the last Owner cannot demote themselves (prevents lockout); the action is logged with actor + target + before/after.

*Mandatory states (per the states law):* loading (skeleton per section the role can see), empty (true no-data, distinct from no-access), error, permission-denied on a **direct URL to a restricted deep link** (a Member opening `/settings/billing/invoices/123` gets a server **403** → a clean "You don't have access; ask an Owner" screen, never a blank or a client redirect that already shipped the data), success/undo on role changes, stale (member list changed under you → refresh cue).

*Handoff / acceptance:*
- Verified in the running app **as each role** (not one admin session with CSS toggles): log in as Member, confirm billing data is **absent from the network response**, not merely hidden.
- Direct-link probe: each restricted deep link returns a server 403 for the wrong role.
- Last-Owner demotion is blocked with a clear reason.
- No role can trigger a mutating endpoint the UI hid — verified by calling it directly with that role's token → 403.

**Why this passes.** It treats role gating as **server-side authorization per object**, so restricted data never reaches the client — closing the IDOR/BOLA and function-level-authz failure this skill's red-team gate targets ("hide the button" / CSS-hidden data). It separates empty-because-restricted from empty-because-no-data, handles the direct-deep-link case with a real 403 (not a client redirect that already leaked), gates and audits role changes, prevents the last-Owner lockout, and — critically — its acceptance criteria verify **as each role in the running app against the network response**, not by eyeballing one admin session. That is the line between designed access control and decorative hiding.

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

### Օրինակ B — role-gated view-եր (server-enforced)

**Prompt.** Team-ի «Settings → Billing & Members» էջը տեսնում են երեք role նույն organization entity-ից՝ **Owner/Admin** (կառավարել billing, invite/remove member, փոխել role), **Member** (տեսնել member-ներին, խմբագրել սեփական profile, ոչ billing), **Billing-viewer** (տեսնել invoice-ները, ոչ member management)։ Նախագծիր էջը, որ ամեն role ստանա ճիշտ view-ն՝ անվտանգ։

**Պատասխան.**

*Ամեն ինչ կառավարող միակ կանոնը․* **role gating-ը authorization որոշում է, enforce-ված server-ի վրա՝ ամեն request-ի և ամեն object-ի համար — ոչ CSS/visibility հնարք։** Client-ը render է անում այն, ինչ server-ի role-scoped response-ը պարունակում է. այն երբեք restricted data չի ստանում ու թաքցնում։ «Թաքցրու button-ը» access control չէ — թաքցված button-ի endpoint-ը դեռ callable է, և DOM-hidden data-ն դեռ payload-ի մեջ է։

*Per-role էջի ձև (նույն route `/settings/billing`, երեք server-scoped response)․*

| Բաժին | Owner/Admin | Member | Billing-viewer |
|---|---|---|---|
| Billing summary (plan, next charge) | full + **edit** | not returned | read-only |
| Invoices list / download | yes + manage | not returned | yes (download only) |
| Payment method | view + **edit** | not returned | not returned |
| Members list | full + **role/remove** | միայն name/role | not returned |
| Invite member | yes | not returned | not returned |
| Սեփական profile | edit | edit | edit |
| Danger zone (close account) | yes (confirm + typed name) | not returned | not returned |

*Դիզայնի որոշումներ․*
- **Server-ը վերադարձնում է capabilities object** ընթացիկ actor-ի համար (`{canEditBilling, canManageMembers, canDownloadInvoice, …}`). UI-ն դրանից է render անում բաժիններն ու action-ները։ Restricted բաժինները **բացակայում են response-ից**, ոչ թե greyed out են։
- Ամեն mutating control map-վում է endpoint-ի, որ **նույն permission-ը վերստուգում է server-side**՝ կոնկրետ object-ի վրա (այս org, այս member) — org A-ի admin-ը չի կարող org B-ն կառավարել id փոխելով։
- **Empty-because-restricted ≠ empty-because-no-data.** Member-ը չի տեսնում greyed «Billing (no access)», որ գովազդում է իր չունեցածը. բաժինը պարզապես չկա։ Zero invoice-ով Billing-viewer-ը տեսնում է իրական empty state («No invoices yet») — ուրիշ բան։
- **Role փոփոխությունն ինքը gated ու audited է․** միայն Owner-ը կարող է role փոխել. վերջին Owner-ը չի կարող իրեն demote անել (կանխում է lockout). action-ը log-վում է actor + target + before/after-ով։

*Պարտադիր վիճակներ (states law-ով)․* loading (skeleton ամեն բաժնի, որ role-ը տեսնում է), empty (իրական no-data, տարբեր no-access-ից), error, permission-denied **restricted deep link-ի ուղիղ URL-ի** դեպքում (Member-ը, որ բացում է `/settings/billing/invoices/123`, ստանում է server **403** → մաքուր «You don't have access. ask an Owner» էկրան, երբեք blank կամ client redirect, որ արդեն data-ն ship արեց), success/undo role փոփոխություններին, stale (member list-ը փոխվեց քո տակ → refresh cue)։

*Handoff / acceptance․*
- Verify արված running app-ում **որպես ամեն role** (ոչ մեկ admin session CSS toggle-ով)․ մտիր որպես Member, հաստատիր, որ billing data-ն **բացակայում է network response-ից**, ոչ պարզապես hidden է։
- Direct-link probe․ ամեն restricted deep link վերադարձնում է server 403 սխալ role-ի համար։
- Last-Owner demotion-ը block-ված է հստակ պատճառով։
- Ոչ մի role չի կարող գործարկել mutating endpoint, որ UI-ն թաքցրեց — verify-ված այն ուղիղ կանչելով այդ role-ի token-ով → 403։

**Ինչու է անցնում gate-ը.** Այն role gating-ը վերաբերվում է որպես **server-side authorization ամեն object-ի համար**, ուստի restricted data-ն երբեք չի հասնում client — փակելով IDOR/BOLA-ն և function-level-authz failure-ը, որ այս skill-ի red-team gate-ը թիրախավորում է («թաքցրու button-ը» / CSS-hidden data)։ Այն առանձնացնում է empty-because-restricted-ը empty-because-no-data-ից, մշակում է direct-deep-link դեպքը իրական 403-ով (ոչ client redirect, որ արդեն leak արեց), gate ու audit է անում role փոփոխությունները, կանխում է last-Owner lockout-ը, և — կրիտիկ — իր acceptance criteria-ն verify է անում **որպես ամեն role running app-ում, network response-ի դեմ**, ոչ մեկ admin session աչքով։ Դա գիծն է designed access control-ի ու decorative hiding-ի միջև։
