# Build notes — how skills_v7_6 was made / Կառուցման նշումներ

## English

`skills_v7_6` was **built by Bro himself** (2026-06-25), not by an external builder. It supersedes the v7(1–5) GPT deliveries.

**Why a rebuild.** A full-skill audit of v7(5) (10 parallel readers, against the locked god-level bar) found the pack was a genuine senior **mechanism core wrapped in a thin, templated shell**: thin `SKILL.md` files (no real decision-rule / failure-mode sections), a broken machine-merged "Operating principle" line in nearly every manual, generic noun-swap "Why this passes" / "Reviewer questions" shells, byte-identical generic output-templates, only ~3 eval prompts, EN/HY decision-rule divergence, missing `OWNER_NOTES.md` / `tests/red-team-prompts.md`, and 2–7 missing required domain topics per skill. Verdict: 0/30 at the god-level bar (the core was real and worth keeping; the shell and the missing depth were not).

**Method.** (1) Author and lock one exemplar — `devops-platform-sre` — to the full target shape and depth. (2) Rebuild the other 29 to match: one focused agent per skill, each told to read the style guide + the exemplar + the skill's current files, then write all 11 files to god-level (write-each-file-immediately for reliability). (3) Bro hand-verifies every skill and persists it. The strong cores (mechanism reference, patterns, rubric, worked-answer bodies) were preserved and extended, not discarded.

**Owner rulings applied.** The YAML `description` routing field is exempt from equal-depth bilingual prose (full English + a one-line Armenian summary); all other user-facing prose is equal-load EN+HY. Armenian uses native punctuation — verjaket `։` as full stop, mijaket `․` for enumeration/explanation, guillemets «» for quotation; English prose uses English quotes. The agents layer targets the Claude runtime.

**Verification.** See `VALIDATION_REPORT.md` — pack-wide automated scan (30×11 files, 0 shell residue, 0 stray files) + Bro's letter-by-letter hand-read of all 30 skills (30/30 god-level, 0 defects; arithmetic re-derived, safety gates confirmed).

## Հայերեն

`skills_v7_6`-ը **Bro-ի կողմից ինքնուրույն կառուցված է** (2026-06-25), ոչ արտաքին builder-ով։ Փոխարինում է v7(1–5) GPT-deliveries-ին։

**Ինչու վերակառուցում։** v7(5)-ի ամբողջ-skill աուդիտը (10 զուգահեռ ընթերցող, locked god-level bar-ի դեմ) գտավ, որ փաթեթը իսկական senior **mechanism-միջուկ էր՝ փաթաթված բարակ, template-ային կեղևի մեջ**՝ բարակ `SKILL.md` (առանց իրական decision-rule / failure-mode բաժինների), կոտրված machine-merge «Operating principle» գրեթե ամեն manual-ում, generic noun-swap «Why this passes» / «Reviewer questions» shell-եր, byte-identical generic output-templates, ընդամենը ~3 eval prompt, EN/HY decision-rule շեղում, բացակա `OWNER_NOTES.md` / `tests/red-team-prompts.md`, և 2–7 պակասող պարտադիր domain-թեմա ամեն skill-ում։ Վճիռ՝ 0/30 god-level bar-ին (միջուկը իսկական էր ու պահելու արժանի. կեղևն ու պակասող խորությունը՝ ոչ)։

**Մեթոդ։** (1) Գրի՛ր ու կողպի՛ր մեկ exemplar՝ `devops-platform-sre`-ն, լրիվ թիրախ ձևով ու խորությամբ։ (2) Վերակառուցի՛ր մյուս 29-ը դրան համապատասխան՝ մեկ focused ագենտ ամեն skill-ի, որ կարդում է style guide-ը + exemplar-ը + skill-ի ընթացիկ ֆայլերը, հետո գրում բոլոր 11 ֆայլը god-level (ամեն ֆայլ անմիջապես՝ հուսալիության համար)։ (3) Bro-ն ձեռքով ստուգում է ամեն skill ու պահում։ Ուժեղ միջուկները (mechanism reference, patterns, rubric, worked-answer-ները) պահվեցին ու ընդլայնվեցին, ոչ դեն նետվեցին։

**Owner ruling-ներ։** YAML `description` routing field-ը ազատված է հավասար-խորությամբ երկլեզու արձակից (ամբողջ անգլերեն + մեկ-տող հայերեն ամփոփում). մնացած user-facing արձակը՝ EN+HY հավասար բեռ։ Հայերենը native կետադրությամբ՝ verjaket `։` (վերջակետ), mijaket `․` (թվարկում/բացատրություն), «» չակերտներ. անգլերենը՝ անգլերեն չակերտներ։ Agents-շերտը Claude runtime-ի համար է։

**Ստուգում։** Տես `VALIDATION_REPORT.md`-ն — ամբողջ-փաթեթ automated scan (30×11 ֆայլ, 0 shell residue, 0 stray) + Bro-ի տառ-առ-տառ ձեռքով ընթերցում բոլոր 30 skill-ի (30/30 god-level, 0 defect)։
