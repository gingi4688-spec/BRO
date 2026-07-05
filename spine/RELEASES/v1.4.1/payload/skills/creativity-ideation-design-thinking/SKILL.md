---
name: "creativity-ideation-design-thinking"
description: >-
  use when the work is idea generation, breaking fixation, reframing a problem, structured divergence (SCAMPER, Crazy 8s, analogical transfer, TRIZ, Six Thinking Hats), constraint-aware convergence (impact/effort, weighted desirability-feasibility-viability, assumption mapping), running a divergence-to-convergence session, or designing the conditions for creativity (incubation, psychological safety, async ideation) — for decisions, critique, planning, ideation artifacts, teaching, or evaluation. use as lead when the central deliverable is an ideation/concept/convergence artifact (idea sprint, SCAMPER sheet, assumption grid, concept-selection matrix, prototype learning plan). do not use as lead when another skill owns the main artifact and ideation is only one input — then support it. հայերեն՝ օգտագործիր գաղափարների ստեղծման, fixation-ը կոտրելու, problem reframing-ի, structured divergence-ի, convergence-ի, divergence-to-convergence session-ի և ստեղծարարության պայմանների ձևավորման աշխատանքի համար։
---

# Creativity, Ideation, and Design Thinking / Ստեղծարարություն, ideation և design thinking

## English

**Scope.** In: problem framing and reframing (the right problem before any idea), structured divergence (SCAMPER, Crazy 8s, analogical transfer, TRIZ inventive principles, Six Thinking Hats), constraint-aware convergence (impact/effort triage, weighted desirability-feasibility-viability, assumption mapping by impact × uncertainty), the divergence-to-convergence session itself, prototype-and-learn planning, and the conditions that make creativity reliable (divergence before judgment, incubation, psychological safety, async/remote ideation). Out: production engineering and rollout (devops/architecture own that), visual/IA layout of a chosen concept (`ui-page-structure-design` owns it), the underlying market/user research evidence (`research-knowledge-synthesis` owns it), and roadmap/staffing of the winning bet (`product-project-management` owns it). This skill turns "give me ideas" into a framed problem, a deliberate divergence that breaks fixation, a scored convergence that survives a fatal-assumption test, and a cheap experiment that tells you whether the bet is real.

**Leads / Supports.** Lead when the central deliverable is ideation- or concept-shaped: an idea sprint, a SCAMPER/TRIZ transform sheet, an analogy map, an assumption grid, a concept-selection matrix, a prototype learning plan, or the design of a divergence-to-convergence session. Support when another skill owns the artifact and ideation is one input — e.g. `product-project-management` owns the roadmap and you supply the scored concept and its riskiest assumption; `ui-page-structure-design` owns the page and you supply the divergent concept directions to lay out.

Conflict rules:
- **Convergence math vs evidence → defer the facts to research.** You own the scoring instrument (DFV weights, impact × uncertainty) and the structure of the decision, but a market-size number, a user-behavior claim, or a benchmark feeding the score is verified by `research-knowledge-synthesis` or marked verify-before-use — never invented to make a score look decisive.
- **A creative idea vs a regulated/safety constraint → the constraint is not "fuel."** When an idea trades safety, legal, privacy, or compliance for novelty, do not reframe the violation as boldness. Surface it, route it to the owning skill (legal/security/people), and keep the constraint as a hard boundary the idea must satisfy, not bypass.
- **Ideation vs implementation feasibility → diverge freely, converge honestly.** Wild ideas are protected during divergence; but at convergence, a concept whose feasibility is unknown becomes a prototype with a named experiment, not a roadmap commitment dressed as a decision.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **"Give me ideas" with no framed problem → frame first.** Name user, job-to-be-done, constraint, and the success signal before generating anything. Ideation on an unframed problem is the most common waste in the domain.
2. **Brainstorm opening with solutions → reset to the problem.** If the first move is "here are features," stop and reframe; surface the problem behind the proposed solution (How-Might-We), or the ideas will all be variants of the first guess.
3. **Stuck on obvious variants → run a forced-transform tool, not "think harder."** SCAMPER (verbs) or analogical transfer (structure from another domain) break fixation mechanically; asking for "more ideas" does not.
4. **A core tradeoff is blocking ("faster but heavier") → use TRIZ, not SCAMPER.** When the obstacle is a contradiction between two improving/worsening parameters, the contradiction matrix and inventive principles target it; SCAMPER is for transforming a known object, not resolving a contradiction.
5. **A mixed group judging while generating → separate the modes with Six Thinking Hats.** Run one hat at a time (facts, then risks, then optimism, then ideas) so critique does not kill ideas before a pattern appears.
6. **Divergence and judgment happening at once → split them in time.** Generate without evaluation first; score second, on a visible instrument. Judging during divergence is the silent idea-killer.
7. **The team is fused on one answer → force Eliminate, Reverse, and an analogy pass.** Fixation shows as every idea being a feature-add; the cure is the verbs that remove and invert, plus a structural analogy from a distant domain.
8. **Convergence by "the senior person likes it" → replace taste with an instrument.** Use impact/effort for quick triage, weighted desirability-feasibility-viability for product bets; a high score with an untested fatal assumption is a prototype, not a commitment.
9. **A winning concept rests on one unproven belief → map assumptions by impact × uncertainty and test the top one cheapest.** The riskiest assumption, not the whole idea, is what a prototype exists to attack.
10. **Analogy borrowed → copy the relation, not the surface.** Map actors, constraints, feedback loops, and failure modes across domains; an analogy that yields a metaphor but no mechanism is discarded.
11. **Group ideation flattened by status/loudness → go async and silent first.** Independent written/sketched generation (brainwriting, Crazy 8s) before discussion beats verbal round-robins on both volume and diversity; pool, then discuss.
12. **A hard problem and no progress → schedule incubation, don't grind.** After loaded divergence, a deliberate break (sleep, a different task) is a real mechanism for insight; protect it instead of forcing one exhausted session.
13. **No experiment after selection → it is not done.** Every chosen concept ships with a cheapest-viable prototype, a learning metric, an owner, and a kill/continue rule; ideas that end in a list teach nothing.
14. **Novelty with a safety/regulated edge → boundary first, idea second.** Do not turn a compliance, privacy, or safety limit into "creative license"; route it and keep it as a constraint the concept must satisfy.

### Failure modes to prevent / Ձախողման ձևեր

1. **Solving the wrong problem.** Brilliant ideation aimed at a problem nobody framed; the output is a polished answer to the wrong question. Tell: no user/job/constraint stated, yet a full idea list and a "winner."
2. **Brainstorm that starts with solutions.** The session opens with features, so every idea is a variant of the first guess and the real problem is never touched. Tell: "here are 10 features" with no How-Might-We and no problem statement.
3. **Judgment during divergence.** Ideas are critiqued as they appear, so the group converges on the safe first answer before a pattern can form. Tell: "yes, but…" in the generation phase; few wild ideas survive.
4. **Fixation never broken.** Every idea is a feature-add on the obvious object; Eliminate, Reverse, and analogy were never run. Tell: a long list, all additive, all near the starting point.
5. **Analogy that is decoration.** A vivid metaphor ("make it like an airport") with no transferred mechanism. Tell: the analogy changes the language but not a single design decision.
6. **TRIZ contradiction ignored.** A real tradeoff is "balanced" by splitting the difference instead of being resolved as a contradiction. Tell: "we compromised on both" where an inventive principle (segmentation, separation, the other-way-round) was available.
7. **Convergence by taste.** The favorite idea wins; no impact/effort, no DFV, no assumption ranking. Tell: a "decision" with no scoring instrument and no riskiest-assumption named.
8. **Fatal assumption shipped as a roadmap commitment.** A high-scoring concept with an untested make-or-break belief is treated as decided. Tell: a roadmap line with no prototype and no experiment behind the key assumption.
9. **Prototype that validates aesthetics, not risk.** A polished mock tests "do people like the look," not "is the make-or-break assumption true." Tell: a beautiful prototype that cannot fail in a way that would change the plan.
10. **Conditions for creativity ignored.** One tired session, status hierarchy in the room, no incubation, no async path; output blamed on "the team isn't creative." Tell: a single live meeting, loudest voice wins, no silent/written phase.
11. **Idea theater (framework as performance).** The biggest, fanciest framework is run to look rigorous, adding ceremony without changing a decision. Tell: a five-stage process where a single SCAMPER verb or impact/effort cut would have decided it.
12. **Regulated constraint reframed as "creativity fuel."** A safety/legal/privacy boundary is bent for novelty and called bold. Tell: the "innovative" idea only works if a real constraint is ignored.

### Acceptance criteria / Ընդունման չափանիշ

- The problem is framed (user, job, constraint, success signal) before any idea — or the answer explicitly reframes an unframed request.
- The artifact matches the decision (idea sprint / SCAMPER or TRIZ sheet / analogy map / assumption grid / concept-selection matrix / prototype learning plan), not generic advice.
- Divergence used a real mechanism (forced-transform verbs, structural analogy, TRIZ principle, or parallel-thinking hats), not "think harder," and was separated in time from judgment.
- Convergence used a visible instrument (impact/effort or weighted DFV), named the riskiest assumption by impact × uncertainty, and routed it to a cheapest-viable prototype.
- Every chosen concept carries an experiment: a learning metric, an owner, and a kill/continue rule.
- Safety/regulated constraints are kept as hard boundaries and routed to the owning skill, not reframed as novelty.
- Facts feeding any score are sourced or marked verify-before-use; no invented market sizes, benchmarks, or quotes.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **divergence quality** (multiple real mechanisms — SCAMPER/analogy/TRIZ/constraint-removal — not more-of-the-same) · **problem frame** (user, job, constraint, success signal shape the ideation) · **convergence math** (weighted DFV or impact × uncertainty drives the choice, taste does not) · **prototype fit** (the cheapest prototype isolates the single riskiest assumption) · **learning loop** (experiment, learning metric, owner, and kill/continue rule are explicit).

### Deep dive & assets

`manual.md` (operating principle, mechanism reference incl. TRIZ + Six Thinking Hats + conditions-for-creativity, decision rules, failure-repair playbook) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (onboarding idea sprint + a divergence-to-convergence session) · `output-templates.md` (idea-sprint brief / assumption grid / concept-selection matrix) · `red-team-gate.md` (domain reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ problem framing և reframing (ճիշտ խնդիրը՝ ցանկացած գաղափարից առաջ), structured divergence (SCAMPER, Crazy 8s, analogical transfer, TRIZ-ի inventive principle-ներ, Six Thinking Hats), constraint-aware convergence (impact/effort triage, weighted desirability-feasibility-viability, assumption-ների քարտեզում՝ impact × uncertainty-ով), հենց divergence-to-convergence session-ը, prototype-and-learn պլանավորում և այն պայմանները, որ ստեղծարարությունը դարձնում են հուսալի (divergence մինչ judgment, incubation, psychological safety, async/remote ideation)։ Դուրս՝ production engineering-ը և rollout-ը (devops/architecture-ինն են), ընտրված concept-ի visual/IA դասավորությունը (`ui-page-structure-design`-ինն է), հիմքում ընկած market/user research-ի ապացույցը (`research-knowledge-synthesis`-ինն է) և հաղթող bet-ի roadmap/staffing-ը (`product-project-management`-ինն է)։ Այս skill-ը «գաղափարներ տուր»-ը դարձնում է շրջանակված խնդիր, դիտավորյալ divergence, որ կոտրում է fixation-ը, գնահատված convergence, որ դիմանում է fatal-assumption test-ին, և էժան experiment, որ ասում է՝ bet-ը իրակա՞ն է։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը ideation-ի կամ concept-ի ձև ունի՝ idea sprint, SCAMPER/TRIZ transform sheet, analogy map, assumption grid, concept-selection matrix, prototype learning plan կամ divergence-to-convergence session-ի դիզայն։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ ideation-ը մեկ input է. օրինակ՝ `product-project-management`-ը տիրում է roadmap-ին, դու տալիս ես գնահատված concept-ը և նրա ամենառիսկային assumption-ը. `ui-page-structure-design`-ը տիրում է էջին, դու տալիս ես divergent concept-ի ուղղությունները՝ դասավորելու համար։

Կոնֆլիկտի կանոններ․
- **Convergence-ի հաշիվ ընդդեմ ապացույցի → փաստերը զիջիր research-ին։** Դու տիրում ես scoring instrument-ին (DFV weight-եր, impact × uncertainty) և որոշման կառուցվածքին, բայց market-size թիվը, user-behavior պնդումը կամ score-ը սնող benchmark-ը ստուգում է `research-knowledge-synthesis`-ը կամ նշվում է verify-before-use — երբեք չի հորինվում, որ score-ը վճռական տեսք ունենա։
- **Ստեղծագործ գաղափար ընդդեմ regulated/safety constraint-ի → constraint-ը «վառելիք» չէ։** Երբ գաղափարը safety, legal, privacy կամ compliance-ը փոխանակում է նորության հետ, խախտումը մի՛ վերաձևակերպիր որպես համարձակություն։ Ցույց տուր այն, ուղղորդիր տիրող skill-ին (legal/security/people) և constraint-ը պահիր որպես կոշտ սահման, որ գաղափարը պետք է բավարարի, ոչ շրջանցի։
- **Ideation ընդդեմ implementation feasibility-ի → diverge արա ազատ, converge արա ազնիվ։** Wild idea-ները պաշտպանված են divergence-ի ընթացքում. բայց convergence-ին concept, որի feasibility-ն անհայտ է, դառնում է prototype՝ անվանված experiment-ով, ոչ թե որոշման հագած roadmap commitment։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **«Գաղափարներ տուր»՝ առանց շրջանակված խնդրի → նախ շրջանակիր։** Անվանի՛ր user-ը, job-to-be-done-ը, constraint-ը և success signal-ը՝ նախքան որևէ բան ստեղծելը։ Չշրջանակված խնդրի վրա ideation-ը ոլորտի ամենատարածված վատնումն է։
2. **Brainstorm-ը բացվում է solution-ով → վերադարձիր խնդրին։** Եթե առաջին քայլը «ահա feature-ները» է, կանգնի՛ր և reframe արա. ցույց տուր առաջարկվող լուծման հետևի խնդիրը (How-Might-We), այլապես բոլոր գաղափարները կլինեն առաջին գուշակության variant-ները։
3. **Stuck obvious variant-ների վրա → գործարկիր forced-transform գործիք, ոչ թե «ավելի շատ մտածիր»։** SCAMPER-ը (բայերը) կամ analogical transfer-ը (կառուցվածք այլ ոլորտից) fixation-ը կոտրում են մեխանիկորեն. «ավելի շատ գաղափար» խնդրելը՝ ոչ։
4. **Հիմնական tradeoff է բլոկում («ավելի արագ, բայց ավելի ծանր») → օգտագործիր TRIZ, ոչ SCAMPER։** Երբ խոչընդոտը երկու բարելավվող/վատացող պարամետրի contradiction է, contradiction matrix-ը և inventive principle-ները թիրախավորում են այն. SCAMPER-ը հայտնի object-ը transform անելու համար է, ոչ contradiction լուծելու։
5. **Խառը խումբ, որ դատում է ստեղծելու ընթացքում → բաժանիր ռեժիմները Six Thinking Hats-ով։** Մեկ hat մի անգամ (փաստեր, հետո ռիսկեր, հետո optimism, հետո գաղափարներ), որ critique-ը գաղափարները չսպանի մինչև pattern-ի երևալը։
6. **Divergence-ն ու judgment-ը միաժամանակ են → բաժանիր ժամանակով։** Նախ ստեղծիր առանց գնահատման. գնահատիր երկրորդը՝ տեսանելի instrument-ի վրա։ Divergence-ի ընթացքում դատելը գաղափարի լուռ սպանողն է։
7. **Թիմը միաձուլվել է մեկ պատասխանի շուրջ → ստիպիր Eliminate, Reverse և analogy pass։** Fixation-ը երևում է որպես ամեն գաղափար՝ feature-add. դեղը հանող ու շրջող բայերն են, plus հեռու ոլորտից structural analogy։
8. **Convergence «senior-ին դուր է գալիս»-ով → ճաշակը փոխարինիր instrument-ով։** Արագ triage-ի համար impact/effort, product bet-ի համար weighted desirability-feasibility-viability. բարձր score՝ չստուգված fatal assumption-ով, prototype է, ոչ commitment։
9. **Հաղթող concept-ը հենվում է մեկ չապացուցված համոզմունքի վրա → քարտեզիր assumption-ները impact × uncertainty-ով և ամենավերևը test արա ամենաէժան ձևով։** Ամենառիսկային assumption-ը, ոչ ամբողջ գաղափարը, այն է, ինչի համար prototype-ը գոյություն ունի։
10. **Analogy ես փոխառում → copy արա relation-ը, ոչ surface-ը։** Քարտեզիր actors, constraints, feedback loops և failure modes-ը ոլորտների միջև. analogy, որ տալիս է metaphor, բայց ոչ mechanism, discard է։
11. **Խմբային ideation-ը հարթվում է status-ով/բարձրաձայնությամբ → գնա async ու լուռ՝ առաջինը։** Անկախ գրավոր/sketch-ով ստեղծումը (brainwriting, Crazy 8s) մինչ քննարկումը գերազանցում է verbal round-robin-ին և՛ ծավալով, և՛ բազմազանությամբ. pool արա, հետո քննարկիր։
12. **Դժվար խնդիր և առաջընթաց չկա → ժամանակ տրամադրիր incubation-ին, մի՛ մաշվիր։** Բեռնված divergence-ից հետո դիտավորյալ ընդմիջումը (քուն, այլ task) insight-ի իրական մեխանիզմ է. պաշտպանիր այն՝ մեկ հոգնած session ստիպելու փոխարեն։
13. **Ընտրությունից հետո experiment չկա → done չէ։** Ամեն ընտրված concept ship-վում է cheapest-viable prototype-ով, learning metric-ով, owner-ով և kill/continue rule-ով. ցուցակով ավարտվող գաղափարը ոչինչ չի սովորեցնում։
14. **Նորություն՝ safety/regulated եզրով → նախ boundary, հետո գաղափար։** compliance, privacy կամ safety սահմանը մի՛ դարձրու «creative license». ուղղորդիր այն և պահիր որպես constraint, որ concept-ը պետք է բավարարի։

### Ձախողման ձևեր

1. **Սխալ խնդրի լուծում։** Փայլուն ideation՝ ուղղված խնդրի, որ ոչ ոք չի շրջանակել. արդյունքը հղկված պատասխան է սխալ հարցին։ Tell՝ user/job/constraint նշված չէ, բայ կա ամբողջ idea list և «հաղթող»։
2. **Brainstorm, որ սկսում է solution-ով։** Session-ը բացվում է feature-ներով, ուստի ամեն գաղափար առաջին գուշակության variant է, և իրական խնդրին երբեք չեն դիպչում։ Tell՝ «ահա 10 feature»՝ առանց How-Might-We-ի և problem statement-ի։
3. **Judgment divergence-ի ընթացքում։** Գաղափարները քննադատվում են հենց երևալիս, ուստի խումբը converge է անում ապահով առաջին պատասխանին՝ նախքան pattern-ը ձևավորվելը։ Tell՝ «այո, բայց…» generation phase-ում. քիչ wild idea է գոյատևում։
4. **Fixation, որ երբեք չի կոտրվել։** Ամեն գաղափար feature-add է obvious object-ի վրա. Eliminate, Reverse և analogy երբեք չեն գործարկվել։ Tell՝ երկար ցուցակ, ամբողջը additive, ամբողջը մեկնարկից մոտ։
5. **Analogy, որ դեկորացիա է։** Վառ metaphor («դարձրու օդանավակայանի պես»)՝ առանց փոխանցված mechanism-ի։ Tell՝ analogy-ն փոխում է լեզուն, բայց ոչ մի design որոշում։
6. **TRIZ contradiction-ը անտեսված։** Իրական tradeoff-ը «հավասարակշռվում է»՝ տարբերությունը կիսելով, contradiction-ի պես լուծվելու փոխարեն։ Tell՝ «երկուսում էլ զիջեցինք», որտեղ inventive principle (segmentation, separation, հակառակ ուղղություն) հասանելի էր։
7. **Convergence ճաշակով։** Սիրված գաղափարն է հաղթում. ոչ impact/effort, ոչ DFV, ոչ assumption ranking։ Tell՝ «որոշում»՝ առանց scoring instrument-ի և անվանված ամենառիսկային assumption-ի։
8. **Fatal assumption-ը ship-ված որպես roadmap commitment։** Բարձր score concept՝ չստուգված make-or-break համոզմունքով, համարվում է որոշված։ Tell՝ roadmap տող՝ առանց prototype-ի և key assumption-ի հետևի experiment-ի։
9. **Prototype, որ aesthetics է validate անում, ոչ ռիսկը։** Հղկված mock-ը test է անում «մարդկանց դուր է գալիս տեսքը», ոչ «make-or-break assumption-ը ճի՞շտ է»։ Tell՝ գեղեցիկ prototype, որ չի կարող fail անել պլանը փոխող ձևով։
10. **Ստեղծարարության պայմանները անտեսված։** Մեկ հոգնած session, status hierarchy սենյակում, ոչ incubation, ոչ async path. արդյունքը մեղադրվում է «թիմը creative չէ»-ով։ Tell՝ մեկ live meeting, բարձրաձայնը հաղթում է, ոչ silent/written phase։
11. **Idea theater (framework-ը որպես ներկայացում)։** Ամենամեծ, ամենափարթամ framework-ը գործարկվում է rigorous երևալու համար՝ ceremony ավելացնելով առանց որոշում փոխելու։ Tell՝ հնգաստիճան process, որտեղ մեկ SCAMPER բայ կամ impact/effort կտրվածք կորոշեր այն։
12. **Regulated constraint-ը վերաձևակերպված որպես «creativity fuel»։** safety/legal/privacy սահմանը ծռվում է նորության համար և կոչվում համարձակ։ Tell՝ «նորարար» գաղափարը աշխատում է միայն, եթե իրական constraint-ը անտեսվի։

### Ընդունման չափանիշ

- Խնդիրը շրջանակված է (user, job, constraint, success signal)՝ ցանկացած գաղափարից առաջ — կամ պատասխանը բացահայտ reframe է անում չշրջանակված հարցումը։
- Artifact-ը համապատասխանում է որոշմանը (idea sprint / SCAMPER կամ TRIZ sheet / analogy map / assumption grid / concept-selection matrix / prototype learning plan), ոչ generic advice։
- Divergence-ն օգտագործել է իրական mechanism (forced-transform բայեր, structural analogy, TRIZ principle կամ parallel-thinking hats), ոչ «ավելի շատ մտածիր», և ժամանակով բաժանված է judgment-ից։
- Convergence-ն օգտագործել է տեսանելի instrument (impact/effort կամ weighted DFV), անվանել է ամենառիսկային assumption-ը impact × uncertainty-ով և ուղղել այն cheapest-viable prototype-ի։
- Ամեն ընտրված concept կրում է experiment՝ learning metric, owner և kill/continue rule։
- Safety/regulated constraint-ները պահվում են որպես կոշտ սահման և ուղղորդվում տիրող skill-ին, ոչ վերաձևակերպվում որպես նորություն։
- Որևէ score սնող փաստերը sourced են կամ նշված verify-before-use. ոչ մի հորինված market size, benchmark կամ quote։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **divergence quality** (բազմաթիվ իրական mechanism — SCAMPER/analogy/TRIZ/constraint-removal — ոչ թե նույնի ավելին) · **problem frame** (user, job, constraint, success signal ձևավորում են ideation-ը) · **convergence math** (weighted DFV կամ impact × uncertainty է որոշում, ոչ ճաշակը) · **prototype fit** (ամենաէժան prototype-ը isolate է անում միակ ամենառիսկային assumption-ը) · **learning loop** (experiment, learning metric, owner և kill/continue rule բաց են)։

### Խորացում և asset-եր

`manual.md` (գործառնական սկզբունք, mechanism reference՝ ներառյալ TRIZ + Six Thinking Hats + ստեղծարարության պայմաններ, որոշման կանոններ, failure-repair playbook) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (onboarding idea sprint + divergence-to-convergence session) · `output-templates.md` (idea-sprint brief / assumption grid / concept-selection matrix) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
