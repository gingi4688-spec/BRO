# People and Organizational Leadership worked examples

## English

### Example A — Org-design memo (decision rights)

**Prompt.** Our product team ships slowly. Every change — even a copy tweak or a config flag — needs VP sign-off, and the managers each have eleven reports. Build a senior-quality org-design memo.

**Senior answer.** The symptom is slow shipping; the mechanism is a decision-rights bottleneck plus a span problem, not a "lazy team."

*Decision-rights map.* I mapped the recurring decisions and found low-risk copy and config changes waiting ~5 days for VP approval — an approval that removes no real risk. Redesign by risk:
- **PM owns** copy and config changes under guardrails (no pricing, no customer-visible policy, no regulated claims).
- **Legal is consulted only** when a claim is regulated (health, finance, safety wording).
- **VP approves** pricing and customer-visible policy — the decisions where the blast radius justifies the approval.

This moves ~80% of the stalled changes out of the VP queue without removing the control where it matters.

*Span check.* Each manager has 11 reports, mostly junior. At that span the coaching bandwidth per report is structurally thin, so growth stalls and the manager becomes the bottleneck for review. Fix the structure, not the manager's effort: introduce two tech leads to hold the technical-review and mentoring load, narrowing the effective coaching span to ~5–6, or split into two teams if the work decomposes cleanly.

*Feedback example (for the slow-handoff pattern surfaced).* "In the last two launches, release notes arrived after QA signoff, which caused a full retest cycle each time. For the next launch, draft the notes by code freeze and confirm the owner in planning." (Observed behavior → impact → expectation → next experiment.)

*Assumptions / unknowns:* I assumed the VP approval is a true bottleneck, not a symptom of low trust from past incidents — confirm by checking whether changes that did ship caused problems. If trust is the real issue, the rights map alone will not hold.

**Why this passes.** It names the actual mechanisms — a decision-rights bottleneck and an oversized span — instead of calling the team slow, and it fixes a *right* (who approves copy/config), not a box. The rights redesign is sorted by risk, so the VP keeps approval exactly where blast radius justifies it (pricing, customer-visible policy) and loses it where it added delay but no risk. The span fix is structural (tech leads narrowing the coaching span to ~5–6), not "spend more 1:1 time," which is the failure mode this domain catches. The feedback is observed behavior → impact → expectation → next experiment, not a label. And it labels the trust assumption it could not verify, so a second leader can reject the memo if the real cause is trust, not rights.

### Example B — Hiring process (signal matrix)

**Prompt.** We're hiring a senior backend engineer. Last loop, five people interviewed the candidate, everyone "got a good vibe," we hired, and it didn't work out. Design the hiring loop so this doesn't repeat.

**Senior answer.** The last loop failed because five interviewers measured one correlated thing — likeability — so five "yes" votes were one signal counted five times, with no coverage of the competencies the role actually needs.

*Define the role first.* Senior backend engineer, this team: the competencies that predict success are (1) system design under real constraints, (2) code quality and debugging depth, (3) operational ownership (on-call, incident judgment), (4) collaboration and mentoring, (5) communication of tradeoffs. Level bar: owns a service end-to-end and raises the bar for others.

*Signal matrix — one competency per interview, with anchors.*

| Interview | Competency (owner) | Structured question | Anchor: 1 / 3 / 5 | Threshold |
|---|---|---|---|---|
| 1 | System design | "Design a rate limiter for our API." | 1: one box; 3: handles scale; 5: names tradeoffs, failure modes, and the metric to watch | 4 |
| 2 | Code/debugging | Live debugging of a seeded bug | 1: guesses; 3: bisects methodically; 5: forms and tests hypotheses, explains the fix's blast radius | 4 |
| 3 | Operational ownership | "Walk me through an incident you owned." | 1: blames others; 3: describes the fix; 5: blameless, names the control they added | 3 |
| 4 | Collaboration/mentoring | Behavioral, structured | 1: solo hero; 3: works with others; 5: concrete example of leveling up a teammate | 3 |
| 5 | Communication | Present a past tradeoff decision | 1: jargon, no audience; 3: clear; 5: tailors to audience, states what they'd change | 3 |

*Debrief discipline.* Each interviewer submits written evidence and a score against the anchors **before** the debrief; the debrief starts from the evidence, not from the first opinion in the room. Guard against halo (one strong answer inflating all scores) and horns. A "no" on a must-have competency (system design, ownership) is not outvoted by "good vibe."

*Assumptions / unknowns:* I assumed on-call ownership is in-scope for this role — if it isn't, drop interview 3 and reweight. Compensation and the offer number are out of scope here and coordinated with finance/HR against the leveling band.

**Why this passes.** It diagnoses the actual failure of the last loop — five interviewers collapsing into one correlated "likeability" signal — and fixes it by assigning one distinct competency per interview with scoring anchors, so five interviews produce five signals instead of one counted five times. The anchors make "good" checkable (a 5 names tradeoffs and failure modes, not just "smart"), and the pre-debrief written-evidence rule is the specific guard against the halo effect and the loudest-voice debrief that this domain flags. It defines the role's competencies before mapping signals, refuses to let "culture fit" stand in for a competency, and explicitly routes the comp number to finance/HR rather than inventing it.

### Example C — Underperformance diagnosis (with HR/legal routing)

**Prompt.** One of my engineers, Davit, keeps missing deadlines and my other engineers are frustrated. I want to put him on a PIP and probably let him go. Write the plan.

**Senior answer.** Two things first. (1) "Probably let him go" is a termination, and termination routes to **HR and legal before any step** — I won't design the exit, because it carries jurisdiction-specific legal exposure (notice, documentation, protected-class risk, final-pay rules) that HR/legal must own. (2) A PIP written before the cause is diagnosed is often both ineffective and unfair. So before any plan, diagnose the cause:

- **Clarity gap?** Does Davit actually know the deadline bar and the priority order, in writing? Many "missed deadlines" are unstated or contradictory expectations. Check the last three commitments — were they explicit, with dates and scope?
- **Capability gap?** Is the work above his current level, or is he missing a specific skill? That points to coaching or a role change, not exit.
- **Resourcing / role-fit gap?** Is he blocked on dependencies, under-tooled, or in the wrong role? Missing deadlines because of upstream blockers is not underperformance.
- **Motivation gap?** Has his energy dropped — autonomy removed, purpose unclear, a fairness issue (e.g. comp or recognition)? That is a 1:1 conversation, not a PIP.
- **Manager gap?** Has he gotten specific, timely feedback that he is missing the bar, or is the first formal signal the PIP itself? If feedback never landed, the manager closes that gap first.

*What I'll build now (the part this skill owns):* a documented performance-evidence log — the last several commitments with their dates, what was agreed, what happened, and the impact — and, once the cause is named and if a formal plan is warranted, a clear, fair improvement plan with a specific bar, the support offered, and a timeline. That evidence and plan are what you take to HR/legal; **they own the PIP-vs-exit decision and the process**, not me.

*On the team frustration:* address it as its own issue — the others are absorbing slipped work. That is a real cost, but it is managed by re-clarifying ownership and deadlines, not by rushing an unfair exit that exposes the company.

**Why this passes.** It hits the hard gate first: "probably let him go" is a termination, so it routes to HR/legal before any step instead of writing the exit, and it refuses to assert employment law. It then does the move this domain requires before any PIP — diagnose the cause across clarity / capability / resourcing / motivation / manager, with a concrete check for each — so the plan is built on evidence, not a label, and an unfair action is prevented. It builds only the part the skill legitimately owns (the evidence log and a fair improvement-plan structure) and hands the exit decision to HR/legal. It also separates the team-frustration issue rather than letting it stampede an unsafe firing.

## Հայերեն

### Օրինակ A — Org-design memo (decision rights)

**Prompt.** Մեր product team-ը դանդաղ է ship անում։ Ամեն փոփոխություն — նույնիսկ copy tweak կամ config flag — VP sign-off է պահանջում, և manager-ներից ամեն մեկն ունի տասնմեկ report։ Կառուցիր senior-quality org-design memo։

**Senior պատասխան.** Symptom-ը դանդաղ ship-ն է. mechanism-ը decision-rights bottleneck plus span խնդիր է, ոչ «ծույլ թիմ»։

*Decision-rights map.* Քարտեզագրեցի recurring decision-ները և գտա, որ low-risk copy և config change-երը ~5 օր սպասում են VP approval-ի — approval, որ իրական risk չի հանում։ Redesign ըստ risk-ի․
- **PM-ը owns** copy և config change-երը guardrail-ներով (ոչ pricing, ոչ customer-visible policy, ոչ regulated claim)։
- **Legal-ը consulted է միայն**, երբ claim-ը regulated է (health, finance, safety-ի ձևակերպում)։
- **VP-ն approve է անում** pricing-ը և customer-visible policy-ն — այն decision-ները, որտեղ blast radius-ը արդարացնում է approval-ը։

Սա ~80% stalled change-երը հանում է VP queue-ից՝ առանց control-ը հանելու, որտեղ կարևոր է։

*Span check.* Ամեն manager ունի 11 report, հիմնականում junior։ Այդ span-ին coaching-ի bandwidth-ը report-ի հաշվով կառուցվածքով բարակ է, ուստի growth-ը կանգ է առնում, և manager-ը դառնում է review-ի bottleneck։ Ուղղիր structure-ը, ոչ manager-ի ջանքը․ ներմուծիր երկու tech lead՝ technical-review-ի և mentoring-ի load-ը պահելու, նեղացնելով effective coaching span-ը ~5–6-ի, կամ split արա երկու թիմի, եթե աշխատանքը մաքուր decompose է լինում։

*Feedback example (բացահայտված slow-handoff pattern-ի համար).* «Վերջին երկու launch-ում release note-երը եկան QA signoff-ից հետո, ինչը ամեն անգամ full retest cycle առաջացրեց։ Հաջորդ launch-ին draft արա note-երը code freeze-ի պահին և planning-ում հաստատիր owner-ը»։ (Observed behavior → impact → expectation → next experiment։)

*Assumption-ներ / unknown-ներ․* Ենթադրեցի, որ VP approval-ը իրական bottleneck է, ոչ թե անցյալ incident-ներից ցածր trust-ի symptom — հաստատիր՝ ստուգելով, արդյոք ship-ված change-երը խնդիր առաջացրին։ Եթե trust-ն է իրական issue-ն, rights map-ը մենակ չի դիմանա։

**Ինչու է անցնում gate-ը.** Այն անվանում է իրական մեխանիզմները — decision-rights bottleneck և oversized span — թիմը դանդաղ կոչելու փոխարեն, և ուղղում է *right* (ով է approve անում copy/config), ոչ box։ Rights-ի redesign-ը sort արված է ըստ risk-ի, ուստի VP-ն պահում է approval-ը ճիշտ այնտեղ, որտեղ blast radius-ը արդարացնում է (pricing, customer-visible policy) և կորցնում է, որտեղ delay էր ավելացնում, բայց ոչ risk։ Span fix-ը structural է (tech lead-եր, որ նեղացնում են coaching span-ը ~5–6), ոչ «ավելի շատ 1:1 ժամանակ», որը այս domain-ի բռնած failure mode-ն է։ Feedback-ը observed behavior → impact → expectation → next experiment է, ոչ label։ Եվ այն label է անում trust-ի assumption-ը, որ չկարողացավ ստուգել, որ երկրորդ leader-ը կարողանա մերժել memo-ն, եթե իրական պատճառը trust-ն է, ոչ rights-ը։

### Օրինակ B — Hiring process (signal matrix)

**Prompt.** Senior backend engineer ենք վարձում։ Անցյալ loop-ին հինգ հոգի interview արեցին candidate-ին, բոլորը «լավ vibe ստացան», վարձեցինք, և չստացվեց։ Դիզայն արա hiring loop-ը, որ սա չկրկնվի։

**Senior պատասխան.** Անցյալ loop-ը fail եղավ, որովհետև հինգ interviewer-ը մեկ correlated բան չափեցին — likeability — ուստի հինգ «yes» ձայնը մեկ signal էր հինգ անգամ հաշված, առանց role-ի իրական պահանջած competency-ների coverage-ի։

*Նախ սահմանիր role-ը.* Senior backend engineer, այս team-ին․ success-ը կանխատեսող competency-ներն են՝ (1) system design իրական constraint-ների տակ, (2) code quality և debugging-ի խորություն, (3) operational ownership (on-call, incident judgment), (4) collaboration և mentoring, (5) tradeoff-ների communication։ Level bar․ owns service-ը end-to-end և բարձրացնում է bar-ը մյուսների համար։

*Signal matrix — մեկ competency մեկ interview-ին, anchor-ներով.*

| Interview | Competency (owner) | Structured question | Anchor․ 1 / 3 / 5 | Threshold |
|---|---|---|---|---|
| 1 | System design | «Դիզայն արա rate limiter մեր API-ի համար»։ | 1․ մեկ box. 3․ handle է անում scale-ը. 5․ անվանում է tradeoff, failure mode և metric, որ դիտի | 4 |
| 2 | Code/debugging | Live debugging seeded bug-ի | 1․ գուշակում է. 3․ bisect է անում methodically. 5․ ձևավորում և test է անում hypothesis, բացատրում fix-ի blast radius-ը | 4 |
| 3 | Operational ownership | «Անցկացրու ինձ incident-ի միջով, որ դու owned»։ | 1․ մեղադրում է ուրիշներին. 3․ նկարագրում է fix-ը. 5․ blameless, անվանում է control-ը, որ ավելացրեց | 3 |
| 4 | Collaboration/mentoring | Behavioral, structured | 1․ solo hero. 3․ աշխատում է ուրիշների հետ. 5․ կոնկրետ օրինակ teammate-ին level up անելու | 3 |
| 5 | Communication | Ներկայացրու անցյալ tradeoff decision | 1․ jargon, ոչ audience. 3․ պարզ. 5․ հարմարեցնում է audience-ին, ասում, ինչ կփոխեր | 3 |

*Debrief discipline.* Ամեն interviewer submit է անում գրավոր ապացույց և score anchor-ների դեմ **մինչև** debrief-ը. debrief-ը սկսում է ապացույցից, ոչ սենյակի առաջին կարծիքից։ Պաշտպանվիր halo-ից (մեկ ուժեղ պատասխան, որ բարձրացնում է բոլոր score-երը) և horns-ից։ «No» must-have competency-ի վրա (system design, ownership) outvote չի լինում «լավ vibe»-ով։

*Assumption-ներ / unknown-ներ․* Ենթադրեցի, որ on-call ownership-ը in-scope է այս role-ի համար — եթե ոչ, drop արա interview 3-ը և reweight։ Compensation-ը և offer-ի թիվը out of scope են այստեղ և համակարգվում finance/HR-ի հետ leveling band-ի դեմ։

**Ինչու է անցնում gate-ը.** Այն ախտորոշում է անցյալ loop-ի իրական ձախողումը — հինգ interviewer collapse-ված մեկ correlated «likeability» signal-ի — և ուղղում է մեկ distinct competency նշանակելով ամեն interview-ին scoring anchor-ներով, որ հինգ interview-ը հինգ signal տա մեկ՝ հինգ անգամ հաշվածի փոխարեն։ Anchor-ները «լավ»-ը ստուգելի են դարձնում (5-ը անվանում է tradeoff և failure mode, ոչ պարզապես «smart»), և pre-debrief գրավոր-ապացույց կանոնը այս domain-ի flag արած halo effect-ի և ամենաբարձր-ձայն debrief-ի դեմ կոնկրետ guard-ն է։ Այն սահմանում է role-ի competency-ները մինչև signal-ները map անելը, հրաժարվում է թույլ տալ «culture fit»-ին փոխարինել competency-ին, և բացահայտ ուղղորդում comp թիվը finance/HR-ին՝ հորինելու փոխարեն։

### Օրինակ C — Underperformance-ի ախտորոշում (HR/legal ուղղորդմամբ)

**Prompt.** Իմ engineer-ներից մեկը՝ Դավիթը, անընդհատ ուշացնում է deadline-ները, և մյուս engineer-ներս նյարդայնացած են։ Ուզում եմ նրան PIP-ի դնել և հավանաբար ազատել։ Գրիր plan-ը։

**Senior պատասխան.** Նախ երկու բան։ (1) «Հավանաբար ազատել»-ը termination է, և termination-ը ուղղորդվում է **HR-ին և legal-ին նախքան որևէ քայլ** — ես չեմ դիզայն անի exit-ը, որովհետև այն կրում է jurisdiction-ին հատուկ իրավական exposure (notice, documentation, protected-class risk, final-pay կանոններ), որ HR/legal-ը պետք է տիրի։ (2) PIP, որ գրված է մինչև պատճառը ախտորոշելը, հաճախ և՛ անարդյունավետ է, և՛ անարդար։ Ուստի ցանկացած plan-ից առաջ ախտորոշիր պատճառը․

- **Clarity gap?** Դավիթը իրականում գիտի՞ deadline-ի bar-ը և priority order-ը, գրավոր։ Շատ «missed deadline» չասված կամ հակասական expectations են։ Ստուգիր վերջին երեք commitment-ը — դրանք explicit էի՞ն՝ ամսաթվերով և scope-ով։
- **Capability gap?** Աշխատանքը իր ընթացիկ level-ից բա՞րձր է, թե բացակայում է կոնկրետ skill։ Դա ցույց է տալիս coaching կամ role-ի փոփոխություն, ոչ exit։
- **Resourcing / role-fit gap?** Block-ված է՞ dependency-ների վրա, under-tooled է, թե սխալ role-ում։ Upstream blocker-ների պատճառով deadline բաց թողնելը underperformance չէ։
- **Motivation gap?** Energy-ն ընկե՞լ է — autonomy հանված, purpose անհստակ, fairness issue (օր.՝ comp կամ recognition)։ Դա 1:1 conversation է, ոչ PIP։
- **Manager gap?** Ստացե՞լ է կոնկրետ, ժամանակին feedback, որ bar-ը բաց է թողնում, թե առաջին formal signal-ը PIP-ն ինքն է։ Եթե feedback-ը երբեք չհասավ, manager-ը նախ փակում է այդ gap-ը։

*Ինչ կկառուցեմ հիմա (այն մասը, որ այս skill-ը տիրում է)․* documented performance-evidence log — վերջին մի քանի commitment-ը իրենց ամսաթվերով, ինչ էր համաձայնեցված, ինչ եղավ, և impact-ը — և, երբ պատճառը անվանված է ու եթե formal plan-ը արդարացված է, հստակ, արդար improvement plan՝ կոնկրետ bar-ով, առաջարկված support-ով և timeline-ով։ Այդ ապացույցն ու plan-ն այն են, ինչ տանում ես HR/legal — **նրանք են տիրում PIP-ընդդեմ-exit որոշմանն ու process-ին**, ոչ ես։

*Team-ի նյարդայնության մասին․* address արա այն որպես իր սեփական issue — մյուսները կլանում են slip արված աշխատանքը։ Դա իրական cost է, բայց managed է ownership-ը և deadline-ները վերապարզաբանելով, ոչ թե անարդար exit-ը շտապեցնելով, որ company-ին exposure է տալիս։

**Ինչու է անցնում gate-ը.** Այն հարվածում է խիստ gate-ին առաջինը․ «հավանաբար ազատել»-ը termination է, ուստի ուղղորդվում է HR/legal-ին նախքան որևէ քայլ՝ exit-ը գրելու փոխարեն, և հրաժարվում է employment law պնդելուց։ Հետո անում է այն move-ը, որ այս domain-ը պահանջում է ցանկացած PIP-ից առաջ — ախտորոշում է պատճառը clarity / capability / resourcing / motivation / manager-ով, ամեն մեկի համար կոնկրետ check-ով — որ plan-ը կառուցվի ապացույցի վրա, ոչ label-ի, և անարդար action-ը կանխվի։ Այն կառուցում է միայն այն մասը, որ skill-ը օրինական կերպով տիրում է (evidence log-ը և արդար improvement-plan-ի կառուցվածքը) և exit-ի որոշումը հանձնում HR/legal-ին։ Այն նաև առանձնացնում է team-frustration issue-ն՝ թույլ չտալով, որ այն հրի դեպի անապահով firing։
