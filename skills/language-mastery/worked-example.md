# Language Mastery worked examples

## English

### Example A — stiff-to-native Armenian rewrite

**Prompt.** Rewrite this stiff Armenian into native product-copy Armenian while preserving the English meaning: «Օգտագործողը կարող է submit անել request-ը, եթե required fields-ը լրացված են և system-ը validation է անում։ In case of error, user-ը պետք է retry անի»։

**Senior answer.**

*Diagnosis (native + linguist lenses):* the sentence mirrors English grammar, over-uses code-switching (`submit անել`, `required fields`, `validation`, `retry անի`), buries the actor behind `system-ը`, and mixes an English fragment into Armenian prose. The actor is the user and the system; the meaning is a condition, a check, an error state, and a corrective action.

*Deverbalized rewrite:* «Հարցումը կարող եք ուղարկել, երբ լրացված են բոլոր պարտադիր դաշտերը, և համակարգը ստուգումն անցկացնում է առանց սխալի։ Եթե սխալ է հայտնվում, ուղղեք նշված դաշտերը և կրկին ուղարկեք հարցումը»։

*Term policy:* `validation` → `ստուգում` (user-facing copy, non-technical audience); `submit/request` → `ուղարկել/հարցում`; `retry` → `կրկին ուղարկել`. One name per concept, applied throughout.

*Register & T-V:* product copy addressing the user formally → `Դուք` form held consistently (`կարող եք`, `ուղղեք`, `ուղարկեք`); no casual `դու` slips in.

*Punctuation & script:* sentence ends with `։`; `«»` for the Armenian quotation; no English colon; homoglyph scan clean (every letter in the Armenian block); article `դաշտերը` (`-ը` before a consonant-initial `և`-clause), `ստուգումն անցկացնում` (`-ն` before the vowel-initial `անցկացնում`).

**Why this passes.** It deverbalizes rather than word-swaps: the English skeleton is gone, the actor (`համակարգը`) drives a concrete verb (`ստուգումն անցկացնում է`) instead of the buried `system-ը validation է անում`. The code-switching is resolved with a real terminology decision (`ստուգում`, `ուղարկել`, `հարցում`), one name per concept, not a mix. The `-ն`/`-ը` choice is applied by the rule and shown — `ստուգումն անցկացնում` takes `-ն` because the next word is vowel-initial, while `դաշտերը` takes `-ը` before a consonant. Register is calibrated and held: the formal `Դուք` form runs through every verb with no slide to `դու`. The meaning is fully preserved — the condition, the validation, the error state, and the retry action all survive — but the shape is rebuilt so a monolingual Armenian reader feels no English underneath. Nothing was softened: "must retry" became a clear native instruction, not a weakened suggestion.

### Example B — English→Armenian translation (deverbalize + equal load)

**Prompt.** Translate this product notice into native Armenian for a general (non-technical) audience, keeping it equal-load: "You must verify your email before you can publish. If you don't, your post will stay as a draft and won't be visible to anyone."

**Senior answer.**

*Diagnosis:* two obligations (verify-before-publish; consequence-if-not), a clear `must`, and a general audience. A literal translation would calque the `before you can` and `if you don't` structures and bury the action.

*Deverbalized Armenian:* «Հրապարակելուց առաջ պետք է հաստատեք ձեր էլ. փոստը։ Մինչ այդ ձեր գրառումը կմնա սևագիր և տեսանելի չի լինի ոչ ոքի»։

*Register & T-V:* general public audience → `Դուք` form (`հաստատեք`, `ձեր`); the obligation `must` is kept as `պետք է հաստատեք`, not softened to `կարող եք հաստատել`.

*Equal load (L0) note:* both obligations and the consequence are carried — verify is required, publishing is gated on it, and the draft-and-invisible outcome is stated; nothing dropped, no extra invented.

*Punctuation & script:* sentences end with `։`; the dot in `էլ.` is the ordinary abbreviation period (`էլ. փոստ` = email), which the homoglyph audit correctly leaves alone; homoglyph scan otherwise clean. Article: `փոստը` takes `-ը` at sentence end (before the `։` pause), and `գրառումը` takes `-ը` before the consonant-initial `կմնա`.

**Why this passes.** It translates the function, not the words: `before you can publish` becomes the native `Հրապարակելուց առաջ` construction instead of a calqued `նախքան որ կարողանաք հրապարակել`, and `if you don't` is folded into the native `Մինչ այդ` ("until then") rather than a literal conditional. The `must` is preserved at full force (`պետք է հաստատեք`), so the obligation is not softened in the name of fluency. The register is calibrated to a general audience with a consistent `Դուք` form, and the T-V choice never slips. Equal load holds: both the requirement and its consequence are present in the Armenian exactly as in the English, with nothing summarized away and nothing invented. The punctuation is native — `։` ends each sentence, and the only non-letter is the ordinary abbreviation period in `էլ.`, which the audit correctly leaves alone rather than flagging as a defect.

### Example C — Armenian→English (deverbalize into native English)

**Prompt.** Translate this Armenian notice into English for an international audience, and show the calque trap. Source (HY): «Հարգելի օգտատեր, տեղեկացնում ենք Ձեզ, որ Ձեր կողմից կատարված վճարումը հաջողությամբ իրականացվել է, և ծառայությունը կմատուցվի առաջիկա 24 ժամվա ընթացքում։»

**Answer.**

*The calque (word-for-word, to avoid):* "Dear user, we inform You that the payment performed by You has been successfully realized, and the service will be provided within the coming 24 hours." — grammatically English, but it reads as translated: the passive nominal chain ("the payment performed by You has been realized"), the capitalized **"You"** (carried over from the Armenian `Ձեզ`/`Ձեր` T-V respect form, which English does not mark), and the empty verbs ("realized," "provided," "we inform You that").

*Deverbalize, then re-express in native English* — drop the Armenian surface, keep the meaning (payment succeeded; service within 24h; polite register), write it as an English speaker would:

> **"Hi [name] — your payment went through. Your service will be active within 24 hours."**

or, for a formal brand voice:

> **"Thank you — we've received your payment, and your service will be active within 24 hours."**

*Why the changes:* English marks respect through **word choice and warmth, not a capitalized pronoun** — so `Ձեզ` → lowercase "you," and the deference of `Հարգելի … տեղեկացնում ենք Ձեզ, որ` collapses into a simple "Hi" / "Thank you," which is how English is actually polite. The passive `վճարումը … իրականացվել է` becomes the active, concrete "your payment went through." `Կմատուցվի` (will be provided) → "will be active," the verb an English user expects. Meaning is preserved in full (success + 24-hour window); nothing added.

**Why this passes.** It runs the L0 discipline **into English**, not only into Armenian — it deverbalizes the Armenian source and re-expresses it in native English instead of carrying the source's shape across, and it names the specific calque tells (the capitalized "You" imported from the Armenian T-V form, the passive nominalizations, the empty "realized/provided"). It shows the register move that actually matters between the two languages — Armenian marks respect **morphologically** (`Ձեզ`, `Դուք`), English marks it **lexically** (word choice, warmth), so the fix is a lowercase "you" plus a warm opener, not a literal transfer. Meaning and the 24-hour fact are preserved exactly, nothing invented — the "native English flow" rubric dimension demonstrated end to end, which the Armenian-target examples never exercised.

## Հայերեն

### Օրինակ A — փայտացածից բնական հայերեն վերաշարադրում

**Prompt.** Փայտացած հայերենը վերագրիր բնական product-copy հայերենով՝ պահելով նույն իմաստը․ «Օգտագործողը կարող է submit անել request-ը, եթե required fields-ը լրացված են և system-ը validation է անում։ In case of error, user-ը պետք է retry անի»։

**Senior պատասխան.**

*Ախտորոշում (բնական + լեզվաբանի ոսպնյակ)․* նախադասությունը կրկնում է անգլերենի քերականությունը, չափից շատ code-switch ունի (`submit անել`, `required fields`, `validation`, `retry անի`), գործող անձին թաղում է `system-ը`-ի տակ, և անգլերեն հատված է խառնում հայերեն արձակ։ Գործող անձը user-ն ու համակարգն են. իմաստը պայման է, ստուգում, error state և ուղղող գործողություն։

*Ապաբառայնացված վերաշարադրում․* «Հարցումը կարող եք ուղարկել, երբ լրացված են բոլոր պարտադիր դաշտերը, և համակարգը ստուգումն անցկացնում է առանց սխալի։ Եթե սխալ է հայտնվում, ուղղեք նշված դաշտերը և կրկին ուղարկեք հարցումը»։

*Term policy․* `validation` → `ստուգում` (user-facing copy, ոչ-տեխնիկական լսարան). `submit/request` → `ուղարկել/հարցում`. `retry` → `կրկին ուղարկել`։ Մեկ անուն ամեն concept-ին, կիրառված ամենուր։

*Ռեգիստր & T-V․* product copy, որ դիմում է user-ին ֆորմալ → `Դուք` ձևը պահված հետևողականորեն (`կարող եք`, `ուղղեք`, `ուղարկեք`). casual `դու` չի սահում ներս։

*Կետադրություն & գիր․* նախադասությունն ավարտվում է `։`-ով. `«»` հայերեն մեջբերման համար. անգլերեն colon չկա. homoglyph scan-ը մաքուր է (ամեն տառ հայերեն block-ում). հոդ՝ `դաշտերը` (`-ը` բաղաձայնով սկսվող `և`-clause-ից առաջ), `ստուգումն անցկացնում` (`-ն` ձայնավորով սկսվող `անցկացնում`-ից առաջ)։

**Ինչու է անցնում gate-ը.** Այն ապաբառայնացնում է, ոչ թե բառ-փոխարինում․ անգլերեն կմախքը չքացել է, գործող անձը (`համակարգը`) վարում է կոնկրետ բայ (`ստուգումն անցկացնում է`)՝ թաղված `system-ը validation է անում`-ի փոխարեն։ Code-switch-ը լուծված է իրական տերմինաբանական որոշմամբ (`ստուգում`, `ուղարկել`, `հարցում`), մեկ անուն ամեն concept-ին, ոչ խառնուրդ։ `-ն`/`-ը` ընտրությունը կիրառված է ըստ կանոնի և ցույց տրված — `ստուգումն անցկացնում` վերցնում է `-ն`, որովհետև հաջորդ բառը ձայնավորով է, իսկ `դաշտերը` վերցնում է `-ը` բաղաձայնից առաջ։ Ռեգիստրը կարգաբերված է և պահված․ ֆորմալ `Դուք` ձևը անցնում է ամեն բայով՝ առանց `դու`-ի սահման։ Իմաստը լրիվ պահված է — պայմանը, ստուգումը, error state-ը և retry-ն բոլորը փրկվում են — բայց ձևը վերակառուցված է այնպես, որ միալեզու հայ ընթերցողը տակի անգլերենը չզգա։ Ոչինչ չթուլացավ․ «պետք է retry անի»-ն դարձավ հստակ բնական ցուցում, ոչ թե թուլացած առաջարկ։

### Օրինակ B — անգլերեն→հայերեն թարգմանություն (ապաբառայնացում + հավասար բեռ)

**Prompt.** Թարգմանիր այս product notice-ը բնական հայերենով ընդհանուր (ոչ-տեխնիկական) լսարանի համար՝ պահելով հավասար բեռնված․ "You must verify your email before you can publish. If you don't, your post will stay as a draft and won't be visible to anyone."

**Senior պատասխան.**

*Ախտորոշում․* երկու պարտավորություն (հաստատել-նախքան-հրապարակել. հետևանք-եթե-ոչ), հստակ `must`, և ընդհանուր լսարան։ Բառացի թարգմանությունը կկալկայեր `before you can` ու `if you don't` կառույցները և կթաղեր գործողությունը։

*Ապաբառայնացված հայերեն․* «Հրապարակելուց առաջ պետք է հաստատեք ձեր էլ. փոստը։ Մինչ այդ ձեր գրառումը կմնա սևագիր և տեսանելի չի լինի ոչ ոքի»։

*Ռեգիստր & T-V․* ընդհանուր հանրային լսարան → `Դուք` ձև (`հաստատեք`, `ձեր`). `must` պարտավորությունը պահված է որպես `պետք է հաստատեք`, ոչ թուլացված `կարող եք հաստատել`-ի։

*Հավասար բեռ (L0) նշում․* երկու պարտավորությունն ու հետևանքը տարված են — հաստատելը պարտադիր է, հրապարակումը պայմանավորված է դրանով, և սևագիր-ու-անտեսանելի արդյունքը նշված է. ոչինչ չի ընկել, ոչ ավելորդ չի հորինվել։

*Կետադրություն & գիր․* նախադասություններն ավարտվում են `։`-ով. `էլ.`-ի կետը սովորական հապավման կետ է (`էլ. փոստ` = էլեկտրոնային փոստ), որ homoglyph audit-ը ճիշտ թողնում է անձեռնմխելի. scan-ն այլապես մաքուր է։ Հոդ՝ `փոստը` վերցնում է `-ը` նախադասության վերջում (`։` դադարից առաջ), իսկ `գրառումը`՝ `-ը` բաղաձայնով սկսվող `կմնա`-ից առաջ։

**Ինչու է անցնում gate-ը.** Այն թարգմանում է գործառույթը, ոչ բառերը․ `before you can publish`-ը դառնում է բնական `Հրապարակելուց առաջ` կառույց՝ կալկայված `նախքան որ կարողանաք հրապարակել`-ի փոխարեն, և `if you don't`-ը ծալվում է բնական `Մինչ այդ`-ի մեջ, ոչ թե բառացի պայմանականի։ `must`-ը պահված է լրիվ ուժով (`պետք է հաստատեք`), ուստի պարտավորությունը չի թուլանում սահունության անունից։ Ռեգիստրը կարգաբերված է ընդհանուր լսարանին հետևողական `Դուք` ձևով, և T-V ընտրությունը երբեք չի սահում։ Հավասար բեռը պահվում է․ թե՛ պահանջը, թե՛ իր հետևանքը առկա են հայերենում ճիշտ այնպես, ինչպես անգլերենում՝ առանց summary-ի և առանց հորինվածի։ Կետադրությունը բնական է — `։`-ն ավարտում է ամեն նախադասություն, և միակ ոչ-տառը `էլ.`-ի սովորական հապավման կետն է, որ audit-ը ճիշտ թողնում է անձեռնմխելի, ոչ թե նշում որպես թերություն։

### Օրինակ C — հայերեն→անգլերեն (ապաբառայնացում դեպի բնական անգլերեն)

**Prompt.** Թարգմանիր այս հայերեն ծանուցումը անգլերեն միջազգային լսարանի համար, և ցույց տուր calque թակարդը։ Աղբյուր (HY)․ «Հարգելի օգտատեր, տեղեկացնում ենք Ձեզ, որ Ձեր կողմից կատարված վճարումը հաջողությամբ իրականացվել է, և ծառայությունը կմատուցվի առաջիկա 24 ժամվա ընթացքում։»

**Պատասխան.**

*Կալկան (բառ առ բառ, խուսափելու)․* "Dear user, we inform You that the payment performed by You has been successfully realized, and the service will be provided within the coming 24 hours." — քերականորեն անգլերեն, բայց կարդացվում է որպես թարգմանված․ passive nominal շղթան ("the payment performed by You has been realized"), մեծատառ **"You"**-ն (փոխանցված հայերեն `Ձեզ`/`Ձեր` T-V հարգանքի ձևից, որ անգլերենը չի նշում), և դատարկ բայերը ("realized", "provided", "we inform You that")։

*Ապաբառայնացրու, հետո նորից արտահայտիր բնական անգլերենով* — թող հայերեն մակերեսը, պահիր իմաստը (վճարումը հաջողվեց. ծառայությունը 24 ժամում. քաղաքավարի ռեգիստր), գրիր, ինչպես անգլերեն խոսողը կգրեր․

> **"Hi [name] — your payment went through. Your service will be active within 24 hours."**

կամ ֆորմալ brand voice-ի համար․

> **"Thank you — we've received your payment, and your service will be active within 24 hours."**

*Ինչու փոփոխությունները․* անգլերենը հարգանքը նշում է **բառընտրությամբ ու ջերմությամբ, ոչ մեծատառ դերանունով** — ուստի `Ձեզ` → փոքրատառ "you", և `Հարգելի … տեղեկացնում ենք Ձեզ, որ`-ի պատկառանքը ծալվում է պարզ "Hi" / "Thank you"-ի մեջ, ինչը անգլերենի իրական քաղաքավարությունն է։ Passive `վճարումը … իրականացվել է`-ն դառնում է active, կոնկրետ "your payment went through"։ `Կմատուցվի` → "will be active", այն բայը, որ անգլերեն user-ը սպասում է։ Իմաստը լրիվ պահված է (success + 24-ժամյա window). ոչինչ ավելացված չէ։

**Ինչու է անցնում gate-ը.** Այն գործարկում է L0 discipline-ը **դեպի անգլերեն**, ոչ միայն դեպի հայերեն — ապաբառայնացնում է հայերեն աղբյուրը և նորից արտահայտում բնական անգլերենով՝ աղբյուրի ձևը փոխանցելու փոխարեն, և անվանում է կոնկրետ calque tell-երը (մեծատառ "You"-ն՝ ներմուծված հայերեն T-V ձևից, passive nominalization-ները, դատարկ "realized/provided"-ը)։ Այն ցույց է տալիս register move-ը, որ իրականում կարևոր է երկու լեզվի միջև — հայերենը հարգանքը նշում է **ձևաբանորեն** (`Ձեզ`, `Դուք`), անգլերենը՝ **բառապաշարով** (բառընտրություն, ջերմություն), ուստի fix-ը փոքրատառ "you" plus ջերմ բացում է, ոչ բառացի փոխանցում։ Իմաստն ու 24-ժամյա փաստը պահված են ճշգրիտ, ոչինչ հորինված — «native English flow» rubric dimension-ը ցուցադրված ծայրից ծայր, որ հայերեն-target example-ները երբեք չէին վարժեցնում։
