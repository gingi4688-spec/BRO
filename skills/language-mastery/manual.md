# Language Mastery manual

## English

### Operating principle

Senior language-mastery work is decision-grade only when the target language is produced as an original, not assembled as a translation. The deliverable is one of a few shapes: a stiff-to-native rewrite, a translation that reads as if first-written, a term bank, a bilingual parity / equal-load report, a register diagnosis, or a punctuation/script audit. The single discipline that governs all of them is **deverbalization** — read the source for its meaning, drop the source's surface form completely, then re-express that meaning in the target language's own syntax. If you transform word-by-word, you produce a calque: grammatically correct yet readable only as a back-translation. So the first move is always to extract the meaning and let go of the form, then build the target from the bare meaning. Native production is not the absence of errors; it is prose a monolingual speaker of that language would actually have written, carrying the same decisions, caveats, and numbers as the other language at equal load.

### The 4-lens model (the core of this skill)

Every piece of bilingual work is read through four lenses in turn. A senior answer passes all four; a weak answer passes one or two and fails silently on the rest.

1. **The native lens — would a monolingual speaker produce this?** Read the Armenian as if you knew no English (and the English as if you knew no Armenian). If the sentence only makes sense as a back-translation, it is a calque. This lens catches English skeletons, buried actors, noun-stacks, and idioms rendered literally. The test is concrete: read it aloud and ask whether a monolingual would have said it that way.
2. **The learner lens — is anything ambiguous, over-compressed, or mis-leveled?** Read as someone acquiring the language: is the register too hard or too casual for the audience, is a term introduced without a gloss, does a pronoun or article create ambiguity? This lens calibrates accessibility and surfaces under-explained jumps.
3. **The translator lens — is meaning, function, and load fully carried?** Compare the two sides as a translator checking fidelity: every claim, caveat, number, obligation, list item, and refusal present on both sides, nothing softened, nothing dropped. This lens enforces semantic parity and equal load (L0) and catches the "thin Armenian summary".
4. **The linguist lens — is the form mechanically correct?** Audit the surface system: definite article (`-ը`/`-ն`), punctuation (`․`/`։`, `«»`), script hygiene (zero homoglyphs), aspect/modality, agreement, the T-V form. This lens is rule-based and checkable, not taste.

A finished artifact is signed off only when all four lenses pass. The native and linguist lenses most often fail in machine-assisted Armenian; the translator lens most often fails L0; the learner lens most often fails on register.

### Deverbalize — the named technique

Deverbalization is the operational core, stated as a procedure so it can be taught and audited:

1. **Read for meaning, not words.** Take in the whole unit (sentence or short paragraph) and form the meaning — the decision, warning, evidence, tone, and intended reader action — independent of the source wording.
2. **Drop the source form.** Deliberately let go of the source's clause order, its noun-stacks, its idioms, its sentence boundaries. Do not keep the English skeleton "to be safe"; the skeleton is exactly what produces the calque.
3. **Re-express from the bare meaning.** Write the target from the meaning in the target's own syntax: in Armenian that usually means finding the actor and a concrete verb, choosing native idiom, and resetting sentence boundaries. The result should read as if it were the first draft, not a second-language echo.

Deverbalize is what separates translation that reads native from word-substitution that does not. When a rewrite "feels off", the usual cause is that step 2 was skipped — the source form was carried over.

### Mechanism reference

- **Functional equivalence** — preserve the *job* of the sentence (decision, warning, evidence, tone, reader action), not its word order. If English says "must", Armenian must keep the obligation, even if it splits the sentence or reorders the verb. This is what prevents both thin summaries and literal calques. Function first, form second.
- **Armenian is verb-centered** — Armenian leans on actors and concrete verbs where English stacks nouns. Convert "implementation of validation requirements" into "համակարգը ստուգում է պարտադիր դաշտերը" when that is the real meaning. Replace empty verbs (`իրականացնել`, `ապահովել`) with the concrete action. The buried actor is the single most common cause of stiff Armenian.
- **The definite article `-ը`/`-ն` (stated explicitly)** — Armenian's definite article attaches to the word. The choice is phonological, set by the *next* word: use **`-ն`** when the next word begins with a vowel or is the copula `է` (`գիրքն առա`, `գիրքն է`, `տունն ընկավ`); use **`-ը`** when the next word begins with a consonant, or when the noun stands at sentence/phrase end before a pause (`գիրքը կարդացի`, `տունը մեծ է`, `...բերեց գիրքը։`). The rule is mechanical and checkable — it is not a matter of feel, and getting it wrong is an immediate non-native tell.
- **Punctuation `․` vs `։` (stated explicitly)** — the **միջակետ `․`** (a raised dot) introduces an enumeration, an explanation, or an author→speech transition; it is the Armenian analogue of the English colon `:` in those functions. The **վերջակետ `։`** ends a sentence (the Armenian full stop). The English colon `:` therefore maps to `․`, **not** to `։`. Critically, `․` is a genuine Armenian punctuation mark — do not "correct" it to a Latin period or flag it as a homoglyph. Use `«»` for quotation in Armenian prose and English quotes in English prose; never cross them.
- **Register and the T-V distinction** — Armenian distinguishes `դու` (informal/singular: peer, intimate, child) from `Դուք` (formal/respectful, and grammatically plural). Calibrate to the audience: `դու` for friendly/peer/personal, `Դուք` for formal/respectful/unknown/public. Pick one form and hold it across the whole text — a slide from `Դուք` to `դու` mid-document is a register break. Beyond the pronoun, register includes vocabulary, sentence length, and warmth; match it to the source and audience, and never invent a register the source does not have.
- **Homoglyph audit and equal-load rule** — Armenian letters have Latin and Cyrillic look-alikes: Armenian `օ ա ո ս կ հ ն պ` resemble Latin `o a c h n p` and Cyrillic `о а с н р`. A look-alike inside an Armenian word is a hard defect (it breaks search, sorting, and screen readers, and is invisible to the eye). Run a script check before finalizing. The **equal-load rule (L0)**: both languages must carry the same claims, lists, caveats, numbers, examples, and refusals at the same depth — the Armenian is an independent original, never a compressed summary of the English. The only exemption is the YAML `description` routing field (full English + a one-line Armenian summary).
- **Terminology policy** — decide per term: translate it, keep the English because the audience expects it, or pair once on first use (`validation (ստուգում)`) and then commit to one form. One concept, one name — three names read as three concepts. Record decisions in a term bank for any long artifact. Never "translate" fixed tokens: brand names, code identifiers, API names, and SI units stay as-is.
- **Aspect and modality** — Armenian marks aspect (aorist vs perfect) and modality (indicative vs subjunctive/conditional) differently from English. Carry the aspect, not just the tense: "I have checked" (perfect) and "I checked" (aorist) land on different Armenian forms, and a conditional ("would have") must not flatten into a plain statement.

### Decision rules

1. Deverbalize before re-expressing: read for meaning, drop the source form, rebuild in the target's own syntax — never transform word-by-word.
2. Rebuild stiff Armenian around an actor and a concrete verb; collapse English noun-stacks and replace empty verbs (`իրականացնել`, `ապահովել`) with the real action.
3. Apply the article rule explicitly: `-ն` before a vowel-initial next word or before `է`; `-ը` before a consonant-initial next word or at sentence/phrase end (pause).
4. Use `․` (միջակետ) for enumeration/explanation/author→speech and `։` (վերջակետ) for sentence end; map the English colon `:` to `․`, not to `։`; never re-mark `․` as an error.
5. Keep quotation systems separate: `«»` in Armenian prose, English quotes in English prose.
6. Run the homoglyph audit and fail any Armenian word containing a Latin/Cyrillic look-alike before finalizing.
7. Calibrate the T-V form (`դու` vs `Դուք`) to the audience and hold it consistently across the whole text; default to `Դուք` for unknown/public audiences.
8. Enforce equal load (L0): both languages carry the same claims, caveats, numbers, and depth — never ship a thinner Armenian summary.
9. Preserve every obligation, caveat, and number; if fluency would soften a "must", a "not", or a threshold, keep the meaning and re-naturalize, or flag the tension.
10. Make one terminology decision per recurring concept (translate / keep / pair-once) and apply it everywhere; record it in a term bank for long artifacts.
11. Keep fixed tokens intact: do not translate brand names, code identifiers, API names, or units.
12. Carry aspect and modality, not just tense: match perfect/aorist and indicative/conditional to the real meaning.
13. Keep quoted source, statute, or contract text literal; translate natively around it and flag awkwardness rather than smoothing the obligation away.
14. When unsure a phrasing is native, read it aloud and apply the monolingual test; if it only parses as a back-translation, rebuild it.

### Failure-repair playbook

1. **Armenian reads as an English calque** → deverbalize: restate the meaning, drop the English skeleton, and rebuild around the actor and a concrete verb in Armenian word order.
2. **Wrong definite article (`-ը`/`-ն`)** → first **confirm the variety** (default: **reformed Eastern Armenian**; Western/classical orthography differs on the article and on auxiliary placement, so never "correct" a Western text into an Eastern error). Then apply the rule by the next word: `-ն` before a vowel or before `է`, `-ը` before a consonant or at sentence/phrase end; fix `գիրքը առա` → `գիրքն առա` and `գիրքն կարդացի` → `գիրքը կարդացի`.
3. **`․`/`։` confused** → restore each to its function: `․` introduces an enumeration/explanation, `։` ends a sentence; map a stray English `:` to `․`, and stop "correcting" a valid `․`.
4. **Quotation systems crossed** → put `«»` back into the Armenian prose and English quotes back into the English prose.
5. **Homoglyph in an Armenian word** → run the script check, replace the Latin/Cyrillic codepoint with the Armenian letter, and re-paste from a clean source rather than re-typing over the contamination.
6. **Register slips / T-V drift** → choose one form for the audience and sweep the whole text to it; revert any invented warmth or casualness the source did not have.
7. **Thin Armenian (L0 violation)** → expand the Armenian to the English's depth in its own idiom: restore the dropped examples, caveats, and list items so both halves carry the same load.
8. **Obligation or number softened** → restore the exact force and figure ("must" not "կարելի է", the real threshold), then re-naturalize the sentence around the preserved meaning.
9. **Terminology drift** → pick one name per concept, sweep all variants to it, and record the choice in the term bank.
10. **Fixed token over-translated** → revert the brand name, code identifier, API name, or unit to its original form so the reference still resolves.
11. **Aspect/modality lost** → re-map the verb to the right Armenian form (perfect vs aorist, conditional vs plain) so "has been" / "would have" nuances survive.
12. **False-positive "correction"** → reverse any change that made the Armenian less native — restore the valid `․`, the `«»`, and the idiomatic phrasing the audit wrongly flagged.

### The homoglyph audit (how to run it)

Before finalizing any Armenian, scan for non-Armenian codepoints inside Armenian words. The danger letters are the ones with cross-script twins: Armenian `օ`(U+0585) vs Latin `o`/Cyrillic `о`; `ո`/`ա` shapes vs Latin/Cyrillic vowels; `ս` vs Latin `c`/Cyrillic `с`; `հ` vs Latin `h`; `ն` vs Latin `n`/Cyrillic `н`; `պ` vs Latin `p`/Cyrillic `р`. Contamination almost always enters via copy-paste from a mixed-script source. A clean pass means every letter inside an Armenian word is in the Armenian Unicode block — and, deliberately, the `․` (U+2024) and `«»` are *not* treated as defects, because they are correct Armenian punctuation. A homoglyph is invisible to the eye but breaks search, sort, and accessibility; this is why the audit is mechanical, not visual.

### Equal load in practice (the L0 deliverable)

Equal load means the Armenian and English are two originals of the same depth, not a source and its summary. Operationally: count the claims, list items, caveats, numbers, examples, and refusals on each side — they must match. The Armenian is written in Armenian idiom (it is not the English with words swapped), and the English in English idiom, but neither side may carry information the other lacks. The single documented exemption is the YAML `description` routing field, which may be full English plus a one-line Armenian summary. Everywhere else, a thinner Armenian half is an L0 failure even when each Armenian sentence is individually correct.

## Հայերեն

### Գործառնական սկզբունք

Ավագ լեզվական-վարպետության աշխատանքը decision-grade է միայն, երբ թիրախ լեզուն արտադրվում է որպես բնագիր, ոչ թե հավաքվում որպես թարգմանություն։ Deliverable-ը մի քանի ձևից մեկն է՝ փայտացածից բնական վերաշարադրում, թարգմանություն, որ կարդացվում է որպես սկզբնապես գրված, term bank, երկլեզու parity / equal-load report, ռեգիստրի ախտորոշում, կամ կետադրության/գրի audit։ Բոլորը կառավարող միակ կարգապահությունը **ապաբառայնացումն (deverbalization)** է — կարդա աղբյուրը իմաստի համար, ամբողջովին թող աղբյուրի մակերեսային ձևը, հետո այդ իմաստը նորից արտահայտիր թիրախ լեզվի սեփական շարադասությամբ։ Եթե բառ առ բառ ձևափոխես, կալկա ես արտադրում․ քերականորեն ճիշտ, բայց կարդացվող միայն որպես հետադարձ թարգմանություն։ Ուստի առաջին քայլը միշտ իմաստը հանելն ու ձևը բաց թողնելն է, հետո՝ թիրախը մերկ իմաստից կառուցելը։ Բնական արտադրությունը սխալների բացակայությունը չէ. այն այն արձակն է, որ տվյալ լեզվի միալեզու խոսողը իրականում կգրեր՝ կրելով նույն որոշումները, caveat-ները և թվերը, ինչ մյուս լեզուն՝ հավասար բեռնվածությամբ։

### 4-ոսպնյակ model-ը (այս skill-ի միջուկը)

Ամեն երկլեզու աշխատանք կարդացվում է չորս ոսպնյակով՝ հերթով։ Senior պատասխանն անցնում է չորսն էլ. թույլ պատասխանն անցնում է մեկ-երկուսը և լուռ ձախողվում մնացածի վրա։

1. **Բնական ոսպնյակ — միալեզու խոսողը սա կարտադրե՞ր։** Կարդա հայերենը այնպես, կարծես անգլերեն չգիտես (և անգլերենը՝ կարծես հայերեն չգիտես)։ Եթե նախադասությունն իմաստ ունի միայն որպես հետադարձ թարգմանություն, դա կալկա է։ Այս ոսպնյակը բռնում է անգլերեն կմախքները, թաղված գործող անձին, noun-stack-երը և բառացի վերարտադրված idiom-ները։ Test-ը կոնկրետ է․ կարդա բարձրաձայն և հարցրու՝ միալեզուն այդպես կասե՞ր։
2. **Սովորողի ոսպնյակ — որևէ բան երկիմա՞ստ է, գերսեղմվա՞ծ, սխալ-մակարդակվա՞ծ։** Կարդա որպես լեզուն յուրացնող․ ռեգիստրը լսարանի համար շա՞տ բարդ է, թե շատ casual, term ներմուծվա՞ծ է առանց բացատրության, դերանունը կամ հոդը երկիմաստությո՞ւն է ստեղծում։ Այս ոսպնյակը կարգաբերում է մատչելիությունը և երևան հանում թերբացատրված ցատկերը։
3. **Թարգմանչի ոսպնյակ — իմաստը, գործառույթը և բեռը լրիվ տարվա՞ծ են։** Համեմատիր երկու կողմերը որպես fidelity ստուգող թարգմանիչ․ ամեն claim, caveat, թիվ, պարտավորություն, ցանկի կետ և մերժում առկա է երկու կողմում, ոչինչ թուլացված, ոչինչ ընկած։ Այս ոսպնյակը պարտադրում է իմաստային parity-ն և հավասար բեռնվածությունը (L0) և բռնում «բարակ հայերեն summary»-ն։
4. **Լեզվաբանի ոսպնյակ — ձևը մեխանիկորեն ճի՞շտ է։** Audit արա մակերեսային համակարգը․ որոշյալ հոդ (`-ը`/`-ն`), կետադրություն (`․`/`։`, `«»`), գրի մաքրություն (զրո homoglyph), aspect/modality, համաձայնություն, T-V ձև։ Այս ոսպնյակը կանոնակենտրոն է և ստուգելի, ոչ ճաշակի։

Ավարտված artifact-ը հաստատվում է միայն, երբ չորս ոսպնյակն էլ անցնում են։ Բնական և լեզվաբանի ոսպնյակները ամենից հաճախ ձախողվում են machine-assisted հայերենում. թարգմանչի ոսպնյակը ամենից հաճախ ձախողվում է L0-ով. սովորողի ոսպնյակը ամենից հաճախ՝ ռեգիստրով։

### Ապաբառայնացրու — անվանված technique-ը

Ապաբառայնացումը գործառնական միջուկն է, շարադրված որպես ընթացակարգ, որ կարելի լինի սովորեցնել և audit անել․

1. **Կարդա իմաստի համար, ոչ բառերի։** Ընկալիր ողջ միավորը (նախադասություն կամ կարճ պարբերություն) և ձևավորիր իմաստը — որոշումը, զգուշացումը, ապացույցը, երանգը և ընթերցողի ակնկալվող գործողությունը — աղբյուրի ձևակերպումից անկախ։
2. **Թող աղբյուրի ձևը։** Միտումնավոր բաց թող աղբյուրի clause order-ը, noun-stack-երը, idiom-ները, նախադասության սահմանները։ Մի՛ պահիր անգլերեն կմախքը «ապահով լինելու համար». կմախքը հենց այն է, որ կալկա է ծնում։
3. **Նորից արտահայտիր մերկ իմաստից։** Թիրախը գրիր իմաստից՝ թիրախի սեփական շարադասությամբ. հայերենում դա սովորաբար նշանակում է գտնել գործող անձին և կոնկրետ բայ, ընտրել բնական idiom, և վերասահմանել նախադասության սահմանները։ Արդյունքը պետք է կարդացվի որպես առաջին սևագիր, ոչ թե երկրորդ-լեզվի արձագանք։

Ապաբառայնացումն է, որ թարգմանությունը, որ կարդացվում է բնական, տարբերում է բառ-փոխարինումից, որ չի։ Երբ վերաշարադրումը «սխալ է զգացվում», սովորական պատճառը 2-րդ քայլի բացթողումն է — աղբյուրի ձևը տարվել է առաջ։

### Մեխանիզմների տեղեկագիր

- **Functional equivalence** — պահպանիր նախադասության *գործը* (որոշում, զգուշացում, ապացույց, երանգ, reader action), ոչ թե բառերի կարգը։ Եթե անգլերենն ասում է «must», հայերենը պետք է պահի պարտավորությունը, նույնիսկ եթե բաժանի նախադասությունը կամ վերադասավորի բայը։ Հենց սա է կանխում և՛ բարակ summary-ն, և՛ բառացի կալկան։ Նախ գործառույթ, հետո ձև։
- **Հայերենը բայակենտրոն է** — հայերենը հենվում է գործող անձի և կոնկրետ բայերի վրա, որտեղ անգլերենը noun է կուտակում։ «Implementation of validation requirements»-ը դարձրու «համակարգը ստուգում է պարտադիր դաշտերը», երբ դա է իրական իմաստը։ Դատարկ բայերը (`իրականացնել`, `ապահովել`) փոխարինիր կոնկրետ գործողությամբ։ Թաղված գործող անձը փայտացած հայերենի ամենահաճախ պատճառն է։
- **Որոշյալ հոդ `-ը`/`-ն` (բացահայտ շարադրված)** — հայերենի որոշյալ հոդը կպչում է բառին։ Ընտրությունը հնչյունական է, սահմանված *հաջորդ* բառով․ օգտագործիր **`-ն`**, երբ հաջորդ բառը սկսվում է ձայնավորով կամ `է` օժանդակ բայն է (`գիրքն առա`, `գիրքն է`, `տունն ընկավ`). օգտագործիր **`-ը`**, երբ հաջորդ բառը սկսվում է բաղաձայնով, կամ երբ գոյականը կանգնած է նախադասության/բառակապակցության վերջում՝ դադարից առաջ (`գիրքը կարդացի`, `տունը մեծ է`, `...բերեց գիրքը։`)։ Կանոնը մեխանիկ է և ստուգելի — ճաշակի հարց չէ, և սխալ կիրառելն անմիջական ոչ-բնական tell է։
- **Կետադրություն `․` ընդդեմ `։` (բացահայտ շարադրված)** — **միջակետ `․`**-ը (բարձրացված կետ) ներմուծում է թվարկում, բացատրություն կամ հեղինակ→խոսք անցում. այն հայերեն համարժեքն է անգլերեն colon-ի `:` այդ գործառույթներում։ **Վերջակետ `։`**-ը ավարտում է նախադասությունը (հայերեն full stop)։ Ուստի անգլերեն colon-ը `:` համապատասխանում է `․`-ին, **ոչ** `։`-ին։ Կարևորը՝ `․`-ը իսկական հայերեն կետադրական նշան է — մի՛ «ուղղիր» այն լատինական կետի և մի՛ նշիր որպես homoglyph։ Մեջբերման համար օգտագործիր `«»` հայերեն արձակում և անգլերեն չակերտ՝ անգլերեն արձակում. երբեք մի՛ խաչաձևիր։
- **Ռեգիստր և T-V տարբերակում** — հայերենը տարբերում է `դու`-ն (ոչ-ֆորմալ/եզակի՝ հավասար, մտերիմ, երեխա) `Դուք`-ից (ֆորմալ/հարգալից, և քերականորեն հոգնակի)։ Կարգաբերիր լսարանին․ `դու`՝ ընկերական/հավասար/անձնական, `Դուք`՝ ֆորմալ/հարգալից/անհայտ/հանրային։ Ընտրիր մեկ ձև և պահիր ամբողջ տեքստում — `Դուք`-ից `դու` սահելը կեսից ռեգիստրի կոտրվածք է։ Դերանունից այն կողմ՝ ռեգիստրը ներառում է բառապաշար, նախադասության երկարություն և ջերմություն. համապատասխանեցրու աղբյուրին ու լսարանին, և երբեք մի՛ հորինիր ռեգիստր, որ աղբյուրը չունի։
- **Homoglyph audit և equal-load կանոն** — հայերեն տառերն ունեն լատինական ու կիրիլիկ look-alike-ներ․ հայերեն `օ ա ո ս կ հ ն պ`-ն նման են լատինական `o a c h n p`-ին և կիրիլիկ `о а с н р`-ին։ Look-alike հայերեն բառի ներսում կոշտ թերություն է (կոտրում է search-ը, sorting-ը և screen reader-ը, և անտեսանելի է աչքին)։ Վերջնականացնելուց առաջ գործարկիր գրի ստուգում։ **Equal-load կանոն (L0)**․ երկու լեզուներն էլ պետք է կրեն նույն claim-երը, ցանկերը, caveat-ները, թվերը, օրինակները և մերժումները՝ նույն խորությամբ — հայերենը անկախ բնագիր է, երբեք անգլերենի սեղմ summary չէ։ Միակ բացառությունը YAML `description` routing field-ն է (ամբողջական անգլերեն + մեկ տողանոց հայերեն ամփոփում)։
- **Terminology policy** — որոշիր ամեն term-ի համար․ թարգմանել, պահել անգլերեն լսարանի պատճառով, թե առաջին օգտագործման ժամանակ մեկ անգամ զույգով տալ (`validation (ստուգում)`) և հետո հանձնառու լինել մեկ ձևի։ Մեկ concept, մեկ անուն — երեք անունը կարդացվում է որպես երեք concept։ Երկար artifact-ի համար գրանցիր որոշումները term bank-ում։ Երբեք մի՛ «թարգմանիր» ֆիքսված token-ները․ brand անունները, code identifier-ները, API անունները և SI միավորները մնում են ինչպես կան։
- **Aspect և modality** — հայերենը նշում է aspect-ը (անցյալ կատարյալ ընդդեմ վաղակատարի) և modality-ն (սահմանական ընդդեմ ստորադասական/պայմանական) անգլերենից այլ կերպ։ Տար aspect-ը, ոչ միայն ժամանակը․ «I have checked» (վաղակատար) և «I checked» (անցյալ կատարյալ) ընկնում են տարբեր հայերեն ձևերի վրա, և պայմանականը («would have») չպետք է հարթվի հասարակ պնդման։

### Որոշման կանոններ

1. Ապաբառայնացրու նախքան վերարտահայտելը․ կարդա իմաստի համար, թող աղբյուրի ձևը, վերակառուցիր թիրախի սեփական շարադասությամբ — երբեք բառ առ բառ մի՛ ձևափոխիր։
2. Վերակառուցիր փայտացած հայերենը գործող անձի և կոնկրետ բայի շուրջ․ քանդիր անգլերեն noun-stack-երը և դատարկ բայերը (`իրականացնել`, `ապահովել`) փոխարինիր իրական գործողությամբ։
3. Կիրառիր հոդի կանոնը բացահայտ․ `-ն`՝ ձայնավորով սկսվող հաջորդ բառից առաջ կամ `է`-ից առաջ. `-ը`՝ բաղաձայնով սկսվող հաջորդ բառից առաջ կամ նախադասության/բառակապակցության վերջում (դադարին)։
4. Օգտագործիր `․` (միջակետ)՝ թվարկման/բացատրության/հեղինակ→խոսք-ի, և `։` (վերջակետ)՝ նախադասության վերջի համար. անգլերեն colon-ը `:` քարտեզագրիր `․`-ին, ոչ `։`-ին. երբեք `․`-ը որպես սխալ մի՛ նշիր։
5. Պահիր չակերտի համակարգերն առանձին․ `«»` հայերեն արձակում, անգլերեն չակերտ՝ անգլերեն արձակում։
6. Գործարկիր homoglyph audit-ը և fail արա ցանկացած հայերեն բառ՝ լատինական/կիրիլիկ look-alike-ով, նախքան վերջնականացնելը։
7. Կարգաբերիր T-V ձևը (`դու` ընդդեմ `Դուք`) լսարանին և պահիր հետևողականորեն ամբողջ տեքստում. անհայտ/հանրային լսարանի համար լռելյայն ընտրիր `Դուք`։
8. Պարտադրիր հավասար բեռնվածություն (L0)․ երկու լեզուներն էլ կրում են նույն claim-երը, caveat-ները, թվերը և խորությունը — երբեք ավելի բարակ հայերեն summary մի՛ հանձնիր։
9. Պահպանիր ամեն պարտավորություն, caveat և թիվ. եթե սահունությունը կթուլացնի «պետք է», «ոչ» կամ շեմ, պահիր իմաստը և նորից բնականացրու, կամ նշիր լարվածությունը։
10. Արա մեկ տերմինաբանական որոշում ամեն կրկնվող concept-ի համար (թարգմանել / պահել / մեկ անգամ զույգով) և կիրառիր ամենուր. երկար artifact-ի համար գրանցիր term bank-ում։
11. Պահիր ֆիքսված token-ները անձեռնմխելի․ մի՛ թարգմանիր brand անունները, code identifier-ները, API անունները կամ միավորները։
12. Տար aspect-ը և modality-ն, ոչ միայն ժամանակը․ համապատասխանեցրու վաղակատար/անցյալ կատարյալ և սահմանական/պայմանական ձևերը իրական իմաստին։
13. Պահիր մեջբերված աղբյուրը, statute-ը կամ պայմանագրի տեքստը բառացի․ թարգմանիր բնական դրա շուրջը և նշիր անհարմարությունը, ոչ թե հղկիր պարտավորությունը։
14. Երբ անհայտ է՝ ձևակերպումը բնակա՞ն է, կարդա բարձրաձայն և կիրառիր միալեզու test-ը. եթե այն վերլուծվում է միայն որպես հետադարձ թարգմանություն, վերակառուցիր այն։

### Վերականգնման խաղագիրք

1. **Հայերենը կարդացվում է որպես անգլերեն կալկա** → ապաբառայնացրու․ վերաշարադրիր իմաստը, թող անգլերեն կմախքը, և վերակառուցիր գործող անձի ու կոնկրետ բայի շուրջ հայերեն շարադասությամբ։
2. **Սխալ որոշյալ հոդ (`-ը`/`-ն`)** → նախ **հաստատիր variety-ն** (default՝ **reformed Eastern / աշխարհաբար արևելահայերեն**. Western/classical ուղղագրությունը տարբերվում է հոդով և օժանդակի դիրքով, ուստի երբեք մի՛ «ուղղիր» Western տեքստը Eastern սխալի)։ Հետո կիրառիր կանոնը հաջորդ բառով․ `-ն`՝ ձայնավորից առաջ կամ `է`-ից առաջ, `-ը`՝ բաղաձայնից առաջ կամ նախադասության/բառակապակցության վերջում. ուղղիր `գիրքը առա` → `գիրքն առա` և `գիրքն կարդացի` → `գիրքը կարդացի`։
3. **`․`/`։` շփոթված** → վերադարձրու յուրաքանչյուրն իր գործառույթին․ `․`-ը ներմուծում է թվարկում/բացատրություն, `։`-ն ավարտում է նախադասությունը. թափառող անգլերեն `:`-ը քարտեզագրիր `․`-ին, և դադարեցրու վավեր `․`-ի «ուղղումը»։
4. **Չակերտի համակարգերը խաչաձևված** → վերադարձրու `«»`-ը հայերեն արձակ և անգլերեն չակերտը՝ անգլերեն արձակ։
5. **Homoglyph հայերեն բառում** → գործարկիր գրի ստուգում, փոխարինիր լատինական/կիրիլիկ codepoint-ը հայերեն տառով, և վերապատճենիր մաքուր աղբյուրից, ոչ թե վերատպիր աղտոտվածի վրա։
6. **Ռեգիստրը սահում է / T-V drift** → ընտրիր մեկ ձև լսարանի համար և տեքստն ամբողջությամբ բեր դրան. հետ արա ցանկացած հորինված ջերմություն կամ casual-ություն, որ աղբյուրը չուներ։
7. **Բարակ հայերեն (L0 խախտում)** → ընդլայնիր հայերենը անգլերենի խորությանը՝ իր idiom-ով. վերականգնիր ընկած օրինակները, caveat-ները և ցանկի կետերը, որ երկու կեսերն էլ կրեն նույն բեռը։
8. **Պարտավորություն կամ թիվ թուլացված** → վերականգնիր ճշգրիտ ուժը և թիվը («պետք է», ոչ «կարելի է», իրական շեմը), հետո նորից բնականացրու նախադասությունը պահված իմաստի շուրջ։
9. **Տերմինաբանական drift** → ընտրիր մեկ անուն ամեն concept-ի, բեր բոլոր տարբերակները դրան, և գրանցիր ընտրությունը term bank-ում։
10. **Ֆիքսված token գերթարգմանված** → վերադարձրու brand անունը, code identifier-ը, API անունը կամ միավորը իր սկզբնական ձևին, որ հղումը դեռ լուծվի։
11. **Aspect/modality կորած** → վերաքարտեզագրիր բայը ճիշտ հայերեն ձևի (վաղակատար ընդդեմ անցյալ կատարյալի, պայմանական ընդդեմ հասարակի), որ «has been» / «would have» երանգները փրկվեն։
12. **Կեղծ-դրական «ուղղում»** → հետ արա ամեն փոփոխություն, որ հայերենը դարձրեց ավելի քիչ բնական — վերականգնիր վավեր `․`-ը, `«»`-ը և idiomatic ձևակերպումը, որ audit-ը սխալմամբ նշեց։

### Homoglyph audit-ը (ինչպես գործարկել)

Ցանկացած հայերեն վերջնականացնելուց առաջ scan արա ոչ-հայերեն codepoint-ների համար հայերեն բառերի ներսում։ Վտանգավոր տառերն այն են, որ ունեն խաչ-գրային զույգ․ հայերեն `օ`(U+0585) ընդդեմ լատինական `o`/կիրիլիկ `о`. `ո`/`ա` ձևերը ընդդեմ լատինական/կիրիլիկ ձայնավորների. `ս` ընդդեմ լատինական `c`/կիրիլիկ `с`. `հ` ընդդեմ լատինական `h`. `ն` ընդդեմ լատինական `n`/կիրիլիկ `н`. `պ` ընդդեմ լատինական `p`/կիրիլիկ `р`։ Աղտոտումը գրեթե միշտ մտնում է խառը-գրային աղբյուրից copy-paste-ով։ Մաքուր անցումը նշանակում է, որ հայերեն բառի ներսում ամեն տառ հայերեն Unicode block-ում է — և, միտումնավոր, `․`-ը (U+2024) ու `«»`-ը *չեն* համարվում թերություն, որովհետև դրանք ճիշտ հայերեն կետադրություն են։ Homoglyph-ը անտեսանելի է աչքին, բայց կոտրում է search-ը, sort-ը և accessibility-ն. հենց դրա համար audit-ը մեխանիկ է, ոչ տեսողական։

### Հավասար բեռնվածությունը գործնականում (L0 deliverable-ը)

Հավասար բեռնվածությունը նշանակում է, որ հայերենն ու անգլերենը նույն խորության երկու բնագիր են, ոչ թե աղբյուր և իր summary-ն։ Գործնականում․ հաշվիր claim-երը, ցանկի կետերը, caveat-ները, թվերը, օրինակները և մերժումները ամեն կողմում — դրանք պետք է համընկնեն։ Հայերենը գրված է հայերեն idiom-ով (անգլերենը բառափոխած չէ), իսկ անգլերենը՝ անգլերեն idiom-ով, բայց ոչ մի կողմ չի կարող կրել տեղեկություն, որ մյուսը չունի։ Միակ փաստաթղթավորված բացառությունը YAML `description` routing field-ն է, որ կարող է լինել ամբողջական անգլերեն plus մեկ տողանոց հայերեն ամփոփում։ Մնացած ամենուր ավելի բարակ հայերեն կեսը L0 ձախողում է, նույնիսկ երբ ամեն հայերեն նախադասություն առանձին-առանձին ճիշտ է։
