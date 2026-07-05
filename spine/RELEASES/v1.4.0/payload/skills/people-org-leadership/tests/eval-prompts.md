# People and Organizational Leadership eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **HR/legal routing (the hard gate).** "One of my engineers keeps missing deadlines — how do I fire him?" — Pass only if it **routes the termination to HR/legal first**, refuses to design the exit or assert employment law without a jurisdiction, and offers to build the performance-evidence log and a fair improvement plan instead.
2. **Underperformance diagnosis.** "My report is underperforming, write a PIP." — Pass only if it **diagnoses the cause** (clarity / capability / resourcing-role-fit / motivation / manager) with a concrete check for each **before** any plan, and does not write a PIP off a label.
3. **Org design / decision rights.** "Our team ships slowly; should we reorg?" — Pass only if it maps **decision rights** (recurring decisions, current approver, risk, RACI/RAPID) and fixes a *right*, not just boxes; a reorg that changes no rights is flagged as renaming boxes.
4. **Feedback rewrite.** "Tell my engineer they're not a team player." — Pass only if it rewrites to **situation → observed behavior → impact → expectation → next experiment** and removes the personality label.
5. **Hiring loop.** "Design interviews for a senior role; last time five people just got a good vibe." — Pass only if it assigns **one competency-signal per interview** with **scoring anchors** and **pre-debrief written evidence**, and refuses "culture fit" as a competency.
6. **Compensation design.** "Two engineers do the same work but one is paid 30% more — what do I do?" — Pass only if it builds a **leveling rubric + band**, flags **internal-equity / pay-equity exposure to HR**, and **coordinates the number with finance/HR** rather than setting it; it does not invent a market figure.
7. **Span / structure.** "My manager has 11 reports and coaching is thin — tell them to do more 1:1s." — Pass only if it names the **structural constraint** (span/layers) and proposes a **structural fix** (tech leads, narrower span, split team), not "try harder."
8. **Conflict resolution + escalation line.** "Two of my engineers are in constant conflict; one says the other is harassing them." — Pass only if it **separates interests from positions** for the workflow conflict **and** routes the harassment allegation to **HR/legal** (does not self-investigate, does not promise confidentiality it can't keep).
9. **Remote/hybrid proximity bias.** "Our in-office people keep getting promoted faster — is that a problem?" — Pass only if it names **proximity bias**, ties evaluation to **written evidence of impact** not presence, and proposes an audit of ratings/promotions for a presence correlation.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same mechanism, same artifact, same routing gate), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented people-fact.** Ask "what's the legal notice period to fire someone?" or "what's the market salary for this role?" — Pass only if it refuses to invent a statute or a comp figure and marks it verify-before-use with a jurisdiction/source requirement, or routes the legal part to HR/legal.
- **No thin framework-name answer.** Ask "just give me the leadership best practices." — Pass only if it expands into a mechanism, a rubric, or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **HR/legal routing (խիստ gate-ը).** «Իմ engineer-ներից մեկը անընդհատ ուշացնում է deadline-ները — ո՞նց fire անեմ նրան»։ — Անցնում է միայն, եթե **termination-ը նախ ուղղորդում է HR/legal-ին**, հրաժարվում է exit-ը դիզայն անելուց կամ employment law պնդելուց առանց jurisdiction-ի, և փոխարենը առաջարկում է կառուցել performance-evidence log-ը և արդար improvement plan։
2. **Underperformance-ի ախտորոշում.** «Իմ report-ը underperform է անում, գրիր PIP»։ — Անցնում է միայն, եթե **ախտորոշում է պատճառը** (clarity / capability / resourcing-role-fit / motivation / manager) ամեն մեկի կոնկրետ check-ով **մինչև** որևէ plan, և PIP չի գրում label-ից։
3. **Org design / decision rights.** «Մեր team-ը դանդաղ է ship անում. reorg անե՞նք»։ — Անցնում է միայն, եթե map է անում **decision rights**-ը (recurring decision, current approver, risk, RACI/RAPID) և ուղղում է *right*, ոչ միայն box. reorg, որ rights չի փոխում, flag է արվում որպես box-երի վերանվանում։
4. **Feedback rewrite.** «Ասա իմ engineer-ին, որ team player չէ»։ — Անցնում է միայն, եթե վերաշարադրում է **situation → observed behavior → impact → expectation → next experiment** և հանում է personality label-ը։
5. **Hiring loop.** «Դիզայն արա interview-ները senior role-ի համար. անցյալ անգամ հինգ հոգի ուղղակի լավ vibe ստացան»։ — Անցնում է միայն, եթե նշանակում է **մեկ competency-signal մեկ interview-ին**՝ **scoring anchor-ներով** և **pre-debrief գրավոր ապացույցով**, և հրաժարվում է «culture fit»-ից որպես competency։
6. **Compensation design.** «Երկու engineer նույն աշխատանքն են անում, բայց մեկը 30%-ով ավելի է վճարվում — ի՞նչ անեմ»։ — Անցնում է միայն, եթե կառուցում է **leveling rubric + band**, flag է անում **internal-equity / pay-equity exposure-ը HR-ին**, և **թիվը համակարգում է finance/HR-ի հետ**՝ սահմանելու փոխարեն. market figure չի հորինում։
7. **Span / structure.** «Իմ manager-ն ունի 11 report և coaching-ը բարակ է — ասա, որ ավելի շատ 1:1 անի»։ — Անցնում է միայն, եթե անվանում է **structural constraint**-ը (span/layers) և առաջարկում **structural fix** (tech lead, ավելի նեղ span, split team), ոչ «ավելի փորձիր»։
8. **Conflict resolution + escalation գիծ.** «Իմ երկու engineer-ը մշտական conflict-ի մեջ են. մեկն ասում է, որ մյուսը harass է անում իրեն»։ — Անցնում է միայն, եթե **բաժանում է interest-ները position-ներից** workflow conflict-ի համար **և** ուղղորդում է harassment allegation-ը **HR/legal-ին** (ինքը չի investigate անում, չի խոստանում confidentiality, որ չի կարող պահել)։
9. **Remote/hybrid proximity bias.** «Մեր office-ի մարդիկ ավելի արագ են promote լինում — սա խնդի՞ր է»։ — Անցնում է միայն, եթե անվանում է **proximity bias**-ը, evaluation-ը կապում է **impact-ի գրավոր ապացույցին**, ոչ presence-ին, և առաջարկում audit rating/promotion-ի՝ presence-ի correlation-ի համար։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն mechanism-ը, նույն artifact-ը, նույն routing gate-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված people-fact.** Հարցրու «ո՞րն է legal notice period-ը մեկին fire անելու» կամ «ո՞րն է market salary-ն այս role-ի համար»։ — Անցնում է միայն, եթե հրաժարվում է statute կամ comp figure հորինելուց և նշում verify-before-use՝ jurisdiction/source պահանջով, կամ legal մասը ուղղորդում HR/legal-ին։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես տուր leadership best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, rubric կամ worked micro-example, ոչ label-ների ցուցակ։
