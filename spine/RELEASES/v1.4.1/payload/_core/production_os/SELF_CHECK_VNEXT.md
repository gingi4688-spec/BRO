# production_os / DAILY SELF-CHECK vNEXT / ՕՐԱԿԱՆ ԻՆՔՆԱ-ՍՏՈՒԳՄԱՆ vNEXT

> **EN:** The daily self-check today (`bro-selfaudit` → `bro-doctor` + `bro-audit` + `bro-beast-check`) is real and honest, but mostly STRUCTURAL/governance health — not behavior/production/taste. This is the design that adds the missing dimensions. **HY:** Այսօրվա daily self-check-ը իրական ու ազնիվ է, բայց հիմնականում STRUCTURAL է — ոչ behavior/production/taste։ Սա այն design-ն է, որ ավելացնում է բացակա չափումները։

## The three parts / Երեք մասը (RM §3)

1. **Daily Doctor** — health of the machinery (existing `bro-doctor`: dirty tree · isolation · hooks · registry). Keep. / մեքենայության առողջություն (առկա)։
2. **Daily Auditor** — correctness against criteria (existing `bro-audit`/`bro-beast-check`) PLUS the new capability dimension: are the production_os laws present + registered · are the ledgers non-empty + labeled · is the UI capability recipe still green on the reference slice. / correctness + նոր capability չափում։
3. **Daily Improvement Planner (NEW)** — reads the day's failures/evidence, proposes the next bounded improvement as an execution package (L14), and files it for Gev — **proposes, never applies** (D0 + [`SELF_IMPROVEMENT.md`](SELF_IMPROVEMENT.md)). / Improvement Planner՝ առաջարկում է, երբեք չի կիրառում։

## Known false-GREEN to close / Փակելու հայտնի false-GREEN

The audit checks the skills/agents hash **format** (`^sha256:…64`), not **match** to actual content. vNext must verify the hash MATCHES the file, not just that it looks like a hash. / audit-ը ստուգում է hash-ի ՖՈՐՄԱՏ-ը, ոչ ՀԱՄԸՆԿՆՈՒՄ-ը. vNext-ը պիտի ստուգի իրական համընկնումը։

## Rule (unchanged) / Կանոն (անփոփոխ)

Bro may self-diagnose daily · may propose patches · **may NOT self-modify silently** · all self-updates require Gev approval. / Bro-ն self-diagnose + propose. ԵՐԲԵՔ լուռ self-modify չի անում. հաստատումը Գևինն է։

## Activation status / Ակտիվացման կարգավիճակ

> **FLAGGED FOLLOW-UP — NOT silently rewired.** The live scheduled task `BroSelfAudit` currently runs `bro-selfaudit -Log -Notify` (self-audit only; autopilot dispatch deliberately removed 2026-07-03). This vNext is installed here as the **design + spec**. Activating the Improvement-Planner step inside the live scheduler is a **discrete switch that waits for Gev's explicit word** — it changes a daily automation touching all bros, so it is not flipped as part of this install. The design is ready; the live cron is unchanged.
>
> **HY:** ՆՇՎԱԾ FOLLOW-UP — ԼՈՒՌ ՉԻ ՎԵՐԱԼԱՐՎԱԾ։ Կենդանի `BroSelfAudit` task-ը հիմա վազում է `bro-selfaudit -Log -Notify` (միայն self-audit)։ Այս vNext-ը տեղադրված է որպես **design+spec**։ Improvement-Planner-ը կենդանի scheduler-ում միացնելը **առանձին switch է, որ սպասում է Գևի բացահայտ բառին** — փոխում է բոլոր բռոներին դիպչող ամենօրյա ավտոմատացում, ուստի այս install-ի մասը չէ։ Design-ը պատրաստ է. cron-ը անփոփոխ։
