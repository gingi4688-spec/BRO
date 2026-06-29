# Auditing red-team gate

## English

This gate extends the skill's final gate for every audit deliverable (charter, evidence-and-sampling plan, finding, audit report). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **No criteria — auditing against vibes** — a finding with a Condition and a Consequence but no named Criteria. Stop and dispatch the criteria from the domain skill; "should" needs a source.
- **Opinion not evidence** — a conclusion that cannot be re-derived from a reproducible working paper; inquiry alone ("they said it works") treated as proof. Require direct/corroborated evidence.
- **Design tested, operating not** — "the policy exists / the control is configured" accepted as "the control works." Require operating-effectiveness evidence across the period.
- **Symptom, not root cause** — a Cause that restates the Condition or names a person; a corrective action that fixes one instance, not the class. Dig to the control/process.
- **Sampling bias / over-extrapolation** — a clean sample projected onto the whole population; the easy/recent items sampled. Require the population, the sampling basis, and the residual risk.
- **Severity inflation AND deflation** — trivia called critical (credibility burns) or a real critical softened for politics. Re-anchor to likelihood × impact bands.
- **Missing independence / self-review threat** — the auditor reviews their own work, or a stakeholder grades the outcome, and it is called independent. Declare it or recuse.
- **Scope creep** — findings outside the agreed scope, or a scope never written down, so the in-scope population is under-covered.
- **Silent coverage gap** — a confident clean conclusion with no population size, no "what was not covered," no residual-risk statement. The completeness law is violated.
- **Checklist theater** — every box ticked, zero reperformance, zero evidence references.
- **Unreproducible evidence** — a finding backed by a vanished screenshot, a verbal claim, or a number no second auditor can re-derive.
- **Absolute assurance** — "100% secure," "fully compliant," "guaranteed clean," with no residual risk.
- **Auditor became the fixer** — the same person found, fixed, and signed off the issue with no independent verification.

### Reviewer probes (ask these of any audit)

- **What are the criteria, and where did they come from?** If there is no named standard dispatched from the domain skill, it is not an audit — it is an opinion.
- **What is the population, and what did you NOT cover?** State the size, the tested count, the named uncovered remainder, the sampling risk, and the residual risk. A silent gap is the worst failure.
- **Did you test design or operating effectiveness?** "The control exists" is design at best. Where is the evidence it actually operated across the period?
- **Is the cause the root cause or a symptom?** Does the corrective action fix the class, or just the one instance you found? Does the Cause name a control/process, not a person?
- **Is the evidence reproducible?** Could a second auditor reach the same finding from the working papers? Is any conclusion resting on inquiry alone?
- **Is the severity calibrated?** Does it match likelihood × impact against defined bands, or did it move under pressure (inflated for drama / deflated for politics)?
- **Are you independent?** Did you produce the subject? Do you have a stake? Are you about to fix what you audit? If any is yes, declare the self-review threat or recuse.
- **Is the assurance reasonable, not absolute?** Did you avoid "100% / fully / guaranteed," distinguish positive from negative assurance, and name the residual risk?
- **Did you stay in your lane?** Is this an audit (facts against criteria) and not a legal/regulatory *opinion* (which routes to `legal-compliance-contracts`)? Did you re-teach the domain instead of dispatching to it?
- **Did the answer invent any standard number, statute, CVE, price, or benchmark, and is the Armenian equal-depth and punctuation-clean (correct `․`/`։`/«», no homoglyphs)?**

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ամեն audit deliverable-ի համար (charter, evidence-and-sampling plan, finding, audit report)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Criteria չկա — vibes-ի դեմ audit** — finding՝ Condition-ով և Consequence-ով, բայց առանց անվանված Criteria-ի։ Կանգնի՛ր և dispatch արա criteria-ն ոլորտի skill-ից. «should»-ը աղբյուր է պահանջում։
- **Opinion, ոչ evidence** — conclusion, որ չի կարող վերածնվել reproducible working paper-ից. inquiry-ն միայնակ («ասացին՝ աշխատում է») որպես ապացույց։ Պահանջի՛ր direct/corroborated evidence։
- **Design թեստավորված, operating՝ ոչ** — «policy-ն կա / control-ը configured է»՝ ընդունված որպես «control-ն աշխատում է»։ Պահանջի՛ր operating-effectiveness evidence ողջ ժամանակահատվածով։
- **Symptom, ոչ root cause** — Cause, որ կրկնում է Condition-ը կամ մարդ է անվանում. corrective action, որ ուղղում է մեկ instance, ոչ class-ը։ Փորիր մինչև control/process-ը։
- **Sampling bias / over-extrapolation** — մաքուր sample՝ project-ված ամբողջ population-ին. հեշտ/վերջին item-երը sample արված։ Պահանջի՛ր population-ը, sampling հիմքը և residual risk-ը։
- **Severity inflation ԵՎ deflation** — trivia-ն critical կոչված (credibility-ն այրվում է) կամ իրական critical-ը քաղաքականության համար մեղմացրած։ Re-anchor արա likelihood × impact band-երին։
- **Բացակայող independence / self-review threat** — auditor-ը review է անում սեփական աշխատանքը, կամ stakeholder-ը grade է անում արդյունքը, և կոչվում independent։ Հայտարարի՛ր կամ recuse արա։
- **Scope creep** — findings համաձայնեցված scope-ից դուրս, կամ scope, որ երբեք չի գրվել, ուստի in-scope population-ը թերի է ծածկվում։
- **Լուռ coverage gap** — վստահ մաքուր conclusion՝ առանց population-ի չափի, առանց «ինչ չի ծածկվել», առանց residual-risk statement-ի։ Completeness law-ը խախտված է։
- **Checklist theater** — ամեն box նշված, զրո reperformance, զրո evidence reference։
- **Չվերարտադրվող evidence** — finding՝ հենված անհետացած screenshot-ի, բանավոր claim-ի, կամ թվի վրա, որ ոչ մի երկրորդ auditor չի կարող վերածնել։
- **Absolute assurance** — «100% secure», «fully compliant», «guaranteed clean»՝ առանց residual risk-ի։
- **Auditor-ը fixer դարձավ** — նույն մարդը գտավ, ուղղեց և sign off արեց issue-ն՝ առանց independent verification-ի։

### Reviewer-ի probe-եր (հարցրու ամեն audit-ին)

- **Ինչ են criteria-ները, և որտեղից եկան։** Եթե ոլորտի skill-ից dispatch-ված անվանված standard չկա, սա audit չէ — opinion է։
- **Ինչ է population-ը, և ինչ ՉԵՍ ծածկել։** Նշի՛ր չափը, թեստավորված count-ը, անվանված չծածկված մնացորդը, sampling risk-ը և residual risk-ը։ Լուռ gap-ը ամենավատ ձախողումն է։
- **Design-ը թեստավորե՞ցիր, թե operating effectiveness-ը։** «Control-ը կա»-ն լավագույն դեպքում design է։ Որտեղ է evidence-ը, որ իրականում operate է արել ողջ ժամանակահատվածում։
- **Cause-ը root cause է՞, թե symptom։** Corrective action-ը ուղղում է class-ը, թե միայն գտնված մեկ instance-ը։ Cause-ը control/process է անվանում, ոչ մարդ։
- **Evidence-ը reproducible է՞։** Երկրորդ auditor-ը կարո՞ղ է working paper-ից նույն finding-ին հասնել։ Որևէ conclusion հենվու՞մ է միայն inquiry-ի վրա։
- **Severity-ն calibrated է՞։** Համապատասխանո՞ւմ է likelihood × impact-ին սահմանված band-երի դեմ, թե shift արեց ճնշման տակ (inflated drama-ի համար / deflated քաղաքականության համար)։
- **Independent ե՞ս։** Subject-ը դու արտադրե՞լ ես։ Stake ունե՞ս։ Պատրաստվու՞մ ես ուղղել այն, ինչ audit ես անում։ Եթե որևէ մեկը այո է, հայտարարի՛ր self-review threat-ը կամ recuse արա։
- **Assurance-ը reasonable է՞, ոչ absolute։** Խուսափե՞ցիր «100% / fully / guaranteed»-ից, տարբերե՞ցիր positive-ը negative-ից, և անվանե՞ցիր residual risk-ը։
- **Քո գծում մնա՞ցիր։** Սա audit է՞ (փաստեր criteria-ի դեմ), ոչ legal/regulatory *opinion* (որ ուղղորդվում է `legal-compliance-contracts`-ին)։ Ոլորտը վերաուսուցանե՞ցիր, թե dispatch արեցիր դրան։
- **Պատասխանը հորինե՞ց standard-ի թիվ, statute, CVE, price կամ benchmark, և հայերենը equal-depth ու punctuation-clean է՞ (ճիշտ `․`/`։`/«», առանց homoglyph-ի)։**
