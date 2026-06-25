# Language Mastery red-team gate

## English

This gate extends the skill's final gate for the language artifacts (native rewrite, translation, term bank, bilingual parity report, register/punctuation audit). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Calque shipped as native** — Armenian that only parses as a back-translation of English (English clause order, buried actor, noun-stacks). Rebuild via deverbalize.
- **Wrong definite article** — `-ը` before a vowel-initial word or `-ն` before a consonant; fix by the rule (`-ն` before a vowel or `է`, `-ը` before a consonant or at sentence/phrase end).
- **`․`/`։` misuse** — a sentence ended with `․`, or an enumeration introduced with `։`, or an English `:` left in Armenian prose; map the colon to `․`.
- **Homoglyph contamination** — a Latin/Cyrillic look-alike inside an Armenian word; fail the word and replace the codepoint.
- **Crossed quotation systems** — `«»` in English prose or English quotes in Armenian prose.
- **Thin-Armenian inequality (L0)** — the Armenian half is a summary of the English; demand equal load.
- **Softened obligation/number** — a `must`, `not`, threshold, or figure weakened to make the sentence flow; restore the exact force.
- **Terminology drift / over-translated tokens** — one concept with several names, or a brand/code/unit translated; lock one name and revert fixed tokens.
- **Register / T-V drift** — address form sliding from `Դուք` to `դու`, or invented warmth/casualness the source lacks.
- **False-positive "correction"** — flagging a valid `․`, `«»`, or idiomatic phrasing as an error, making the Armenian less native.

### Reviewer probes (ask these of any answer)

- Read the Armenian as a monolingual: does any sentence only make sense as a back-translation of English? Where is the actor, and is the main verb concrete or an empty `իրականացնել`/`ապահովել`?
- Check every definite article against the rule: is each `-ն` before a vowel or `է`, and each `-ը` before a consonant or at a sentence/phrase-end pause? Point to one and justify it.
- Is every `․` an enumeration/explanation/author→speech mark and every `։` a sentence end? Is any English `:` still sitting in Armenian prose?
- Run the homoglyph scan: is every letter inside each Armenian word in the Armenian Unicode block? And did the audit wrongly flag a valid `․` or `«»`?
- Are the quotation systems kept separate — `«»` only in Armenian, English quotes only in English?
- Count the load: do the English and Armenian carry the same claims, caveats, numbers, examples, and refusals, or is one side thinner? Name the missing items.
- Did any obligation, negation, threshold, or number get softer or rounder in the target than in the source? Quote the pair.
- Is there one name per concept across the whole artifact, and are brand names, code identifiers, and units left untranslated?
- Is the T-V form (`դու`/`Դուք`) and register consistent end-to-end and matched to the audience and the source — no invented warmth, no slide mid-text?
- Did the answer invent a fact, statute, or citation while "improving" the language, and is the Armenian a true equal-depth original rather than a translation of the English?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը լեզվական artifact-ների համար (բնական rewrite, թարգմանություն, term bank, երկլեզու parity report, ռեգիստրի/կետադրության audit)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Կալկա հանձնված որպես բնական** — հայերեն, որ վերլուծվում է միայն որպես անգլերենի հետադարձ թարգմանություն (անգլերեն clause order, թաղված գործող անձ, noun-stack)։ Վերակառուցիր deverbalize-ով։
- **Սխալ որոշյալ հոդ** — `-ը` ձայնավորով սկսվող բառից առաջ կամ `-ն` բաղաձայնից առաջ. ուղղիր ըստ կանոնի (`-ն` ձայնավորից կամ `է`-ից առաջ, `-ը` բաղաձայնից առաջ կամ նախադասության/բառակապակցության վերջում)։
- **`․`/`։` սխալ կիրառություն** — նախադասություն ավարտված `․`-ով, կամ թվարկում ներմուծված `։`-ով, կամ անգլերեն `:` թողնված հայերեն արձակում. colon-ը քարտեզագրիր `․`-ին։
- **Homoglyph աղտոտում** — լատինական/կիրիլիկ look-alike հայերեն բառի ներսում. fail արա բառը և փոխարինիր codepoint-ը։
- **Խաչաձև չակերտի համակարգեր** — `«»` անգլերեն արձակում կամ անգլերեն չակերտ հայերեն արձակում։
- **Բարակ-հայերեն անհավասարություն (L0)** — հայերեն կեսը անգլերենի summary է. պահանջիր հավասար բեռ։
- **Թուլացած պարտավորություն/թիվ** — `must`, `not`, շեմ կամ թիվ թուլացած նախադասությունը հոսեցնելու համար. վերականգնիր ճշգրիտ ուժը։
- **Տերմինաբանական drift / գերթարգմանված token-ներ** — մեկ concept՝ մի քանի անունով, կամ brand/code/միավոր թարգմանված. կողպիր մեկ անուն և հետ բեր ֆիքսված token-ները։
- **Ռեգիստր / T-V drift** — դիմելաձևը սահում է `Դուք`-ից `դու`, կամ հորինված ջերմություն/casual-ություն, որ աղբյուրը չունի։
- **Կեղծ-դրական «ուղղում»** — վավեր `․`, `«»` կամ idiomatic ձևակերպում նշել որպես սխալ՝ հայերենը դարձնելով ավելի քիչ բնական։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Կարդա հայերենը որպես միալեզու․ որևէ նախադասություն իմաստ ունի՞ միայն որպես անգլերենի հետադարձ թարգմանություն։ Որտե՞ղ է գործող անձը, և գլխավոր բայը կոնկրե՞տ է, թե դատարկ `իրականացնել`/`ապահովել`։
- Ստուգիր ամեն որոշյալ հոդ կանոնի դեմ․ ամեն `-ն` ձայնավորից կամ `է`-ից առա՞ջ է, ամեն `-ը` բաղաձայնից առա՞ջ կամ նախադասության/բառակապակցության վերջում։ Մատնանշիր մեկը և հիմնավորիր։
- Ամեն `․` թվարկման/բացատրության/հեղինակ→խոսք նշա՞ն է, ամեն `։` նախադասության վե՞րջ։ Որևէ անգլերեն `:` դեռ նստա՞ծ է հայերեն արձակում։
- Գործարկիր homoglyph scan-ը․ ամեն հայերեն բառի ներսում ամեն տառ հայերեն Unicode block-ո՞ւմ է։ Եվ audit-ը սխալմա՞մբ նշեց վավեր `․` կամ `«»`։
- Չակերտի համակարգերն առանձի՞ն են պահված — `«»` միայն հայերեն, անգլերեն չակերտ՝ միայն անգլերեն։
- Հաշվիր բեռը․ անգլերենն ու հայերենը կրո՞ւմ են նույն claim-երը, caveat-ները, թվերը, օրինակները և մերժումները, թե մի կողմն ավելի բարակ է։ Անվանի՛ր պակասող կետերը։
- Որևէ պարտավորություն, ժխտում, շեմ կամ թիվ թիրախում ավելի թո՞ւյլ կամ կլո՞ր դարձավ, քան աղբյուրում։ Մեջբերի՛ր զույգը։
- Մեկ անուն ամեն concept-ի՞ն է ամբողջ artifact-ով, և brand անունները, code identifier-ները ու միավորները թողնվա՞ծ են չթարգմանված։
- T-V ձևը (`դու`/`Դուք`) և ռեգիստրը հետևողակա՞ն են ծայրից ծայր և համապատասխանեցվա՞ծ լսարանին ու աղբյուրին — առանց հորինված ջերմության, առանց կեսից սահման։
- Պատասխանը լեզուն «բարելավելիս» որևէ փաստ, statute կամ citation հորինե՞ց, և հայերենը իսկապես հավասար-խորության բնագի՞ր է, ոչ անգլերենի թարգմանություն։
