# Language Mastery patterns

## English

These are canonical language-mastery moves. Each produces one of the domain's artifacts (native rewrite, translation, term bank, bilingual parity report, register/punctuation audit). Choose the move that fixes the actual defect, not the nicest-sounding label.

### 1. Deverbalize-and-rebuild (stiff/calqued → native)

- **Trigger:** Armenian (or English) is grammatical but reads as the other language wearing this language's words — buried actor, noun-stacks, literal idioms, English clause order.
- **Mechanism:** Read the unit for meaning; drop the source's surface form entirely (deverbalize); rebuild from the bare meaning in the target's own syntax — in Armenian, find the actor and a concrete verb, collapse noun-stacks, reset sentence boundaries, choose native idiom. Then run the linguist lens (article, `․`/`։`, `«»`, homoglyphs).
- **Do not use when:** A quoted source, statute, or contract clause must stay literal — translate natively around it but leave the binding text verbatim.
- **Failure repair:** If the rewrite came out shorter, check what was dropped — a caveat, condition, or number usually vanished; restore meaning before polishing tone.

### 2. Bilingual parity / equal-load pass

- **Trigger:** The English and Armenian halves must be two originals of the same depth (every artifact in this pack).
- **Mechanism:** Count the claims, list items, caveats, numbers, examples, and refusals on each side; they must match. Expand the thinner side in its own idiom (not by translating the other) until both carry the same load. The only exemption is the YAML `description` routing field.
- **Do not use when:** The text is the documented YAML `description` exemption — there a full-English routing line plus a one-line Armenian summary is allowed.
- **Failure repair:** If the Armenian is a compressed summary, rewrite it as a full Armenian original at the English's depth; an accurate-but-thin Armenian still fails L0.

### 3. Term-bank lock

- **Trigger:** A technical concept recurs across a bilingual artifact and risks picking up several names.
- **Mechanism:** Decide per term — translate / keep English / pair-once (`validation (ստուգում)`) — then apply the one chosen form everywhere. Record the decisions in a small table so a later edit cannot reintroduce a variant. Keep fixed tokens (brand names, code identifiers, API names, units) untouched.
- **Do not use when:** The text is a one-off casual reply with no recurring terminology — a full term bank is overhead.
- **Failure repair:** If one concept has two or three names, readers will infer two or three concepts; collapse all variants to the single locked form.

### 4. Register & T-V calibration

- **Trigger:** The audience and formality are known (or must be decided), or the address form drifts across the text.
- **Mechanism:** Choose the T-V form — `դու` for peer/intimate/personal, `Դուք` for formal/respectful/unknown/public — and the matching register (vocabulary, sentence length, warmth). Hold one form across the whole text. Calibrate to the source: do not invent warmth a neutral source lacks, or strip formality a legal source requires.
- **Do not use when:** The source's own register is the binding constraint (a verbatim quote, a fixed legal notice) — preserve it rather than re-calibrating.
- **Failure repair:** If the text slides from `Դուք` to `դու` (or formal to casual) mid-document, sweep the whole text to one form and revert the invented register.

### 5. Punctuation & script audit (the linguist-lens sweep)

- **Trigger:** Any Armenian is about to be finalized, especially after copy-paste from a mixed-script source.
- **Mechanism:** Run four mechanical checks. (1) Article: `-ն` before a vowel-initial next word or before `է`; `-ը` before a consonant or at sentence/phrase end. (2) `․` only for enumeration/explanation/author→speech; `։` for sentence end; English `:` maps to `․`. (3) `«»` only in Armenian prose, English quotes only in English prose. (4) Homoglyph scan: every letter inside an Armenian word is in the Armenian Unicode block — `․` and `«»` are correct, not defects.
- **Do not use when:** Never skip it for Armenian output — but do not apply the homoglyph fix to `․`/`«»`, which are valid Armenian marks (that is a false-positive correction).
- **Failure repair:** If the audit "corrected" a valid `․`, `«»`, or idiomatic phrasing, reverse it — an audit that makes the Armenian less native has failed.

## Հայերեն

Սրանք canonical լեզվական-վարպետության move-եր են։ Ամեն մեկն արտադրում է ոլորտի artifact-ներից մեկը (բնական rewrite, թարգմանություն, term bank, երկլեզու parity report, ռեգիստրի/կետադրության audit)։ Ընտրիր այն move-ը, որ ուղղում է իրական թերությունը, ոչ թե ամենագեղեցիկ հնչող label-ը։

### 1. Ապաբառայնացրու-և-վերակառուցիր (փայտացած/կալկա → բնական)

- **Երբ է պետք․** Հայերենը (կամ անգլերենը) քերականորեն ճիշտ է, բայց կարդացվում է որպես մյուս լեզուն՝ այս լեզվի բառերով հագած — թաղված գործող անձ, noun-stack-եր, բառացի idiom-ներ, անգլերեն clause order։
- **Մեխանիզմը․** Կարդա միավորը իմաստի համար. ամբողջովին թող աղբյուրի մակերեսային ձևը (deverbalize). վերակառուցիր մերկ իմաստից թիրախի սեփական շարադասությամբ — հայերենում գտիր գործող անձին և կոնկրետ բայ, քանդիր noun-stack-երը, վերասահմանիր նախադասության սահմանները, ընտրիր բնական idiom։ Հետո գործարկիր լեզվաբանի ոսպնյակը (հոդ, `․`/`։`, `«»`, homoglyph)։
- **Երբ չօգտագործել․** Երբ մեջբերված աղբյուրը, statute-ը կամ պայմանագրի clause-ը պետք է մնա բառացի — թարգմանիր բնական դրա շուրջը, բայց պարտադիր տեքստը թող verbatim։
- **Ուղղում․** Եթե rewrite-ը կարճ ստացվեց, ստուգիր ինչ ընկավ — սովորաբար caveat, պայման կամ թիվ չքացավ. վերականգնիր իմաստը նախքան երանգը հղկելը։

### 2. Երկլեզու parity / հավասար բեռնվածության անցում

- **Երբ է պետք․** Անգլերեն և հայերեն կեսերը պետք է լինեն նույն խորության երկու բնագիր (այս pack-ի ամեն artifact)։
- **Մեխանիզմը․** Հաշվիր claim-երը, ցանկի կետերը, caveat-ները, թվերը, օրինակները և մերժումները ամեն կողմում. դրանք պետք է համընկնեն։ Ընդլայնիր ավելի բարակ կողմը իր idiom-ով (ոչ թե մյուսը թարգմանելով), մինչև երկուսն էլ կրեն նույն բեռը։ Միակ բացառությունը YAML `description` routing field-ն է։
- **Երբ չօգտագործել․** Երբ տեքստը փաստաթղթավորված YAML `description` բացառությունն է — այնտեղ թույլատրվում է ամբողջական-անգլերեն routing տող plus մեկ տողանոց հայերեն ամփոփում։
- **Ուղղում․** Եթե հայերենը սեղմ summary է, վերաշարադրիր այն որպես ամբողջական հայերեն բնագիր անգլերենի խորությամբ. ճշգրիտ-բայց-բարակ հայերենը դեռ fail է L0-ով։

### 3. Term bank-ի կողպում

- **Երբ է պետք․** Տեխնիկական concept կրկնվում է երկլեզու artifact-ով և ռիսկ ունի մի քանի անուն ստանալու։
- **Մեխանիզմը․** Որոշիր ամեն term-ի համար — թարգմանել / պահել անգլերեն / մեկ անգամ զույգով (`validation (ստուգում)`) — հետո կիրառիր ընտրած մեկ ձևը ամենուր։ Գրանցիր որոշումները փոքր աղյուսակում, որ հետագա խմբագրումը չվերաներմուծի տարբերակ։ Ֆիքսված token-ները (brand անուն, code identifier, API անուն, միավոր) պահիր անձեռնմխելի։
- **Երբ չօգտագործել․** Երբ տեքստը մեկանգամյա casual պատասխան է առանց կրկնվող տերմինաբանության — ամբողջական term bank-ը ավելորդ ծախս է։
- **Ուղղում․** Եթե մեկ concept-ը երկու-երեք անուն ունի, ընթերցողը կեզրակացնի երկու-երեք concept. միավորիր բոլոր տարբերակները մեկ կողպված ձևի։

### 4. Ռեգիստր & T-V կարգաբերում

- **Երբ է պետք․** Լսարանը և ֆորմալությունը հայտնի են (կամ պետք է որոշվեն), կամ դիմելաձևը drift է անում տեքստով։
- **Մեխանիզմը․** Ընտրիր T-V ձևը — `դու`՝ հավասար/մտերիմ/անձնական, `Դուք`՝ ֆորմալ/հարգալից/անհայտ/հանրային — և համապատասխան ռեգիստրը (բառապաշար, նախադասության երկարություն, ջերմություն)։ Պահիր մեկ ձև ամբողջ տեքստում։ Կարգաբերիր աղբյուրին․ մի՛ հորինիր ջերմություն, որ չեզոք աղբյուրը չունի, և մի՛ հանիր ֆորմալությունը, որ իրավական աղբյուրը պահանջում է։
- **Երբ չօգտագործել․** Երբ աղբյուրի սեփական ռեգիստրն է պարտադիր սահմանափակումը (verbatim մեջբերում, ֆիքսված իրավական ծանուցում) — պահպանի՛ր այն, ոչ թե վերակարգաբերիր։
- **Ուղղում․** Եթե տեքստը կեսից սահում է `Դուք`-ից `դու` (կամ ֆորմալից casual), բեր ամբողջ տեքստը մեկ ձևի և հետ արա հորինված ռեգիստրը։

### 5. Կետադրության & գրի audit (լեզվաբանի-ոսպնյակ անցում)

- **Երբ է պետք․** Ցանկացած հայերեն պատրաստվում է վերջնականացվել, հատկապես խառը-գրային աղբյուրից copy-paste-ից հետո։
- **Մեխանիզմը․** Գործարկիր չորս մեխանիկ ստուգում։ (1) Հոդ․ `-ն`՝ ձայնավորով սկսվող հաջորդ բառից առաջ կամ `է`-ից առաջ. `-ը`՝ բաղաձայնից առաջ կամ նախադասության/բառակապակցության վերջում։ (2) `․` միայն թվարկման/բացատրության/հեղինակ→խոսք-ի համար. `։` նախադասության վերջում. անգլերեն `:`-ը քարտեզագրվում է `․`-ին։ (3) `«»` միայն հայերեն արձակում, անգլերեն չակերտ՝ միայն անգլերեն արձակում։ (4) Homoglyph scan․ հայերեն բառի ներսում ամեն տառ հայերեն Unicode block-ում է — `․`-ը և `«»`-ը ճիշտ են, ոչ թերություն։
- **Երբ չօգտագործել․** Երբեք մի՛ բաց թող այն հայերեն արդյունքի համար — բայց homoglyph fix-ը մի՛ կիրառիր `․`/`«»`-ի վրա, որոնք վավեր հայերեն նշաններ են (դա կեղծ-դրական ուղղում է)։
- **Ուղղում․** Եթե audit-ը «ուղղեց» վավեր `․`, `«»` կամ idiomatic ձևակերպում, հետ արա այն — audit, որ հայերենը դարձնում է ավելի քիչ բնական, ձախողվել է։
