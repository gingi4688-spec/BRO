---
name: "teaching-mentoring-knowledge-transfer"
description: >-
  use when the work is teaching a concept, designing a course or curriculum, building an onboarding or ramp plan, mentoring or coaching an individual, designing assessment, or capturing expert knowledge so a team is not single-threaded on one person (bus-factor / documentation-for-transfer) — for decisions, critique, planning, diagnostics, runbooks/artifacts, teaching, or evaluation. use as lead when this domain owns the central deliverable (learning path, onboarding plan, coaching plan, assessment rubric, knowledge-transfer map, concept explanation). do not use as lead when another skill owns the artifact and instruction is only one input — then support it. հայերեն՝ օգտագործիր ուսուցման, դասընթացի/ծրագրի, onboarding-ի, mentoring/coaching-ի, գնահատման ձևավորման և փորձագիտական գիտելիքի փոխանցման (bus-factor) աշխատանքի համար։
---

# Teaching, Mentoring, and Knowledge Transfer / Ուսուցում, mentoring և գիտելիքի փոխանցում

## English

**Scope.** In: turning expertise into a learner-specific path; concept explanation pitched to a stated audience; course and curriculum design; onboarding and ramp plans; one-to-one mentoring and coaching; assessment design (formative, summative, transfer); and documentation-for-transfer that lowers the bus factor so a team is not single-threaded on one expert. Out: the *content correctness* of the underlying domain (that domain owns the facts — you own how they are learned), HR performance management and discipline (people-org/leadership owns that), and the writing polish of public docs (communication-writing owns prose). This skill turns knowledge into *changed performance under realistic conditions*, not into slides, attendance, or a "got it."

**Leads / Supports.** Lead when the central deliverable is instruction-shaped: a learning path, an onboarding/ramp plan, a coaching plan, an assessment rubric, a knowledge-transfer map, or a concept explanation. Support when another skill owns the artifact and learning is one input — e.g. devops owns the runbook and you supply the transfer plan that makes a second engineer able to run it; product owns the spec and you supply the enablement plan for the field team.

Conflict rules:
- **Performance problem vs skill gap → diagnose before you teach.** Not every miss is a training gap. If the cause is motivation, unclear expectations, missing access/tooling, or a process defect, training will not fix it — route to `people-org-leadership` (expectations/motivation) or the owning domain (tooling/process). Teach only the part that is genuinely a skill gap.
- **Discipline / termination / capability-management → not this skill.** The moment a mentoring conversation turns into documenting underperformance for an HR action, hand off to `people-org-leadership` and legal. Coaching is developmental and confidential by default; it is not evidence-gathering.
- **Content authority → defer to the owning domain.** You design the learning sequence, the retrieval cadence, and the assessment; you do not certify that the technical content is correct. Pair with the domain skill (or a named SME) for factual sign-off, and never present invented domain facts as content.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **"Teach them X" → first write the observable behavior.** Convert the topic into a performance objective: *given* a condition, the learner *does* an observable action *to* a standard. "Understand error budgets" becomes "given an SLO and a window, compute budget minutes and choose page/ticket/freeze." A topic is not an objective.
2. **Adult learner → apply Knowles' andragogy, don't lecture.** Surface why it matters now (relevance), connect to their experience, give them control over how they get there, and anchor every block to a real task they own. Adults learn what they can use this week, not what completes a syllabus.
3. **Novice → lead with a worked example; expert → lead with a problem.** Worked examples cut cognitive load for novices; the same over-explanation bores and insults an expert, who needs edge cases and hard problems. Pitch to the stage, not the average.
4. **New material → chunk it and protect working memory.** Sequence in small, schema-building chunks (roughly one new idea at a time, leaning on what's already known); never dump the whole system at once. Overload destroys learning even when every fact is correct.
5. **Recognition ≠ recall ≠ transfer.** "Makes sense when I read it" is recognition. The bar is recall after delay and *transfer* — doing it on a new case without the answer in front of them. Design for the highest bar the goal needs, and test at that bar.
6. **Scaffolding must fade on a schedule.** Provide structure (templates, prompts, worked steps), then remove it step by step until the learner performs unaided. Scaffolding that never fades manufactures dependence, not competence — set the fade points up front.
7. **Practice → retrieval and spacing, not rereading.** Schedule recall over expanding intervals (same day → +2 days → +1 week → in a real task). Massed rereading feels productive and transfers poorly; spaced retrieval feels harder and lasts.
8. **Feedback → specific, timely, against a criterion.** Tie feedback to a rubric line and the next observable behavior, not to personality ("be more confident"). Late or vague feedback teaches nothing; "state the ask in the first two sentences" does.
9. **Mentor → coach the thinking, don't hand over the answer.** When the learner can reach it with a prompt, ask the question that exposes the next decision; solve it for them only when the gap is knowledge they cannot yet derive and the clock matters. Rescuing every time blocks the skill from forming.
10. **Onboarding → ramp to a real shipped contribution, on a clock, with a buddy.** A ramp plan names week-by-week milestones ending in an owned, shipped task, a named buddy/mentor, the minimum context to be productive, and check-in points — not a reading list and a firehose.
11. **Knowledge transfer → capture tacit decisions and failure modes, not just the happy path.** The bus-factor risk lives in the judgment: why this way, what we tried that failed, what breaks it, who to ask. A doc that lists steps but not the *why* and the *traps* does not lower the bus factor.
12. **Assessment → align objective ↔ task ↔ criteria ↔ evidence.** What you measure must be what you taught, scored against explicit criteria, with a *transfer* task proving it works outside the lesson. A quiz that tests recall of a skill that needs application is misaligned.
13. **Group is mixed-level → differentiate or you lose both ends.** Give novices worked examples and experts harder problems in the same session; one flat lesson under-serves the strong and drowns the weak.
14. **"They attended / I explained it" → not learned.** Attendance, slide count, and a clear explanation are inputs, not evidence. Evidence is the learner *doing* the behavior to standard, later, on a new case.

### Failure modes to prevent / Ձախողման ձևեր

1. **Cognitive overload / no chunking.** The whole system is poured out at once; working memory saturates and nothing forms a schema. Tell: a 90-minute firehose, twelve new concepts per session, "we covered everything" with no practice between chunks.
2. **Mistaking recall for understanding (recognition trap).** The learner nods, the slide is clear, the quiz is multiple-choice — and they cannot do it on a new case a week later. Tell: assessment is recognition ("which of these…") with no delayed recall and no transfer task.
3. **Scaffolding that never fades.** The template, the checklist, or the mentor's hand stays on forever; the learner is fluent only while propped up. Tell: no fade schedule, the "trainee" still needs the worked example after months, the mentor still reviews every line.
4. **Topic taught instead of objective.** The plan lists subjects ("intro to Kafka") with no observable behavior or standard, so no one can tell when it's done. Tell: a syllabus of nouns, zero "the learner will be able to…", no transfer task.
5. **Pitched at the wrong stage.** Worked-example basics dumped on an expert (boredom/insult) or open-ended discovery dumped on a novice (flailing). Tell: same lesson for everyone, no novice/expert split.
6. **Attendance / completion mistaken for learning.** Success is measured by seats filled, modules completed, or "any questions? no? great." Tell: the metric is attendance or a completion checkbox, never a demonstrated behavior.
7. **Mentor solves instead of coaching.** Every question gets the answer handed over; the learner stays dependent and never builds judgment. Tell: the mentor's transcript is all answers, no questions that surface the learner's reasoning.
8. **Knowledge-transfer doc with no practice and no tacit knowledge.** A wiki dump of steps with no exercise, no "why," no failure modes; the reader still can't operate it. Tell: a handoff that is a page of bullet steps, a one-hour meeting, and a closed ticket — bus factor unchanged.
9. **Feedback that is vague or about the person.** "Be clearer," "more confident," "good job" — nothing the learner can act on. Tell: no rubric line, no next observable behavior, praise/criticism aimed at the person not the work.
10. **Diagnosing a non-skill problem as a training gap.** A motivation, tooling, or expectations problem gets a course; the course runs, the problem persists. Tell: training prescribed with no check of whether the cause is even skill.
11. **No retrieval / massed practice only.** Everything happens in one sitting; it feels efficient and is forgotten by next week. Tell: a single session, no spaced recall, "we did the training" as past tense and done.
12. **Mentoring drifting into HR/discipline without a handoff.** A developmental conversation quietly becomes documentation for a performance action. Tell: notes being kept as evidence, capability-management language, no route to people-org/legal.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the request (learning path / onboarding plan / coaching plan / assessment rubric / knowledge-transfer map / concept explanation), not generic advice.
- Every objective is an observable behavior with a condition and a standard; the plan states the learner stage and pitches to it.
- Practice carries retrieval and spacing; scaffolding has explicit fade points; the goal's bar (recall vs transfer) is tested with a transfer task.
- Assessment aligns objective ↔ task ↔ criteria ↔ evidence; feedback is specific, timely, criterion-referenced.
- Knowledge-transfer artifacts capture tacit decisions, failure modes, and owners — not just the happy path — and lower the bus factor.
- Safety routing is explicit: skill-gap is separated from motivation/tooling/process; discipline/termination/capability-management routes to people-org/legal; domain facts are SME-owned, never invented.
- **Verify by demonstrated behavior, not attendance** — the proof is the learner doing the behavior to standard, later, on a new case.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **learning objective** (observable behavior, condition, standard, transfer task explicit) · **instructional fit** (novice/expert stage drives worked examples, load, and pace; Knowles' andragogy for adults) · **practice design** (retrieval, spacing, interleaving, faded scaffolding, real-task transfer) · **assessment** (objective↔task↔criteria↔evidence aligned; formative/summative; criterion-referenced feedback) · **knowledge transfer** (tacit decisions, failure modes, owners, practice loops captured; bus factor lowered).

### Deep dive & assets

`manual.md` (mechanisms — spacing/retrieval, worked-example effect, skill decomposition, assessment alignment, Knowles' andragogy, cognitive load/chunking, scaffolding & fading; decision rules; failure-repair playbook) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (onboarding plan + concept explanation + assessment) · `output-templates.md` (learning path / onboarding plan / knowledge-transfer map) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ փորձագիտությունը learner-ին համապատասխան ճանապարհի վերածելը. հասկացության բացատրություն՝ հասցեագրված հայտարարված audience-ին. դասընթացի և curriculum-ի ձևավորում. onboarding և ramp plan. մեկ-մեկու mentoring և coaching. գնահատման ձևավորում (formative, summative, transfer). և գիտելիքի փոխանցում (documentation-for-transfer), որ իջեցնում է bus factor-ը, որպեսզի թիմը մեկ expert-ի վրա single-threaded չմնա։ Դուրս՝ հիմքում ընկած ոլորտի *բովանդակության ճշտությունը* (այդ ոլորտն է տիրում փաստերին — դու տիրում ես, թե ինչպես են դրանք սովորվում), HR performance-management-ը և discipline-ը (people-org/leadership-ինն է), և հանրային doc-երի լեզվական մշակումը (communication-writing-ինն է)։ Այս skill-ը գիտելիքը դարձնում է *իրատեսական պայմաններում փոխված performance*, ոչ slide, attendance կամ «հասկացա»։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը ուսուցման ձև ունի՝ learning path, onboarding/ramp plan, coaching plan, assessment rubric, knowledge-transfer map կամ հասկացության բացատրություն։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ learning-ը մեկ input է. օրինակ՝ devops-ը տիրում է runbook-ին, դու տալիս ես transfer plan-ը, որ երկրորդ engineer-ը կարողանա այն գործարկել. product-ը տիրում է spec-ին, դու տալիս ես enablement plan-ը field թիմի համար։

Կոնֆլիկտի կանոններ․
- **Performance problem ընդդեմ skill gap → սովորեցնելուց առաջ ախտորոշիր։** Ամեն բացթողում training-ի gap չէ։ Եթե պատճառը motivation-ն է, անհասկանալի expectation-ները, բացակայող access/tooling-ը կամ process-ի թերությունն է, training-ը չի ուղղի — ուղղորդիր `people-org-leadership`-ին (expectation/motivation) կամ տվյալ ոլորտին (tooling/process)։ Սովորեցրու միայն այն մասը, որ իսկապես skill gap է։
- **Discipline / termination / capability-management → ոչ այս skill-ը։** Այն պահին, երբ mentoring զրույցը դառնում է underperformance-ը HR-գործողության համար փաստաթղթավորում, փոխանցիր `people-org-leadership`-ին և legal-ին։ Coaching-ը զարգացման է և լռելյայն գաղտնի. այն ապացույց հավաքելու գործիք չէ։
- **Բովանդակության authority → զիջիր ոլորտին։** Դու ձևավորում ես ուսուցման հերթականությունը, retrieval cadence-ը և assessment-ը. դու չես հաստատում, որ տեխնիկական բովանդակությունը ճիշտ է։ Զուգիր ոլորտի skill-ի (կամ անվանված SME-ի) հետ՝ փաստերի sign-off-ի համար, և երբեք հորինված ոլորտային փաստ որպես բովանդակություն մի՛ ներկայացրու։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **«Սովորեցրու նրանց X» → նախ գրիր observable behavior-ը։** Թեման վերածիր performance objective-ի՝ *տրված* պայմանի դեպքում learner-ը *անում է* observable գործողություն *մինչև* standard։ «Հասկանա error budget-ը» դառնում է «տրված SLO-ի և window-ի դեպքում հաշվում է budget minute-ը և ընտրում page/ticket/freeze»։ Թեման objective չէ։
2. **Մեծահասակ learner → կիրառիր Knowles-ի andragogy-ն, lecture մի՛ արա։** Բացահայտիր, թե ինչու է հիմա կարևոր (relevance), կապիր նրա փորձին, տուր նրան control, թե ինչպես հասնի, և ամեն block կապիր իրական task-ի, որ իրենն է։ Մեծահասակը սովորում է այն, ինչ կարող է օգտագործել այս շաբաթ, ոչ թե այն, ինչ լրացնում է syllabus-ը։
3. **Novice → առաջնորդիր worked example-ով. expert → առաջնորդիր խնդրով։** Worked example-ները novice-ի cognitive load-ը կտրում են. նույն գեր-բացատրությունը ձանձրացնում և վիրավորում է expert-ին, ում edge case և դժվար խնդիր է պետք։ Հասցեագրիր stage-ին, ոչ միջինին։
4. **Նոր նյութ → chunk արա այն և պաշտպանիր working memory-ն։** Հերթականացրու փոքր, schema-կառուցող chunk-երով (մոտավորապես մեկ նոր գաղափար միանգամից՝ հենվելով արդեն հայտնիի վրա). երբեք ողջ համակարգը միանգամից մի՛ թափիր։ Overload-ը քանդում է learning-ը, նույնիսկ երբ ամեն փաստ ճիշտ է։
5. **Recognition ≠ recall ≠ transfer։** «Իմաստ ունի, երբ կարդում եմ»-ը recognition է։ Նշաձողը delayed recall-ն է և *transfer*-ը — նոր case-ի վրա անելը՝ առանց պատասխանը աչքի առաջ ունենալու։ Ձևավորիր այն ամենաբարձր նշաձողի համար, որ նպատակը պահանջում է, և test արա այդ նշաձողին։
6. **Scaffolding-ը պետք է fade անի ժամանակացույցով։** Տուր structure (template, prompt, worked step), հետո հանիր այն քայլ առ քայլ, մինչև learner-ը կատարի առանց օգնության։ Scaffolding, որ երբեք չի fade անում, dependence է արտադրում, ոչ competence — fade point-երը նախապես սահմանիր։
7. **Practice → retrieval և spacing, ոչ rereading։** Recall-ը schedule արա ընդարձակվող interval-ներով (նույն օրը → +2 օր → +1 շաբաթ → իրական task-ի մեջ)։ Massed rereading-ը արդյունավետ է զգացվում և վատ է transfer անում. spaced retrieval-ը ավելի դժվար է զգացվում և մնում է։
8. **Feedback → կոնկրետ, ժամանակին, criterion-ի դեմ։** Feedback-ը կապիր rubric-ի տողին և հաջորդ observable behavior-ին, ոչ personality-ին («եղիր ավելի վստահ»)։ Ուշ կամ vague feedback-ը ոչինչ չի սովորեցնում. «առաջին երկու նախադասությունում ասա ask-ը»-ն սովորեցնում է։
9. **Mentor → coach արա մտածողությունը, պատասխանը մի՛ հանձնիր։** Երբ learner-ը կարող է prompt-ով հասնել, տուր այն հարցը, որ բացահայտում է հաջորդ decision-ը. լուծիր նրա փոխարեն միայն, երբ gap-ը գիտելիք է, որ դեռ չի կարող բխեցնել, և ժամացույցը կարևոր է։ Ամեն անգամ փրկելը արգելափակում է skill-ի ձևավորումը։
10. **Onboarding → ramp մինչև իրական ship-ված ներդրում, ժամացույցով, buddy-ով։** Ramp plan-ը անվանում է շաբաթ-առ-շաբաթ milestone-ներ, որ ավարտվում են owned, ship-ված task-ով, անվանված buddy/mentor, minimum context՝ productive լինելու, և check-in point-եր — ոչ reading list և firehose։
11. **Knowledge transfer → capture արա tacit decision-ները և failure mode-երը, ոչ միայն happy path-ը։** Bus-factor ռիսկը ապրում է judgment-ում՝ ինչու այսպես, ինչ փորձեցինք և ձախողվեց, ինչը կոտրում է, ում հարցնել։ Doc, որ step-եր է թվարկում, բայց ոչ *ինչու*-ն և *trap*-երը, bus factor-ը չի իջեցնում։
12. **Assessment → align արա objective ↔ task ↔ criteria ↔ evidence։** Այն, ինչ չափում ես, պետք է լինի այն, ինչ սովորեցրիր, score-ված հստակ criteria-ի դեմ, *transfer* task-ով, որ ապացուցում է, որ աշխատում է lesson-ից դուրս։ Quiz, որ recall է test անում application պահանջող skill-ի, misaligned է։
13. **Group-ը mixed-level է → differentiate արա, թե կկորցնես երկու ծայրն էլ։** Տուր novice-ին worked example, expert-ին՝ ավելի դժվար խնդիր նույն session-ում. մեկ հարթ lesson-ը թերի է սպասարկում ուժեղին և խեղդում թույլին։
14. **«Ներկա էին / ես բացատրեցի» → սովորած չէ։** Attendance-ը, slide-ի քանակը և հստակ բացատրությունը input են, ոչ evidence։ Evidence-ը learner-ի *անելն* է behavior-ը մինչև standard, հետո, նոր case-ի վրա։

### Ձախողման ձևեր

1. **Cognitive overload / no chunking։** Ողջ համակարգը թափվում է միանգամից. working memory-ն հագենում է, և ոչինչ schema չի դառնում։ Tell՝ 90-րոպեանոց firehose, session-ին տասներկու նոր հասկացություն, «ամեն ինչ ծածկեցինք»՝ առանց chunk-երի միջև practice-ի։
2. **Recall-ը understanding-ի հետ շփոթելը (recognition trap)։** Learner-ը գլխով է անում, slide-ը պարզ է, quiz-ը multiple-choice է — և մեկ շաբաթ անց նոր case-ի վրա չի կարող անել։ Tell՝ assessment-ը recognition է («ո՞րն է սրանցից…»)՝ առանց delayed recall-ի և transfer task-ի։
3. **Scaffolding, որ երբեք չի fade անում։** Template-ը, checklist-ը կամ mentor-ի ձեռքը մնում է հավերժ. learner-ը սահուն է միայն, քանի դեռ հենված է։ Tell՝ fade schedule չկա, «trainee»-ն ամիսներ անց դեռ worked example-ի կարիք ունի, mentor-ը դեռ ամեն տող է review անում։
4. **Թեման սովորեցված objective-ի փոխարեն։** Plan-ը թվարկում է առարկաներ («intro to Kafka»)՝ առանց observable behavior-ի կամ standard-ի, ուստի ոչ ոք չի կարող ասել, թե երբ է ավարտված։ Tell՝ գոյականների syllabus, զրո «learner-ը կկարողանա…», transfer task չկա։
5. **Սխալ stage-ին հասցեագրված։** Worked-example basic-ները թափված expert-ի վրա (ձանձրույթ/վիրավորանք) կամ open-ended discovery թափված novice-ի վրա (խարխափում)։ Tell՝ նույն lesson-ը բոլորի համար, novice/expert split չկա։
6. **Attendance/completion-ը learning-ի հետ շփոթելը։** Success-ը չափվում է լցված աթոռներով, ավարտված module-ներով կամ «հարցեր կա՞ն, ոչ, հիանալի»-ով։ Tell՝ metric-ը attendance է կամ completion checkbox, երբեք demonstrated behavior։
7. **Mentor-ը լուծում է coaching-ի փոխարեն։** Ամեն հարց ստանում է հանձնված պատասխան. learner-ը մնում է dependent և երբեք judgment չի կառուցում։ Tell՝ mentor-ի transcript-ը ամբողջը պատասխան է, ոչ մի հարց, որ learner-ի reasoning-ը բացահայտի։
8. **Knowledge-transfer doc՝ առանց practice-ի և tacit knowledge-ի։** Step-երի wiki dump՝ առանց exercise-ի, «ինչու»-ի, failure mode-ի. ընթերցողը դեռ չի կարող այն գործարկել։ Tell՝ handoff, որ մի էջ bullet-step է, մեկ-ժամանոց meeting և փակ ticket — bus factor-ը անփոփոխ։
9. **Feedback, որ vague է կամ մարդու մասին։** «Եղիր ավելի պարզ», «ավելի վստահ», «լավ էր» — ոչինչ, որ learner-ը կարող է act անել։ Tell՝ rubric-ի տող չկա, հաջորդ observable behavior չկա, գովք/քննադատություն ուղղված մարդուն, ոչ աշխատանքին։
10. **Ոչ-skill խնդիրը training gap-ի պես ախտորոշելը։** Motivation-ի, tooling-ի կամ expectation-ի խնդիրը ստանում է course. course-ը անցնում է, խնդիրը մնում է։ Tell՝ training նշանակված՝ առանց ստուգելու, թե արդյոք պատճառը նույնիսկ skill է։
11. **Ոչ retrieval / միայն massed practice։** Ամեն ինչ լինում է մեկ sitting-ում. արդյունավետ է զգացվում և մոռացվում է հաջորդ շաբաթ։ Tell՝ մեկ session, spaced recall չկա, «training-ը արեցինք»՝ որպես անցյալ և ավարտված։
12. **Mentoring-ը սահում է HR/discipline՝ առանց handoff-ի։** Զարգացման զրույցը լուռ դառնում է performance-գործողության փաստաթղթավորում։ Tell՝ note-եր են պահվում որպես ապացույց, capability-management լեզու, people-org/legal route չկա։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է հարցմանը (learning path / onboarding plan / coaching plan / assessment rubric / knowledge-transfer map / հասկացության բացատրություն), ոչ generic advice։
- Ամեն objective observable behavior է՝ condition-ով և standard-ով. plan-ը նշում է learner-ի stage-ը և հասցեագրում է դրան։
- Practice-ը կրում է retrieval և spacing. scaffolding-ը ունի հստակ fade point-եր. նպատակի նշաձողը (recall ընդդեմ transfer) test-ված է transfer task-ով։
- Assessment-ը align է objective ↔ task ↔ criteria ↔ evidence. feedback-ը կոնկրետ է, ժամանակին, criterion-referenced։
- Knowledge-transfer artifact-ները capture են անում tacit decision-ները, failure mode-երը և owner-ները — ոչ միայն happy path-ը — և իջեցնում bus factor-ը։
- Safety routing-ը հստակ է. skill-gap-ը բաժանված է motivation/tooling/process-ից. discipline/termination/capability-management-ը ուղղորդվում է people-org/legal. ոլորտային փաստերը SME-owned են, երբեք հորինված։
- **Ստուգի՛ր demonstrated behavior-ով, ոչ attendance-ով** — ապացույցը learner-ի անելն է behavior-ը մինչև standard, հետո, նոր case-ի վրա։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **learning objective** (observable behavior, condition, standard, transfer task բաց) · **instructional fit** (novice/expert stage-ը driving է worked example-ը, load-ը և pace-ը. մեծահասակի համար՝ Knowles-ի andragogy) · **practice design** (retrieval, spacing, interleaving, faded scaffolding, real-task transfer) · **assessment** (objective↔task↔criteria↔evidence aligned. formative/summative. criterion-referenced feedback) · **knowledge transfer** (tacit decision, failure mode, owner, practice loop captured. bus factor իջեցված)։

### Խորացում և asset-եր

`manual.md` (մեխանիզմներ — spacing/retrieval, worked-example effect, skill decomposition, assessment alignment, Knowles-ի andragogy, cognitive load/chunking, scaffolding & fading. որոշման կանոններ. failure-repair playbook) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (onboarding plan + հասկացության բացատրություն + assessment) · `output-templates.md` (learning path / onboarding plan / knowledge-transfer map) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
