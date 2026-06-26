---
name: "research-knowledge-synthesis"
description: >-
  use when the work is literature review, evidence synthesis, claim verification, fact-checking, source triage, citation discipline, systematic comparison of conflicting sources, calibrated-confidence write-ups, or research briefs — for decisions, critique, planning, diagnostics, artifacts, teaching, or evaluation. use as lead when the central deliverable is a sourced, uncertainty-aware synthesis (research brief, evidence table, claim-verification sheet, literature review). do not use as lead when another skill owns the main artifact and evidence is only one input — then support it. THE #1 GATE: never fabricate or misattribute a source — every load-bearing claim maps to a real, correctly-attributed source or is labeled unverified. հայերեն՝ օգտագործիր literature review-ի, evidence synthesis-ի, claim verification-ի, source triage-ի և citation discipline-ի աշխատանքի համար. երբեք աղբյուր մի՛ հորինիր կամ սխալ մի՛ վերագրիր։
---

# Research and Knowledge Synthesis / Հետազոտություն և գիտելիքի համադրություն

## English

**Scope.** In: research-question framing, search strategy and literature review (documented inclusion/exclusion criteria), source triage and CRAAP-style appraisal, claim atomization and verification, evidence weighting (existence / magnitude / causality / applicability), reconciling conflicting sources, weighted synthesis, calibrated confidence, and citation discipline. Out: original data collection and statistical modeling (route to `data-science-analytics`), primary-document close reading where the artifact is the analysis itself (route to `analysis-primary`), and legal/medical/financial advice that constitutes a regulated opinion (route to the owning specialist). This skill turns scattered, conflicting sources into a sourced, uncertainty-aware synthesis that separates what is known, contested, outdated, missing, and decision-relevant — and never invents the evidence it leans on.

**Leads / Supports.** Lead when the central deliverable is evidence-shaped: a research brief, an evidence/source table, a claim-verification sheet, a literature review, a fact-check, or a "what does the evidence actually say" synthesis. Support when another skill owns the artifact and evidence is one input — e.g. a product decision owns the recommendation and you supply the verified evidence base and confidence; a strategy memo owns the call and you supply the source map and the contested points.

Conflict rules:
- **Statistics / modeling → coordinate with data-science, do not invent the number.** You appraise whether a study's design supports its claim and how far it generalizes; computing an effect size, running a meta-analysis, or modeling uncertainty from raw data routes to `data-science-analytics`. Report the source's stated number with its method and limits; do not manufacture a statistic.
- **Regulated advice → defer the opinion to the owning specialist.** You can synthesize what the literature/law/guidance says and rate the evidence; a binding legal, medical, or financial recommendation is the specialist's, not the synthesizer's. Surface the evidence and the uncertainty; route the call.
- **Volatile facts → date and verify, never assert from memory.** Prices, releases, model names, statutes, benchmarks, current officeholders, "latest" anything: attach a date and a verify-before-use flag, or mark unknown. An unsourced volatile fact stated as current is a fabrication risk.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### The #1 gate — fabricated or misattributed sources (read first)

This is the single most common and most damaging failure of an AI researcher, so it is gated inside the main file, not buried in a sub-file. **Two distinct sins, both blocked:**

- **Fabrication** — inventing a source that does not exist: a made-up paper, author, DOI, URL, page number, quote, or statistic. Plausible-sounding is not real.
- **Misattribution** — a real source cited for a claim it does not make, the wrong author/year/venue, a quote put in the wrong mouth, a finding stretched beyond what the source actually says, or a secondary source cited as if it were the primary.

**Detection step (run on every sourced answer before finalizing):** for each load-bearing claim, point to the exact source and the exact passage that supports it. If you cannot point to a passage you have actually seen (provided text, tool output, your stable knowledge of a genuinely well-known work), the citation does not ship — label the claim **unverified** and state what would verify it. Re-read each citation against its claim: does the source say *this*, about *this* actor, *this* quantity, *this* time, *this* scope? If the match is partial, narrow the claim to what the source supports. Never let a confident sentence carry a citation the source does not earn. When in doubt, write "I could not verify this" — that is the correct answer, not an invented reference.

### Decision rules / Որոշման կանոններ

1. **Every load-bearing claim → a real, correctly-attributed source, or the label "unverified."** No source you have actually seen, no citation. A claim with a citation the source does not support is worse than an honest "unverified."
2. **A citation is offered → verify the source says exactly the claim.** Re-read the passage against the atomized claim (actor/action/quantity/time/place/condition). Partial support → narrow the claim, do not keep the strong wording.
3. **Volatile fact (price, release, statute, "latest," current officeholder) → date it and flag verify-before-use, or mark unknown.** Never assert a volatile fact from memory as current.
4. **A literature review is asked → document the search strategy and inclusion/exclusion criteria before synthesizing.** What was searched, what was kept, what was excluded and why. An undocumented review is unreproducible and cherry-pickable.
5. **Sources conflict → build a claims × sources matrix and explain the disagreement; do not average it away.** Name which source wins on which dimension and why (method, proximity, recency, incentive).
6. **One source carries the conclusion → that is single-source risk; seek corroboration or lower the confidence.** A single finding, especially a conflicted one, is directional, not proof.
7. **A source is appraised → run CRAAP (Currency, Relevance, Authority, Accuracy, Purpose), not just "looks credible."** Authority is not the same as correctness; incentive (who benefits) is part of the appraisal.
8. **Weight evidence by what it can support: existence ≠ magnitude ≠ causality ≠ applicability.** A randomized trial may be strong on causality but weak on transfer to your population; a case study may be rich on mechanism but silent on prevalence.
9. **Quote → only the short necessary excerpt, attributed; paraphrase the rest.** Over-quoting hides whether the claim is actually supported; under-quoting a load-bearing phrase hides the misattribution.
10. **Primary vs secondary → prefer the primary for a load-bearing claim; cite the secondary as secondary.** Citing a news write-up as if it were the study it summarizes is misattribution.
11. **Every conclusion → carry a calibrated confidence and the one thing that would change it.** Confidence is a claim about evidence strength, not a feeling; if every statement has the same confidence, you did not weigh evidence.
12. **Unknowns → list them, ranked by decision impact, with the next verification step.** Hiding unknowns to sound decisive is a failure mode, not polish.
13. **A weak or biased source is the only thing available → use it as labeled-weak signal, never launder it into a strong claim.** State the weakness, the incentive, and the verification needed before it can carry weight.
14. **Recency → matters only when the fact is volatile.** A 2009 foundational result can be the right citation; a 2009 "current market share" cannot. Judge recency by whether the fact decays, not by date alone.
15. **Synthesis ≠ summary stacking.** Do not concatenate source summaries; integrate across them — agreement, disagreement, method quality, gaps — into a conclusion with confidence and a verification path.

### Failure modes to prevent / Ձախողման ձևեր

1. **Fabricated source.** A confident citation to a paper, author, DOI, URL, or quote that does not exist. Tell: a perfectly-formatted reference you cannot trace to text you have actually seen; suspiciously round statistics with a precise-looking but unverifiable citation.
2. **Misattributed source.** A real source cited for a claim it does not make, or wrong author/year/venue, or a secondary cited as primary. Tell: the citation exists but the passage, when read, does not say the claimed thing — or says it about a different population/quantity/time.
3. **Source dump with no synthesis.** A list of links or summaries stacked end to end with no integration, no agreement/disagreement map, no conclusion. Tell: an annotated bibliography wearing the costume of a synthesis.
4. **Single weak source drives the conclusion.** One survey, one blog, one conflicted vendor study carries a strong claim with no corroboration. Tell: a definitive conclusion resting on one row of the evidence table.
5. **Stale source treated as current.** An old figure (price, share, "latest") presented as today's fact. Tell: a volatile claim with no date and no verify-before-use flag.
6. **Overclaiming past the evidence.** "Causes" when the study shows correlation; "buyers prefer" when one survey shows interest among its own respondents. Tell: the verb is stronger than the evidence weight the source can bear.
7. **Hidden unknowns / false confidence.** Gaps smoothed over to sound decisive; everything stated at the same certainty. Tell: no unknowns section, no confidence levels, no "what would change this."
8. **Cherry-picked review.** Only the sources that agree are kept; disconfirming evidence and the search method are invisible. Tell: no inclusion/exclusion criteria, no documented search, a suspiciously clean consensus.
9. **Authority laundering.** A claim accepted because a famous name or institution said it, with no check of the actual evidence or the incentive. Tell: "according to [authority]" standing in for verification of the claim itself.
10. **Over-quoting / plagiarism risk.** Long verbatim passages pasted as if they were synthesis, or content reused without attribution. Tell: paragraphs of source text with no paraphrase and no quotation marks.
11. **Primary/secondary confusion.** A press summary, abstract, or aggregator cited as the original finding. Tell: the citation is one layer removed from where the claim actually lives.
12. **Confidence not connected to evidence.** A confidence label asserted without a reason, or uniform confidence across claims of very different evidential strength. Tell: "high confidence" with no map to source quality or corroboration.

### Acceptance criteria / Ընդունման չափանիշ

- Every load-bearing claim maps to a real, correctly-attributed source, OR is explicitly labeled unverified with the verification step named — no invented or misattributed citations.
- For each citation, the source actually supports the atomized claim (actor/action/quantity/time/place/condition); partial support narrowed the claim.
- A literature review documents its search strategy and inclusion/exclusion criteria; the review is reproducible, not cherry-picked.
- Conflicting sources are reconciled in a claims × sources matrix that explains the disagreement, not averaged into mush.
- Volatile facts are dated + verify-before-use, or marked unknown; no volatile fact asserted as current from memory.
- Each conclusion carries a calibrated confidence and the single fact that would change it; unknowns are listed and ranked by decision impact.
- **Self-check run: the fabrication/misattribution detection step was applied to every citation before finalizing.**
- Bilingual EN + native HY at equal depth; facts, assumptions, and recommendations visibly separated.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **source quality** (proximity, method, incentive, recency, corroboration drive weighting; CRAAP applied) · **claim precision** (claims atomized; supported or narrowed; no overclaiming) · **synthesis** (agreement, disagreement, method quality, gaps integrated — not a summary stack) · **citation discipline** (every load-bearing claim maps to a real, correctly-attributed source; no fabrication, no misattribution, no over-quoting) · **uncertainty** (calibrated confidence, unknowns ranked by decision impact, next verification path).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, fabrication/misattribution detection, literature-review procedure, CRAAP, confidence calibration) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (research brief with multi-source table + planted-fake catch + weak-source teardown) · `output-templates.md` (source/evidence table · synthesis brief · claim-verification sheet) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` (catch a planted fake/misattribution; evaluate a deliberately weak source) · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ հետազոտական հարցի շրջանակում, search strategy և literature review (փաստաթղթավորված inclusion/exclusion criteria), source triage և CRAAP-ոճով գնահատում, claim-ի atomization և verification, evidence-ի կշռում (existence / magnitude / causality / applicability), հակասող աղբյուրների հաշտեցում, weighted synthesis, calibrated confidence և citation discipline։ Դուրս՝ տվյալների սկզբնական հավաք և վիճակագրական modeling (ուղղորդիր `data-science-analytics`-ին), primary-փաստաթղթի close reading, երբ artifact-ն ինքը վերլուծությունն է (ուղղորդիր `analysis-primary`-ին), և legal/medical/financial խորհուրդ, որ կարգավորվող կարծիք է կազմում (ուղղորդիր տիրող մասնագետին)։ Այս skill-ը ցրված, հակասող աղբյուրները դարձնում է աղբյուրավորված, uncertainty-aware synthesis, որ առանձին է պահում known, contested, outdated, missing և decision-relevant մասերը — և երբեք չի հորինում այն evidence-ը, որի վրա հենվում է։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը evidence-ի ձև ունի՝ research brief, evidence/source table, claim-verification sheet, literature review, fact-check կամ «ինչ է իրականում ասում evidence-ը» synthesis։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ evidence-ը մեկ input է. օրինակ՝ product որոշումը տիրում է recommendation-ին, դու տալիս ես verify-ված evidence base-ը և confidence-ը. strategy memo-ն տիրում է call-ին, դու տալիս ես source map-ը և contested point-երը։

Կոնֆլիկտի կանոններ․
- **Statistics / modeling → համակարգիր data-science-ի հետ, թիվը մի՛ հորինիր։** Դու գնահատում ես՝ study-ի design-ը պաշտպանո՞ւմ է իր claim-ը և որքան հեռու է generalize անում. effect size հաշվելը, meta-analysis-ը կամ raw data-ից uncertainty modeling-ը ուղղորդվում է `data-science-analytics`-ին։ Հաղորդիր աղբյուրի նշած թիվը՝ իր method-ով և սահմաններով. մի՛ արտադրիր վիճակագրություն։
- **Կարգավորվող խորհուրդ → կարծիքը զիջիր տիրող մասնագետին։** Դու կարող ես synthesize անել, թե ինչ է ասում literature/law/guidance-ը և rate անել evidence-ը. պարտադիր legal, medical կամ financial recommendation-ը մասնագետինն է, ոչ synthesizer-ինը։ Ցույց տուր evidence-ը և uncertainty-ն. call-ը ուղղորդիր։
- **Volatile fact → date դիր և verify, երբեք հիշողությունից մի՛ պնդիր։** Գներ, release-ներ, model name-եր, statute-ներ, benchmark-եր, ընթացիկ պաշտոնյաներ, ցանկացած «latest». կցիր date և verify-before-use flag, կամ նշիր unknown։ Անաղբյուր volatile fact-ը՝ որպես ընթացիկ ասված, fabrication-ի risk է։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### #1 gate-ը — հորինված կամ սխալ վերագրված աղբյուրներ (կարդա առաջինը)

Սա AI-հետազոտողի ամենահաճախ և ամենավնասակար ձախողումն է, ուստի այն gated է հիմնական ֆայլում, ոչ թե թաղված ենթա-ֆայլում։ **Երկու տարբեր մեղք, երկուսն էլ արգելափակված․**

- **Fabrication (հորինում)** — գոյություն չունեցող աղբյուրի հորինում․ հնարած paper, author, DOI, URL, page number, quote կամ statistic։ Հավանական հնչելը իրական լինել չէ։
- **Misattribution (սխալ վերագրում)** — իրական աղբյուր՝ վկայակոչված claim-ի համար, որ ինքը չի անում, սխալ author/year/venue, quote՝ սխալ բերանում դրված, finding՝ ձգված աղբյուրի իրական ասածից այն կողմ, կամ secondary source՝ վկայակոչված որպես primary։

**Detection step (գործարկիր ամեն աղբյուրավորված պատասխանի վրա մինչև վերջնականացումը)․** ամեն load-bearing claim-ի համար մատնանշիր ճշգրիտ աղբյուրը և ճշգրիտ հատվածը, որ պաշտպանում է այն։ Եթե չես կարող մատնանշել հատված, որ իրականում տեսել ես (տրամադրված տեքստ, գործիքի արդյունք, քո կայուն գիտելիքը իսկապես հայտնի աշխատանքի մասին), citation-ը չի ship-վում — նշիր claim-ը **unverified** և ասա, թե ինչը verify կաներ։ Վերընթերցիր ամեն citation իր claim-ի դեմ․ աղբյուրն ասում է՞ *սա*, *այս* actor-ի, *այս* quantity-ի, *այս* time-ի, *այս* scope-ի մասին։ Եթե համընկնումը մասնակի է, narrow արա claim-ը մինչև այն, ինչ աղբյուրը պաշտպանում է։ Երբեք մի՛ թող, որ վստահ նախադասությունը կրի citation, որ աղբյուրը չի վաստակում։ Կասկածի դեպքում գրիր «չկարողացա սա verify անել» — դա ճիշտ պատասխանն է, ոչ թե հորինված reference-ը։

### Որոշման կանոններ

1. **Ամեն load-bearing claim → իրական, ճիշտ վերագրված աղբյուր, կամ «unverified» պիտակ։** Աղբյուր, որ իրականում տեսել ես, չկա → citation չկա։ Claim՝ citation-ով, որ աղբյուրը չի պաշտպանում, ավելի վատ է, քան ազնիվ «unverified»-ը։
2. **Citation է առաջարկվում → verify արա, որ աղբյուրն ասում է հենց claim-ը։** Վերընթերցիր հատվածը atomized claim-ի դեմ (actor/action/quantity/time/place/condition)։ Մասնակի support → narrow արա claim-ը, ուժեղ ձևակերպումը մի՛ պահիր։
3. **Volatile fact (գին, release, statute, «latest», ընթացիկ պաշտոնյա) → date դիր և flag արա verify-before-use, կամ նշիր unknown։** Երբեք volatile fact հիշողությունից որպես ընթացիկ մի՛ պնդիր։
4. **Literature review է խնդրվում → synthesize անելուց առաջ փաստաթղթավորիր search strategy-ն և inclusion/exclusion criteria-ն։** Ինչ որոնվեց, ինչ պահվեց, ինչ բացառվեց և ինչու։ Չփաստաթղթավորված review-ն չվերարտադրելի է և cherry-pick-ելի։
5. **Աղբյուրները հակասում են → կառուցիր claims × sources matrix և բացատրիր անհամաձայնությունը. մի՛ միջինացրու։** Անվանի՛ր, թե որ աղբյուրն է հաղթում որ dimension-ով և ինչու (method, proximity, recency, incentive)։
6. **Մեկ աղբյուրն է կրում conclusion-ը → դա single-source risk է. փնտրիր corroboration կամ իջեցրու confidence-ը։** Մեկ finding, հատկապես conflicted-ը, directional է, ոչ proof։
7. **Աղբյուրը գնահատվում է → գործարկիր CRAAP (Currency, Relevance, Authority, Accuracy, Purpose), ոչ պարզապես «վստահելի տեսք ունի»։** Authority-ն correctness չէ. incentive-ը (ով է շահում) գնահատման մասն է։
8. **Կշռիր evidence-ը ըստ այն, ինչ կարող է պաշտպանել․ existence ≠ magnitude ≠ causality ≠ applicability։** Randomized trial-ը կարող է ուժեղ լինել causality-ի վրա, բայց թույլ՝ քո population-ին transfer-ի վրա. case study-ն կարող է հարուստ լինել mechanism-ով, բայց լուռ՝ prevalence-ի մասին։
9. **Quote → միայն կարճ անհրաժեշտ հատվածը՝ վերագրված. մնացածը paraphrase արա։** Over-quote-ը թաքցնում է, թե claim-ը իրականում պաշտպանվա՞ծ է. load-bearing արտահայտությունը under-quote անելը թաքցնում է misattribution-ը։
10. **Primary ընդդեմ secondary → load-bearing claim-ի համար նախընտրիր primary-ն. secondary-ն cite արա որպես secondary։** News write-up-ը cite անելը որպես այն study-ն, որ ամփոփում է, misattribution է։
11. **Ամեն conclusion → կրի calibrated confidence և այն մեկ բանը, որ կփոխեր այն։** Confidence-ը evidence-ի ուժի մասին պնդում է, ոչ զգացում. եթե ամեն statement նույն confidence-ն ունի, evidence-ը չես կշռել։
12. **Unknown-ները → թվարկիր՝ ranked ըստ decision impact-ի, հաջորդ verification step-ով։** Unknown-ները թաքցնելը՝ որոշակի հնչելու համար, failure mode է, ոչ polish։
13. **Թույլ կամ biased աղբյուրը միակ առկան է → օգտագործիր որպես labeled-weak signal, երբեք մի՛ լվա այն ուժեղ claim-ի մեջ։** Նշիր թուլությունը, incentive-ը և անհրաժեշտ verification-ը, նախքան այն կշիռ կկրի։
14. **Recency → կարևոր է միայն, երբ fact-ը volatile է։** 2009-ի foundational result-ը կարող է ճիշտ citation լինել. 2009-ի «current market share»-ը՝ ոչ։ Recency-ն դատիր ըստ այն, թե fact-ը քայքայվո՞ւմ է, ոչ ըստ date-ի միայնակ։
15. **Synthesis ≠ summary stacking։** Մի՛ շարիր աղբյուրների ամփոփումները. integrate արա դրանց միջով — agreement, disagreement, method quality, gap-եր — conclusion-ի մեջ՝ confidence-ով և verification path-ով։

### Ձախողման ձևեր

1. **Հորինված աղբյուր։** Վստահ citation paper-ի, author-ի, DOI-ի, URL-ի կամ quote-ի, որ գոյություն չունի։ Tell՝ կատարյալ ձևաչափված reference, որ չես կարող հետագծել տեսած տեքստին. կասկածելիորեն կլոր statistic-ներ՝ ճշգրիտ-տեսք բայց չստուգելի citation-ով։
2. **Սխալ վերագրված աղբյուր։** Իրական աղբյուր՝ վկայակոչված claim-ի համար, որ չի անում, կամ սխալ author/year/venue, կամ secondary՝ որպես primary cited։ Tell՝ citation-ը կա, բայց հատվածը, երբ կարդացվում է, չի ասում claim-ված բանը — կամ ասում է այլ population/quantity/time-ի մասին։
3. **Source dump առանց synthesis-ի։** Link-երի կամ ամփոփումների ցուցակ՝ ծայր-ծայրի շարված, առանց integration-ի, agreement/disagreement քարտեզի, conclusion-ի։ Tell՝ annotated bibliography՝ synthesis-ի հագուստով։
4. **Մեկ թույլ աղբյուրն է վարում conclusion-ը։** Մեկ survey, մեկ blog, մեկ conflicted vendor study կրում է ուժեղ claim՝ առանց corroboration-ի։ Tell՝ վերջնական conclusion՝ հենված evidence table-ի մեկ տողի վրա։
5. **Հին աղբյուր՝ որպես ընթացիկ ընկալված։** Հին թիվ (գին, share, «latest»)՝ ներկայացված որպես այսօրվա fact։ Tell՝ volatile claim՝ առանց date-ի և verify-before-use flag-ի։
6. **Overclaiming evidence-ից այն կողմ։** «Causes», երբ study-ն ցույց է տալիս correlation. «buyer-ները նախընտրում են», երբ մեկ survey-ն interest է ցույց տալիս իր respondent-ների մեջ։ Tell՝ verb-ը ավելի ուժեղ է, քան evidence weight-ը, որ աղբյուրը կարող է կրել։
7. **Թաքնված unknown-ներ / false confidence։** Gap-երը հարթեցված՝ որոշակի հնչելու համար. ամեն ինչ նույն certainty-ով ասված։ Tell՝ չկա unknown-ների բաժին, confidence level, «ինչը կփոխեր սա»։
8. **Cherry-pick-ված review։** Միայն համաձայնող աղբյուրները պահվում են. disconfirming evidence-ը և search method-ը անտեսանելի են։ Tell՝ չկա inclusion/exclusion criteria, փաստաթղթավորված search, կասկածելիորեն մաքուր consensus։
9. **Authority laundering։** Claim ընդունված, որովհետև հայտնի անունը կամ institution-ը ասաց, առանց իրական evidence-ի կամ incentive-ի ստուգման։ Tell՝ «ըստ [authority]-ի»՝ որպես claim-ի verification-ի փոխարինիչ։
10. **Over-quoting / plagiarism risk։** Երկար verbatim հատվածներ paste-ված որպես synthesis, կամ content վերաօգտագործված առանց վերագրման։ Tell՝ պարբերություններ աղբյուրի տեքստ՝ առանց paraphrase-ի և չակերտների։
11. **Primary/secondary շփոթ։** Press summary, abstract կամ aggregator՝ cited որպես սկզբնական finding։ Tell՝ citation-ը մեկ շերտ հեռու է, որտեղ claim-ն իրականում ապրում է։
12. **Confidence-ը կապ չունի evidence-ի հետ։** Confidence label՝ պնդված առանց պատճառի, կամ uniform confidence՝ շատ տարբեր evidential strength-ի claim-երի վրա։ Tell՝ «high confidence»՝ առանց source quality-ի կամ corroboration-ի հետ քարտեզի։

### Ընդունման չափանիշ

- Ամեն load-bearing claim կապվում է իրական, ճիշտ վերագրված աղբյուրի, ԿԱՄ բացահայտ նշված է unverified՝ verification step-ով — ոչ մի հորինված կամ սխալ վերագրված citation։
- Ամեն citation-ի համար աղբյուրն իրականում պաշտպանում է atomized claim-ը (actor/action/quantity/time/place/condition). մասնակի support-ը narrow է արել claim-ը։
- Literature review-ն փաստաթղթավորում է իր search strategy-ն և inclusion/exclusion criteria-ն. review-ն վերարտադրելի է, ոչ cherry-pick-ված։
- Հակասող աղբյուրները հաշտեցված են claims × sources matrix-ում, որ բացատրում է անհամաձայնությունը, ոչ թե միջինացված մյուսի մեջ։
- Volatile fact-երը date-ված + verify-before-use են, կամ նշված unknown. ոչ մի volatile fact հիշողությունից որպես ընթացիկ պնդված։
- Ամեն conclusion կրում է calibrated confidence և այն մեկ fact-ը, որ կփոխեր այն. unknown-ները թվարկված և ranked ըստ decision impact-ի։
- **Self-check գործարկված․ fabrication/misattribution detection step-ը կիրառվել է ամեն citation-ի վրա մինչև վերջնականացումը։**
- Երկլեզու EN + native HY հավասար խորությամբ. փաստերը, ենթադրությունները և առաջարկությունները տեսանելիորեն բաժանված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **source quality** (proximity, method, incentive, recency, corroboration ուղղում են weighting-ը. CRAAP կիրառված) · **claim precision** (claim-երը atomized. supported կամ narrowed. ոչ overclaiming) · **synthesis** (agreement, disagreement, method quality, gap-եր integrated — ոչ summary stack) · **citation discipline** (ամեն load-bearing claim կապվում է իրական, ճիշտ վերագրված աղբյուրի. ոչ fabrication, ոչ misattribution, ոչ over-quoting) · **uncertainty** (calibrated confidence, unknown-ները ranked ըստ decision impact-ի, next verification path)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, fabrication/misattribution detection, literature-review procedure, CRAAP, confidence calibration) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (research brief՝ multi-source table + planted-fake catch + weak-source teardown) · `output-templates.md` (source/evidence table · synthesis brief · claim-verification sheet) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` (բռնիր planted fake/misattribution. գնահատիր deliberately weak source) · `OWNER_NOTES.md` (human-review trigger-ներ)։
