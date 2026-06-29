---
name: "language-mastery"
description: >-
  use when the work is bilingual English-Armenian language production or quality: native rewriting, translation that is not a calque, register and tone calibration (incl. the Armenian դու/Դուք T-V distinction), terminology decisions, punctuation and script hygiene (Armenian ․/։/«» and homoglyph audit), bilingual parity/equal-load review, or teaching/evaluating language craft — for creation, critique, decision support, teaching, or evaluation. use as lead when the central deliverable is language-shaped (a native rewrite, a term bank, a bilingual parity report, a register diagnosis) or whenever an answer must be delivered equally in English and native Armenian (the L0 engine). do not use as lead when another skill owns the substance and language is only the surface — then support it by making its output native and equal-load. հայերեն՝ օգտագործիր երկլեզու անգլերեն-հայերեն լեզվական արտադրության ու որակի աշխատանքի համար՝ բնական վերաշարադրում, ոչ-կալկա թարգմանություն, ռեգիստր ու երանգ, տերմինաբանություն, կետադրություն ու գրի մաքրություն, երկլեզու հավասարակշռության ստուգում, դասավանդում/գնահատում։
---

# Language Mastery / Լեզվական վարպետություն

## English

**Scope.** In: native bilingual English↔Armenian production and quality control — deverbalized rewriting (stiff/calqued text → native), translation that preserves meaning and function rather than word order, register and tone calibration including the Armenian T-V distinction (դու vs Դուք), terminology decisions (translate / keep English / pair-once), Armenian punctuation and script hygiene (․ vs ։, «», the `-ը`/`-ն` definite article, zero Latin/Cyrillic homoglyphs), bilingual parity and equal-load review, and teaching/evaluating language craft. Out: the factual substance of another domain (finance, law, devops own their own content — this skill makes that content native and equal-load, it does not invent or change the facts), machine-translation tooling choices (that is an engineering decision), and translation of legally binding text where a certified human translator is required. This skill is the L0 engine: it is what makes every other answer land equally in English and in real Armenian.

**Leads / Supports.** Lead when the central deliverable is language-shaped: a stiff-to-native rewrite, a translation that must read as if originally written, a term bank, a bilingual parity / equal-load report, a register or tone diagnosis, a punctuation/script audit — or whenever the binding requirement is "deliver this equally in both languages" (every artifact in this pack). Support when another skill owns the substance and language is the surface: finance owns the model, you make its commentary native Armenian; legal owns the clause, you preserve its obligation exactly while making the surrounding prose native. In support mode you never alter the domain's facts, numbers, or obligations — you carry them across, equal-load, without loss.

Conflict rules:
- **Meaning vs naturalness → meaning wins, then re-naturalize.** When a fluent Armenian phrasing would soften an obligation, a caveat, or a number, keep the obligation and find a native phrasing that still carries it. Never "polish away" a "must", a "not", a threshold, or a safety caveat. If the two cannot be reconciled, flag it rather than silently choosing fluency.
- **Terminology vs another skill's house style → defer the substance, own the surface.** If finance/legal/devops has a fixed English term the audience expects (SLO, EBITDA, indemnity), keep it; you decide how it is introduced and whether it is paired once, not whether the concept is renamed. Renaming a domain term is the domain owner's call.
- **Literalness vs register → audience decides, but never invent register the source lacks.** A contract clause stays literal; product copy gets native register. Do not make a neutral source sound warm, or a formal source sound casual, unless the user asks — register is a calibration to the source and audience, not a free rewrite.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing. For this skill the equal-depth requirement is not a side rule — it is the core deliverable.

### Decision rules / Որոշման կանոններ

1. **Calqued/stiff text → deverbalize first, then re-express.** Read the source for meaning, drop the source's surface form entirely (deverbalize), then write the target from the bare meaning in its own syntax. Do not transform word-by-word; that is what produces the calque.
2. **Armenian sounds like "English in Armenian words" → rebuild around an actor and a concrete verb.** Armenian is verb-centered; collapse English noun-stacks ("implementation of validation requirements") into actor + action ("համակարգը ստուգում է պարտադիր դաշտերը"). Replace empty verbs (իրականացնել, ապահովել) with the concrete action.
3. **Definite article on an Armenian word → choose `-ն` before a vowel-initial next word or before the copula `է`; choose `-ը` before a consonant-initial next word or at sentence/phrase end (pause).** This is the explicit rule, not a vibe: `գիրքն առա` (next word vowel-initial → `-ն`), `գիրքը կարդացի` (next word consonant-initial → `-ը`), `գիրքն է` (before `է` → `-ն`), `գիրքը։` (sentence end → `-ը`). State it; apply it; check it.
4. **`․` vs `։` → use `․` (միջակետ) for an enumeration lead-in / explanation / author→speech transition; use `։` (վերջակետ) to end a sentence.** The English colon `:` maps to the Armenian `․` in those functions, NOT to `։`. `․` is a native Armenian mark, not a look-alike — do not "correct" it to a period.
5. **Any Armenian word containing a Latin or Cyrillic look-alike → fail and fix.** Armenian `օ ա ո ս կ հ ն պ` etc. have Latin/Cyrillic twins (`o a c h n p`, Cyrillic `о а с н р`). A homoglyph inside an Armenian word is a hard defect — run the homoglyph audit before finalizing.
6. **Audience known → calibrate the T-V form: `դու` for peer/intimate/child, `Դուք` for formal/respectful/plural-address.** Pick one and hold it across the whole text; a slide from `Դուք` to `դու` mid-document is a register break. When the audience is unknown and the text is public-facing, default to `Դուք`.
7. **Recurring technical concept → make one terminology decision (translate / keep English / pair-once) and apply it everywhere.** One concept must have one name; three names read as three concepts. Record the decision in a term bank when the artifact is long.
8. **English term the audience genuinely expects → keep it, pair once on first use, then use one form.** `validation` in developer docs may stay; in user-facing copy prefer `ստուգում`. Pair as `validation (ստուգում)` once, then commit to the chosen form.
9. **Both-language delivery required → produce equal-load, not a translation of one side.** Write each language in its own idiom to the same depth: same claims, lists, caveats, numbers, examples, refusals. A thinner Armenian half fails L0 even if "accurate".
10. **Rewrite came out shorter → check what was dropped before celebrating concision.** Shrinkage often means a caveat, a condition, or a number quietly disappeared. Restore meaning first; tighten tone second.
11. **Quoted source, statute, contract clause, or cited line → keep it literal; do not re-style it.** Translate around it natively, but the binding text stays verbatim; flag if a faithful rendering reads awkwardly rather than smoothing the obligation away.
12. **Proper nouns, brand names, code identifiers, units → do not "translate" them.** Transliterate a name only when there is an established Armenian form; leave code tokens, API names, and SI units as-is.
13. **English quotation in English prose, `«»` in Armenian prose → never cross them.** Straight/curly quotes belong to English; `«»` belongs to Armenian. Mixing the quotation systems is a punctuation defect even when the letters are clean.
14. **Verb-form contrast hidden (aorist vs perfect, indicative vs subjunctive) → carry the aspect, not just the tense.** Armenian marks aspect and modality differently from English; "I have checked" vs "I checked" must land on the right Armenian form, or the meaning shifts.
15. **Unsure whether a phrasing is native → read it aloud and ask "would a monolingual Armenian speaker produce this?"** If it only makes sense as a back-translation of English, it is a calque — rebuild it.

### Failure modes to prevent / Ձախողման ձևեր

1. **The calque (English skeleton in Armenian skin).** Grammatically correct Armenian that only parses if you mentally back-translate to English — English clause order, English noun-stacks, English idioms rendered literally. Tell: the sentence reads fine to a bilingual and wrong to a monolingual; the actor is buried behind a nominalization.
2. **Wrong definite article (`-ը`/`-ն`).** `-ը` written before a vowel-initial next word, or `-ն` before a consonant, or the article dropped where Armenian needs it. Tell: `գիրքը առա` (should be `գիրքն առա`), or `գիրքն կարդացի` (should be `գիրքը կարդացի`).
3. **`․`/`։` confusion.** A sentence ended with `․` (which is the enumeration/explanation mark), or `․` "corrected" to a Latin period, or an English colon left as `:` inside Armenian prose. Tell: an enumeration introduced with `։`, or a full stop written as `․`.
4. **Homoglyph contamination.** A Latin `o/a/c/p/n/h` or Cyrillic `о/а/с/р/н` sitting inside an Armenian word. Tell: the word looks Armenian but a script check flags a non-Armenian codepoint; copy-paste from mixed sources is the usual source.
5. **Quotation-system bleed.** `«»` used in English prose, or straight/curly quotes used in Armenian prose. Tell: `"բարև"` in Armenian text, or `«hello»` in English text.
6. **Register slip and T-V drift.** A document that opens on `Դուք` and slides to `դու`, or formal source rendered casually, or warmth invented where the source is neutral. Tell: the address form changes mid-text, or a legal notice suddenly sounds chatty.
7. **Thin-Armenian inequality (L0 violation).** The Armenian half is a compressed summary of the English — fewer examples, dropped caveats, missing a list item. Tell: the two halves differ in length or in number of claims; the Armenian reads like a translation, not an original.
8. **Obligation/number softened in the name of fluency.** A "must" became "կարելի է", a "do not" lost its force, a threshold or figure was rounded or dropped to make the sentence flow. Tell: the native version is smoother and weaker than the source.
9. **Terminology drift.** One concept carries two or three names across the artifact (`ստուգում` here, `վալիդացիա` there, `validation` elsewhere). Tell: a reader could reasonably think these are different things.
10. **Over-translation of fixed tokens.** A brand name, code identifier, API call, or unit "translated" into Armenian, breaking the reference. Tell: a function name or product name appears in Armenian letters and no longer matches the real thing.
11. **Aspect/modality loss.** Tense carried but aspect or modality dropped — perfect collapsed to aorist, a conditional rendered as a flat statement. Tell: "would have" / "has been" nuances vanish in the Armenian.
12. **False-positive "corrections".** "Fixing" a correct native mark — flagging `․` as a homoglyph, replacing `«»` with English quotes, or rewriting idiomatic Armenian into calqued Armenian because it "looks unusual". Tell: the audit makes the Armenian less native, not more.

### Acceptance criteria / Ընդունման չափանիշ

- The deliverable matches the request (native rewrite / translation / term bank / parity report / register diagnosis / punctuation audit), not generic language advice.
- Armenian reads as originally-authored Armenian: actor-and-verb structure, no English skeleton, native idiom — passes the "would a monolingual produce this?" test.
- Punctuation is correct and language-native: `․` only for enumeration/explanation/author→speech, `։` for sentence end, `«»` only in Armenian prose, English quotes only in English prose.
- Definite article is correct by the stated rule: `-ն` before a vowel-initial word or before `է`; `-ը` before a consonant-initial word or at sentence/phrase end.
- Zero Latin/Cyrillic homoglyphs inside Armenian words (homoglyph audit run and clean).
- Register and the T-V form (`դու`/`Դուք`) are calibrated to audience and held consistently across the whole text.
- Meaning is preserved with zero softened obligations, caveats, or numbers; terminology is consistent (one concept, one name).
- Equal load (L0): both languages carry the same claims, caveats, examples, and depth — the Armenian is an original, not a summary.
- Assumptions and unknowns labeled; fixed tokens (names, code, units) left intact.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **native Armenian flow** (deverbalized, actor-and-verb, idiomatic — no calque) · **native English flow** (own punctuation, concision, audience tone) · **semantic parity & equal load** (same decisions, caveats, numbers, depth both ways) · **register & T-V calibration** (`դու`/`Դուք` and tone matched to audience and held) · **script & punctuation hygiene** (`-ը`/`-ն`, `․`/`։`, `«»`, zero homoglyphs).

### Deep dive & assets

`manual.md` (the 4-lens model, deverbalize technique, `-ը`/`-ն` rule, `․`/`։` rule, register & T-V, homoglyph + equal-load, decision rules, failure-repair playbook) · `patterns.md` (5 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (stiff-to-native rewrite + EN→HY translation, with domain "why it passes") · `output-templates.md` (native rewrite / term bank / bilingual parity report) · `red-team-gate.md` (domain reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ բնական երկլեզու անգլերեն↔հայերեն արտադրություն և որակի վերահսկում՝ ապաբառայնացված (deverbalized) վերաշարադրում (փայտացած/կալկա տեքստ → բնական), թարգմանություն, որ պահում է իմաստն ու գործառույթը, ոչ թե բառերի կարգը, ռեգիստրի ու երանգի կարգաբերում՝ ներառյալ հայերենի T-V տարբերակումը (`դու` ընդդեմ `Դուք`), տերմինաբանական որոշումներ (թարգմանել / պահել անգլերեն / մեկ անգամ զույգով տալ), հայերեն կետադրություն և գրի մաքրություն (`․` ընդդեմ `։`, «», `-ը`/`-ն` որոշյալ հոդ, զրո լատինական/կիրիլիկ homoglyph), երկլեզու հավասարակշռության ու հավասար բեռնվածության ստուգում, և լեզվական վարպետության դասավանդում/գնահատում։ Դուրս՝ այլ ոլորտի փաստական բովանդակությունը (finance, law, devops տիրում են իրենց բովանդակությանը — այս skill-ը այդ բովանդակությունը դարձնում է բնական ու հավասար բեռնված, բայց փաստերը չի հորինում կամ փոխում), machine-translation գործիքի ընտրությունը (դա engineering որոշում է), և իրավաբանորեն պարտադիր տեքստի թարգմանությունը, որտեղ պահանջվում է հավաստագրված մարդ-թարգմանիչ։ Այս skill-ը L0 շարժիչն է․ հենց ինքն է, որ ամեն մյուս պատասխանը հավասարապես հնչեցնում է անգլերեն և իրական հայերեն։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը լեզվական ձև ունի՝ փայտացածից բնական վերաշարադրում, թարգմանություն, որ պետք է կարդացվի որպես սկզբնապես գրված, term bank, երկլեզու parity / equal-load report, ռեգիստրի կամ երանգի ախտորոշում, կետադրության/գրի audit — կամ երբ պարտադիր պահանջն է «սա հանձնիր հավասարապես երկու լեզվով» (այս pack-ի ամեն artifact)։ Աջակից, երբ բովանդակության տերը այլ skill է, իսկ լեզուն մակերեսն է․ finance-ը տիրում է model-ին, դու նրա մեկնաբանությունը դարձնում ես բնական հայերեն. legal-ը տիրում է clause-ին, դու ճշգրիտ պահում ես պարտավորությունը, մինչ շրջապատող արձակը դարձնում ես բնական։ Աջակից ռեժիմում երբեք չես փոխում ոլորտի փաստերը, թվերը կամ պարտավորությունները — դրանք տանում ես այն կողմ՝ հավասար բեռնված, առանց կորստի։

Կոնֆլիկտի կանոններ․
- **Իմաստն ընդդեմ բնականության → իմաստը հաղթում է, հետո նորից բնականացնում ես։** Երբ սահուն հայերեն ձևակերպումը կթուլացնի պարտավորություն, caveat կամ թիվ, պահի՛ր պարտավորությունը և գտի՛ր բնական ձևակերպում, որ դեռ կրում է այն։ Երբեք մի՛ «հղկիր» «պետք է»-ն, «ոչ»-ը, շեմը կամ անվտանգության caveat-ը։ Եթե երկուսը չեն հաշտվում, նշի՛ր, ոչ թե լուռ ընտրիր սահունությունը։
- **Տերմինաբանությունն ընդդեմ այլ skill-ի house style-ի → բովանդակությունը զիջիր, մակերեսը՝ քեզ պահիր։** Եթե finance/legal/devops-ն ունի ֆիքսված անգլերեն տերմին, որ լսարանն սպասում է (SLO, EBITDA, indemnity), պահի՛ր. դու որոշում ես, թե ինչպես է այն ներկայացվում և արդյոք մեկ անգամ զույգով տրվում, ոչ թե concept-ը վերանվանվում։ Ոլորտի տերմինը վերանվանելը ոլորտի տիրոջ որոշումն է։
- **Բառացիությունն ընդդեմ ռեգիստրի → լսարանը որոշում է, բայց երբեք մի՛ հորինիր ռեգիստր, որ աղբյուրը չունի։** Պայմանագրի clause-ը մնում է բառացի. product copy-ն ստանում է բնական ռեգիստր։ Չեզոք աղբյուրը մի՛ դարձրու ջերմ, ֆորմալ աղբյուրը՝ casual, քանի դեռ user-ը չի խնդրել — ռեգիստրը աղբյուրին ու լսարանին կարգաբերում է, ոչ թե ազատ վերաշարադրում։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։ Այս skill-ի համար հավասար խորության պահանջը կողմնակի կանոն չէ — այն հենց հիմնական deliverable-ն է։

### Որոշման կանոններ

1. **Կալկայված/փայտացած տեքստ → նախ ապաբառայնացրու, հետո նորից արտահայտիր։** Կարդա աղբյուրը իմաստի համար, ամբողջովին թող աղբյուրի մակերեսային ձևը (deverbalize), հետո թիրախը գրիր մերկ իմաստից՝ իր շարադասությամբ։ Մի՛ ձևափոխիր բառ առ բառ. հենց դա է կալկա ծնում։
2. **Հայերենը հնչում է որպես «անգլերեն հայերեն բառերով» → վերակառուցիր գործող անձի և կոնկրետ բայի շուրջ։** Հայերենը բայակենտրոն է. քանդիր անգլերեն noun-stack-երը («implementation of validation requirements») actor + action-ի («համակարգը ստուգում է պարտադիր դաշտերը»)։ Դատարկ բայերը (իրականացնել, ապահովել) փոխարինիր կոնկրետ գործողությամբ։
3. **Որոշյալ հոդ հայերեն բառի վրա → ընտրիր `-ն`՝ ձայնավորով սկսվող հաջորդ բառից առաջ կամ `է` օժանդակ բայից առաջ. ընտրիր `-ը`՝ բաղաձայնով սկսվող հաջորդ բառից առաջ կամ նախադասության/բառակապակցության վերջում (դադարին)։** Սա բացահայտ կանոնն է, ոչ զգացում․ `գիրքն առա` (հաջորդ բառը ձայնավորով → `-ն`), `գիրքը կարդացի` (հաջորդ բառը բաղաձայնով → `-ը`), `գիրքն է` (`է`-ից առաջ → `-ն`), `գիրքը։` (նախադասության վերջ → `-ը`)։ Ասա՛ այն. կիրառի՛ր. ստուգի՛ր։
4. **`․` ընդդեմ `։` → օգտագործիր `․` (միջակետ)՝ թվարկման մուտքի / բացատրության / հեղինակ→խոսք անցման համար. օգտագործիր `։` (վերջակետ)՝ նախադասությունն ավարտելու։** Անգլերեն colon-ը `:` այդ գործառույթներում համապատասխանում է հայերեն `․`-ին, ՈՉ `։`-ին։ `․`-ը բնական հայերեն նշան է, ոչ look-alike — մի՛ «ուղղիր» այն կետի։
5. **Հայերեն բառ՝ լատինական կամ կիրիլիկ look-alike-ով → fail և ուղղիր։** Հայերեն `օ ա ո ս կ հ ն պ` և այլն ունեն լատինական/կիրիլիկ զույգեր (`o a c h n p`, կիրիլիկ `о а с н р`)։ Homoglyph հայերեն բառի ներսում կոշտ թերություն է — վերջնականացնելուց առաջ գործարկիր homoglyph audit-ը։
6. **Լսարանը հայտնի է → կարգաբերիր T-V ձևը՝ `դու`՝ հավասարի/մտերիմի/երեխայի, `Դուք`՝ ֆորմալ/հարգալից/հոգնակի դիմելու համար։** Ընտրիր մեկը և պահիր ամբողջ տեքստում. `Դուք`-ից `դու` սահելը կեսից ռեգիստրի կոտրվածք է։ Երբ լսարանն անհայտ է, և տեքստը հանրային է, լռելյայն ընտրիր `Դուք`։
7. **Կրկնվող տեխնիկական concept → արա մեկ տերմինաբանական որոշում (թարգմանել / պահել անգլերեն / մեկ անգամ զույգով) և կիրառիր ամենուր։** Մեկ concept-ը պետք է ունենա մեկ անուն. երեք անունը կարդացվում է որպես երեք concept։ Երկար artifact-ի դեպքում որոշումը գրանցիր term bank-ում։
8. **Անգլերեն տերմին, որ լսարանն իսկապես սպասում է → պահի՛ր, առաջին օգտագործման ժամանակ մեկ անգամ զույգով տուր, հետո մեկ ձև պահիր։** `validation`-ը developer doc-ում կարող է մնալ. user-facing copy-ում նախընտրիր `ստուգում`։ Զույգով տուր որպես `validation (ստուգում)` մեկ անգամ, հետո հանձնառու եղիր ընտրած ձևին։
9. **Երկու լեզվով հանձնում է պահանջվում → արտադրիր հավասար բեռնված, ոչ թե մի կողմի թարգմանություն։** Ամեն լեզու գրիր իր բառապաշարով՝ նույն խորությամբ. նույն claim-երը, ցանկերը, caveat-ները, թվերը, օրինակները, մերժումները։ Ավելի բարակ հայերեն կեսը fail է L0-ով, նույնիսկ եթե «ճշգրիտ» է։
10. **Վերաշարադրումը կարճ ստացվեց → ստուգիր ինչ ընկավ, նախքան concision-ով ուրախանալը։** Կարճանալը հաճախ նշանակում է, որ caveat, պայման կամ թիվ լուռ անհետացավ։ Նախ վերականգնիր իմաստը. հետո սեղմիր երանգը։
11. **Մեջբերված աղբյուր, statute, պայմանագրի clause կամ cited տող → պահիր բառացի. մի՛ վերաոճավորիր։** Թարգմանիր դրա շուրջը բնական, բայց պարտադիր տեքստը մնում է verbatim. նշի՛ր, եթե հավատարիմ վերարտադրությունն անհարմար է հնչում, ոչ թե հղկիր պարտավորությունը։
12. **Հատուկ անուններ, brand անուններ, code identifier-ներ, միավորներ → մի՛ «թարգմանիր» դրանք։** Անունը տառադարձիր միայն, երբ կա հաստատված հայերեն ձև. code token-ները, API անունները և SI միավորները թող ինչպես կան։
13. **Անգլերեն չակերտ՝ անգլերեն արձակում, `«»`՝ հայերեն արձակում → երբեք մի՛ խաչաձևիր։** Ուղիղ/curly չակերտները անգլերենինն են. `«»`-ը հայերենինը։ Չակերտի համակարգերը խառնելը կետադրական թերություն է, նույնիսկ երբ տառերը մաքուր են։
14. **Բայաձևի հակադրությունը թաքնված է (անցյալ կատարյալ ընդդեմ վաղակատարի, սահմանական ընդդեմ ստորադասականի) → տար aspect-ը, ոչ միայն ժամանակը։** Հայերենը aspect-ը և modality-ն այլ կերպ է նշում, քան անգլերենը. «I have checked» ընդդեմ «I checked» պետք է ընկնի ճիշտ հայերեն ձևի վրա, այլապես իմաստը շեղվում է։
15. **Անհայտ է՝ ձևակերպումը բնակա՞ն է → կարդա բարձրաձայն և հարցրու «արդյոք միալեզու հայ խոսողը սա կարտադրե՞ր»։** Եթե այն իմաստ ունի միայն որպես անգլերենի հետադարձ թարգմանություն, դա կալկա է — վերակառուցիր այն։

### Ձախողման ձևեր

1. **Կալկան (անգլերեն կմախք հայերեն մաշկի մեջ)։** Քերականորեն ճիշտ հայերեն, որ վերլուծվում է միայն, եթե մտքում հետ թարգմանես անգլերեն — անգլերեն clause order, անգլերեն noun-stack, անգլերեն բառակապ բառացի։ Tell՝ նախադասությունը bilingual-ին լավ է հնչում, միալեզվին՝ սխալ. գործող անձը թաղված է nominalization-ի տակ։
2. **Սխալ որոշյալ հոդ (`-ը`/`-ն`)։** `-ը` գրված ձայնավորով սկսվող հաջորդ բառից առաջ, կամ `-ն` բաղաձայնից առաջ, կամ հոդը բաց թողնված, որտեղ հայերենին պետք է։ Tell՝ `գիրքը առա` (պետք է `գիրքն առա`), կամ `գիրքն կարդացի` (պետք է `գիրքը կարդացի`)։
3. **`․`/`։` շփոթ։** Նախադասությունն ավարտված `․`-ով (որ թվարկման/բացատրության նշանն է), կամ `․` «ուղղված» լատինական կետի, կամ անգլերեն colon թողնված `:` հայերեն արձակում։ Tell՝ թվարկում, որ ներմուծվում է `։`-ով, կամ վերջակետ գրված `․`-ով։
4. **Homoglyph աղտոտում։** Լատինական `o/a/c/p/n/h` կամ կիրիլիկ `о/а/с/р/н` հայերեն բառի ներսում։ Tell՝ բառը հայերեն տեսք ունի, բայց գրի ստուգումը նշում է ոչ-հայերեն codepoint. խառը աղբյուրներից copy-paste-ն սովորական պատճառն է։
5. **Չակերտի համակարգի արտահոսք։** `«»` օգտագործված անգլերեն արձակում, կամ ուղիղ/curly չակերտ՝ հայերեն արձակում։ Tell՝ `"բարև"` հայերեն տեքստում, կամ `«hello»` անգլերեն տեքստում։
6. **Ռեգիստրի սահում և T-V drift։** Փաստաթուղթ, որ բացվում է `Դուք`-ով և սահում `դու`-ի, կամ ֆորմալ աղբյուր՝ casual վերարտադրված, կամ ջերմություն հորինված, որտեղ աղբյուրը չեզոք է։ Tell՝ դիմելաձևը փոխվում է կեսից, կամ իրավական ծանուցումը հանկարծ զրուցային է հնչում։
7. **Բարակ-հայերեն անհավասարություն (L0 խախտում)։** Հայերեն կեսը անգլերենի սեղմ summary է — ավելի քիչ օրինակ, ընկած caveat, պակասող ցանկի կետ։ Tell՝ երկու կեսերը տարբերվում են երկարությամբ կամ claim-երի քանակով. հայերենը կարդացվում է որպես թարգմանություն, ոչ բնագիր։
8. **Պարտավորություն/թիվ՝ սահունության անունից թուլացված։** «Պետք է»-ն դարձավ «կարելի է», «մի՛ արա»-ն կորցրեց ուժը, շեմ կամ թիվ կլորացվեց կամ ընկավ նախադասությունը հոսեցնելու համար։ Tell՝ բնական տարբերակն ավելի սահուն է և ավելի թույլ, քան աղբյուրը։
9. **Տերմինաբանական drift։** Մեկ concept-ը կրում է երկու-երեք անուն artifact-ով (`ստուգում` այստեղ, `վալիդացիա` այնտեղ, `validation` այլ տեղ)։ Tell՝ ընթերցողը հիմնավորապես կարող է կարծել, թե սրանք տարբեր բաներ են։
10. **Ֆիքսված token-ների գերթարգմանություն։** Brand անուն, code identifier, API call կամ միավոր «թարգմանված» հայերեն՝ կոտրելով հղումը։ Tell՝ ֆունկցիայի անունը կամ product-ի անունը հայերեն տառերով է և այլևս չի համընկնում իրականին։
11. **Aspect/modality-ի կորուստ։** Ժամանակը տարված, բայց aspect-ը կամ modality-ն ընկած — վաղակատարը սեղմված անցյալ կատարյալի, պայմանականը վերարտադրված հարթ պնդման։ Tell՝ «would have» / «has been» երանգները չքանում են հայերենում։
12. **Կեղծ-դրական «ուղղումներ»։** Ճիշտ բնական նշանի «ուղղում» — `․`-ը նշել որպես homoglyph, `«»`-ը փոխարինել անգլերեն չակերտով, կամ idiomatic հայերենը վերաշարադրել կալկայված հայերենի, որովհետև «անսովոր է երևում»։ Tell՝ audit-ը հայերենը դարձնում է ավելի քիչ բնական, ոչ ավելի։

### Ընդունման չափանիշ

- Deliverable-ը համապատասխանում է հարցմանը (բնական վերաշարադրում / թարգմանություն / term bank / parity report / ռեգիստրի ախտորոշում / կետադրության audit), ոչ generic լեզվական խորհուրդ։
- Հայերենը կարդացվում է որպես սկզբնապես գրված հայերեն․ գործող-անձ-և-բայ կառուցվածք, անգլերեն կմախք չկա, բնական բառապաշար — անցնում է «միալեզու խոսողը սա կարտադրե՞ր» test-ը։
- Կետադրությունը ճիշտ է և լեզվին բնական․ `․` միայն թվարկման/բացատրության/հեղինակ→խոսք-ի համար, `։` նախադասության վերջում, `«»` միայն հայերեն արձակում, անգլերեն չակերտ միայն անգլերեն արձակում։
- Որոշյալ հոդը ճիշտ է ըստ նշված կանոնի․ `-ն` ձայնավորով սկսվող բառից առաջ կամ `է`-ից առաջ. `-ը` բաղաձայնով սկսվող բառից առաջ կամ նախադասության/բառակապակցության վերջում։
- Զրո լատինական/կիրիլիկ homoglyph հայերեն բառերի ներսում (homoglyph audit գործարկված և մաքուր)։
- Ռեգիստրը և T-V ձևը (`դու`/`Դուք`) կարգաբերված են լսարանին և պահված հետևողականորեն ամբողջ տեքստում։
- Իմաստը պահպանված է զրո թուլացած պարտավորությամբ, caveat-ով կամ թվով. տերմինաբանությունը հետևողական է (մեկ concept, մեկ անուն)։
- Հավասար բեռնվածություն (L0)․ երկու լեզուներն էլ կրում են նույն claim-երը, caveat-ները, օրինակները և խորությունը — հայերենը բնագիր է, ոչ summary։
- Assumption-ները և unknown-ները label-ված. ֆիքսված token-ները (անուններ, code, միավորներ) անձեռնմխելի։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **բնական հայերեն հոսք** (ապաբառայնացված, գործող-անձ-և-բայ, idiomatic — առանց կալկայի) · **բնական անգլերեն հոսք** (իր կետադրությունը, concision, լսարանի երանգ) · **իմաստային parity & հավասար բեռնվածություն** (նույն որոշումները, caveat-ները, թվերը, խորությունը երկու կողմից) · **ռեգիստր & T-V կարգաբերում** (`դու`/`Դուք`-ը և երանգը լսարանին համապատասխան և պահված) · **գիր & կետադրության մաքրություն** (`-ը`/`-ն`, `․`/`։`, `«»`, զրո homoglyph)։

### Խորացում և asset-եր

`manual.md` (4-ոսպնյակ model-ը, deverbalize technique-ը, `-ը`/`-ն` կանոնը, `․`/`։` կանոնը, ռեգիստր & T-V, homoglyph + equal-load, որոշման կանոններ, failure-repair playbook) · `patterns.md` (5 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (փայտացածից բնական rewrite + EN→HY թարգմանություն՝ domain «ինչու է անցնում»-ով) · `output-templates.md` (բնական rewrite / term bank / երկլեզու parity report) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
