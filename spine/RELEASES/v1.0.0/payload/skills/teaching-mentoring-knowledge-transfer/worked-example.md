# Teaching, Mentoring, and Knowledge Transfer worked examples

## English

### Example A — Onboarding / ramp plan

**Prompt.** A backend engineer just joined a 6-person team that owns a payments service. Their manager wants them "productive fast." Build the onboarding plan.

**Senior answer.** First, redefine "productive" as a demonstrated behavior, not a reading list: *by end of week 4, the new engineer independently ships and deploys a small, real change to the payments service through the normal review and rollout process.* Work backward from that.

- **Week 1 — orient, not firehose.** Goal: ship one trivial but real change (a log line, a config tweak) end-to-end. Give only the *minimum* context needed for that path — repo, local run, the deploy pipeline, who reviews — not the whole architecture. Pair with a named buddy for the first PR. Milestone (observable): merged + deployed change, and they can describe the deploy/rollback path in their own words.
- **Week 2 — one subsystem, with a worked example.** Pick one bounded area (say, the refund flow). Have the buddy walk one real ticket as a worked example, narrating the *decisions* (why this validation, what breaks without it). Then the new engineer takes a similar low-risk ticket with the buddy reviewing. Milestone: a refund-area change shipped, with a short written note of the two non-obvious decisions they hit.
- **Week 3 — fade the scaffold.** They pick up tickets across two subsystems; the buddy reviews but stops pre-explaining — the engineer proposes the approach first, buddy critiques. Introduce on-call shadowing (observe, not own). Milestone: two changes shipped with the approach proposed unaided; one incident shadowed with notes.
- **Week 4 — unaided, with a check.** They own a small feature ticket end-to-end (design note → review → canary → verify-live → done) with normal (not buddy) review. Milestone = the definition of "productive" above, demonstrated. Buddy check-in moves from daily to weekly.
- **Throughout:** a weekly 30-minute check-in (blockers, what's still fuzzy), and a running "questions I had to ask" doc — which becomes a fix to the onboarding gaps for the next hire (and lowers the team's bus factor).

Assumption labeled: this assumes the gap is genuinely ramp/skill. If the engineer is blocked by access, unclear expectations, or a tooling defect, that is not an onboarding problem and the plan above will not fix it.

**Why this passes.** It opens by converting the manager's vibe word ("productive fast") into one observable, dated behavior — ship and deploy a real change unaided by week 4 — and builds every week backward from it, so "done" is testable rather than a feeling. It protects working memory in week 1 by giving only the minimum context for one end-to-end path instead of the whole architecture (chunking, not firehose), uses a buddy-narrated worked example in week 2 with the *decisions* surfaced, and then explicitly **fades the scaffold** in week 3 (buddy stops pre-explaining; the engineer proposes first) so the support is removed on a schedule rather than left on forever. Each week ends in an observable milestone, not a completed reading list, and the plan routes the non-skill case (access/expectations/tooling) away rather than prescribing onboarding for a problem onboarding cannot fix. The "questions I had to ask" doc closes the loop into a bus-factor improvement for the next hire.

### Example B — Concept explanation

**Prompt.** Explain "idempotency" to a junior developer who keeps writing payment endpoints that double-charge on a retry. Make sure it lands.

**Senior answer.** Start from what they already know — a familiar anchor, one new idea, the misconception, then a check on a *new* case.

- **Anchor (prior knowledge):** "You know an elevator call button — press it once or press it five times while waiting, the elevator still comes exactly once. The extra presses change nothing. That property is *idempotency*: doing the operation again has the same effect as doing it once."
- **One new idea (chunk):** "Your payment endpoint is *not* idempotent: each call charges. So when the client retries after a timeout — and clients *will* retry — you charge twice. The fix is to make 'charge' behave like the elevator button: the second identical call has no extra effect."
- **Worked instance:** "Concretely: the client sends an `Idempotency-Key` (a unique id per *intent to pay*, generated once and reused on retries). On the server, before charging, you check: have I already processed this key? If yes, return the stored result of the first charge; if no, charge, store the result against the key, then return it. Same key in → same single charge → same response, no matter how many times it arrives."
- **Name the misconception explicitly:** "The trap is thinking 'retries are rare, I'll ignore them' or 'I'll just dedupe by amount + user.' Retries are normal (timeouts, mobile networks, load balancers), and amount+user collides on two legitimate identical purchases. The *key* is what makes it safe, because it identifies the *intent*, not the values."
- **Check for understanding (new case, not the one I used):** "Here's a different one: a 'cancel subscription' endpoint. Is it naturally idempotent? Walk me through what happens if it's called twice, and if not, what key you'd use." (If they can reason it out on this unseen case, the concept transferred; if they just repeat the elevator line, it didn't.)

**Why this passes.** It does not restate the definition in fancier words — it anchors to a concrete prior-knowledge analogy (the elevator button), introduces exactly **one new idea at a time** to protect working memory, and grounds it in a *worked instance* with the actual mechanism (the idempotency key and the check-store-return flow) rather than abstract prose. Critically, it names the **specific misconception** driving this junior's bug (ignoring retries / deduping by amount) and dissolves it directly, because correcting the wrong model is what changes behavior. The close is a **transfer check on an unseen case** (cancel-subscription, not the charge example), so it tests recall and transfer rather than recognition — if the learner can only echo the analogy, the explanation has not landed and you iterate.

### Example C — Assessment design (alignment + transfer)

**Prompt.** A team ran a two-hour SQL-injection training and measured success by a 10-question multiple-choice quiz, all passed. Leadership says "the team is now secure." Critique and fix the assessment.

**Senior answer.** The assessment is misaligned: the objective is a *behavior* ("write and review code that does not introduce SQL injection"), but the measure is *recognition* ("pick the vulnerable line from four options"). Passing the quiz proves they can recognize the textbook case; it does not prove they will avoid the bug in their own code or catch it in review — that is the recognition trap. Realign objective ↔ task ↔ criteria ↔ evidence:

- **Objective (behavior):** Given a code-review of a real PR touching a query, the engineer identifies any injection risk and rewrites it with a parameterized query — to standard, on code they have not seen.
- **Task (matches the behavior):** a *transfer* task, not a quiz — review two realistic PRs (one with a subtle injection via dynamic ORDER BY that the quiz never covers, one clean) and submit the fix.
- **Criteria (explicit):** detects the risk, applies parameterization (not string-escaping), does not flag the clean PR as a false positive, explains *why* the fix removes the risk.
- **Evidence + cadence:** formative — a couple of low-stakes practice reviews during the session with feedback; summative — the transfer task above scored against the criteria; spaced — a follow-up review task two weeks later to confirm it stuck.

Then the honest reframe to leadership: a passed quiz means "the team can recognize the canonical example today," not "the team is secure." Security is demonstrated by the behavior on novel code over time, and it is owned by the security skill for the threat model — this assessment only proves the *learning*, not the system's security posture.

**Why this passes.** It diagnoses the exact failure (a recognition measure standing in for a behavioral objective) instead of just adding more questions, and it **realigns objective ↔ task ↔ criteria ↔ evidence** so the test measures what was actually taught. It replaces the multiple-choice quiz with a **transfer task on unseen code** (including a case the quiz never covered) and adds **spaced** follow-up, hitting recall and transfer rather than recognition. It writes **explicit criteria** (parameterization not escaping, no false positives, explain-why) so two reviewers would score it the same, and it refuses the overclaim — correcting "the team is now secure" to what a passed assessment actually evidences, and routing the security-posture judgment to the owning domain rather than inventing it here.

## Հայերեն

### Օրինակ A — Onboarding / ramp plan

**Prompt.** Backend engineer-ը նոր է միացել 6-հոգանոց թիմին, որ տիրում է payments service-ին։ Manager-ը ուզում է, որ նա «արագ productive» լինի։ Կառուցիր onboarding plan-ը։

**Senior պատասխան.** Նախ վերասահմանիր «productive»-ը որպես demonstrated behavior, ոչ reading list․ *4-րդ շաբաթվա վերջում նոր engineer-ը ինքնուրույն ship և deploy է անում փոքր, իրական փոփոխություն payments service-ին՝ նորմալ review և rollout process-ով։* Աշխատիր հետընթաց դրանից։

- **Շաբաթ 1 — orient, ոչ firehose.** Նպատակ՝ ship անել մեկ տրիվիալ, բայց իրական փոփոխություն end-to-end (log տող, config tweak)։ Տուր միայն *minimum* context-ը այդ path-ի համար — repo, local run, deploy pipeline, ով է review անում — ոչ ողջ architecture-ը։ Զուգիր անվանված buddy-ի հետ առաջին PR-ի համար։ Milestone (observable)՝ merged + deployed փոփոխություն, և նա կարող է իր բառերով նկարագրել deploy/rollback path-ը։
- **Շաբաթ 2 — մեկ subsystem, worked example-ով.** Ընտրիր մեկ սահմանափակ տարածք (օրինակ՝ refund flow)։ Buddy-ն մեկ իրական ticket-ով անցնում է որպես worked example՝ narrate անելով *decision*-ները (ինչու այս validation-ը, ինչ է կոտրվում առանց դրա)։ Հետո նոր engineer-ը վերցնում է նմանատիպ low-risk ticket, buddy-ն review է անում։ Milestone՝ refund-տարածքի փոփոխություն ship-ված, երկու ոչ-ակնհայտ decision-ի կարճ գրավոր note-ով։
- **Շաբաթ 3 — fade արա scaffold-ը.** Նա վերցնում է ticket-եր երկու subsystem-ով. buddy-ն review է անում, բայց դադարում է նախապես բացատրել — engineer-ն առաջարկում է approach-ը նախ, buddy-ն critique անում։ Ներմուծիր on-call shadowing (դիտել, ոչ տիրել)։ Milestone՝ երկու փոփոխություն ship-ված՝ approach-ը առանց օգնության առաջարկված. մեկ incident shadowed՝ note-երով։
- **Շաբաթ 4 — առանց օգնության, check-ով.** Նա տիրում է փոքր feature ticket-ի end-to-end (design note → review → canary → verify-live → done)՝ նորմալ (ոչ buddy) review-ով։ Milestone-ը վերևի «productive»-ի սահմանումն է՝ demonstrated։ Buddy check-in-ը ամենօրյայից դառնում է շաբաթական։
- **Ողջ ընթացքում․** շաբաթական 30-րոպեանոց check-in (blocker, ինչն է դեռ fuzzy), և ընթացիկ «հարցեր, որ ստիպված էի տալ» doc — որ դառնում է հաջորդ աշխատակցի onboarding-ի gap-երի fix (և իջեցնում թիմի bus factor-ը)։

Label-ված assumption․ սա ենթադրում է, որ gap-ը իսկապես ramp/skill է։ Եթե engineer-ը block է access-ով, անհասկանալի expectation-ով կամ tooling-ի թերությամբ, դա onboarding-ի խնդիր չէ, և վերևի plan-ը չի ուղղի այն։

**Ինչու է անցնում gate-ը.** Այն սկսում է manager-ի vibe-բառը («արագ productive») վերածելով մեկ observable, թվագրված behavior-ի — ship և deploy իրական փոփոխություն առանց օգնության 4-րդ շաբաթին — և ամեն շաբաթ կառուցում է դրանից հետընթաց, ուստի «done»-ը testable է, ոչ զգացում։ Այն պաշտպանում է working memory-ն 1-ին շաբաթին՝ տալով միայն minimum context մեկ end-to-end path-ի համար, ոչ ողջ architecture-ը (chunking, ոչ firehose), 2-րդ շաբաթին օգտագործում է buddy-narrated worked example՝ *decision*-ները բացահայտված, և հետո բացահայտ **fade է անում scaffold-ը** 3-րդ շաբաթին (buddy-ն դադարում է նախապես բացատրել. engineer-ն առաջարկում է նախ), ուստի աջակցությունը հանվում է ժամանակացույցով, ոչ թե թողնված հավերժ։ Ամեն շաբաթ ավարտվում է observable milestone-ով, ոչ ավարտված reading list-ով, և plan-ը ոչ-skill case-ը (access/expectation/tooling) ուղղորդում է, ոչ թե onboarding նշանակում խնդրի համար, որ onboarding-ը չի կարող ուղղել։ «Հարցեր, որ ստիպված էի տալ» doc-ը փակում է loop-ը հաջորդ աշխատակցի bus-factor-ի բարելավման մեջ։

### Օրինակ B — Հասկացության բացատրություն

**Prompt.** Բացատրիր «idempotency»-ն junior developer-ին, որ անընդհատ payment endpoint-եր է գրում, որոնք retry-ի վրա կրկնակի charge են անում։ Համոզվիր, որ հասնում է։

**Senior պատասխան.** Սկսիր այն, ինչ նա արդեն գիտի — ծանոթ anchor, մեկ նոր գաղափար, misconception-ը, հետո check *նոր* case-ի վրա։

- **Anchor (prior knowledge)․** «Գիտես elevator-ի կանչի կոճակը — սեղմիր մեկ անգամ կամ սեղմիր հինգ անգամ սպասելիս, elevator-ը նույնն է գալիս ճիշտ մեկ անգամ։ Ավելորդ սեղմումները ոչինչ չեն փոխում։ Այդ հատկությունը *idempotency*-ն է․ գործողությունը կրկին անելը նույն effect-ն ունի, ինչ մեկ անգամ անելը»։
- **Մեկ նոր գաղափար (chunk)․** «Քո payment endpoint-ը idempotent *չէ*․ ամեն call charge է անում։ Ուստի երբ client-ը retry է անում timeout-ից հետո — և client-ը *կանի* retry — դու երկու անգամ ես charge անում։ Fix-ը 'charge'-ը elevator-ի կոճակի պես վարվել տալն է․ երկրորդ նույնական call-ը ավելորդ effect չունի»։
- **Worked instance․** «Կոնկրետ․ client-ը ուղարկում է `Idempotency-Key` (եզակի id ամեն *վճարելու մտադրության* համար, գեներացված մեկ անգամ և կրկնակի օգտագործված retry-ի վրա)։ Server-ում, charge-ից առաջ, ստուգում ես․ արդեն մշակե՞լ եմ այս key-ը։ Եթե այո՝ վերադարձրու առաջին charge-ի պահված result-ը. եթե ոչ՝ charge արա, պահիր result-ը key-ի դեմ, հետո վերադարձրու։ Նույն key ներս → նույն մեկ charge → նույն response, անկախ նրանից, քանի անգամ է գալիս»։
- **Անվանիր misconception-ը բացահայտ․** «Trap-ը մտածելն է 'retry-ները հազվադեպ են, կանտեսեմ' կամ 'dedupe կանեմ amount + user-ով'։ Retry-ները նորմալ են (timeout, mobile network, load balancer), և amount+user-ը բախվում է երկու օրինական նույնական գնման վրա։ *Key*-ն է, ինչ դարձնում է ապահով, որովհետև այն identify է անում *մտադրությունը*, ոչ value-ները»։
- **Check for understanding (նոր case, ոչ իմ օգտագործածը)․** «Ահա մեկ ուրիշը․ 'cancel subscription' endpoint։ Բնականից idempotent է՞։ Անցկացրու ինձ հետ, թե ինչ է լինում, եթե երկու անգամ կանչվի, և եթե ոչ՝ ինչ key կօգտագործեիր»։ (Եթե նա կարող է այս չտեսնված case-ի վրա reason անել, հասկացությունը transfer եղավ. եթե միայն կրկնում է elevator-ի տողը՝ ոչ։)

**Ինչու է անցնում gate-ը.** Այն չի վերաձևակերպում սահմանումը ավելի ճոխ բառերով — այն anchor է անում կոնկրետ prior-knowledge analogy-ի (elevator-ի կոճակ), ներմուծում է ճիշտ **մեկ նոր գաղափար միանգամից**՝ working memory-ն պաշտպանելու, և հիմնավորում է *worked instance*-ով՝ իրական mechanism-ով (idempotency key-ը և check-store-return flow-ը), ոչ abstract արձակով։ Կարևորը՝ այն անվանում է **կոնկրետ misconception-ը**, որ վարում է այս junior-ի bug-ը (retry-ները անտեսել / amount-ով dedupe անել) և լուծում է այն ուղիղ, որովհետև սխալ model-ը ուղղելն է, ինչ փոխում է behavior-ը։ Փակումը **transfer check է չտեսնված case-ի վրա** (cancel-subscription, ոչ charge-ի example-ը), ուստի test է անում recall և transfer, ոչ recognition — եթե learner-ը կարող է միայն analogy-ն կրկնել, բացատրությունը չի հասել, և iterate ես անում։

### Օրինակ C — Assessment design (alignment + transfer)

**Prompt.** Թիմը անցկացրեց երկու-ժամանոց SQL-injection training և success-ը չափեց 10-հարցանոց multiple-choice quiz-ով, բոլորը անցան։ Leadership-ն ասում է «թիմն այժմ secure է»։ Critique արա և ուղղիր assessment-ը։

**Senior պատասխան.** Assessment-ը misaligned է․ objective-ը *behavior* է («գրել և review անել code, որ SQL injection չի ներմուծում»), բայց measure-ը *recognition* է («չորս option-ից ընտրել vulnerable տողը»)։ Quiz-ն անցնելը ապացուցում է, որ կարող են ճանաչել դասագրքային case-ը. չի ապացուցում, որ կխուսափեն bug-ից սեփական code-ում կամ կբռնեն review-ում — դա recognition trap-ն է։ Realign արա objective ↔ task ↔ criteria ↔ evidence․

- **Objective (behavior)․** Տրված իրական PR-ի code-review-ի դեպքում, որ query է դիպչում, engineer-ը identify է անում injection risk-ը և rewrite է անում parameterized query-ով — մինչև standard, code-ի վրա, որ չի տեսել։
- **Task (համապատասխանում է behavior-ին)․** *transfer* task, ոչ quiz — review երկու իրատեսական PR (մեկը՝ նուրբ injection-ով dynamic ORDER BY-ով, որ quiz-ը երբեք չծածկեց, մեկը՝ մաքուր) և submit արա fix-ը։
- **Criteria (բացահայտ)․** detect է անում risk-ը, կիրառում parameterization (ոչ string-escaping), մաքուր PR-ը false positive չի flag անում, բացատրում է *ինչու* fix-ը հանում է risk-ը։
- **Evidence + cadence․** formative — մի քանի low-stakes practice review session-ի ընթացքում feedback-ով. summative — վերևի transfer task-ը score-ված criteria-ի դեմ. spaced — follow-up review task երկու շաբաթ անց՝ հաստատելու, որ մնաց։

Հետո ազնիվ reframe leadership-ին․ անցած quiz-ը նշանակում է «թիմը կարող է այսօր ճանաչել canonical example-ը», ոչ «թիմը secure է»։ Security-ն demonstrated է behavior-ով նոր code-ի վրա ժամանակի ընթացքում, և threat model-ի համար տիրվում է security skill-ի կողմից. այս assessment-ը ապացուցում է միայն *learning-ը*, ոչ համակարգի security posture-ը։

**Ինչու է անցնում gate-ը.** Այն ախտորոշում է ճշգրիտ ձախողումը (recognition measure, որ կանգնում է behavioral objective-ի փոխարեն), ոչ թե պարզապես ավելի շատ հարց ավելացնում, և **realign է անում objective ↔ task ↔ criteria ↔ evidence**, ուստի test-ը չափում է այն, ինչ իրականում սովորեցվեց։ Այն փոխարինում է multiple-choice quiz-ը **transfer task-ով չտեսնված code-ի վրա** (ներառյալ case, որ quiz-ը երբեք չծածկեց) և ավելացնում **spaced** follow-up, հարվածելով recall-ին և transfer-ին, ոչ recognition-ին։ Այն գրում է **բացահայտ criteria** (parameterization ոչ escaping, ոչ false positive, explain-why), ուստի երկու reviewer նույն կերպ score կանեն, և մերժում է overclaim-ը — «թիմն այժմ secure է»-ն ուղղելով այն, ինչ անցած assessment-ն իրականում evidence է, և security-posture-ի judgment-ը ուղղորդելով տիրող ոլորտին, ոչ թե այստեղ հորինելով։
