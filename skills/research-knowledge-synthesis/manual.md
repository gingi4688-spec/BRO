# Research and Knowledge Synthesis manual

## English

### Operating principle

Senior research and synthesis work is decision-grade only when every load-bearing claim is traceable to a real, correctly-attributed source — or is honestly labeled unverified — and the conclusion carries a confidence that matches the evidence. The deliverable is one of four shapes: a source/evidence table, a claim-verification sheet, a synthesis brief, or a literature review. The single guardrail that governs all four is integrity of attribution: if a citation is fabricated or misattributed, every downstream conclusion built on it is poisoned, no matter how clean the reasoning looks. So the first move is never "what do I believe is true," it is "what can I actually point to, and where exactly does it say this." Synthesis is not summary stacking and not a vote count; it is the integration of what is known, contested, outdated, missing, and decision-relevant into a conclusion whose confidence is earned, with the one thing that would change it named out loud. The honest answer "I could not verify this" outranks any confident invented reference.

### Mechanism reference

- **Source triage** — Rank evidence by proximity and incentive, not by polish. A primary source beats commentary; the methods section beats the headline; independent replication beats a single finding; a conflicted source (the vendor selling the thing) needs corroboration before it carries weight. Recency matters only when the fact is volatile — a foundational result can be old and still correct; a "current market share" cannot. Map each source to where it sits: primary (the study, the filing, the dataset), secondary (the review, the news write-up), or tertiary (the encyclopedia, the aggregator). Cite the layer you actually used, and never pass a secondary off as the primary.
- **CRAAP appraisal** — Score a source on five axes before trusting it: **Currency** (is it recent enough for a fact that decays?), **Relevance** (does it actually bear on this claim, this population, this scope?), **Authority** (who produced it, what expertise, but authority ≠ correctness), **Accuracy** (is it verifiable, cited, internally consistent, free of obvious error?), and **Purpose** (why does it exist — to inform, to sell, to persuade — and who benefits?). Purpose and incentive catch the conflicted source that Authority alone would wave through.
- **Claim atomization and verification** — Decompose a claim into actor, action, quantity, time, place, and condition. Each atom needs support. Verify by re-reading the cited passage against the atomized claim: does the source say *this action*, by *this actor*, in *this quantity*, at *this time*, in *this place*, under *this condition*? If any atom lacks support, narrow the claim to what the source earns rather than keeping the strong wording. Quote only the short necessary excerpt and paraphrase the rest; over-quoting hides whether the claim is supported, and under-quoting a load-bearing phrase hides a misattribution.
- **Evidence weighting** — Separate what a piece of evidence can support: **existence** (the thing happened / was observed), **magnitude** (how big), **causality** (X caused Y, not merely correlated), and **applicability** (does it transfer to your population, setting, time?). A randomized controlled trial can be strong on causality yet weak on applicability to a different group; a case study can be rich on mechanism yet silent on prevalence; an observational study can show correlation but not licence "causes." Match the verb to the weight the evidence can bear.
- **Conflict reconciliation** — When sources disagree, do not average them into mush and do not pick the one you like. Build a claims × sources matrix (rows = claims, columns = source / method / date / incentive / support strength / caveat) and explain *why* they differ: different populations, different methods, different time, different incentives, or one is simply wrong. Name which source wins on which dimension. A real disagreement is information, not noise to smooth over.
- **Synthesis** — Integration, not stacking. From the matrix, state where sources agree (and how strongly), where they conflict (and why), where the method quality is strong or weak, and where evidence is simply missing. Then produce a conclusion with a calibrated confidence and the single fact that would move it. A synthesis that reads as a list of summaries did not synthesize.
- **Confidence calibration** — Confidence is a claim about evidence strength, expressed in a stable vocabulary, not a mood. Use a ladder: **high** (multiple independent, high-quality, corroborating sources; direct evidence; applies to this case), **moderate** (some good evidence but gaps, single strong source, or partial applicability), **low** (weak, conflicted, indirect, or stale evidence), **unknown** (no source you can stand behind). Different claims in the same brief should carry different confidence; uniform confidence is a tell that evidence was not weighed. Always pair the level with "what would raise or lower it."

### The fabrication / misattribution detection step (the #1 gate)

This is the most common and most damaging failure of an AI researcher, so run it explicitly on every sourced answer before finalizing. There are two distinct sins:

- **Fabrication** — a source that does not exist: an invented paper, author, DOI, URL, page, quote, or statistic. Plausible formatting is not existence.
- **Misattribution** — a real source cited for a claim it does not make: wrong author/year/venue, a quote in the wrong mouth, a finding stretched past what the source says, or a secondary cited as the primary.

Procedure: (1) For each load-bearing claim, point to the **exact source and exact passage** that supports it. (2) If you cannot point to a passage you have actually seen — provided text, tool output, or your stable knowledge of a genuinely well-known work — do **not** ship the citation; label the claim **unverified** and name the verification step. (3) Re-read each citation against its atomized claim; if the match is partial, narrow the claim. (4) Check the layer: is a secondary being passed as primary? (5) Flag every volatile fact for a date and verify-before-use. The correct output when you cannot verify is the sentence "I could not verify this," never an invented reference that looks tidy.

### Literature-review procedure (documented and reproducible)

A literature review that cannot be reproduced can be cherry-picked, so document the method as a first-class part of the deliverable:

1. **Research question** — state it precisely enough that a source is clearly in or out of scope.
2. **Search strategy** — what was searched (which databases / sources / search terms), over what date range, in what languages. Write it down so someone else could repeat it.
3. **Inclusion criteria** — what makes a source eligible (e.g. peer-reviewed, primary data, relevant population, within the date window, in a language you can verify).
4. **Exclusion criteria** — what disqualifies a source (e.g. no methods stated, conflicted with no corroboration, off-population, opinion piece for a factual claim), and record *why* each excluded source was excluded.
5. **Appraise** — run CRAAP on each included source; record method, date, incentive, support strength, caveat.
6. **Synthesize** — build the claims × sources matrix; report agreement, disagreement, method quality, and gaps; do not drop the disconfirming sources.
7. **Report** — conclusion with calibrated confidence, the unknowns ranked by decision impact, and the next verification step. A clean unanimous consensus with no documented exclusions is a red flag, not a result.

### Decision rules

1. Map every load-bearing claim to a real, correctly-attributed source, or label it unverified with the verification step named; a citation the source does not support is worse than an honest "unverified."
2. When a citation is offered, re-read the passage against the atomized claim; on partial support, narrow the claim rather than keep the strong wording.
3. Date every volatile fact (price, release, statute, "latest," current officeholder) and flag verify-before-use, or mark it unknown; never assert a volatile fact from memory as current.
4. For a literature review, document the search strategy and inclusion/exclusion criteria before synthesizing; an undocumented review is unreproducible and cherry-pickable.
5. When sources conflict, build a claims × sources matrix and explain the disagreement; do not average it away or silently pick one.
6. Treat a conclusion resting on one source as single-source risk; seek corroboration or lower the confidence.
7. Appraise each source with CRAAP, not "looks credible"; weigh incentive (who benefits), because authority is not correctness.
8. Weight evidence by what it can support — existence ≠ magnitude ≠ causality ≠ applicability; match the verb to the weight.
9. Quote only the short necessary excerpt, attributed, and paraphrase the rest; cite a secondary as secondary, never as the primary it summarizes.
10. Give every conclusion a calibrated confidence and the single fact that would change it; uniform confidence across unequal evidence means you did not weigh it.
11. List unknowns ranked by decision impact with the next verification step; hiding unknowns to sound decisive is a failure, not polish.
12. When only a weak or biased source exists, use it as labeled-weak signal — state the weakness and the incentive — and never launder it into a strong claim.
13. Judge recency by whether the fact decays, not by date alone; a foundational result can be old and right, a volatile figure cannot be old and current.
14. Synthesize by integrating across sources (agreement, disagreement, method quality, gaps), not by stacking summaries end to end.

### Failure-repair playbook

1. **A citation cannot be traced to a passage you have seen** → do not ship it; relabel the claim unverified and state what would verify it (the database, the document, the tool query). An honest gap beats a tidy fabrication.
2. **A citation exists but the passage does not say the claim** → this is misattribution; narrow the claim to exactly what the source supports, fix the author/year/venue, or drop the citation and mark the remainder unverified.
3. **A secondary source is cited as the primary** → relabel it as secondary, find and cite the actual primary for the load-bearing claim, or lower the confidence to reflect the extra layer.
4. **The answer is a stack of source summaries** → build the claims × sources matrix and produce an integrated conclusion with agreement/disagreement and confidence; a synthesis names what the sources together imply.
5. **One weak source carries a strong conclusion** → demote it to directional signal, seek corroboration, and lower the confidence; state explicitly that a single conflicted source is not proof.
6. **A volatile fact is stated as current with no date** → attach a date and a verify-before-use flag, or mark it unknown; do not present a stale or memory-based figure as today's fact.
7. **The verb outruns the evidence ("causes" on correlational data)** → downgrade the verb to what the evidence weight supports (associated with / observed in), and name what stronger design would be needed for causality.
8. **The review keeps only agreeing sources** → document the search and inclusion/exclusion criteria, reintroduce the disconfirming sources, and explain the conflict instead of hiding it.
9. **A claim rides on authority alone** → check the underlying evidence and the producer's incentive; replace "according to [authority]" with the actual finding and its method, or lower confidence.
10. **Unknowns are smoothed over to sound decisive** → add the unknowns section ranked by decision impact, each with a next verification step; decisiveness is earned by confidence calibration, not by hiding gaps.
11. **Confidence is uniform across unequal claims** → recalibrate per claim against source quality and corroboration, and pair each level with what would raise or lower it.
12. **Long verbatim passages stand in for synthesis** → paraphrase with attribution, keep only the short load-bearing quote in quotation marks, and integrate the content into the conclusion.

## Հայերեն

### Գործառնական սկզբունք

Ավագ research և synthesis աշխատանքը decision-grade է միայն այն ժամանակ, երբ ամեն load-bearing claim հետագծելի է իրական, ճիշտ վերագրված աղբյուրին — կամ ազնվորեն նշված է unverified — և conclusion-ը կրում է confidence, որ համապատասխանում է evidence-ին։ Deliverable-ը չորս ձևից մեկն է՝ source/evidence table, claim-verification sheet, synthesis brief կամ literature review։ Չորսն էլ կառավարող միակ guardrail-ը վերագրման ամբողջականությունն է․ եթե citation-ը հորինված է կամ սխալ վերագրված, ապա դրա վրա կառուցված ամեն հետընթաց conclusion թունավորված է, որքան էլ մաքուր երևա reasoning-ը։ Ուստի առաջին քայլը երբեք «ինչ եմ կարծում, որ ճիշտ է» չէ, այլ՝ «ինչին կարող եմ իրականում մատնանշել, և ուր հենց դա ասում է»։ Synthesis-ը summary stacking չէ և ձայների հաշվարկ չէ. այն known, contested, outdated, missing և decision-relevant մասերի integration-ն է conclusion-ի մեջ, որի confidence-ը վաստակված է, և այն մեկ բանը, որ կփոխեր այն, ասված է բարձրաձայն։ Ազնիվ «չկարողացա սա verify անել» պատասխանը գերակա է ցանկացած վստահ հորինված reference-ից։

### Մեխանիզմների տեղեկագիր

- **Source triage** — Դասավորիր evidence-ը proximity-ով և incentive-ով, ոչ polish-ով։ Primary source-ը ուժեղ է commentary-ից. methods բաժինը՝ headline-ից. independent replication-ը՝ single finding-ից. conflicted source-ը (vendor-ը, որ վաճառում է բանը) պահանջում է corroboration, նախքան կշիռ կկրի։ Recency-ն կարևոր է միայն, երբ fact-ը volatile է — foundational result-ը կարող է հին լինել և դեռ ճիշտ. «current market share»-ը՝ ոչ։ Քարտեզիր ամեն source՝ ուր է նստած․ primary (study, filing, dataset), secondary (review, news write-up), կամ tertiary (encyclopedia, aggregator)։ Cite արա այն շերտը, որ իրականում օգտագործել ես, և երբեք secondary-ն primary-ի տեղ մի՛ անցկացրու։
- **CRAAP appraisal** — Գնահատիր source-ը հինգ առանցքով, նախքան վստահելը․ **Currency** (բավական թա՞րմ է fact-ի համար, որ քայքայվում է), **Relevance** (իրականում առնչվու՞մ է այս claim-ին, այս population-ին, այս scope-ին), **Authority** (ով է արտադրել, ինչ expertise, բայց authority ≠ correctness), **Accuracy** (ստուգելի՞ է, cited, ներքին consistent, ակնհայտ սխալից զերծ), և **Purpose** (ինչու է գոյություն ունի — տեղեկացնե՞լ, վաճառե՞լ, համոզե՞լ — և ով է շահում)։ Purpose-ը և incentive-ը բռնում են conflicted source-ը, որ Authority-ն միայնակ կբաց թողներ։
- **Claim atomization և verification** — Քանդիր claim-ը actor, action, quantity, time, place և condition-ի։ Ամեն atom պետք է ունենա support։ Verify արա՝ վերընթերցելով cited հատվածը atomized claim-ի դեմ․ աղբյուրն ասում է՞ *այս action*-ը, *այս* actor-ի, *այս* quantity-ով, *այս* time-ին, *այս* place-ում, *այս* condition-ի տակ։ Եթե որևէ atom support չունի, narrow արա claim-ը մինչև այն, ինչ աղբյուրը վաստակում է, ուժեղ ձևակերպումը պահելու փոխարեն։ Quote արա միայն կարճ անհրաժեշտ հատվածը և paraphrase արա մնացածը. over-quote-ը թաքցնում է, թե claim-ը պաշտպանվա՞ծ է, իսկ load-bearing արտահայտությունը under-quote անելը թաքցնում է misattribution-ը։
- **Evidence weighting** — Բաժանիր այն, ինչ evidence-ի կտորը կարող է պաշտպանել․ **existence** (բանը տեղի ունեցավ / դիտվեց), **magnitude** (որքան մեծ), **causality** (X-ը պատճառեց Y-ը, ոչ պարզապես correlated), և **applicability** (transfer անու՞մ է քո population-ին, setting-ին, time-ին)։ Randomized controlled trial-ը կարող է ուժեղ լինել causality-ի վրա, բայց թույլ՝ այլ խմբին applicability-ի. case study-ն կարող է հարուստ լինել mechanism-ով, բայց լուռ՝ prevalence-ի մասին. observational study-ն կարող է correlation ցույց տալ, բայց «causes» չլիցենզավորել։ Համապատասխանեցրու verb-ը այն weight-ին, որ evidence-ը կարող է կրել։
- **Conflict reconciliation** — Երբ աղբյուրները հակասում են, մի՛ միջինացրու դրանք մյուսի մեջ և մի՛ ընտրիր այն, որ քեզ դուր է գալիս։ Կառուցիր claims × sources matrix (rows = claim-եր, columns = source / method / date / incentive / support strength / caveat) և բացատրիր *ինչու* են տարբերվում․ տարբեր population, տարբեր method, տարբեր time, տարբեր incentive, կամ մեկը պարզապես սխալ է։ Անվանի՛ր, թե որ source-ն է հաղթում որ dimension-ով։ Իրական անհամաձայնությունը տեղեկություն է, ոչ թե աղմուկ՝ հարթեցնելու։
- **Synthesis** — Integration, ոչ stacking։ Matrix-ից նշիր, որտեղ source-երը համաձայն են (և որքան ուժեղ), որտեղ հակասում են (և ինչու), որտեղ method quality-ն ուժեղ է կամ թույլ, և որտեղ evidence-ը պարզապես բացակայում է։ Հետո տուր conclusion՝ calibrated confidence-ով և այն մեկ fact-ով, որ կշարժեր այն։ Synthesis, որ կարդացվում է որպես ամփոփումների ցուցակ, չի synthesize արել։
- **Confidence calibration** — Confidence-ը evidence-ի ուժի մասին պնդում է՝ արտահայտված կայուն vocabulary-ով, ոչ mood։ Օգտագործիր ladder․ **high** (բազմակի անկախ, բարձրորակ, corroborating source-եր. ուղիղ evidence. կիրառվում է այս case-ին), **moderate** (որոշ լավ evidence, բայց gap-եր, single strong source, կամ մասնակի applicability), **low** (թույլ, conflicted, անուղղակի կամ stale evidence), **unknown** (չկա source, որի հետևում կարող ես կանգնել)։ Նույն brief-ի տարբեր claim-երը պետք է կրեն տարբեր confidence. uniform confidence-ը tell է, որ evidence-ը չի կշռվել։ Միշտ զուգիր level-ը «ինչը կբարձրացնի կամ կիջեցնի այն»-ի հետ։

### Fabrication / misattribution detection step-ը (#1 gate-ը)

Սա AI-հետազոտողի ամենահաճախ և ամենավնասակար ձախողումն է, ուստի գործարկիր այն բացահայտ ամեն աղբյուրավորված պատասխանի վրա մինչև վերջնականացումը։ Երկու տարբեր մեղք կա․

- **Fabrication** — source, որ գոյություն չունի․ հորինած paper, author, DOI, URL, page, quote կամ statistic։ Հավանական ձևաչափումը գոյություն չէ։
- **Misattribution** — իրական source՝ cited claim-ի համար, որ չի անում․ սխալ author/year/venue, quote՝ սխալ բերանում, finding՝ ձգված աղբյուրի ասածից այն կողմ, կամ secondary՝ որպես primary cited։

Ընթացակարգ․ (1) Ամեն load-bearing claim-ի համար մատնանշիր **ճշգրիտ source-ը և ճշգրիտ հատվածը**, որ պաշտպանում է այն։ (2) Եթե չես կարող մատնանշել հատված, որ իրականում տեսել ես — տրամադրված տեքստ, գործիքի արդյունք, կամ քո կայուն գիտելիքը իսկապես հայտնի աշխատանքի մասին — **մի՛** ship արա citation-ը. նշիր claim-ը **unverified** և անվանի՛ր verification step-ը։ (3) Վերընթերցիր ամեն citation իր atomized claim-ի դեմ. եթե համընկնումը մասնակի է, narrow արա claim-ը։ (4) Ստուգիր շերտը․ secondary-ն primary-ի՞ տեղ է անցկացվում։ (5) Flag արա ամեն volatile fact՝ date-ի և verify-before-use-ի համար։ Ճիշտ արդյունքը, երբ չես կարող verify անել, «չկարողացա սա verify անել» նախադասությունն է, ոչ երբեք հորինված reference, որ կոկիկ տեսք ունի։

### Literature-review ընթացակարգ (փաստաթղթավորված և վերարտադրելի)

Literature review, որ չի կարող վերարտադրվել, կարող է cherry-pick-վել, ուստի փաստաթղթավորիր method-ը որպես deliverable-ի first-class մաս․

1. **Research question** — ձևակերպիր այնքան ճշգրիտ, որ source-ը հստակ scope-ի ներսում կամ դրսում լինի։
2. **Search strategy** — ինչ որոնվեց (որ database / source / search term), ինչ date range-ով, ինչ լեզուներով։ Գրիր, որ ուրիշը կարողանա կրկնել։
3. **Inclusion criteria** — ինչն է source-ը դարձնում eligible (օր.՝ peer-reviewed, primary data, relevant population, date window-ի ներսում, լեզվով, որ կարող ես verify անել)։
4. **Exclusion criteria** — ինչն է source-ին disqualify անում (օր.՝ method չնշված, conflicted առանց corroboration-ի, off-population, opinion piece՝ factual claim-ի համար), և գրառիր *ինչու* ամեն բացառված source-ը բացառվեց։
5. **Appraise** — գործարկիր CRAAP ամեն ներառված source-ի վրա. գրառիր method, date, incentive, support strength, caveat։
6. **Synthesize** — կառուցիր claims × sources matrix. հաղորդիր agreement, disagreement, method quality և gap-եր. մի՛ գցիր disconfirming source-երը։
7. **Report** — conclusion՝ calibrated confidence-ով, unknown-ները ranked ըստ decision impact-ի, և next verification step։ Մաքուր միաձայն consensus՝ առանց փաստաթղթավորված exclusion-ների, red flag է, ոչ result։

### Որոշման կանոններ

1. Քարտեզիր ամեն load-bearing claim իրական, ճիշտ վերագրված աղբյուրի, կամ նշիր այն unverified՝ verification step-ով. citation, որ աղբյուրը չի պաշտպանում, ավելի վատ է, քան ազնիվ «unverified»-ը։
2. Երբ citation է առաջարկվում, վերընթերցիր հատվածը atomized claim-ի դեմ. մասնակի support-ի դեպքում narrow արա claim-ը, ուժեղ ձևակերպումը պահելու փոխարեն։
3. Date դիր ամեն volatile fact-ի (գին, release, statute, «latest», ընթացիկ պաշտոնյա) և flag արա verify-before-use, կամ նշիր unknown. երբեք volatile fact հիշողությունից որպես ընթացիկ մի՛ պնդիր։
4. Literature review-ի համար փաստաթղթավորիր search strategy-ն և inclusion/exclusion criteria-ն մինչև synthesize անելը. չփաստաթղթավորված review-ն չվերարտադրելի է և cherry-pick-ելի։
5. Երբ աղբյուրները հակասում են, կառուցիր claims × sources matrix և բացատրիր անհամաձայնությունը. մի՛ միջինացրու կամ լուռ ընտրիր մեկը։
6. Մեկ source-ի վրա հենված conclusion-ը համարիր single-source risk. փնտրիր corroboration կամ իջեցրու confidence-ը։
7. Գնահատիր ամեն source CRAAP-ով, ոչ «վստահելի տեսք ունի»-ով. կշռիր incentive-ը (ով է շահում), որովհետև authority-ն correctness չէ։
8. Կշռիր evidence-ը ըստ այն, ինչ կարող է պաշտպանել — existence ≠ magnitude ≠ causality ≠ applicability. համապատասխանեցրու verb-ը weight-ին։
9. Quote արա միայն կարճ անհրաժեշտ հատվածը՝ վերագրված, և paraphrase արա մնացածը. cite արա secondary-ն որպես secondary, երբեք որպես primary, որ ամփոփում է։
10. Տուր ամեն conclusion-ի calibrated confidence և այն մեկ fact-ը, որ կփոխեր այն. uniform confidence՝ անհավասար evidence-ի վրա, նշանակում է չես կշռել։
11. Թվարկիր unknown-ները ranked ըստ decision impact-ի՝ next verification step-ով. unknown-ները թաքցնելը՝ որոշակի հնչելու համար, failure է, ոչ polish։
12. Երբ միայն թույլ կամ biased source կա, օգտագործիր որպես labeled-weak signal — նշիր թուլությունը և incentive-ը — և երբեք մի՛ լվա այն ուժեղ claim-ի մեջ։
13. Recency-ն դատիր ըստ այն, թե fact-ը քայքայվո՞ւմ է, ոչ ըստ date-ի միայնակ. foundational result-ը կարող է հին և ճիշտ լինել, volatile թիվը չի կարող հին և ընթացիկ լինել։
14. Synthesize արա source-երի միջով integrate անելով (agreement, disagreement, method quality, gap-եր), ոչ ամփոփումներ ծայր-ծայրի շարելով։

### Վերականգնման խաղագիրք

1. **Citation-ը չի կարող հետագծվել տեսած հատվածի** → մի՛ ship արա. վերանշիր claim-ը unverified և ասա, թե ինչը կverify աներ (database-ը, document-ը, tool query-ն)։ Ազնիվ gap-ը գերակա է կոկիկ fabrication-ից։
2. **Citation-ը կա, բայց հատվածը չի ասում claim-ը** → սա misattribution է. narrow արա claim-ը ճիշտ այն, ինչ source-ը պաշտպանում է, ուղղիր author/year/venue-ն, կամ գցիր citation-ը և մնացածը նշիր unverified։
3. **Secondary source-ը cited է որպես primary** → վերանշիր այն որպես secondary, գտիր և cite արա իրական primary-ն load-bearing claim-ի համար, կամ իջեցրու confidence-ը՝ լրացուցիչ շերտը արտացոլելու։
4. **Պատասխանը source ամփոփումների շարան է** → կառուցիր claims × sources matrix և տուր integrated conclusion՝ agreement/disagreement-ով և confidence-ով. synthesis-ը անվանում է, թե source-երը միասին ինչ են ենթադրում։
5. **Մեկ թույլ source կրում է ուժեղ conclusion** → իջեցրու այն directional signal-ի, փնտրիր corroboration և իջեցրու confidence-ը. ասա բացահայտ, որ մեկ conflicted source proof չէ։
6. **Volatile fact-ը ասված է որպես ընթացիկ՝ առանց date-ի** → կցիր date և verify-before-use flag, կամ նշիր unknown. մի՛ ներկայացրու stale կամ հիշողությունից թիվը որպես այսօրվա fact։
7. **Verb-ը գերազանցում է evidence-ը («causes» correlational data-ի վրա)** → իջեցրու verb-ը այն, ինչ evidence weight-ը պաշտպանում է (associated with / observed in), և անվանի՛ր, թե ինչ ավելի ուժեղ design կպահանջվեր causality-ի համար։
8. **Review-ն պահում է միայն համաձայնող source-եր** → փաստաթղթավորիր search-ը և inclusion/exclusion criteria-ն, վերաներմուծիր disconfirming source-երը, և բացատրիր conflict-ը՝ թաքցնելու փոխարեն։
9. **Claim-ը հենվում է միայն authority-ի վրա** → ստուգիր հիմքում ընկած evidence-ը և արտադրողի incentive-ը. փոխարինիր «ըստ [authority]-ի»-ն իրական finding-ով և իր method-ով, կամ իջեցրու confidence-ը։
10. **Unknown-ները հարթեցված են՝ որոշակի հնչելու համար** → ավելացրու unknown-ների բաժինը ranked ըստ decision impact-ի, ամեն մեկը next verification step-ով. որոշակիությունը վաստակվում է confidence calibration-ով, ոչ gap-երը թաքցնելով։
11. **Confidence-ը uniform է անհավասար claim-երի վրա** → recalibrate արա ամեն claim-ի համար source quality-ի և corroboration-ի դեմ, և զուգիր ամեն level-ը այն բանի հետ, որ կբարձրացնի կամ կիջեցնի այն։
12. **Երկար verbatim հատվածները synthesis-ի տեղ են** → paraphrase արա վերագրմամբ, պահիր միայն կարճ load-bearing quote-ը չակերտներում, և integrate արա content-ը conclusion-ի մեջ։
