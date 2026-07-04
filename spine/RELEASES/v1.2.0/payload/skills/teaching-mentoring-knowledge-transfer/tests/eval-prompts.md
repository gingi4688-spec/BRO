# Teaching, Mentoring, and Knowledge Transfer eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete behavioral artifact, not vocabulary. Do not reuse one check for another prompt.

1. **Objective from a topic.** "We want to train the team on Kafka." — Pass only if it converts the topic into one or more *observable* performance objectives ("given …, the learner does … to standard"), names the learner stage, and includes a transfer task; fail if it returns a topic syllabus.
2. **Onboarding / ramp plan.** "Onboard a new engineer fast." — Pass only if it defines "productive" as a demonstrated, shipped behavior by a named week, ramps in observable weekly milestones, gives minimum-context-first (not a firehose), assigns a buddy, and **fades** the support; fail if it returns a reading list.
3. **Concept explanation.** "Explain [a concept] to a junior so it lands." — Pass only if it anchors to prior knowledge, introduces one new idea at a time (chunk), uses a worked instance, **names and corrects the common misconception**, and closes with a check-for-understanding on an *unseen* case; fail if it just restates the definition.
4. **Cognitive overload / chunking.** "Here's a 3-hour deep-dive deck covering the whole system for new hires." — Pass only if it flags overload, chunks the material known→new, inserts retrieval/practice between chunks, and cuts extraneous load; fail if it accepts the firehose.
5. **Recall vs understanding.** "We'll measure the training with a multiple-choice quiz." — Pass only if it distinguishes recognition from recall/transfer, and requires a delayed-recall and a transfer task on an unseen case for any behavioral goal; fail if it endorses the quiz as proof of competence.
6. **Scaffolding that never fades.** "Our trainees always use the worked-example template; is that fine?" — Pass only if it requires a fade schedule (full → partial → prompt → unaided) with dates and treats persistent dependence as a diagnosis; fail if it leaves the prop on indefinitely.
7. **Coaching vs solving.** "My mentee keeps asking me how to design every endpoint; I just tell them." — Pass only if it shifts to coaching questions that surface the mentee's next decision and reserves direct answers for non-derivable knowledge under time pressure; fail if it endorses handing over every answer.
8. **Documentation-for-transfer (bus factor).** "Only Ani knows how our billing reconciliation works and she's leaving in three weeks. Capture it." — Pass only if it captures the tacit decisions/why, failure modes and triggers, what was tried and rejected, and owners — **and** specifies an acceptance test where a *named second person* runs the task from the doc with Ani out of the room; fail if it produces a happy-path step list or a single handoff meeting.
9. **Skill vs non-skill diagnosis.** "The team keeps shipping bugs; build a quality training." — Pass only if it first checks whether the cause is skill vs motivation/expectations/tooling/process, routes the non-skill part, and trains only the genuine skill gap; fail if it prescribes a course without diagnosis.
10. **Assessment alignment.** "Design the assessment for [a hands-on skill]." — Pass only if objective ↔ task ↔ criteria ↔ evidence are aligned, with formative/summative split, explicit criteria, and a transfer task; fail if the test measures recognition of a skill that requires application.
11. **Armenian equal-depth.** Ask any of prompts 1–10 in Armenian. — Pass only if the Armenian is native, equal-depth (same mechanism, same artifact, same rigor), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for a named study, an effect-size statistic, or a citation ("what's the exact retention boost from spacing?"). — Pass only if it refuses to invent the number/citation or marks it verify-before-use and reasons from the mechanism instead.
- **No thin framework-name answer.** Ask "just give me the adult-learning principles." — Pass only if it operationalizes them (e.g. Knowles into concrete moves), not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete behavioral artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Objective թեմայից.** «Ուզում ենք թիմին Kafka-ի training տալ»։ — Անցնում է միայն, եթե թեման վերածում է մեկ կամ ավելի *observable* performance objective-ի («տրված …, learner-ը անում է … մինչև standard»), անվանում learner-ի stage-ը և ներառում transfer task. fail՝ եթե թեմայի syllabus է վերադարձնում։
2. **Onboarding / ramp plan.** «Onboard արա նոր engineer-ին արագ»։ — Անցնում է միայն, եթե «productive»-ը սահմանում է որպես demonstrated, ship-ված behavior անվանված շաբաթով, ramp է անում observable շաբաթական milestone-ներով, տալիս minimum-context-նախ (ոչ firehose), նշանակում buddy և **fade** է անում աջակցությունը. fail՝ եթե reading list է վերադարձնում։
3. **Հասկացության բացատրություն.** «Բացատրիր [հասկացություն] junior-ին, որ հասնի»։ — Անցնում է միայն, եթե anchor է անում prior knowledge-ին, ներմուծում մեկ նոր գաղափար միանգամից (chunk), օգտագործում worked instance, **անվանում և ուղղում տարածված misconception-ը**, և փակում check-for-understanding-ով *չտեսնված* case-ի վրա. fail՝ եթե միայն վերաձևակերպում է սահմանումը։
4. **Cognitive overload / chunking.** «Ահա 3-ժամանոց deep-dive deck, որ ողջ համակարգը ծածկում է նոր աշխատակիցների համար»։ — Անցնում է միայն, եթե flag է անում overload-ը, chunk է անում նյութը հայտնի→նոր, retrieval/practice ներդնում chunk-երի միջև և կտրում extraneous load-ը. fail՝ եթե ընդունում է firehose-ը։
5. **Recall ընդդեմ understanding.** «Training-ը կչափենք multiple-choice quiz-ով»։ — Անցնում է միայն, եթե տարբերում է recognition-ը recall/transfer-ից և պահանջում delayed-recall և transfer task չտեսնված case-ի վրա ցանկացած behavioral նպատակի համար. fail՝ եթե quiz-ը հաստատում է որպես competence-ի ապացույց։
6. **Scaffolding, որ երբեք չի fade անում.** «Մեր trainee-ները միշտ worked-example template են օգտագործում. նորմա՞լ է»։ — Անցնում է միայն, եթե պահանջում է fade schedule (լրիվ → մասնակի → prompt → առանց օգնության)՝ ամսաթվերով, և կայուն dependence-ը համարում ախտորոշում. fail՝ եթե prop-ը թողնում է անժամկետ։
7. **Coaching ընդդեմ լուծելու.** «Mentee-ս անընդհատ հարցնում է, թե ոնց design անի ամեն endpoint. ես ուղղակի ասում եմ»։ — Անցնում է միայն, եթե անցնում է coaching հարցերի, որ բացահայտում են mentee-ի հաջորդ decision-ը, և ուղիղ պատասխանը պահում ոչ-բխեցվող գիտելիքի և ժամանակի ճնշման համար. fail՝ եթե հաստատում է ամեն պատասխան հանձնելը։
8. **Documentation-for-transfer (bus factor).** «Միայն Անին գիտի, թե ոնց է մեր billing reconciliation-ն աշխատում, և նա հեռանում է երեք շաբաթից։ Capture արա»։ — Անցնում է միայն, եթե capture է անում tacit decision-ները/ինչու-ն, failure mode-երը և trigger-ները, ինչ փորձվեց ու մերժվեց, և owner-ները — **և** սահմանում acceptance test, որտեղ *անվանված երկրորդ մարդը* գործարկում է task-ը doc-ից՝ Անին սենյակից դուրս. fail՝ եթե happy-path step list կամ մեկ handoff meeting է արտադրում։
9. **Skill ընդդեմ ոչ-skill ախտորոշում.** «Թիմը անընդհատ bug է ship անում. կառուցիր quality training»։ — Անցնում է միայն, եթե նախ ստուգում է՝ պատճառը skill է, թե motivation/expectation/tooling/process, route է անում ոչ-skill մասը և train անում միայն իսկական skill gap-ը. fail՝ եթե course է նշանակում առանց ախտորոշման։
10. **Assessment alignment.** «Ձևավորիր assessment [hands-on skill]-ի համար»։ — Անցնում է միայն, եթե objective ↔ task ↔ criteria ↔ evidence aligned են, formative/summative split-ով, բացահայտ criteria-ով և transfer task-ով. fail՝ եթե test-ը recognition է չափում application պահանջող skill-ի։
11. **Հայերեն equal-depth.** Հարցրու 1–10-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն mechanism-ը, նույն artifact-ը, նույն rigor-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու անվանված study, effect-size վիճակագրություն կամ citation («ինչ է spacing-ի ճշգրիտ retention boost-ը»)։ — Անցնում է միայն, եթե հրաժարվում է թիվը/citation-ը հորինելուց կամ նշում verify-before-use և reason է անում mechanism-ից։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես տուր adult-learning principle-ները»։ — Անցնում է միայն, եթե operationalize է անում դրանք (օր.՝ Knowles-ը կոնկրետ move-երի), ոչ label-ների ցուցակ։
