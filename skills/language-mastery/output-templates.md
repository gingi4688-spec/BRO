# Language Mastery output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep meaning, obligations, and numbers intact; run the linguist-lens checks before finalizing. These are language artifacts — there is no formula or matrix to fill.

### Template 1 — Native rewrite / translation

- **Source text:** (paste the original, English or Armenian)
- **Direction & target:** EN→HY | HY→EN | stiff-HY→native-HY
- **Audience & register:** who reads it; T-V form chosen (`դու` / `Դուք`) and why
- **Diagnosis (lenses):** what makes it non-native — calque / buried actor / noun-stack / code-switch / register / punctuation
- **Deverbalized rewrite:** (the native target, written from meaning, not word-swapped)
- **Terminology decisions:** term → chosen form (translate / keep English / pair-once); fixed tokens left intact
- **What was preserved:** obligations, caveats, numbers, conditions carried in full (note anything that could have been softened and was not)
- **Linguist-lens check:** `-ը`/`-ն` correct · `․`/`։` correct · `«»` vs English quotes correct · homoglyph scan clean
- **Acceptance:** passes the "would a monolingual produce this?" test · meaning preserved · register held · script clean

### Template 2 — Term bank

For a recurring-terminology artifact. One row per concept; one chosen form, applied everywhere.

| Concept (EN) | Decision | Chosen form | First-use gloss | Notes |
|---|---|---|---|---|
| validation | translate | ստուգում | validation (ստուգում) | user-facing copy |
| SLO | keep English | SLO | — | audience expects the acronym |
| (your term) | translate / keep / pair-once | (form) | (gloss or —) | (audience / register) |

- **Fixed tokens (never translated):** brand names, code identifiers, API names, units — list them so an editor cannot "translate" them later.
- **Acceptance:** one concept → one name across the whole artifact · paired terms glossed once then committed · fixed tokens listed and untouched.

### Template 3 — Bilingual parity / equal-load report

For checking that an English and Armenian pair are two originals at equal depth.

- **Artifact under review:** (file / section)
- **Claim count:** EN ___ vs HY ___ (must match)
- **List items / examples:** EN ___ vs HY ___ (must match)
- **Caveats & obligations:** present on both sides? (list any dropped on one side)
- **Numbers & thresholds:** identical both ways? (flag any rounded/dropped)
- **Refusals / safety lines:** present and equal-force both ways?
- **Register match:** same T-V form and tone both sides?
- **Script & punctuation:** Armenian half — `-ը`/`-ն`, `․`/`։`, `«»`, homoglyphs all clean?
- **Verdict:** PASS (equal load) | FAIL (which side is thin, and the exact missing items)
- **Exemption note:** the only allowed inequality is the YAML `description` routing field.

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. պահիր իմաստը, պարտավորությունները և թվերը անձեռնմխելի. վերջնականացնելուց առաջ գործարկիր լեզվաբանի-ոսպնյակ ստուգումները։ Սրանք լեզվական artifact-ներ են — formula կամ matrix լրացնելու բան չկա։

### Template 1 — Բնական rewrite / թարգմանություն

- **Աղբյուր տեքստ․** (փակցրու բնագիրը, անգլերեն կամ հայերեն)
- **Ուղղություն & թիրախ․** EN→HY | HY→EN | փայտացած-HY→բնական-HY
- **Լսարան & ռեգիստր․** ով է կարդում. ընտրված T-V ձև (`դու` / `Դուք`) և ինչու
- **Ախտորոշում (ոսպնյակներ)․** ինչն է ոչ-բնական դարձնում — կալկա / թաղված գործող անձ / noun-stack / code-switch / ռեգիստր / կետադրություն
- **Ապաբառայնացված rewrite․** (բնական թիրախը, գրված իմաստից, ոչ բառ-փոխարինած)
- **Տերմինաբանական որոշումներ․** term → ընտրված ձև (թարգմանել / պահել անգլերեն / մեկ անգամ զույգով). ֆիքսված token-ները անձեռնմխելի
- **Ինչ պահպանվեց․** պարտավորությունները, caveat-ները, թվերը, պայմանները տարված լրիվ (նշիր, եթե որևէ բան կարող էր թուլանալ և չթուլացավ)
- **Լեզվաբանի-ոսպնյակ ստուգում․** `-ը`/`-ն` ճիշտ · `․`/`։` ճիշտ · `«»` ընդդեմ անգլերեն չակերտի ճիշտ · homoglyph scan մաքուր
- **Acceptance․** անցնում է «միալեզուն սա կարտադրե՞ր» test-ը · իմաստը պահպանված · ռեգիստրը պահված · գիրը մաքուր

### Template 2 — Term bank

Կրկնվող-տերմինաբանության artifact-ի համար։ Մեկ տող ամեն concept-ի. մեկ ընտրված ձև, կիրառված ամենուր։

| Concept (EN) | Որոշում | Ընտրված ձև | Առաջին-օգտագործման gloss | Նշումներ |
|---|---|---|---|---|
| validation | թարգմանել | ստուգում | validation (ստուգում) | user-facing copy |
| SLO | պահել անգլերեն | SLO | — | լսարանը սպասում է հապավմանը |
| (քո term-ը) | թարգմանել / պահել / մեկ անգամ զույգով | (ձև) | (gloss կամ —) | (լսարան / ռեգիստր) |

- **Ֆիքսված token-ներ (երբեք չթարգմանվող)․** brand անուններ, code identifier-ներ, API անուններ, միավորներ — թվարկիր դրանք, որ խմբագիրը հետո չ«թարգմանի»։
- **Acceptance․** մեկ concept → մեկ անուն ամբողջ artifact-ով · զույգով տրված term-երը glossed մեկ անգամ, հետո հանձնառու · ֆիքսված token-ները թվարկված և անձեռնմխելի։

### Template 3 — Երկլեզու parity / հավասար-բեռի report

Ստուգելու, որ անգլերեն-հայերեն զույգը նույն խորության երկու բնագիր է։

- **Ստուգվող artifact․** (ֆայլ / բաժին)
- **Claim-երի քանակ․** EN ___ ընդդեմ HY ___ (պետք է համընկնեն)
- **Ցանկի կետեր / օրինակներ․** EN ___ ընդդեմ HY ___ (պետք է համընկնեն)
- **Caveat-ներ & պարտավորություններ․** առկա՞ են երկու կողմում (թվարկիր ընկածը մի կողմում)
- **Թվեր & շեմեր․** նույնակա՞ն են երկու կողմից (նշիր կլորացված/ընկածը)
- **Մերժումներ / safety տողեր․** առկա՞ և հավասար-ուժով երկու կողմից
- **Ռեգիստրի համապատասխանություն․** նույն T-V ձև և երանգ երկու կողմո՞ւմ
- **Գիր & կետադրություն․** հայերեն կեսը — `-ը`/`-ն`, `․`/`։`, `«»`, homoglyph բոլորը մաքո՞ւր
- **Վճիռ․** PASS (հավասար բեռ) | FAIL (որ կողմն է բարակ և ճշգրիտ պակասող կետերը)
- **Բացառության նշում․** միակ թույլատրելի անհավասարությունը YAML `description` routing field-ն է։
