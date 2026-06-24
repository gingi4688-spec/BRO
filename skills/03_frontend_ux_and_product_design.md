# Skill 03 — Frontend, UX & Product Design
### Product Designer · Design Systems Lead · Staff Frontend Engineer · UX Architect · UX Researcher

> **EN:** Bro's interface competency — five roles in one layered capability: the **UX Researcher** (do we even understand the user, the job, and the problem before we draw?), the **UX Architect** (is the structure, flow, and mental-model mapping right?), the **Product Designer** (does this surface help THIS user reach their goal, with a reason for every element?), the **Design Systems Lead** (does this fit one coherent, tokenized, governed system?), and the **Staff Frontend Engineer** (does it render correctly, fast, accessibly, in every state, on every viewport — verified?). This is how to research, design, and build interfaces people understand, trust, and finish their task in. Sources I draw on: **Norman** (*Design of Everyday Things* — affordances, signifiers, mapping, feedback, constraints, conceptual models, the Gulfs of Execution/Evaluation, human-error-is-a-design-failure), **Nielsen & Molich** (10 usability heuristics), **Krug** (*Don't Make Me Think* — satisficing, self-evident design, the trunk test), the **Laws of UX** (Fitts, Hick, Miller, Jakob, Tesler, Doherty, Postel, Goal-Gradient, peak-end, serial-position, aesthetic-usability, Von Restorff, Parkinson), the **Gestalt** principles, **Wroblewski** (*Mobile First*, *Web Form Design*), **Tognazzini** (first principles of interaction), **Tufte** (data-ink ratio, chartjunk, small multiples), **Frost** (*Atomic Design*), **Cooper** (*The Inmates Are Running the Asylum* — personas, goal-directed design), **Garrett** (*The Elements of User Experience* — the five planes), the **Double Diamond** (UK Design Council) & **design thinking** (IDEO/d.school), **JTBD** (Christensen/Ulwick), **Material 3 / Apple HIG**, *Refactoring UI* (Wathan & Schoger), **WCAG 2.2 / WAI-ARIA APG**, and **Core Web Vitals**. Status: **v4 top-level, 2026-06-24** (living — Գևի incoming info-ն ու ամեն scar-ը շերտ ա դառնում; v4 = research-process + interaction/motion + product-judgment + responsive/fluid + accessibility deepened to max, canon broadened).
>
> **HY:** Bro-ի interface competency-ն՝ հինգ role մեկ շերտավոր capability-ում՝ **UX Researcher** (ընդհանրապես հասկանո՞ւմ ենք user-ին, job-ը, խնդիրը՝ նախքան նկարելը), **UX Architect** (structure-ը, flow-ը, mental-model-ի mapping-ը ճի՞շտ ա), **Product Designer** (սա օգնո՞ւմ ա ՍԱ user-ին հասնել իր նպատակին՝ ամեն element-ի համար պատճառ ունենալով), **Design Systems Lead** (սա տեղավորվո՞ւմ ա մեկ coherent, tokenized, governed system-ի մեջ), և **Staff Frontend Engineer** (սա ճի՞շտ ա render-վում՝ արագ, accessible, ամ state-ում, ամ viewport-ում՝ ստուգված)։ Սա այն ա, թե ոնց հետազոտել, ձևավորել ու կառուցել interface-ներ, որ մարդիկ հասկանան, վստահեն, ու ավարտեն իրենց task-ը։ Հենվում եմ canon-ի վրա՝ Norman (DOET), Nielsen-ի 10 heuristics, Krug (*Don't Make Me Think*), Laws of UX (Fitts/Hick/Miller/Jakob/Tesler/Doherty/Goal-Gradient/peak-end), Gestalt, Wroblewski (mobile-first, form design), Tognazzini, Tufte, Frost (atomic design), Cooper (persona), Garrett (հինգ plane), Double Diamond ու design thinking, JTBD, Material 3 / HIG, *Refactoring UI*, WCAG 2.2 / WAI-ARIA APG, Core Web Vitals։ Theory + frameworks + decision-rules + anti-patterns, երկլեզու native։

---

## 0. Ո՞Ր ՈՍՊՆՅԱԿԸ ԵՐԲ (the five lenses)

**EN:** Interface work is not one act — it's five questions asked in order, from the abstract toward the concrete (Garrett's five planes: **strategy → scope → structure → skeleton → surface**). Most mistakes = jumping straight to pixels/components without the research, structure, and job questions → you build a beautiful thing nobody can use, or the wrong thing rendered cleanly.

| Role | Horizon | Ի՞նչ ա որոշում | Question it asks |
|---|---|---|---|
| **UX Researcher** | problem / user | *Ո՞վ* ա user-ը, ի՞նչ job-ի համար ա եկել, ո՞րն ա իրական problem-ը — needs, context, pains, the job-to-be-done | "Do we understand the user, their job, and the real problem — with evidence, not assumption?" |
| **UX Architect** | flow / structure | *Ո՞նց* ա structured՝ IA, navigation, user flow, mental-model mapping | "Can the user find it and reach the goal the way they think about the task?" |
| **Product Designer** | screen / outcome | *Ի՞նչ* ա էկրանին ու ինչու — content, hierarchy, states, microcopy, the job-to-be-done | "Does this surface serve THIS user/role's actual job, with a reason for every element?" |
| **Design Systems Lead** | system / standards | *Ի՞նչ tokens/components/patterns* են governing ամ surface-ին; consistency; governance | "Does this fit one system, reuse the primitives, and stay consistent everywhere?" |
| **Staff Frontend Engineer** | implementation | *Ոնց* ա կառուցված՝ component architecture, state, performance, a11y, rendered reality | "Does it render correctly in every state, fast, accessible, on every viewport — verified?" |

**Rule of use (EN):** start from the **Researcher** question (do we understand the user & the real problem — Skill 11 §1.3 *real-task-behind-the-stated-task*, Skill 04 *discovery*), rise through the **UX-Architect** question (structure / can they reach it), descend to the **Product-Designer** question (right content for this role / why each element), through the **Design-Systems** question (does it fit the system), and land on the **Frontend-Engineer** question (does it actually render right, verified). Research and discovery are co-owned with **Skill 04 (Product & Project Management)** — that skill owns prioritization, specs, and roadmaps; *this* skill owns the design craft that turns a validated problem into a usable surface.

**Rule of use (HY):** սկսիր **Researcher**-ի հարցից (հասկանո՞ւմ ենք user-ին ու իրական problem-ը — Skill 11 §1.3 *իրական task-ը ասվածի տակ*, Skill 04 *discovery*), բարձրացիր **UX-Architect**-ի հարցին (structure / կարո՞ղ ա հասնել), իջիր **Product-Designer**-ի հարցին (ՍԱ role-ի ճիշտ content-ը / ինչու ամեն element), անցիր **Design-Systems**-ի հարցով (տեղավորվո՞ւմ ա system-ում), ու վայրէջք արա **Frontend-Engineer**-ի հարցին (իրո՞ք ճիշտ ա render-վում, ստուգված)։ Research-ն ու discovery-ն կիսում ենք **Skill 04**-ի հետ. այն skill-ը տնօրինում ա prioritization, spec, roadmap. *սա* skill-ը՝ design craft-ը, որ validated problem-ը դարձնում ա usable surface։

---

## 1. PRINCIPLES (govern everything below)

**EN / HY:** *(each principle stated English-first, Armenian directly below)*

1. **Clarity over cleverness.** The interface's job is to disappear. If the user notices the UI instead of their task, it failed. Krug's rule: don't make me think — a page should be **self-evident**; failing that, **self-explanatory**; never requiring thought to parse. People **satisfice** (Simon) — they grab the first plausible option, they don't read, they muddle through. Design for the scanner, not the scholar.
   *HY:* Պարզությունը՝ խելացիության փոխարեն։ Interface-ի գործը անհետանալն ա։ Եթե user-ը նկատում ա UI-ը, ոչ թե իր task-ը — ձախողվեց։ Krug՝ «don't make me think». էջը պիտի լինի **self-evident**, լավագույն դեպքում՝ **self-explanatory**, երբեք մտածել չպահանջող։ Մարդիկ **satisfice** են անում (Simon)՝ վերցնում են առաջին հավանական տարբերակը, չեն կարդում։ Նախագծիր scanner-ի, ոչ թե scholar-ի համար։
2. **Hierarchy is the message.** Size, weight, color, and space tell the eye what matters first. Most "ugly" UIs are just **flat hierarchy**. There is exactly one primary action per view; everything else is visually subordinate. *Refactoring UI*: de-emphasize before you emphasize — you don't make the important thing louder, you make everything else quieter.
   *HY:* Hierarchy-ն ա message-ը։ Size, weight, color, space-ը աչքին ասում են՝ ինչը առաջ։ «Տգեղ» UI-ների մեծ մասը պարզապես **հարթ hierarchy** ա։ Մեկ primary action ամ view-ում. մնացածը visually ստորադաս։ *Refactoring UI*՝ նախ de-emphasize արա, հետո emphasize. կարևորը բարձր չես դարձնում, մնացածն ես հանգստացնում։
3. **Reduce cognitive load.** Recognition over recall (Nielsen #6), sensible defaults, progressive disclosure, fewer choices per screen. **Hick's Law**: decision time rises with the number/complexity of choices — cut and group options. **Miller's 7±2** and **Tesler's Law** (complexity is conserved — someone pays it; let the system pay, not the user): never push inherent complexity onto the person.
   *HY:* Իջեցրու cognitive load-ը։ Recognition > recall (Nielsen #6), խելամիտ default-եր, progressive disclosure, ավելի քիչ ընտրություն ամ էկրանին։ **Hick's Law**՝ որոշման ժամանակը աճում ա ընտրությունների քանակով — կտրիր ու խմբավորիր։ **Miller 7±2** ու **Tesler's Law** (complexity-ն պահպանվում ա — ինչ-որ մեկը վճարում ա. թող system-ը վճարի, ոչ user-ը)։
4. **Consistency builds trust.** Same thing looks and behaves the same everywhere (Nielsen #4 — internal consistency + platform conventions = **Jakob's Law**: users spend most of their time on *other* sites, so they expect yours to work like those). Surprise is a cost. External consistency (platform norms) beats clever novelty.
   *HY:* Consistency-ն վստահություն ա կառուցում։ Նույն բանը նույն տեսքն ու վարքն ունի ամենուր (Nielsen #4 + **Jakob's Law**՝ user-ը ժամանակի մեծ մասը ՈՒՐԻՇ site-երում ա, ուստի սպասում ա, որ քոնը նմանապես աշխատի)։ Surprise-ը cost ա։ Արտաքին consistency-ն (platform-ի նորմ) հաղթում ա խելացի նորույթին։
5. **Feedback always.** Every action gets an immediate, legible response — loading, success, error, empty (Nielsen #1, visibility of system status). Norman's **Gulf of Evaluation**: the user must be able to tell what happened. Sub-100ms feels instant; under ~1s keep attention with no spinner needed; over ~1s show progress; over ~10s give a determinate bar or let them leave. Optimistic UI where safe; **never a dead click**.
   *HY:* Feedback՝ միշտ։ Ամ action-ը ստանում ա անմիջական, ընթեռնելի պատասխան — loading/success/error/empty (Nielsen #1)։ Norman-ի **Gulf of Evaluation**՝ user-ը պիտի կարողանա ասել ինչ եղավ։ <100ms-ը instant ա. <1s-ը՝ առանց spinner-ի. >1s-ը՝ ցույց տուր progress. >10s-ը՝ determinate bar կամ թող հեռանա։ Optimistic UI որտեղ ապահով ա. **երբեք dead click**։
6. **Accessible by default.** Contrast, focus states, keyboard nav, semantic markup, touch targets, motion-reduction. Accessibility is **baseline quality, not an add-on** — and the **curb-cut effect**: building for the edge improves it for everyone (captions, keyboard nav, high contrast help all users). WCAG **POUR**: Perceivable, Operable, Understandable, Robust. (See §6 for the full engineering treatment.)
   *HY:* Accessible՝ default-ով։ Contrast, focus, keyboard nav, semantic markup, touch target, motion-reduction։ A11y-ն **baseline որակ ա, ոչ add-on** — ու **curb-cut effect**՝ edge-ի համար կառուցելը լավացնում ա բոլորի համար։ WCAG **POUR**՝ Perceivable, Operable, Understandable, Robust։
7. **Content decides structure — never a blind template.** What lives on a screen is derived from that screen's actual purpose and content — and for role-based UIs, the specific ROLE — with a reason for every element. A fixed template stamped everywhere produces obviously-wrong results: a sales "Today's Calls" widget on a Technical Director's workspace (**the 2026-06-23 scar**). If an element isn't obviously right for THIS page/role, it doesn't belong. For role-driven surfaces, gate EVERY zone by role-fit — not just labels and KPIs while the body stays generic.
   *HY:* Content-ն ա որոշում structure-ը — երբեք կույր template։ Ինչ կա էկրանին՝ բխում ա էկրանի իրական նպատակից ու content-ից — role-based UI-ի դեպքում՝ կոնկրետ ROLE-ից — ամ element-ի համար պատճառով։ Կույր template ամենուր՝ ակնհայտ սխալ արդյունք. sales «Today's Calls» widget Technical Director-ի workspace-ում (**2026-06-23 scar**)։ Եթե element-ը ակնհայտ ճիշտ չի ՍԱ page/role-ի համար — տեղ չունի։
8. **Not done until seen rendered.** A design/build is finished only after it's viewed in the running app — every state (empty/loading/error/full) and, for role UIs, representative roles. **"It compiles" is not "it looks right."** (**The 2026-06-23 verified-rendered law.**) Mirrors Skill 02 §1.7 and Skill 11 §1.7 — the running system is the truth.
   *HY:* Done չի, քանի դեռ rendered չես տեսել։ Design/build-ը ավարտված ա միայն երբ դիտված ա աշխատող app-ում — ամ state-ը ու role UI-ի համար representative role-երը։ **«Compile ա լինում» ≠ «ճիշտ տեսք ունի»**։ (2026-06-23 verified-rendered օրենք. արձագանքում ա Skill 02 §1.7 ու Skill 11 §1.7-ին։)
9. **Design the unhappy path first-class.** The happy path is the easy 20%. Empty, loading, error, partial, permission-denied, offline, slow, too-much-data, zero-results, first-run — these *are* the product. A surface with only its full-data state is a demo, not a feature.
   *HY:* Unhappy path-ը նախագծիր first-class։ Happy path-ը հեշտ 20%-ն ա։ Empty, loading, error, partial, permission-denied, offline, slow, too-much-data, zero-results, first-run — սրանք *են* product-ը։ Միայն full-data state-ով surface-ը demo ա, ոչ feature։
10. **Match the user's mental model, not the database schema or the org chart.** The interface is a story about how the world works; if it contradicts how the user already thinks, every interaction costs friction. Model the business as the user lives it (this is also Skill 01's "model the business, not the screen" seen from the other side — UI is the disposable projection, but it must project the *user's* model).
    *HY:* Համապատասխանիր user-ի mental model-ին, ոչ թե DB schema-ին կամ org chart-ին։ Interface-ը պատմություն ա, թե ոնց ա աշխատում աշխարհը. եթե հակասում ա user-ի մտածելակերպին՝ ամ interaction-ը friction ա։ Մոդելավորիր business-ը ոնց user-ն ա ապրում այն (Skill 01-ի «model the business, not the screen»-ը մյուս կողմից. UI-ը մեկ-անգամյա projection ա, բայց պիտի projektի *user-ի* model-ը)։
11. **Respect attention as the scarcest resource.** Every badge, toast, modal, red dot, and animation is a withdrawal from a finite account. Interrupt only for things worth interrupting for. Notification spam trains users to ignore you — including the one alert that mattered.
    *HY:* Հարգիր attention-ը՝ ամենասակավ ռեսուրսը։ Ամ badge, toast, modal, red dot, animation՝ դուրսբերում ա վերջավոր հաշվից։ Ընդհատիր միայն ընդհատելու արժանի բանի համար։ Notification-ի spam-ը սովորեցնում ա անտեսել քեզ — այդ թվում այն մեկ alert-ը, որ կարևոր էր։
12. **Trust is cumulative and fragile.** One janky animation, one lost form, one lie in the copy ("Saved!" when it wasn't) costs disproportionate trust. Quality everywhere is the brand; polish is not decoration, it is credibility. (L2: quality > efficiency lives here in pixels.)
    *HY:* Վստահությունը կուտակվող ա ու փխրուն։ Մեկ janky animation, մեկ կորած form, մեկ սուտ copy-ում («Saved!» երբ չէր) — անհամաչափ վստահություն ա արժենում։ Որակը ամենուր՝ brand-ն ա. polish-ը զարդ չի, credibility ա։ (L2՝ որակ > արդյունավետություն՝ այստեղ pixel-ում։)

---

## 2. UX RESEARCHER — understand the user, the job, the problem (the plane before the pixels)

**EN:** *(Co-owned with Skill 04 discovery. This skill owns the methods that produce design-ready evidence; Skill 04 owns turning that into specs & priority.)*

### 2.1 The double diamond & design thinking (the process spine)
- **Double Diamond** (UK Design Council): **Discover** (diverge — research the problem space broadly) → **Define** (converge — frame the *one* real problem) → **Develop** (diverge — generate many solutions) → **Deliver** (converge — build & test the chosen one). Two diamonds, four modes; the discipline is **deliberate divergence then convergence** — never converge before you've explored, never explore forever.
- **Design thinking** (IDEO / Stanford d.school): **Empathize → Define → Ideate → Prototype → Test**, iterated. Same spirit: understand deeply, frame sharply, generate widely, build cheaply, learn fast. The point of both: **fall in love with the problem, not the first solution.**
- **The most expensive mistake is solving the wrong problem beautifully.** Discovery is the cheapest place to be wrong (Skill 11 §1.3, Skill 04). A week of research saves a quarter of building.

*HY:* **Double Diamond** (UK Design Council)՝ **Discover** (լայն հետազոտիր problem space-ը) → **Define** (նեղացրու դեպի *մեկ* իրական problem) → **Develop** (գեներացրու շատ լուծում) → **Deliver** (կառուցիր ու թեստավորիր ընտրվածը)։ Երկու diamond, չորս mode. կարգապահությունը՝ **գիտակցված divergence, հետո convergence**. երբեք մի՛ նեղացրու նախքան բացելը, երբեք հավերժ մի՛ բացիր։ **Design thinking** (IDEO/d.school)՝ Empathize → Define → Ideate → Prototype → Test, iteration-ով։ Երկուսի էությունը՝ **սիրահարվիր problem-ին, ոչ առաջին լուծմանը**։ Ամենաթանկ սխալը՝ սխալ problem-ը գեղեցիկ լուծելն ա։

### 2.2 Jobs-to-be-done (JTBD)
- **People "hire" a product to make progress in a situation** (Christensen). The unit of design is the **job**, not the demographic or the feature. JTBD statement form: *"When [situation], I want to [motivation], so I can [expected outcome]."* ("When I get a new lead, I want to log it in two taps, so I don't lose it.")
- **Functional + emotional + social** dimensions of a job — the spreadsheet user also wants to *feel competent* and *look reliable to their boss*. Don't design only the functional layer.
- **Outcome-driven** (Ulwick): users measure success on outcome metrics ("minimize the time to log a lead", "minimize the chance of a missed follow-up") — surface and design to those, not to feature requests. The drill/hole/picture-on-the-wall ladder (Skill 11 §1.3) lives here.

*HY:* Մարդիկ **«վարձում» են product՝ իրավիճակում առաջընթաց անելու համար** (Christensen)։ Design-ի միավորը **job**-ն ա, ոչ demographic-ը կամ feature-ը։ JTBD ձև՝ *«Երբ [իրավիճակ], ուզում եմ [շարժառիթ], որ կարողանամ [սպասվող արդյունք]»*։ Job-ը ունի **functional + emotional + social** չափումներ — spreadsheet-ի user-ն ուզում ա նաև *իրեն competent զգալ*։ **Outcome-driven** (Ulwick)՝ user-ը հաջողությունը չափում ա outcome-ով, ոչ feature-ով։

### 2.3 Personas, empathy & journey maps
- **Personas** (Cooper) are *goal-directed* archetypes built from research — name, context, goals, frustrations, the job they're here for — NOT marketing demographics. A persona's value is that it makes "the user" specific enough to design for and to say "no" on behalf of. For role-based products, personas ≈ **roles** (the Technical Director vs the salesperson — §4.1).
- **Empathy map** — for a persona/role: what they *say · think · do · feel*, plus their pains and gains. Cheap, fast alignment tool before design.
- **Journey map / experience map** — the end-to-end path across stages: *actions · thoughts · emotions · touchpoints · pain points · opportunities*. Reveals **where the emotional lows are** (the moments that destroy trust) and the **moments of truth** worth investing in (peak-end rule — §9). A journey map without an emotion line is half a map.
- **Service blueprint** — the journey map plus the **backstage** (the systems, people, and data behind each touchpoint) — use when the experience spans channels and back-office (cross-link Skill 05 process/ops).

*HY:* **Persona** (Cooper)՝ research-ից կառուցված *goal-directed* archetype — անուն, context, goal, frustration, job — ՈՉ marketing demographic։ Persona-ի արժեքը՝ «user»-ին բավական կոնկրետ դարձնելն ա, որ կարողանաս դրա համար նախագծել ու դրա անունից «ոչ» ասել։ Role-based product-ում persona ≈ **role**։ **Empathy map**՝ ինչ ա user-ը *ասում · մտածում · անում · զգում* + pain/gain։ **Journey map**՝ end-to-end ուղին stage-երով՝ action · thought · emotion · touchpoint · pain · opportunity. ցույց ա տալիս **որտեղ են emotional low-երը** (վստահությունը քանդող պահերը) ու **moments of truth**-ը (peak-end — §9)։ Առանց emotion-գծի journey map-ը կիսատ ա։ **Service blueprint**՝ journey map + **backstage** (system/people/data ամ touchpoint-ի հետևում)։

### 2.4 Research methods (pick by question)
- **Generative / discovery (what & why):** user **interviews** (open, non-leading — ask about *past behavior*, not hypothetical futures; "tell me about the last time you…"), **contextual inquiry / field study** (*genchi genbutsu* — Skill 11 §2: watch them do the real job in the real context), diary studies. Output: jobs, pains, mental models, vocabulary.
- **Evaluative (does our design work):** **usability testing** (below), **A/B testing** (causal, at scale — Skill 04/06), analytics/funnels (where they drop), **heuristic evaluation** (expert review against Nielsen's 10), **cognitive walkthrough**.
- **IA-specific:** **card sorting** (open = users name the groups → discover the mental model; closed = sort into your categories → validate them; hybrid in between) and **tree testing** (validate findability of a proposed nav *before building screens* — "where would you click to do X?").
- **Quant vs qual, attitudinal vs behavioral** — the four-quadrant map (Rohrer): interviews/surveys = attitudinal; usability tests/analytics = behavioral. **Watch what people DO, not only what they SAY** — stated preference ≠ revealed behavior.

*HY:* **Generative (ինչ ու ինչու)**՝ **interview** (բաց, ոչ առաջնորդող — հարցրու *անցյալ վարքի* մասին, ոչ հիպոթետիկ ապագայի. «պատմիր վերջին անգամի մասին, երբ…»), **contextual inquiry / field study** (*genchi genbutsu* — Skill 11 §2՝ դիտիր ոնց են անում իրական job-ը իրական context-ում), diary study։ **Evaluative (մեր design-ը աշխատո՞ւմ ա)**՝ **usability testing**, **A/B testing**, analytics/funnel, **heuristic evaluation** (Nielsen-ի 10-ով), **cognitive walkthrough**։ **IA-ի համար**՝ **card sorting** (open՝ user-ն ա անվանում խմբերը → mental model. closed՝ դասավորում ա քո category-ներում → validate) ու **tree testing** (նախքան էկրան կառուցելը findability-ն validate անելը)։ **Քանակ vs որակ, attitudinal vs behavioral** (Rohrer-ի չորս-քառորդ)։ **Դիտիր ինչ են ԱՆՈՒՄ, ոչ միայն ինչ են ԱՍՈՒՄ**։

### 2.5 Usability testing (the protocol)
- **5 users surface ~80% of usability problems** (Nielsen) — run small, run often, run cheap. Continuous discount usability beats one big study at the end.
- **Test tasks, not opinions:** give a realistic *task* ("find and pay your last invoice"), then **shut up and watch** — don't lead, don't explain, don't rescue. **Think-aloud protocol**: ask them to narrate. Their *struggle* is the finding; their *praise* is noise.
- **Measure:** task success/failure, time-on-task, error count, where they hesitate, where they take the wrong path, satisfaction (SUS/SEQ). Severity-rate each issue (cosmetic → catastrophic) and fix the catastrophes first.
- **Moderated vs unmoderated, in-person vs remote** — moderated for depth/why, unmoderated for scale/speed. Prototype fidelity scales with the question (paper for flow, hi-fi for visual/interaction).
- **The trunk test** (Krug): drop a user onto any page cold — can they answer *what site/section is this, where am I, what can I do, where do I go*? If not, wayfinding (§3.1) is broken.

*HY:* **5 user-ը բացում ա problem-ների ~80%-ը** (Nielsen) — փոքր, հաճախ, էժան։ **Թեստավորիր task, ոչ կարծիք**՝ տուր իրական *task* («գտիր ու վճարիր վերջին invoice-ը»), հետո **լռիր ու դիտիր** — մի՛ առաջնորդիր, մի՛ փրկիր։ **Think-aloud**՝ թող պատմեն իրենց մտքերը։ Իրենց *պայքարն* ա finding-ը. *գովեստը*՝ noise։ **Չափիր**՝ success/failure, time-on-task, error, որտեղ են վարանում, satisfaction (SUS/SEQ). severity-ով դասիր ու catastrophe-ները նախ։ **Moderated vs unmoderated** (խորություն vs scale)։ **Trunk test** (Krug)՝ գցիր user-ին ցանկացած page՝ կարո՞ղ ա ասել ուր ա, ինչ կարա անի, ուր գնա։

---

## 3. UX ARCHITECT — structure, flow, mental models

### 3.1 Information architecture (IA)
**EN:**
- **Group by user mental model, not org chart, not DB tables.** Navigation should match how users think about the task. Run **card sorting** (open / closed) to discover natural groupings; **tree testing** to validate findability before you build a single screen (§2.4).
- **Navigation depth vs breadth:** prefer shallow + broad over deep + narrow for discovery; deep is fine for known-item retrieval. Three clicks is a myth — **users tolerate clicks if each one is confident**; ambiguity, not click count, is the killer.
- **Labels are IA.** A category named wrong is invisible. Use the user's words (run the value/term arc — what does *the role* call this? ticket = հայտ/заявка, not "case object"). Labels beat icons for comprehension; icon-only nav is **mystery meat**.
- **Wayfinding:** the user must always answer three questions — *Where am I? What can I do here? Where can I go next?* Breadcrumbs, active-state nav, page titles, and a persistent home affordance answer them.
- **Organizing schemes** (Rosenfeld/Morville *Information Architecture* — the "polar bear" book): exact schemes (alphabetical, chronological, geographic) for known-item lookup; ambiguous schemes (topic, task, audience/role, metaphor) for exploration. **Search and browse are complements, not substitutes** — power users search, newcomers browse; serve both.

*HY:*
- **Խմբավորիր user-ի mental model-ով**, ոչ org chart-ով, ոչ DB table-ով։ Navigation-ը պիտի համապատասխանի, թե ոնց ա user-ը մտածում task-ի մասին։ **Card sorting** (open/closed)՝ բնական խմբերը գտնելու, **tree testing**՝ findability-ն validate անելու՝ նախքան էկրան կառուցելը։
- **Depth vs breadth**՝ discovery-ի համար shallow+broad > deep+narrow. «Three clicks»-ը առասպել ա — **user-ը հանդուրժում ա click-եր, եթե ամ մեկը վստահ ա**. ambiguity-ն ա սպանողը, ոչ click-ի քանակը։
- **Label-ները IA են**։ Սխալ անվանված category-ն անտեսանելի ա։ Օգտագործիր user-ի բառերը (ticket = հայտ/заявка, ոչ «case object»)։ Icon-only nav = **mystery meat**։
- **Wayfinding**՝ user-ը միշտ պիտի պատասխանի՝ *Ուր եմ։ Ինչ կարամ անեմ։ Ուր կարամ գնամ։* Breadcrumb, active nav, page title, persistent home։
- **Կազմակերպման սխեմա** (Rosenfeld/Morville)՝ ճշգրիտ (այբբենական, ժամանակագրական, աշխարհագրական) known-item-ի համար. ոչ-միանշանակ (թեմա, task, audience/role, փոխաբերություն) բացահայտման համար։ **Search-ն ու browse-ը լրացնում են իրար**։

### 3.2 User flows & journeys
**EN:**
- **Map the path to the goal** before drawing screens: entry → steps → success, plus every branch and failure. **Minimize steps, kill dead ends, always offer a way back** (Nielsen #3, user control & freedom — undo/redo, escape hatches, cancel).
- **Job-to-be-done (JTBD):** the user "hires" the product to make progress in a situation. Design the flow around the job, not around features (§2.2).
- **Tasks, not pages:** a flow is a sequence of decisions and actions; optimize the *sequence* (reduce mode errors, carry context forward, don't re-ask what you know). **Goal-Gradient effect:** motivation rises near completion — show progress, pre-fill the first step, make the end feel close.
- **First-run / onboarding** is a flow, not a screen: get to first value (the "aha") in the fewest steps; defer setup; teach by doing, not by tour.
- **Flow-state design:** carry context across steps, remember selections, support back/forward and deep-link, never trap the user in a modal mid-flow. **Parkinson's Law of the form** — every extra field is paid by every user, forever; cut ruthlessly.

*HY:*
- **Քարտեզագրիր ուղին դեպի goal**՝ նախքան էկրան նկարելը՝ entry → քայլեր → success + ամ ճյուղ ու failure։ **Քիչ քայլ, dead-end չկա, միշտ հետ-գնալու ճանապարհ** (Nielsen #3)։
- **Task, ոչ page**՝ flow-ը որոշումների ու action-ների հաջորդականություն ա. optimize արա *հաջորդականությունը* (mode error քիչ, context առաջ տար, մի՛ հարցրու ինչ արդեն գիտես)։ **Goal-Gradient**՝ motivation-ը աճում ա ավարտին մոտ — ցույց տուր progress, լրացրու առաջին քայլը։
- **Onboarding**-ը flow ա, ոչ էկրան՝ հասցրու առաջին արժեքին («aha») նվազագույն քայլով. հետաձգիր setup-ը. սովորեցրու անելով, ոչ tour-ով։

### 3.3 Mental models, conventions & the two Gulfs
**EN:**
- **Norman's Gulfs:** the **Gulf of Execution** (can I figure out how to do it?) and the **Gulf of Evaluation** (can I tell what happened?). Bridge execution with clear **affordances** (what's possible) and **signifiers** (visible cues to it); bridge evaluation with **feedback** and good **mapping** (controls spatially/logically matching their effect).
- **Norman's seven stages of action** — goal → plan → specify → execute → perceive → interpret → compare. Friction at any stage is a design defect; the two Gulfs are where stages collapse.
- **Conventions are knowledge in the world** (Norman). A search box top-right, a logo linking home, underlined-blue links, a hamburger on mobile — reuse them. Innovate on your differentiator, conform on everything else. **Constraints** (physical, logical, semantic, cultural) prevent error by making the wrong action impossible or obviously wrong.
- **Modes are dangerous** — they cause **mode errors** (the same action does different things). Avoid hidden modes; if a mode exists, make it loud and easy to exit (`Esc`).
- **Human error is a design failure, not a user failure** (Norman). When users "make mistakes," the design set them up — fix the design, not the user. Distinguish **slips** (right intention, wrong action — prevent with constraints/confirmation on the dangerous one) from **mistakes** (wrong intention — prevent with a clearer model/feedback).

*HY:*
- **Norman-ի Gulf-երը**՝ **Gulf of Execution** (կարո՞ղ եմ հասկանալ ոնց անել) ու **Gulf of Evaluation** (կարո՞ղ եմ ասել ինչ եղավ)։ Execution-ը կամրջիր հստակ **affordance**-ով (ինչ ա հնարավոր) ու **signifier**-ով (տեսանելի cue). evaluation-ը՝ **feedback**-ով ու լավ **mapping**-ով։
- **Norman-ի action-ի յոթ փուլ**՝ goal → plan → specify → execute → perceive → interpret → compare. ցանկացած փուլում friction-ը design-ի թերություն ա։
- **Convention-ները knowledge-in-the-world են**։ Search վերև-աջ, logo→home, underlined-blue link, hamburger mobile-ում — reuse արա։ Նորարարիր differentiator-ի վրա, conform արա մնացածի։ **Constraint**-ները (ֆիզիկական, տրամաբանական, semantic, cultural) կանխում են error-ը՝ սխալ action-ը անհնար դարձնելով։
- **Mode-երը վտանգավոր են** — **mode error**։ Խուսափիր թաքնված mode-ից. եթե կա՝ դարձրու բարձր ու հեշտ-ելք (`Esc`)։
- **Human error-ը design-ի ձախողում ա, ոչ user-ի** (Norman)։ Տարբերիր **slip** (ճիշտ մտադրություն, սխալ action — կանխիր constraint/confirmation-ով) ու **mistake** (սխալ մտադրություն — կանխիր ավելի պարզ model-ով)։

---

## 4. PRODUCT DESIGNER — content, hierarchy, states, copy

### 4.1 Content-first, role-first (the anti-template discipline)
**EN:**
- **Derive every surface from its purpose, content, and — for role UIs — the ROLE.** Start from "what is the one job this person came here to do?" then "what does that job need on screen?" Every element answers "why is this here for THIS user?" or it is cut. This is the durable lesson behind the 2026-06-23 scar.
- **Role-fit is a per-zone gate, top to bottom.** Header, KPIs, primary widget, secondary content, side rails, empty-state CTA — each must independently pass "right for this role?" Half-personalization (role-aware header, generic body) is the trap.
- **Personas & their priorities differ by role:** a Technical Director's workspace leads with operational/network state and exceptions; a salesperson's leads with their pipeline and today's actions. Same product, different first screen. (See the GAAhex "Workspace = working place" rule: lead with actionable work, act-in-place, NOT a generic dashboard.)

*HY:*
- **Բխեցրու ամ surface-ը իր նպատակից, content-ից, ու role UI-ի դեպքում՝ ROLE-ից**։ Սկսիր «ո՞րն ա այն մեկ job-ը, որի համար եկել ա այս մարդը», հետո «ինչ ա այդ job-ին պետք էկրանին»։ Ամ element-ը պատասխանում ա «ինչու ա սա այստեղ ՍԱ user-ի համար» կամ կտրվում ա։
- **Role-fit-ը per-zone gate ա, վերևից ներքև**։ Header, KPI, primary widget, secondary, side rail, empty-state CTA — ամ մեկը անկախ պիտի անցնի «ճիշտ ա այս role-ի համա՞ր»։ Կես-personalization-ը (role-aware header, generic body) թակարդ ա։
- **Persona-ի առաջնահերթությունը տարբեր ա ըստ role-ի**՝ Technical Director-ի workspace-ը սկսում ա operational/network state-ով ու exception-ով. salesperson-ինը՝ pipeline-ով ու այսօրվա action-ով։ Նույն product, տարբեր առաջին էկրան։

### 4.2 Visual hierarchy & layout
**EN:**
- **Establish primary / secondary / tertiary** with type scale, weight, color, and space — in that priority order (space and weight do more than color). **Squint test:** blur the screen; the most important thing should still pop.
- **Visual weight tools, cheapest-first:** size → weight → contrast/color → spacing/position. Reach for color last; over-coloring flattens hierarchy.
- **Gestalt principles** organize without lines: **proximity** (near = related — the #1 grouping tool), **similarity**, **common region** (shared background/card), **continuity**, **closure**, **figure-ground**, **common fate** (things moving together are grouped). Use proximity and white space before borders and dividers.
- **Alignment & grid:** everything aligns to a grid (a 12-column or 4/8px baseline); ragged edges read as broken. Optical alignment beats mathematical when they disagree (icons, punctuation). The grid is a system of relationships, not a cage — break it intentionally for emphasis (Von Restorff).
- **The fold is soft, but priority is real:** put the primary job and CTA where the eye lands first (top-left in LTR reading, center for focused tasks). **Scanning patterns:** F-pattern for text-heavy, Z/layer-cake for designed pages — design to them.

*HY:*
- **Հաստատիր primary / secondary / tertiary**՝ type scale, weight, color, space-ով — այդ առաջնահերթությամբ (space ու weight-ը ավելի շատ են անում քան color)։ **Squint test**՝ լղոզիր էկրանը. ամենակարևորը պիտի դեռ առանձնանա։
- **Visual weight-ի գործիքները, էժանից**՝ size → weight → contrast/color → spacing/position։ Color-ը վերջում. գերգունավորումը հարթեցնում ա hierarchy-ն։
- **Gestalt**-ը կազմակերպում ա առանց գծի՝ **proximity** (մոտ = կապված, #1 գործիք), **similarity**, **common region** (ընդհանուր card/background), **continuity**, **closure**, **figure-ground**, **common fate**։ Proximity ու white space՝ նախքան border ու divider։
- **Alignment ու grid**՝ ամեն ինչ grid-ին (12-column կամ 4/8px baseline). ուղղագիծ եզրերը կոտրված են երևում։ Optical alignment > մաթեմատիկական, երբ չեն համընկնում։
- **Fold-ը փափուկ ա, priority-ն իրական**՝ primary job ու CTA այնտեղ, ուր աչքը նախ ընկնում ա։ **Scanning**՝ F-pattern տեքստի, Z/layer-cake design-ված էջի համար։

### 4.3 Typography (the workhorse of hierarchy)
**EN:**
- **Limited modular scale** (a type ramp on a ratio — 1.2 minor third, 1.25, 1.333 perfect fourth, 1.5); few sizes, used consistently. Type does most of the hierarchy work.
- **Readability:** measure (line length) ~45–75 characters; line-height ~1.4–1.6 for body, tighter (1.1–1.3) for large headings; restrained weights (regular + one bold beats five weights). Don't justify body text on the web (rivers). Mind the **vertical rhythm** — line-heights and spacing on a consistent baseline.
- **Hierarchy via type:** size + weight + color + letter-spacing + case. Establish heading/body/caption/label roles as **tokens**, not ad-hoc.
- **Pairing & choice:** at most two families (one display/heading, one text/body — or a single superfamily). Choose for the job: humanist sans for UI warmth, geometric for modern brand, a real text serif for long reading. **Numerals matter** — tabular (lining) figures for tables and numbers that must align; OpenType features (true small caps, fractions) over faked ones.
- **System & performance:** prefer a system/variable font stack or subset+`font-display: swap` to avoid FOIT and layout shift (CLS — §5.3). Webfont weight is a perf budget line item.

*HY:*
- **Սահմանափակ modular scale** (type ramp ratio-ով — 1.2 / 1.25 / 1.333 / 1.5). քիչ չափ, consistent։ Type-ն ա hierarchy-ի մեծ մասը անում։
- **Ընթեռնելիություն**՝ measure ~45–75 նիշ. line-height ~1.4–1.6 body-ի, ավելի սեղմ (1.1–1.3) մեծ heading-ի. զուսպ weight (regular + մեկ bold > հինգ weight)։ Web-ում body-ն մի՛ justify արա (rivers)։ Հետևիր **vertical rhythm**-ին։
- **Hierarchy type-ով**՝ size + weight + color + letter-spacing + case. Հաստատիր heading/body/caption/label role-երը **token**-ով։
- **Զուգորդում**՝ առավելագույնը երկու family. ընտրիր job-ի համար (humanist sans UI-ի ջերմության, geometric brand-ի, text serif երկար ընթերցանության)։ **Numerals**՝ tabular figures table-ի համար։
- **System & performance**՝ system/variable font stack կամ subset + `font-display: swap`՝ FOIT ու layout-shift (CLS) խուսափելու. webfont-ի weight-ը perf budget-ի տող ա։

### 4.4 Color & contrast
**EN:**
- **Small, intentional palette:** one neutral/spine ramp (the workhorse — most of the UI is grays), one accent for interaction/brand, semantic colors for status (success/warning/danger/info). Color carries meaning, so spend it carefully.
- **You need more grays and more shades than you think:** a real system has ~8–10 steps of neutral and ~5–9 of each hue. Define them as tokens; never eyedropper one-off colors. Build ramps in a perceptual space (HSL/LCH); fix the perceived-lightness jumps that naive HSL produces.
- **Color theory, applied:** use **hue** for category/identity, **value (lightness)** for hierarchy and depth, **saturation** for emphasis (muted backgrounds, saturated accents); 60-30-10 as a rough balance of neutral/secondary/accent. Warm advances, cool recedes; saturated draws the eye. **Tint/shade ramps** (mix toward white/black/gray) make a coherent family from one seed.
- **Never encode meaning by color alone** (WCAG 1.4.1 + color-blindness): pair color with icon, text, or shape. Red/green status must survive deuteranopia (~8% of men). Test with a color-blind simulator.
- **Contrast is a hard floor, not taste:** body text ≥ **4.5:1**, large text (≥24px or 18.66px bold) and UI components/graphics ≥ **3:1** (WCAG AA). AAA is 7:1/4.5:1. Test it; don't eyeball it. Contrast applies to **states** too — disabled, placeholder, and focus must still be perceivable enough to function.
- **Dark mode is not invert:** desaturate, lower pure-white text (use ~#E…), reduce large solid-color areas (eye fatigue), re-test every contrast pair. It's a token theme (§5.1), not a filter.

*HY:*
- **Փոքր, գիտակցված palette**՝ մեկ neutral/spine ramp (UI-ի մեծ մասը gray ա), մեկ accent, semantic գույներ status-ի (success/warning/danger/info)։ Color-ը meaning ա կրում — ծախսիր զգույշ։
- **Ավելի շատ gray ու shade, քան կարծում ես**՝ իրական system-ը ~8–10 neutral step ու ~5–9 ամ hue-ի։ Token-ով սահմանիր. երբեք eyedropper-ով one-off։ Ramp-ը կառուցիր perceptual space-ում (HSL/LCH)։
- **Color theory կիրառված**՝ **hue**՝ category/identity-ի, **value**՝ hierarchy/depth-ի, **saturation**՝ emphasis-ի. 60-30-10 հավասարակշռություն։ Warm-ը առաջ ա գալիս, cool-ը հետ։
- **Երբեք meaning միայն color-ով** (WCAG 1.4.1 + գունակուրություն)՝ զուգիր icon/text/shape-ի հետ։ Red/green-ը պիտի դիմանա deuteranopia-ին (~8% տղամարդ)։
- **Contrast-ը կոշտ հատակ ա, ոչ ճաշակ**՝ body ≥ **4.5:1**, large/UI ≥ **3:1** (WCAG AA). AAA՝ 7:1/4.5:1։ Թեստավորիր, մի՛ աչքաչափիր. վերաբերում ա նաև **state**-երին (disabled, placeholder, focus)։
- **Dark mode-ը invert չի**՝ desaturate, pure-white-ից խուսափիր (~#E…), մեծ solid գույները քչացրու. token theme ա, ոչ filter։

### 4.5 Density, data display & dataviz (Tufte)
**EN:**
- **Density is a deliberate choice, not an accident.** Operational/expert tools (a dispatch board, a registry) want **high information density** — more rows visible, tighter spacing, scannable — power users punish padding-bloat. Consumer/first-run surfaces want air and focus. Offer **density modes** as a token set (comfortable/compact — §5.1), not bespoke CSS.
- **Tables/registries:** right-align numbers, left-align text, tabular figures, sticky header, a clear sort affordance, zebra/row-hover only if it aids scanning, freeze the key column. Don't make a table do a chart's job, or vice versa.
- **Tufte's data-ink:** maximize the **data-ink ratio** — every pixel of ink should encode data; **erase non-data-ink and redundant ink** (chartjunk — heavy gridlines, 3-D, decorative shadows, gratuitous color). **Small multiples** for comparison across one variable. **Sparklines** for inline trend. **Lie factor** = the visual must be proportional to the data; never truncate a bar-chart axis to exaggerate.
- **Chart choice by question:** trend over time → line; comparison of categories → bar (not pie beyond 2-3 slices); part-to-whole → stacked bar/treemap; correlation → scatter; distribution → histogram/box. The chart answers a question; if it has no question, cut it.

*HY:*
- **Density-ն գիտակցված ընտրություն ա**։ Operational/expert tool-ը (dispatch board, registry) ուզում ա **բարձր density** — ավելի շատ row, սեղմ spacing, scannable. consumer/first-run-ը՝ օդ ու focus։ Առաջարկիր **density mode**-եր token-ով (comfortable/compact), ոչ bespoke CSS։
- **Table/registry**՝ թվերը աջ, տեքստը ձախ, tabular figure, sticky header, sort affordance, freeze key column։ Table-ին chart-ի գործ մի՛ տուր, ու հակառակը։
- **Tufte-ի data-ink**՝ առավելագույնի հասցրու **data-ink ratio**-ն. ջնջիր non-data-ink-ը (chartjunk՝ ծանր gridline, 3-D, դեկորատիվ shadow)։ **Small multiples** համեմատության. **sparkline** inline trend-ի. **lie factor**՝ visual-ը համաչափ data-ին (երբեք մի՛ կտրիր bar-ի axis-ը)։
- **Chart-ի ընտրություն ըստ հարցի**՝ trend→line. category-համեմատություն→bar (ոչ pie >2-3 slice). part-to-whole→stacked/treemap. correlation→scatter. distribution→histogram։

### 4.6 The states matrix (design ALL of them, up front)
**EN:** For every data-driven surface, design: **empty** (first-run vs filtered-to-zero are different — first-run teaches and offers the primary action; zero-results offers to clear filters), **loading** (skeleton > spinner for layout-stable content; never layout-shift on load), **partial/streaming**, **error** (what happened + what to do + a way to retry/recover — never a raw stack trace), **success/confirmation**, **permission-denied** (explain + who to ask, don't just hide), **offline/stale** (show staleness, queue the write), and **too-much-data** (pagination/virtualization/summary). The happy "full" state is the *last* one to design, not the first.

*HY:* Ամ data-driven surface-ի համար նախագծիր՝ **empty** (first-run vs filtered-to-zero տարբեր են — first-run-ը սովորեցնում ա ու առաջարկում primary action. zero-results-ը՝ clear filter), **loading** (skeleton > spinner layout-stable-ի համար. երբեք layout-shift), **partial/streaming**, **error** (ինչ եղավ + ինչ անել + retry — երբեք raw stack trace), **success/confirmation**, **permission-denied** (բացատրիր + ում հարցնել, մի՛ պարզապես թաքցրու), **offline/stale** (ցույց տուր հնությունը, queue արա write-ը), **too-much-data** (pagination/virtualization/summary)։ Happy «full» state-ը *վերջինն* ա, ոչ առաջինը։

### 4.7 Forms (the highest-friction surface)
**EN:**
- **Label clearly, above the field** (not placeholder-as-label — it vanishes on focus and fails a11y). One column, logical grouping, top-aligned labels for speed (Wroblewski). Group related fields; chunk long forms into steps with a progress indicator (Goal-Gradient — §3.2).
- **Validate inline and forgivingly:** validate on blur for format, on submit for completeness; **show one error at a time near its field**; never validate aggressively as the user types the first character. **Preserve input on failure** — losing a half-filled form is a cardinal sin (form hostility). Re-focus the first error.
- **Reduce input cost:** smart defaults, autofill, input masks, sensible field types (numeric keypad for numbers), `inputmode`/`autocomplete`, optional fields marked (not required ones cluttered with asterisks), and ask only for what you truly need now. Every field is a tax (Parkinson — §3.2).
- **Match the field to the data:** ≤5 options → radios/segmented (all visible); 5–15 → select; many + searchable → combobox/typeahead; multi-select → checkboxes/chips/multi-combobox; dates → a real date picker with keyboard entry too; ranges → slider only when imprecision is fine.
- **Microcopy on forms:** helper text before the error, not after; constructive error language ("Enter a date after today," not "Invalid input"). Make the **submit button name the result** (§4.8); disable double-submit; show a pending state.

*HY:*
- **Label՝ field-ից վերև** (ոչ placeholder-as-label — անհետանում ա focus-ին, ձախողում a11y)։ Մեկ column, տրամաբանական խումբ, top-aligned label՝ արագության համար (Wroblewski)։ Երկար form-ը կտրիր step-երի՝ progress-ով (Goal-Gradient)։
- **Validate inline ու ներողամիտ**՝ blur-ին format-ի, submit-ին completeness-ի համար. **մեկ error իր field-ի մոտ**. երբեք առաջին նիշից։ **Պահպանի input-ը failure-ին** — կիսատ form-ի կորուստը cardinal մեղք ա (form hostility)։
- **Իջեցրու input-ի cost-ը**՝ smart default, autofill, mask, ճիշտ type, `inputmode`/`autocomplete`, optional-ը նշիր (ոչ required-ը asterisk-ով)։ Ամ field tax ա (Parkinson)։
- **Field-ը data-ին համապատասխան**՝ ≤5→radio/segmented. 5–15→select. շատ+searchable→combobox. multi→checkbox/chip. ամսաթիվ→իրական picker + keyboard։
- **Microcopy**՝ helper նախքան error. կառուցողական լեզու («Enter a date after today», ոչ «Invalid input»)։ Submit-ը անվանի արդյունքը. արգելիր double-submit. ցույց տուր pending։

### 4.8 Product-design judgment — disclosure, defaults, error-prevention, recovery
**EN:** *(This is where Skill 11's analysis lands in pixels: the unhappy path, the edge, the second-order effect.)*
- **Progressive disclosure** (Nielsen/Tognazzini): show the few common things; reveal the advanced on demand (a "More options" expander, a settings drawer, a wizard step). Default to simple; let depth be opt-in. Don't dump every option at once (Hick — §9).
- **Smart defaults are design decisions.** The default is what 80% will keep — choose it for the common case, make it safe, and pre-fill what you already know. A good default removes a decision; a bad one ships a wrong choice to most users.
- **Error prevention > error messages** (Nielsen #5, the highest-leverage heuristic): make the wrong action hard or impossible — constraints, disabled states with a reason, confirmation only on the **destructive & irreversible** (not on everything — confirmation fatigue), undo instead of confirm where possible. **Prefer reversible (undo) to preventive (confirm)** — a 5-second "Undo" toast beats a modal nobody reads.
- **Recovery & forgiveness:** every destructive action has an undo or a recovery path; deletes are soft/recoverable where feasible; autosave drafts; never trap the user with no way out (Nielsen #3). The **forgiving format** — accept messy input (any phone format) and normalize, rather than reject (Postel at the UI).
- **Confirmations done right:** name the consequence and the object in the button ("Delete 3 invoices"), make the safe choice the default focus, require typing the name only for the truly catastrophic.

*HY:* *(Այստեղ Skill 11-ի analysis-ը վայրէջք ա անում pixel-ում՝ unhappy path-ը, edge-ը, second-order-ը։)*
- **Progressive disclosure** (Nielsen/Tognazzini)՝ ցույց տուր քիչ ընդհանուրը, advanced-ը՝ ըստ պահանջի։ Default-ը պարզ. depth-ը opt-in։ Մի՛ թափիր ամ option-ը միանգամից (Hick)։
- **Smart default-ները design որոշում են**։ Default-ը այն ա, ինչ 80%-ը կպահի — ընտրիր common case-ի համար, դարձրու ապահով, լրացրու ինչ գիտես։
- **Error-ի կանխում > error message** (Nielsen #5, ամենաբարձր leverage-ը)՝ սխալ action-ը դարձրու դժվար/անհնար. confirmation միայն **destructive & irreversible**-ի վրա (ոչ ամ բանի — confirmation fatigue). **undo > confirm** որտեղ հնարավոր ա։
- **Recovery & forgiveness**՝ ամ destructive action-ը ունի undo. soft delete. autosave draft. երբեք մի՛ թակարդիր (Nielsen #3)։ **Forgiving format**՝ ընդունիր messy input ու normalize արա (Postel UI-ում)։
- **Confirmation ճիշտ**՝ button-ում անվանի consequence-ը ու object-ը («Delete 3 invoices»), ապահով ընտրությունը՝ default focus. անուն գրել պահանջիր միայն իսկապես catastrophic-ի համար։

### 4.9 Microcopy & content design
**EN:**
- **Buttons name the action and its result** ("Save changes," "Delete account," "Send invoice" — not "Submit," "OK"). The user should predict the outcome from the label (Nielsen #1 + match).
- **Errors:** say what happened, why if useful, and the next step — in human language, blameless ("We couldn't reach the server. Check your connection and retry," not "Error 0x80004005").
- **Empty states sell the feature:** explain what goes here, why it's valuable, and offer the primary action.
- **Voice & tone:** consistent, calm, concise; tone scales with the moment (celebratory on success, sober and helpful on error). **No "New" prefix on create buttons** (project SST) — the action verb stands alone. Front-load the meaningful word (people scan, not read — Krug).
- **Localize as content, not as string-swap:** real Eastern Armenian / Russian collocations, the role's actual term (հայտ/заявка), values arc included; verbatim tokens stay by design (L0 + the localization arc lesson). Plan for **text expansion** (Armenian/Russian/German run longer — never lay out to fit English) and **RTL** if in scope. Microcopy is content **and** an a11y surface — it's what a screen reader announces. (Cross-link Skill 08 for the writing craft; Skill 09 for the native-Armenian engine.)

*HY:*
- **Button-ը անվանում ա action-ն ու արդյունքը** («Save changes», «Send invoice» — ոչ «Submit», «OK»)։ User-ը պիտի label-ից կանխատեսի outcome-ը (Nielsen #1)։
- **Error**՝ ինչ եղավ, ինչու (եթե օգտակար), հաջորդ քայլը — մարդկային, ոչ-մեղադրող («Չհաջողվեց հասնել server-ին. ստուգիր connection-ը ու կրկնիր», ոչ «Error 0x80004005»)։
- **Empty state-ը վաճառում ա feature-ը**՝ բացատրիր ինչ ա այստեղ լինելու, ինչու ա արժեքավոր, առաջարկիր primary action։
- **Voice & tone**՝ consistent, հանգիստ, սեղմ. tone-ը մասշտաբվում ա պահի հետ։ **«New» prefix չկա create-ի վրա** (SST)։ Առաջ բեր իմաստալից բառը (մարդիկ scan են անում — Krug)։
- **Localize՝ որպես content, ոչ string-swap**՝ իրական Eastern Armenian/Russian collocation, role-ի բառը (հայտ/заявка), values arc. verbatim token-ը by design։ Հաշվիր **text expansion**-ը (հայերեն/ռուսերեն/գերմաներեն ավելի երկար են) ու **RTL** եթե scope-ում ա։ (Cross-link Skill 08՝ writing craft. Skill 09՝ native-Armenian engine։)

---

## 5. DESIGN SYSTEMS LEAD — tokens, components, governance (atomic design)

### 5.1 Tokens (one source of truth)
**EN:**
- **Design tokens** = named variables for color, spacing, type, radii, shadows, z-index, motion durations/easings, breakpoints. Change once, propagate everywhere. **No hardcoded values in components** — ever (this is the design-system equivalent of Skill 01's "no hardcoded reference data").
- **Token tiers (the three-tier model):** **primitive/global** (raw palette: `gray-700`, `space-4`) → **semantic/alias** (`color-text-primary`, `color-bg-danger`, `space-inset-card`) → **component-specific** (`button-bg-hover`). Components consume **semantic** tokens, never primitives — that's what makes theming (light/dark, density, brand) a token swap, not a refactor.
- **Theming is a token swap.** Light/dark, brand variants, density (comfortable/compact), and high-contrast modes are *alternate values for the same semantic tokens* — define the theme at the semantic tier and the whole UI re-skins for free. This is why §4.4 dark-mode and §4.5 density are token sets, not CSS forks.
- **Spacing scale:** a single base (4 or 8px) and a ramp; whitespace is structure, not emptiness. Tokens are the contract between design and engineering — store them in a tool-agnostic format (W3C DTCG JSON / Style Dictionary) so design tools and code read the same source.

*HY:*
- **Design token**՝ անվանված փոփոխական color, spacing, type, radii, shadow, z-index, motion, breakpoint-ի համար։ Փոխիր մեկ անգամ, propagate ամենուր։ **Component-ում hardcode չկա** — երբեք (Skill 01-ի «no hardcoded reference data»-ի design-տարբերակը)։
- **Token-ի երեք շերտ**՝ **primitive/global** (`gray-700`, `space-4`) → **semantic/alias** (`color-text-primary`, `color-bg-danger`) → **component** (`button-bg-hover`)։ Component-ը սպառում ա **semantic**, երբեք primitive — դա ա theming-ը (light/dark, density, brand) token-swap դարձնում, ոչ refactor։
- **Theming-ը token-swap ա**։ Light/dark, brand, density, high-contrast-ը *նույն semantic token-ի այլընտրանքային արժեքներ* են։
- **Spacing scale**՝ մեկ base (4/8px) + ramp. whitespace-ը structure ա, ոչ դատարկություն։ Token-ը design↔eng contract-ն ա — պահիր tool-agnostic ձևով (DTCG JSON / Style Dictionary)։

### 5.2 Atomic design & the component layering (Frost)
**EN:**
- **Atomic Design** (Brad Frost): **atoms** (a label, an input, a button — the indivisible UI elements) → **molecules** (a labeled input + button = a search field) → **organisms** (a header, a data-table, a card grid) → **templates** (page-level layout with placeholder content) → **pages** (templates with real content, where you validate). It's a **mental model and naming system**, not a rigid folder structure — the value is thinking in composable layers from primitives up.
- **Maps onto the token tiers:** primitive tokens feed atoms; semantic tokens bind molecules/organisms to theme; the page is where you finally see it rendered (§1.8). Atomic design is *how* you build the system; tokens are *what* the system is made of.

*HY:*
- **Atomic Design** (Brad Frost)՝ **atom** (label, input, button — անբաժանելի element) → **molecule** (label+input+button = search field) → **organism** (header, data-table, card grid) → **template** (page layout placeholder content-ով) → **page** (իրական content-ով, որտեղ validate ես անում)։ Սա **mental model ու naming system** ա, ոչ կոշտ folder structure — արժեքը composable շերտերով մտածելն ա՝ primitive-ից վեր։
- **Համապատասխանում ա token-ի շերտերին**՝ primitive token → atom. semantic token → molecule/organism theme-ին. page-ը՝ որտեղ վերջապես rendered ես տեսնում (§1.8)։

### 5.3 Components
**EN:**
- **Documented with variants, states, and rules:** every component ships its full state set — **default / hover / active-pressed / focus-visible / disabled / loading / error / selected** — and its usage do's/don'ts. A component without its focus and disabled states is half-built.
- **Build the system, not the screen.** Solve the class of problem once (a `Button`, a `Modal` shell, a `DataTable`, a `PageShell`) and reuse. Reuse + extend before you invent (the modal-shell + page baselines; PageShell `headerActions` slot; `filters.search` pattern).
- **API design for components:** props are a contract — minimal, composable, predictable; controlled vs uncontrolled is a deliberate choice; slots/children for flexibility over a forest of boolean props. **Composition over configuration** (compound components beat 30-prop monoliths). Polymorphism (`as`/`asChild`) and sensible defaults keep the API small.
- **Anatomy & accessibility baked in:** each component encodes its ARIA role, keyboard model, and focus behavior so consumers can't get it wrong. Use proven primitives (Radix / React Aria / ARIA APG patterns) rather than re-deriving a combobox. The system is the place to **get a11y right once** so every consumer inherits it (§6).

*HY:*
- **Փաստաթղթավորված variant, state ու rule-ով**՝ ամ component-ը բերում ա իր ամբողջ state set-ը — **default / hover / active-pressed / focus-visible / disabled / loading / error / selected** — ու do/don't։ Առանց focus ու disabled state-ի component-ը կիսատ ա։
- **Կառուցիր system-ը, ոչ էկրանը**՝ լուծիր problem-ի class-ը մեկ անգամ (`Button`, `Modal` shell, `DataTable`, `PageShell`) ու reuse արա։ Reuse + extend՝ նախքան հորինելը։
- **Component-ի API**՝ props-ը contract ա — minimal, composable, կանխատեսելի. controlled vs uncontrolled՝ գիտակցված. slot/children > boolean prop-երի անտառ։ **Composition over configuration**։
- **Anatomy & a11y ներսից**՝ ամ component-ը կոդավորում ա ARIA role, keyboard model, focus։ Օգտագործիր ապացուցված primitive (Radix/React Aria/APG)։ System-ը այն տեղն ա, որ a11y-ն **մեկ անգամ ճիշտ անես** ու ամ consumer ժառանգի (§6)։

### 5.4 Patterns & layout primitives
**EN:**
- **Standardized patterns:** forms, tables/registries, navigation, search, filters, empty/error/loading, modals/drawers, toasts, pagination — defined once so every product feels coherent.
- **Layout primitives** (Stack, Cluster, Grid, Sidebar, Center, Cover — *Every Layout*) express layout intent compositionally; bespoke flexbox per screen is how a system drifts. They consume spacing tokens, so layout obeys the same rhythm everywhere.
- **Registry vs operations layouts are different patterns** and must not be conflated (the GAAhex PageShell trap below).

*HY:*
- **Ստանդարտ pattern**՝ form, table/registry, navigation, search, filter, empty/error/loading, modal/drawer, toast, pagination — մեկ անգամ սահմանված, որ ամ product coherent լինի։
- **Layout primitive**-ներ (Stack, Cluster, Grid, Sidebar, Center, Cover — *Every Layout*)՝ layout-ի մտադրությունը compositional ձևով. bespoke flexbox ամ էկրանին՝ system-ի drift-ի ճանապարհն ա։ Սպառում են spacing token, ուստի layout-ը նույն rhythm-ին ա ենթարկվում։
- **Registry vs operations layout-ը տարբեր pattern են** — մի՛ խառնիր (PageShell trap-ը ներքևում)։

### 5.5 Governance
**EN:**
- **Naming conventions, no hardcoded values, contribution rules, deprecation paths.** A design system that drifts is no system. (Skill 01 governance ↔ design governance: policy → standard → automated guard.)
- **Make conformance enforceable, not aspirational** (mirrors Skill 01 principle #5): lint rules ban raw hex/px in components; CI checks contrast on tokens; visual-regression tests (Chromatic / Playwright snapshots) catch drift; a token diff gate flags unsanctioned values. A rule with no automated guard *will* drift (same law as Skill 02 §1.8).
- **Adoption is the metric:** % of UI using system components, number of one-off colors/spacings in the codebase (should trend to zero), time-to-build a new screen. A system nobody adopts is a museum.
- **Versioning & contribution:** SemVer the system; breaking token/component changes go through deprecation, not surprise (the design echo of data/API contracts — Skill 02 §3.2). Document in a living catalog (Storybook) with usage, props, do/don't, and accessibility notes per component.

*HY:*
- **Naming convention, hardcode չկա, contribution rule, deprecation path**։ Drift-վող design system-ը system չի։ (Skill 01 governance ↔ design governance՝ policy → standard → automated guard։)
- **Conformance-ը դարձրու enforceable, ոչ aspirational**՝ lint-ը արգելում ա raw hex/px component-ում. CI-ը ստուգում ա contrast token-ի. visual-regression (Chromatic/Playwright) բռնում ա drift-ը. token-diff gate-ը նշում ա չհաստատված արժեք։ Առանց guard-ի rule-ը *կ*drift-ի (Skill 02 §1.8-ի օրենքը)։
- **Adoption-ն ա metric-ը**՝ system-component-ով UI-ի %, one-off color/spacing-ի քանակ (պիտի ձգտի 0-ի), նոր էկրանի build-ի ժամանակ։ Չընդունված system-ը թանգարան ա։
- **Versioning & contribution**՝ SemVer. breaking փոփոխությունը deprecation-ով, ոչ surprise (data/API contract-ի design-արձագանք)։ Living catalog (Storybook)՝ usage, props, do/don't, a11y note ամ component-ի։

---

## 6. STAFF FRONTEND ENGINEER — build, state, performance, a11y, motion

### 6.1 Component architecture
**EN:**
- **Small, composable, single-responsibility** components; **state lifted only as far as needed** (lowest common ancestor, no higher). Colocate state with use; avoid premature global stores.
- **Container/presentational separation** where it earns its keep; pure render functions are testable and predictable. Derive, don't duplicate, state — a value computable from other state is not state.
- **Rendering strategy is an architecture decision** (cross-link Skill 02 §2, §5): **CSR** (SPA — rich app, behind auth, low SEO need), **SSR** (per-request HTML — dynamic + SEO + fast first paint), **SSG** (build-time — content/marketing, cacheable at the edge), **ISR/streaming SSR + islands/RSC** (hybrid — static shell + dynamic islands, stream HTML, hydrate selectively). Pick by **content freshness × interactivity × SEO × scale**, not by framework fashion.

*HY:*
- **Փոքր, composable, single-responsibility** component. **state-ը բարձրացրու միայն այնքան, որքան պետք ա** (lowest common ancestor, ոչ ավելի)։ State-ը տեղավորիր օգտագործման մոտ. խուսափիր վաղաժամ global store-ից։
- **Container/presentational** բաժանում՝ որտեղ արժի. pure render-ը testable ա։ **Derive, ոչ duplicate** — այլ state-ից հաշվելի արժեքը state չի։
- **Rendering strategy-ն architecture որոշում ա** (Skill 02 §2, §5)՝ **CSR** (SPA), **SSR** (per-request HTML + SEO), **SSG** (build-time, edge-cacheable), **ISR/streaming SSR + islands/RSC** (hybrid)։ Ընտրիր ըստ **freshness × interactivity × SEO × scale**, ոչ framework-ի նորաձևության։

### 6.2 State — different problems, different tools
**EN:**
- **Local UI state** (open/closed, hover, input draft) → component state.
- **Server cache state** (data fetched from the backend) → a query/cache library (React Query / SWR-style): caching, revalidation, optimistic updates, dedup — *not* a global store. Treating server data as client state is the #1 state-management mess.
- **Global app/client state** (auth/session, theme, cross-cutting UI) → a deliberate, small store. **Don't put everything in one store.**
- **URL is state** (filters, tabs, selection, pagination belong in the URL so they're shareable, bookmarkable, and back-button-correct). **Form state** is its own concern (a form library — dirty/touched/validation). Match the tool to the problem; one mega-store for all of it is the smell.

*HY:*
- **Local UI state** (open/closed, hover, draft) → component state։
- **Server cache state** (backend-ից fetch արված) → query/cache lib (React Query/SWR)՝ caching, revalidation, optimistic, dedup — *ոչ* global store։ Server data-ն client state համարելը #1 խառնաշփոթն ա։
- **Global app state** (auth/session, theme) → գիտակցված, փոքր store։ **Մի՛ դիր ամեն ինչ մեկ store-ում։**
- **URL-ը state ա** (filter, tab, selection, pagination — URL-ում, որ shareable, bookmarkable, back-button-correct լինեն)։ **Form state**-ը առանձին concern ա (form lib)։ Մեկ mega-store ամ ինչի համար՝ smell ա։

### 6.3 Performance (measure, don't guess)
**EN:**
- **Core Web Vitals are the rubric:** **LCP** (largest contentful paint — perceived load, target **<2.5s**), **CLS** (cumulative layout shift — visual stability, **<0.1**; reserve space, set image dimensions, no jumpy loads / late-injected banners), **INP** (interaction to next paint — responsiveness, **<200ms**; replaced FID in 2024). Measure with **real-user metrics (RUM / field data)**, not just lab — lab catches regressions, field tells the truth.
- **Set a performance budget** and gate it in CI (Lighthouse-CI / bundle-size check): JS bytes shipped, LCP, INP, total weight. A budget unenforced is a wish (mirrors §5.5, Skill 02 §1.8).
- **Techniques:** code-split + lazy-load routes and heavy components; **virtualize long lists** (never render 10k rows); optimize and properly size images (modern formats — AVIF/WebP, `srcset`/`sizes`, lazy below the fold, fetch-priority on the LCP image); debounce/throttle expensive handlers; **break up long tasks** (yield to the main thread, `requestIdleCallback`) to protect INP; memoize the genuinely expensive (not everything — premature `memo` is noise); minimize re-render cascades; ship less JS (the cheapest byte is the one you don't send).
- **Perceived performance beats raw speed:** skeletons, optimistic UI, instant feedback on click, streaming/progressive render, prefetch on intent/hover. A fast-feeling slow app beats a slow-feeling fast one (Doherty threshold — §9). Perceived performance is a *design* tool as much as an engineering one.
- **Network discipline:** avoid request waterfalls (parallelize, prefetch, colocate data needs), cache aggressively, paginate/window large datasets server-side (cross-link Skill 02 §5).

*HY:*
- **Core Web Vitals-ը rubric-ն ա**՝ **LCP** (perceived load, **<2.5s**), **CLS** (visual stability, **<0.1**. ռեզերվ արա տեղ, set արա image-ի չափ, ոչ jumpy load), **INP** (responsiveness, **<200ms**. 2024-ին փոխարինեց FID-ին)։ Չափիր **RUM / field data**-ով, ոչ միայն lab — lab-ը բռնում ա regression, field-ը ասում ա ճշմարտությունը։
- **Set արա perf budget** ու gate արա CI-ում (Lighthouse-CI / bundle-size)։ Չ-enforce արված budget-ը wish ա։
- **Տեխնիկա**՝ code-split + lazy-load. **virtualize երկար list** (երբեք 10k row). image՝ AVIF/WebP, `srcset`/`sizes`, lazy, fetch-priority LCP-ին. debounce/throttle. **կտրիր երկար task-ը** (yield main thread-ին)՝ INP-ի համար. memoize միայն իսկապես թանկը. ship-արա ավելի քիչ JS։
- **Perceived performance > raw speed**՝ skeleton, optimistic UI, ակնթարթային click-feedback, streaming render, prefetch hover-ին (Doherty — §9)։ Perceived performance-ը *design* գործիք ա նույնքան, որքան engineering։
- **Network discipline**՝ waterfall-ից խուսափիր (parallelize, prefetch), cache, server-side paginate/window (Skill 02 §5)։

### 6.4 Accessibility (the engineering half of principle #6 — non-negotiable)
**EN:**
- **Semantic HTML first** — a real `<button>`, `<nav>`, `<table>`, `<label>`, headings in order; ARIA only to fill gaps, never to paper over `<div onClick>`. **The first rule of ARIA: don't use ARIA if a native element exists** — native elements bring keyboard, focus, and role for free.
- **Keyboard:** everything operable without a mouse; logical tab order (DOM order = visual order); **visible focus** (`:focus-visible`, never `outline:none` without a replacement); **trap focus in modals and restore it on close**; `Esc` closes; skip-links for navigation; roving-tabindex / arrow-key navigation for composite widgets (menus, tabs, grids) per the **ARIA APG**.
- **Screen readers:** meaningful **accessible names** (`<label>`/`aria-label`/`aria-labelledby`), **live regions** (`aria-live`) for async updates (toasts, validation, results count), correct roles & states (`aria-expanded`, `aria-selected`, `aria-invalid`, `aria-current`, `aria-busy`), alt text that conveys *purpose* (decorative images get `alt=""`).
- **Targets & motion:** touch targets ≥ **44×44px** (Apple HIG) / ≥ **24px** minimum (WCAG 2.2 SC 2.5.8); respect **`prefers-reduced-motion`**; never convey state by color alone (§4.4); sufficient contrast; support 200–400% zoom and reflow without horizontal scroll (WCAG 1.4.10).
- **WCAG 2.2 additions to honor:** focus not obscured (2.4.11), dragging movements have a single-pointer alternative (2.5.7), target size minimum (2.5.8), consistent help (3.2.6), redundant entry (don't re-ask — 3.3.7), accessible authentication (no cognitive-test CAPTCHAs — 3.3.8).
- **Test it:** automated (axe / Lighthouse / Pa11y) catches ~30–40%; the rest needs **keyboard-only and screen-reader passes** (VoiceOver / NVDA). A11y is **verified, like everything else** (§1.8) — and it's the **system's** job to make it the default (§5.3), not every consumer's to re-derive. **Inclusive design** (Microsoft): designing for permanent, temporary, *and situational* impairment (one arm, bright sun, noisy room) improves the product for everyone — the curb-cut effect engineered.

*HY:*
- **Semantic HTML նախ**՝ իրական `<button>`, `<nav>`, `<table>`, `<label>`, heading-ները կարգով. ARIA-ն միայն բացերի համար, երբեք `<div onClick>`-ը ծածկելու։ **ARIA-ի առաջին կանոնը՝ մի՛ օգտագործիր ARIA, եթե native element կա** — native-ը keyboard/focus/role ձրի ա բերում։
- **Keyboard**՝ ամեն ինչ առանց mouse. տրամաբանական tab order (DOM = visual)։ **Տեսանելի focus** (`:focus-visible`, երբեք `outline:none` առանց փոխարինման)։ **Modal-ում focus-trap ու վերականգնում close-ին**։ `Esc` փակում ա. skip-link. composite widget-ի համար roving-tabindex/arrow (APG-ով)։
- **Screen reader**՝ իմաստալից **accessible name** (`<label>`/`aria-label`)։ **Live region** (`aria-live`) async update-ի (toast, validation, count)։ ճիշտ role/state (`aria-expanded`, `aria-selected`, `aria-invalid`, `aria-current`)։ alt text-ը կրում ա *նպատակը* (դեկորատիվ՝ `alt=""`)։
- **Target & motion**՝ touch target ≥ **44×44px** (HIG) / ≥ **24px** (WCAG 2.2 SC 2.5.8). հարգիր **`prefers-reduced-motion`**. երբեք state միայն color-ով. 200–400% zoom առանց horizontal scroll (1.4.10)։
- **WCAG 2.2 հավելումներ**՝ focus not obscured (2.4.11), drag-ի single-pointer այլընտրանք (2.5.7), target size (2.5.8), consistent help (3.2.6), redundant entry (3.3.7), accessible auth (3.3.8)։
- **Թեստավորիր**՝ automated-ը (axe/Lighthouse) բռնում ա ~30–40%. մնացածը՝ **keyboard-only ու screen-reader pass** (VoiceOver/NVDA)։ A11y-ն **verified ա, ինչպես ամեն ինչ** (§1.8) — ու **system-ի** գործն ա այն default դարձնելը (§5.3)։ **Inclusive design** (Microsoft)՝ permanent + temporary + *situational* impairment-ի համար նախագծելը (մեկ ձեռք, պայծառ արև, աղմկոտ սենյակ) լավացնում ա բոլորի համար։

### 6.5 Interaction & motion design (microinteractions, perceived performance)
**EN:**
- **Microinteractions** (Saffer) have an anatomy: **trigger → rules → feedback → loops/modes**. The toggle that animates, the heart that fills, the field that confirms — small, contained moments that make the UI feel alive and *communicate state*. Sweat them; they're where craft shows.
- **Motion must mean something.** Animate only to communicate **state change, spatial continuity (where did this come from / go to), causality, or hierarchy of attention**. Decorative motion that delays the task is a cost. Material's principle: motion provides **meaning** and **continuity**, not decoration.
- **Easing & duration:** ease-out for elements entering (decelerate into place), ease-in for leaving, ease-in-out for moving within view. Keep UI transitions **short — ~150–300ms** (long enough to perceive, short enough not to wait); large/full-screen transitions a touch longer. **Snappy beats smooth** for frequent interactions.
- **Transitions for orientation:** animate a modal/drawer in from its origin, a list item out as it's deleted, a shared element between views — so the user keeps spatial context (no teleporting UI). Stagger list entrances subtly; don't animate everything at once.
- **Perceived performance via motion:** skeletons over spinners, optimistic UI with rollback, progress for >1s waits, instant press-feedback (active state) so a click never feels dropped — perceived speed is engineered with motion and feedback as much as with bytes (§6.3, Doherty).
- **Always honor `prefers-reduced-motion`** — provide a reduced/none alternative (cross-fade instead of large movement). Motion can trigger vestibular disorders; reduced-motion is accessibility, not a preference to ignore.

*HY:*
- **Microinteraction** (Saffer)-ի anatomy-ն՝ **trigger → rules → feedback → loops/modes**։ Toggle-ի animation, սրտի լցվելը, field-ի confirm-ը — փոքր, պարփակ պահեր, որ UI-ը կենդանի են դարձնում ու *state հաղորդում*։ Քրտնաջան մշակիր. այստեղ ա craft-ը երևում։
- **Motion-ը պիտի իմաստ ունենա**՝ animate արա միայն **state change, spatial continuity (որտեղից/ուր), causality, attention-ի hierarchy** հաղորդելու։ Դեկորատիվ motion-ը, որ ուշացնում ա task-ը, cost ա։ Material՝ motion-ը **meaning ու continuity** ա, ոչ զարդ։
- **Easing & duration**՝ ease-out մտնողի (decelerate), ease-in դուրս եկողի, ease-in-out տեղափոխվողի համար։ UI transition՝ **կարճ ~150–300ms**։ **Snappy > smooth** հաճախակի interaction-ի համար։
- **Transition orientation-ի համար**՝ modal/drawer-ը իր origin-ից, list item-ը delete-վելիս դուրս, shared element view-երի միջև — որ user-ը spatial context պահի (ոչ teleport)։
- **Perceived performance motion-ով**՝ skeleton > spinner, optimistic UI rollback-ով, progress >1s-ին, ակնթարթային press-feedback (active state) — perceived արագությունը motion-ով ու feedback-ով ա կառուցվում (§6.3, Doherty)։
- **Միշտ հարգիր `prefers-reduced-motion`**-ը՝ տուր reduced/none այլընտրանք (cross-fade մեծ շարժման փոխարեն)։ Motion-ը կարա vestibular խանգարում հրահրի. reduced-motion-ը accessibility ա, ոչ անտեսելի preference։

### 6.6 Responsive & fluid design
**EN:**
- **Mobile-first:** design and build the smallest viewport first, enhance up; **test the smallest viewport first** (it forces priority — if it fits and works on mobile, it'll work big). Content reflows by **breakpoints driven by the content** (where the layout breaks), not by device names.
- **Fluid scaling** (project SST): prefer **fluid type/space with `clamp(min, preferred-vw, max)`** over snapping at breakpoints; the UI should *breathe* across sizes, not jump. A fluid type scale + a fluid space scale = far fewer breakpoints. Use breakpoints for **layout reconfiguration** (1-col → 2-col), fluid scaling for **everything in between**.
- **Container queries** for **component-level responsiveness** — a card adapts to *its container's* width, not the viewport's, so the same component works in a sidebar and a full-width grid. This is the real fix for "responsive components" that media queries never gave us. Pair with intrinsic CSS (`min()`/`max()`/`clamp()`, `auto-fit`/`minmax` grids) for layouts that respond without breakpoints at all.
- **Robustness across environments:** handle **long strings** (localized text is longer — Armenian/Russian overflow, §4.9), zero/huge data, slow networks, **RTL** if in scope, **dark mode**, **high zoom (400%)** with reflow, **reduced motion**, touch vs pointer vs keyboard input, and old-but-supported browsers. Test on a real device, not just a resized desktop window.

*HY:*
- **Mobile-first**՝ նախ ամենափոքր viewport-ը, հետո վեր. **թեստավորիր փոքրը նախ** (priority ա պարտադրում)։ Content-ը reflow ա ըստ **content-driven breakpoint**-ի (որտեղ layout-ը կոտրվում ա), ոչ device-անունով։
- **Fluid scaling** (SST)՝ **`clamp(min, vw, max)`**-ով fluid type/space > breakpoint-ի snap. UI-ը պիտի *շնչի*, ոչ թռչի։ Fluid type + fluid space = շատ քիչ breakpoint. breakpoint-ը՝ **layout-ի վերակառուցման** (1→2 column), fluid-ը՝ մնացածի համար։
- **Container query**՝ **component-level responsiveness** — card-ը հարմարվում ա *իր container-ի* լայնքին, ոչ viewport-ի, ուստի նույն component-ը աշխատում ա sidebar-ում ու full-width grid-ում։ Զուգիր intrinsic CSS-ի հետ (`min/max/clamp`, `auto-fit/minmax`)։
- **Robustness**՝ **երկար string** (localized-ը երկար ա — §4.9), zero/huge data, դանդաղ network, **RTL**, **dark mode**, **400% zoom** reflow-ով, **reduced motion**, touch vs pointer vs keyboard, հին-բայց-supported browser։ Թեստավորիր իրական սարքի վրա։

### 6.7 The verified-rendered gate (principle #8, operationalized)
**EN:** Before any UI is "done": **launch the running app** and view it — every state in the §4.6 matrix, representative **roles** for role UIs, the smallest and a large viewport, keyboard-only once, a screen-reader spot-check, dark mode if supported, and a glance at the CWV/Lighthouse numbers. "It compiles" and "the tests pass" do not equal "it looks right." (The 2026-06-23 law; mirrors Skill 02 §1.7 and Skill 11 §1.7.) Verify rendered, then ship — and **hold pushes until Gev says**, per the working-mode rule.

*HY:* Նախքան UI-ը «done» լինի՝ **գործարկիր աշխատող app-ը** ու դիտիր — §4.6 matrix-ի ամ state-ը, role UI-ի representative **role**-երը, ամենափոքր ու մեծ viewport-ը, keyboard-only մեկ անգամ, screen-reader spot-check, dark mode եթե կա, ու հայացք CWV/Lighthouse թվերին։ «Compile ա» ու «test-երն անցան» ≠ «ճիշտ տեսք ունի»։ (2026-06-23 օրենք. Skill 02 §1.7, Skill 11 §1.7։) Verify rendered, հետո ship — ու **պահիր push-երը մինչ Գևը ասի**, working-mode կանոնով։

---

## 7. DECISION RULES (fast, reusable)

**EN / HY** *(each rule English, Armenian directly after)*

- **Before you design anything — do we understand the user & the real problem?** If it's assumption, not evidence, do discovery first (§2; Skill 11 §1.3; Skill 04). *HY: Նախքան նախագծելը — հասկանո՞ւմ ենք user-ին ու իրական problem-ը։ Եթե ենթադրություն ա, ոչ evidence — նախ discovery (§2)։*
- **Add a feature/element to a screen?** Only if it serves the screen's primary job for THIS role. Otherwise it's clutter — move, hide behind disclosure, or cut it. *HY: Element ավելացնե՞լ — միայն եթե ՍԱ role-ի primary job-ին ա ծառայում. այլապես կտրիր/թաքցրու/տեղափոխիր։*
- **Is this element right for THIS page/role?** If you can't say why it belongs here specifically, cut it. Role-based UI → check **every zone** for role-fit, top to bottom, not just the header. (The 2026-06-23 scar.) *HY: Ճիշտ ա ՍԱ page/role-ի համա՞ր։ Չես կարա ասես ինչու՝ կտրիր։ Role UI → ամ zone-ը ստուգիր։*
- **New component or reuse?** Reuse + extend an existing system component unless the need is genuinely novel. Novel → build it *into* the system (tokens, states, docs, a11y), not as a one-off. *HY: Նոր component, թե reuse։ Reuse+extend, քանի դեռ իսկապես novel չի. novel→ system-ի մեջ կառուցիր։*
- **Modal, drawer, or page?** Quick focused task / confirm → **modal** (trap focus, `Esc`). Contextual side task while keeping context → **drawer**. Complex / standalone / deep-linkable / multi-step → **page** (URL = state). *HY: Modal/drawer/page՝ արագ focus-task→modal. contextual կողք→drawer. բարդ/deep-link/multi-step→page։*
- **How many options on screen?** As few as complete the task (Hick). Group, default the rest, hide advanced behind progressive disclosure. *HY: Քանի option՝ որքան task-ը պահանջում ա (Hick). խմբավորիր, default արա, advanced-ը disclosure-ի տակ։*
- **Confirm, undo, or just do?** Reversible → just do (+ a way back). Reversible-but-noticeable → **undo** toast. Destructive + irreversible → **confirm** naming the consequence. Don't confirm the harmless (confirmation fatigue). *HY: Confirm/undo/just-do՝ reversible→արա. նկատելի→undo. destructive+irreversible→confirm consequence-ով։*
- **Skeleton, spinner, or optimistic?** Layout-stable known shape → **skeleton**. Unknown/short indeterminate wait → **spinner**. Safe, reversible mutation → **optimistic** (with rollback on failure). *HY: Skeleton/spinner/optimistic՝ հայտնի shape→skeleton. անհայտ կարճ→spinner. ապահով mutation→optimistic (rollback-ով)։*
- **Animate or not?** Only if it communicates (state change, spatial continuity, causality, attention). Decorative motion that delays the task → cut. Always honor `prefers-reduced-motion`; keep UI transitions ~150–300ms. *HY: Animate թե ոչ՝ միայն եթե հաղորդում ա. դեկորատիվ delay→կտրիր. հարգիր reduced-motion. ~150–300ms։*
- **Color, icon, or text for status?** Use at least two of the three; **never color alone**. Critical status → text + icon + color. *HY: Status՝ երեքից առնվազն երկուսը. երբեք միայն color. critical→երեքն էլ։*
- **Token or hardcode?** Always token. If there's no token for it, you've found a gap — add the token, don't hardcode. Components consume **semantic** tokens, not primitives. *HY: Token թե hardcode՝ միշտ token. չկա→gap ա, ավելացրու։ Component-ը semantic token ա սպառում։*
- **Breakpoint or fluid?** Layout reconfiguration (column count) → breakpoint. Continuous size adjustment (type, space, container) → **fluid `clamp`** / container query. Default to fluid; breakpoint only where the layout truly breaks. *HY: Breakpoint թե fluid՝ layout-վերակառուցում→breakpoint. շարունակական→fluid clamp/container query. default fluid։*
- **List view layout type?** Registry/list/stacked status tabs → **REGISTRY** layout, never OPERATIONS (OPERATIONS imposes a grid that stretches status tabs into giant pills — the PageShell trap, fixed in 4a188c0). *HY: List view layout՝ registry→REGISTRY, երբեք OPERATIONS (grid-ը status tab-ը giant pill ա ձգում — 4a188c0)։*
- **Which state to manage where?** Cross-cutting session/app → global store (small). Fetched data → query/cache lib. Component-only → local. Shareable/back-button → URL. Form → form lib. *HY: State-ը որտեղ՝ session→global. fetch→query lib. component→local. shareable→URL. form→form lib։*
- **CSR, SSR, SSG, or hybrid?** Rich app behind auth → CSR. Dynamic + SEO + fast paint → SSR. Content/marketing, cacheable → SSG. Mix of static + dynamic → islands/RSC/streaming. By content×interactivity×SEO×scale. *HY: CSR/SSR/SSG/hybrid՝ ըստ content×interactivity×SEO×scale, ոչ framework-fashion։*
- **Done?** Not until **seen rendered** in the running app across all states, representative roles, smallest+large viewport, keyboard once, a11y spot-check (principle #8). "Compiles" ≠ "done." *HY: Done՝ քանի դեռ rendered չես տեսել՝ ամ state, role, viewport, keyboard, a11y (§8)։ «Compile» ≠ «done»։*

---

## 8. ANTI-PATTERNS (smell → fix)

**EN / HY** *(smell → fix, Armenian directly after each)*

- **Flat hierarchy** — everything same size/weight. *Fix:* establish primary/secondary/tertiary with type + space; de-emphasize the rest; squint test. *HY: Հարթ hierarchy → հաստատիր primary/secondary/tertiary, de-emphasize, squint test։*
- **Mystery meat navigation** — unlabeled icons, no destination hint. *Fix:* labels, or icon + label; the user must predict where it goes before clicking. *HY: Mystery-meat nav (անպիտակ icon) → label, կամ icon+label։*
- **Solving the wrong problem** — beautifully built, but nobody needed it. *Fix:* discovery before design (§2); validate the problem (Double Diamond Define) before the solution. *HY: Սխալ problem-ի լուծում → discovery նախքան design (§2)։*
- **No empty/error/loading states** — UI breaks on reality. *Fix:* design all states up front (§4.6 matrix); the happy path is the easy 20%. *HY: Չկա empty/error/loading → նախագծիր ամ state-ը (§4.6)։*
- **Inconsistent components** — five button styles, eyedropper colors. *Fix:* a governed design system with tokens + lint/visual-regression guards (§5.5). *HY: Անհետևողական component → governed design system, token, lint/visual-regression (§5.5)։*
- **Form hostility** — wipes input on error, validates only on submit (or on every keystroke from char 1), vague errors. *Fix:* inline forgiving validation, one error near its field, preserve input. *HY: Form hostility → inline-ներողամիտ validation, մեկ error, պահպանի input։*
- **Decoration as substitute for hierarchy** — shadows/gradients/borders hiding a flat layout. *Fix:* fix spacing and type first; decoration is seasoning, not structure. *HY: Դեկորը hierarchy-ի փոխարեն → նախ spacing/type, դեկորը համեմունք ա։*
- **Template-stamping** — one fixed layout/widget-set applied to every page or role. *Fix:* derive each surface from its content/role; justify every element; cut what isn't obviously right. (2026-06-23.) *HY: Template-stamping → բխեցրու ամ surface content/role-ից (2026-06-23)։*
- **Half-personalized** — labels/KPIs role-aware but the body left generic (sales widgets on a non-sales role). *Fix:* gate EVERY zone by role-fit, not just the top layer. (2026-06-23.) *HY: Կես-personalized → gate արա ամ zone (2026-06-23)։*
- **Done-on-compile** — calling a UI finished because it builds. *Fix:* view it rendered in the running app — every state, representative roles, keyboard, a11y — before "done". (2026-06-23.) *HY: Done-on-compile → rendered դիտիր app-ում (2026-06-23)։*
- **Dashboard-where-a-workspace-belongs** — a passive metrics wall where the user came to *do* work. *Fix:* lead with actionable work, act-in-place; the landing is a working place, not a dashboard. (GAAhex Workspace rule.) *HY: Dashboard workspace-ի փոխարեն → առաջ բեր actionable work, act-in-place (GAAhex)։*
- **Color-only meaning** — status by hue alone, fails color-blind & contrast users. *Fix:* pair color with icon/text/shape. *HY: Միայն-color meaning → զուգիր icon/text/shape-ի հետ։*
- **Placeholder-as-label** — label vanishes on focus, fails a11y and memory. *Fix:* persistent label above the field. *HY: Placeholder-as-label → մշտական label field-ից վերև։*
- **Div-soup / fake controls** — `<div onClick>` instead of `<button>`. *Fix:* semantic HTML first; keyboard + focus + role for free. *HY: Div-soup → semantic HTML, keyboard/focus/role ձրի։*
- **Inaccessible / `outline:none` focus removed** — keyboard users get lost. *Fix:* visible `:focus-visible` on every interactive element; trap+restore in modals. *HY: Հեռացված focus (`outline:none`) → տեսանելի `:focus-visible`, trap+restore modal-ում։*
- **Spinner-of-doom / layout shift** — indeterminate spinner forever, content jumps on load (CLS). *Fix:* skeletons that reserve space, progress for long waits, reserve image/ad dimensions, no CLS. *HY: Spinner-of-doom / layout shift → skeleton տեղ ռեզերվ-արող, progress, ոչ CLS։*
- **Notification spam** — everything badges and toasts. *Fix:* interrupt only for what's worth interrupting; attention is a finite account. *HY: Notification spam → ընդհատիր միայն արժանին (attention վերջավոր ա)։*
- **Modal abuse** — stacked modals, modals for complex multi-step work, no `Esc`, no focus trap. *Fix:* page for complex flows; one modal, focus-trapped, escapable. *HY: Modal abuse → page բարդ flow-ին. մեկ modal, focus-trap, escapable։*
- **Dark patterns** — confirm-shaming, hidden costs, roach-motel (easy in, hard out / cancel), forced continuity, disguised ads, pre-checked opt-ins, false urgency. *Fix:* design for the user's interest, not against it; trust is the asset (principle #12) and dark patterns are increasingly illegal (GDPR/CCPA/EU dark-pattern rules). Make the honest path the easy path. *HY: Dark pattern (confirm-shame, թաքնված cost, roach-motel, forced continuity, false urgency) → նախագծիր user-ի շահի համար. վստահությունն ա asset-ը (#12), ու dark pattern-ները ապօրինի են դառնում։ Ազնիվ ճանապարհը՝ հեշտ ճանապարհ։*
- **Server-data-as-client-state** — fetched data shoved into a global store, manual sync. *Fix:* a query/cache layer; URL for view state. *HY: Server-data-as-client-state → query/cache layer. URL՝ view state-ին։*
- **Render-everything lists** — 10k DOM rows. *Fix:* virtualization + server pagination. *HY: Render-everything list → virtualization + server pagination։*
- **Layout-type misuse** — OPERATIONS grid on a list/registry view stretches status tabs into giant vertical pills. *Fix:* REGISTRY layout for stacked list views. (4a188c0.) *HY: Layout-type misuse → REGISTRY stacked list-ին (4a188c0)։*
- **Premature optimization / over-memoization** — `memo` everywhere, noise; or shipping huge JS "to be fast." *Fix:* measure (CWV / profiler) first, optimize the real hotspot, ship less. *HY: Վաղաժամ optimization / over-memo → նախ չափիր (CWV/profiler), real hotspot, ship-արա քիչ։*
- **Hardcoded-English (or any-language) strings** — un-localized literals scattered in views. *Fix:* token/i18n every string; native collocations, not string-swap; plan for text expansion; verbatim tokens by design only. (Localization arc.) *HY: Hardcoded-English string → i18n ամ string. native collocation, text-expansion. verbatim by design (localization arc)։*
- **Decorative chartjunk** — 3-D pies, heavy gridlines, truncated axes. *Fix:* maximize data-ink, erase non-data-ink, honest axes (Tufte §4.5). *HY: Chartjunk → max data-ink, ջնջիր non-data-ink, ազնիվ axis (Tufte §4.5)։*
- **Mobile as an afterthought** — desktop-first, mobile retrofitted and broken. *Fix:* mobile-first; design and test the smallest viewport first; fluid scaling between. *HY: Mobile-ը հետո → mobile-first, փոքրը նախ, fluid արանքում։*

---

## 9. CANONICAL QUICK-REFERENCE (laws, heuristics, frameworks — attributed)

**EN / HY** *(reference list — bilingual labels)*

**Nielsen–Molich 10 usability heuristics:** 1 visibility of system status · 2 match system↔real world · 3 user control & freedom (undo/exit) · 4 consistency & standards · 5 error **prevention** · 6 recognition > recall · 7 flexibility & efficiency (shortcuts) · 8 aesthetic & minimalist design · 9 help users recognize/diagnose/recover from errors · 10 help & documentation. *(Use heuristic evaluation — §2.4 — as a fast expert audit.)*
*HY: Nielsen-ի 10 heuristics — system-status-ի տեսանելիություն · system↔իրականություն match · user control (undo/exit) · consistency · error-ի **կանխում** · recognition>recall · flexibility/shortcut · aesthetic-minimalist · error-ից վերականգնում · help/doc։*

**UX laws (use as design constraints):** **Fitts's Law** (time-to-target ∝ distance/size → big & near targets; screen edges/corners are infinitely large) · **Hick's Law** (more choices = slower decisions → reduce/group) · **Miller's 7±2** (working-memory limit → chunk) · **Tesler's Law** (complexity is conserved → the system pays it) · **Jakob's Law** (users expect your site to work like the others they know) · **Postel's/robustness** (liberal in what you accept) · **Goal-Gradient** (motivation rises near the finish → show progress) · **Doherty Threshold** (<400ms response keeps users productive & engaged) · **Parkinson's Law** (work/forms expand to fill — cut fields) · **Aesthetic-Usability effect** (pretty is perceived as more usable — never a substitute for usability) · **Peak-End rule** (judged by peak + end → nail success/error moments) · **Serial-position** (first & last remembered → order matters) · **Von Restorff/isolation** (the different one is remembered → one primary action).
*HY: UX օրենքներ՝ Fitts (մեծ ու մոտ target. եզրերն անվերջ մեծ են) · Hick (քիչ ընտրություն) · Miller 7±2 (chunk) · Tesler (system-ը վճարում ա) · Jakob (նմանվիր ուրիշներին) · Postel (liberal-ընդունում) · Goal-Gradient (ցույց տուր progress) · Doherty (<400ms) · Parkinson (կտրիր field) · Aesthetic-Usability · Peak-End (peak+end) · Serial-position · Von Restorff (մեկ primary action)։*

**Norman (DOET):** affordances · signifiers · mapping · feedback · constraints (physical/logical/semantic/cultural) · conceptual model · Gulf of Execution / Gulf of Evaluation · seven stages of action · knowledge in the head vs in the world · slips vs mistakes · **human error is a design failure**.
*HY: Norman (DOET)՝ affordance · signifier · mapping · feedback · constraint · conceptual model · Gulf of Execution/Evaluation · action-ի 7 փուլ · knowledge-in-head vs in-world · slip vs mistake · **human error-ը design-ի ձախողում ա**։*

**Krug (*Don't Make Me Think*):** self-evident > self-explanatory · satisficing · scan not read · the trunk test · billboard-design-101 (obvious hierarchy) · "get rid of half the words, then half again."
*HY: Krug՝ self-evident > self-explanatory · satisficing · scan, ոչ read · trunk test · «բառերի կեսը հանիր, հետո էլի կեսը»։*

**Gestalt principles:** proximity · similarity · common region · continuity · closure · figure-ground · common fate · symmetry. (Grouping without lines.)
*HY: Gestalt՝ proximity · similarity · common-region · continuity · closure · figure-ground · common-fate · symmetry (խմբավորում առանց գծի)։*

**Frost — Atomic Design:** atoms → molecules → organisms → templates → pages. A naming/mental model for composable systems, mapped onto token tiers (§5.1–5.2).
*HY: Frost — Atomic Design՝ atom → molecule → organism → template → page (composable system-ի model, token-շերտերին համապատասխան §5.1–5.2)։*

**Tufte:** data-ink ratio · erase chartjunk & non-data-ink · small multiples · sparklines · lie factor · "above all else, show the data."
*HY: Tufte՝ data-ink ratio · chartjunk-ը ջնջիր · small multiples · sparkline · lie factor · «ամենից առաջ՝ ցույց տուր data-ն»։*

**Wroblewski:** **Mobile First** (design the smallest first, it forces focus) · **Web Form Design** (top-aligned labels, one column, minimize fields, smart defaults).
*HY: Wroblewski՝ **Mobile First** (փոքրը նախ, focus ա պարտադրում) · **Web Form Design** (top-aligned label, մեկ column, քիչ field, smart default)։*

**Cooper / Garrett:** Cooper — goal-directed design, personas, "the inmates are running the asylum." Garrett — **the five planes**: strategy → scope → structure → skeleton → surface (abstract → concrete).
*HY: Cooper՝ goal-directed design, persona. Garrett՝ **հինգ plane**՝ strategy → scope → structure → skeleton → surface։*

**Process & discovery:** **Double Diamond** (Discover → Define → Develop → Deliver — diverge/converge twice) · **Design Thinking** (Empathize → Define → Ideate → Prototype → Test) · **JTBD** (hire-a-product, outcome-driven — Christensen/Ulwick).
*HY: Process՝ **Double Diamond** (Discover→Define→Develop→Deliver) · **Design Thinking** (Empathize→Define→Ideate→Prototype→Test) · **JTBD** (product-ը «վարձում» են, outcome-driven)։*

**WCAG 2.2 (POUR):** Perceivable · Operable · Understandable · Robust; AA contrast 4.5:1 text / 3:1 large & UI; keyboard-operable; focus visible & not-obscured; target size (24/44px); reduced motion; not-by-color-alone; reflow at 400%; redundant-entry & accessible-auth. **WAI-ARIA APG** = the keyboard/role patterns for widgets.
*HY: WCAG 2.2 (POUR)՝ Perceivable·Operable·Understandable·Robust. AA contrast 4.5:1/3:1. keyboard, focus տեսանելի ու չծածկված, target size (24/44px), reduced-motion, ոչ-միայն-color, 400% reflow, redundant-entry/accessible-auth։ **WAI-ARIA APG** = widget-ի keyboard/role pattern։*

**Core Web Vitals:** LCP <2.5s · CLS <0.1 · INP <200ms (field-measured). Budgeted & gated in CI.
*HY: Core Web Vitals՝ LCP <2.5s · CLS <0.1 · INP <200ms (field-չափված, CI-ում budget+gate)։*

**Refactoring UI essentials (Wathan/Schoger):** start with a feature, not a layout · hierarchy via de-emphasis · more grays/shades than you think · space generously then tighten · color via HSL ramps · depth via subtle shadow/overlap, not heavy borders · text needs hierarchy too · use real/edge-case content while designing.
*HY: Refactoring UI՝ սկսիր feature-ից, ոչ layout-ից · hierarchy-ն de-emphasize-ով · ավելի շատ gray/shade · առատ space հետո սեղմիր · HSL ramp · depth՝ նուրբ shadow/overlap-ով · տեքստն էլ hierarchy ա ուզում · իրական/edge content design-ի ժամանակ։*

**Design tokens — three tiers:** primitive/global → semantic/alias → component. Components consume **semantic**. Theming = swapping semantic values.
*HY: Design token՝ primitive → semantic → component. Component-ը **semantic** ա սպառում. theming = semantic արժեքի swap։*

**States matrix:** empty(first-run/zero-results) · loading(skeleton/spinner) · partial/streaming · error(recoverable) · success · permission-denied · offline/stale · too-much-data.
*HY: States matrix՝ empty(first-run/zero-results) · loading(skeleton/spinner) · partial/streaming · error · success · permission-denied · offline/stale · too-much-data։*

**Interaction/motion:** microinteraction anatomy (trigger→rules→feedback→loops) · meaningful motion (state/continuity/causality) · ease-out-in · 150–300ms UI transitions · `prefers-reduced-motion`.
*HY: Interaction/motion՝ microinteraction (trigger→rules→feedback→loops) · իմաստալից motion · ease-out/in · 150–300ms · `prefers-reduced-motion`։*

---

## 10. ԲԱՌԱՐԱՆ (glossary)

**EN:** the five planes (strategy/scope/structure/skeleton/surface) · five lenses (researcher/architect/product-designer/systems-lead/frontend-engineer) · hierarchy · cognitive load · satisficing · progressive disclosure · recognition vs recall · affordance · signifier · mapping · feedback · constraint · conceptual/mental model · Gulf of Execution/Evaluation · seven stages of action · slip vs mistake · mode error · Gestalt (proximity/similarity/common-region/figure-ground/common-fate) · squint test · F-pattern/Z-pattern/layer-cake · scanning · modular type scale · measure (line length) · vertical rhythm · tabular figures · spacing scale · neutral/spine ramp · semantic color · tint/shade ramp · 60-30-10 · contrast (4.5:1 / 3:1) · density modes · data-ink ratio · chartjunk · small multiples · sparkline · lie factor · design tokens (primitive/semantic/component) · theming · atomic design (atoms/molecules/organisms/templates/pages) · component variants/states (default/hover/active/focus-visible/disabled/loading/error/selected) · compound components · composition over configuration · layout primitives (Stack/Cluster/Grid/Sidebar/Center/Cover) · information architecture · organizing schemes · card sorting (open/closed) · tree testing · wayfinding · trunk test · user flow · JTBD · persona · empathy map · journey map · service blueprint · Double Diamond · design thinking · contextual inquiry / genchi genbutsu · usability testing (think-aloud/5-users/SUS/SEQ) · heuristic evaluation · cognitive walkthrough · onboarding/aha · states matrix · microcopy · content design · placeholder-as-label · forgiving format · form validation (inline/forgiving) · smart defaults · error prevention vs recovery · undo vs confirm · microinteraction (trigger/rules/feedback/loops) · meaningful motion · easing/duration · perceived performance · optimistic UI · WCAG/POUR · WAI-ARIA / APG · accessible name · live region · focus-visible / focus trap+restore · skip-link · roving tabindex · touch target (44/24px) · prefers-reduced-motion · inclusive design · curb-cut effect · responsive/mobile-first · fluid scaling (clamp) · container query · intrinsic CSS · breakpoint · text expansion · RTL · LCP/CLS/INP · Core Web Vitals · performance budget · skeleton vs spinner · virtualization · code-split · rendering strategy (CSR/SSR/SSG/ISR/islands/RSC) · server-cache vs client state · URL-as-state · Nielsen heuristics · Fitts/Hick/Miller/Tesler/Jakob/Doherty/Goal-Gradient/Peak-End/Serial-position/Von-Restorff/Parkinson laws · aesthetic-usability effect · dark patterns · registry-vs-operations layout · template-stamping · role-fit gating · verified-rendered.

**HY (հիմնական եզրեր, native):** հինգ plane (strategy/scope/structure/skeleton/surface) · հինգ ոսպնյակ (researcher/architect/product-designer/systems-lead/frontend-engineer) · hierarchy (ի՞նչը առաջ) · cognitive load (մտածողական բեռ) · satisficing (առաջին հավանականը) · progressive disclosure (աստիճանական բացահայտում) · recognition vs recall (ճանաչել vs հիշել) · affordance (ինչ ա հնարավոր) · signifier (տեսանելի cue) · mapping (control↔էֆեկտ համապատասխանություն) · feedback · constraint (սահմանափակում) · conceptual/mental model · Gulf of Execution/Evaluation (կատարման/գնահատման անդունդ) · action-ի 7 փուլ · slip vs mistake · mode error · Gestalt (proximity/similarity/common-region/figure-ground/common-fate) · squint test (լղոզման թեստ) · F/Z/layer-cake scanning · modular type scale · measure (տողի երկարություն) · vertical rhythm · tabular figure · spacing scale · neutral/spine ramp · semantic color · tint/shade ramp · 60-30-10 · contrast (4.5:1/3:1) · density mode · data-ink ratio · chartjunk · small multiples · sparkline · lie factor · design token (primitive/semantic/component) · theming · atomic design (atom/molecule/organism/template/page) · component-ի variant/state · compound component · composition over configuration · layout primitive (Stack/Cluster/Grid/Sidebar/Center/Cover) · information architecture · կազմակերպման սխեմա · card sorting (open/closed) · tree testing · wayfinding (ուր եմ/ինչ կարամ/ուր գնամ) · trunk test · user flow · JTBD (job-to-be-done) · persona · empathy map · journey map · service blueprint · Double Diamond · design thinking · contextual inquiry / genchi genbutsu (գնա ու տես) · usability testing (think-aloud / 5 user / SUS/SEQ) · heuristic evaluation · cognitive walkthrough · onboarding/aha · states matrix · microcopy · content design · placeholder-as-label · forgiving format (ներողամիտ ընդունում) · form validation (inline/forgiving) · smart default · error-ի կանխում vs վերականգնում · undo vs confirm · microinteraction (trigger/rules/feedback/loops) · իմաստալից motion · easing/duration · perceived performance (ընկալվող արագություն) · optimistic UI · WCAG/POUR · WAI-ARIA / APG · accessible name · live region · focus-visible / focus trap+restore · skip-link · roving tabindex · touch target (44/24px) · prefers-reduced-motion · inclusive design · curb-cut effect (եզրաքարի էֆեկտ) · responsive/mobile-first · fluid scaling (clamp) · container query · intrinsic CSS · breakpoint · text expansion (տեքստի երկարացում) · RTL · LCP/CLS/INP · Core Web Vitals · performance budget · skeleton vs spinner · virtualization · code-split · rendering strategy (CSR/SSR/SSG/ISR/islands/RSC) · server-cache vs client state · URL-as-state · Nielsen-ի heuristics · Fitts/Hick/Miller/Tesler/Jakob/Doherty/Goal-Gradient/Peak-End/Serial-position/Von-Restorff/Parkinson օրենքներ · aesthetic-usability effect · dark pattern (խաբուսիկ pattern) · registry-vs-operations layout · template-stamping · role-fit gating · verified-rendered (rendered-ում ստուգված)։

---

*EN: Skill 03 v4 — top-level, living. Research the problem → structure the flow → derive content/role → fit the system → render verified reality. Understand the user before you draw; content/role decides what's on the screen — no blind templates; gate every zone by role-fit; design every state; tokens not hardcodes; atomic, composable components; semantic HTML and accessibility as baseline, never an add-on; motion that means something; measure performance against Core Web Vitals; fluid & responsive; never a dark pattern. Make it clear, consistent, fast, accessible, quietly excellent — and never "done" until verified rendered in the running app. (2026-06-23 scars kept: anti-template · per-zone role-fit · verified-rendered. 2026-06-24: research/process · interaction/motion · product-judgment · responsive/fluid · accessibility deepened to max.)*

*HY: Skill 03 v4 — top-level, living։ Հետազոտիր problem-ը → structure արա flow-ը → բխեցրու content/role-ը → տեղավորիր system-ում → render-արա ստուգված իրականություն։ Հասկացիր user-ին նախքան նկարելը. content/role-ն ա որոշում ինչ կա էկրանին — ոչ կույր template. ամ zone-ը gate արա role-fit-ով. ամ state-ը նախագծիր. token, ոչ hardcode. atomic, composable component. semantic HTML ու accessibility՝ baseline, երբեք add-on. motion, որ իմաստ ունի. չափիր performance-ը Core Web Vitals-ով. fluid ու responsive. երբեք dark pattern։ Արա պարզ, consistent, արագ, accessible, հանգիստ-գերազանց — ու երբեք «done» չի, քանի դեռ rendered-ի մեջ չես ստուգել աշխատող app-ում։ (2026-06-23 scar-երը պահված՝ anti-template · per-zone role-fit · verified-rendered։ 2026-06-24՝ research/process · interaction/motion · product-judgment · responsive/fluid · accessibility՝ խորացված մինչև max։) 💪🤍*
