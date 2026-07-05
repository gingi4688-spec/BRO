# production_os / 07 — REPAIRER / ՎԵՐԱՆՈՐՈԳՈՂ

> **EN:** Core role — the fix-loop that runs when the Verifier issues RED/YELLOW. Fix only the failed area, re-verify, log. Bounded: max 3 automatic cycles, then escalate to Gev with the exact blocker. **HY:** Հիմնական role — fix-loop, որ վազում է երբ Verifier-ը RED/YELLOW է տալիս։ Ուղղիր միայն ձախողված հատվածը, re-verify, log։ Սահմանափակ՝ առավելագույնը 3 ցիկլ, հետո escalate Գևին ճշգրիտ blocker-ով։

## 1. The repair loop / Վերանորոգման loop

1. **Identify** the failed criterion (from the Verifier verdict). / հայտնաբերիր ձախողված criterion-ը։
2. **Classify** the failure: missing requirement · wrong implementation · broken UI · failed test · unsupported assumption · unsafe action · unclear input. / classify արա failure-ը։
3. **Fix only the failed area** — no scope creep, no unrelated changes riding along. / ուղղիր միայն ձախողված հատվածը — ոչ scope creep։
4. **Re-verify** — re-run the exact check that failed (and the suite). / re-verify — վազեցրու ձախողված check-ը (ու suite-ը)։
5. **Append** to the failure log: what failed · why · which gate caught it · the fix · the re-verification result. / գրիր failure log-ում՝ ինչ · ինչու · որ gate · fix · re-verify արդյունք։
6. **Repeat** until GREEN or the cycle cap. / կրկնիր մինչ GREEN կամ cap։

## 2. The cap / Cap-ը

Max **3** automatic repair cycles. After the 3rd failure, STOP and escalate to Gev with the exact blocker (never loop silently, never fake a pass). / Առավելագույնը **3** ցիկլ։ 3-րդ ձախողումից հետո՝ ԿԱՆԳ ու escalate Գևին ճշգրիտ blocker-ով (երբեք լուռ loop, երբեք կեղծ pass)։

## 3. Discipline / Կարգապահություն

- Two defects in → two fixes out. No extra changes. / երկու defect ներս → երկու fix դուրս։ ոչ ավել։
- Minimal diff over band-aid where a clean rewrite of the failed unit is cleaner (per Gev's rewrite-over-bandaid steer), still test-first, still anchored. / մինիմալ diff, բայց մաքուր rewrite երբ ավելի մաքուր է, դեռ test-first, դեռ anchored։

## 4. Reference run / Հղումային վազք

On the CRM slice the Repairer fixed **FL-001** (flip `CONTROLLED_DEFECT_ESC_NOOP` → false; drawer closes on Escape) and **FL-002** (Churned badge → solid destructive fill, white-on-red 4.77:1 ≥ AA) — two defects, two minimal fixes, no scope creep → re-verify **23/23 GREEN**. Recorded in `memory/_failures/FAILURE_LEDGER.md`. / Repairer-ը ուղղեց FL-001 (ESC) ու FL-002 (contrast) → re-verify 23/23 GREEN, գրանցված failure ledger-ում։

On the Code slice the Repairer fixed **FL-008** (boundary `< end` → `<= end`, a minimal one-operator diff) and **FL-009** (add `"rootDir": "src"`) — two defects, two minimal fixes, no scope creep → re-verify **13/13 GREEN**. Same discipline, different artifact class. / Code slice-ում Repairer-ը ուղղեց FL-008-ն ու FL-009-ը՝ երկու min fix, ոչ scope creep → 13/13 GREEN։ նույն կարգապահություն, ուրիշ դաս։

On GREEN → [`08_FINAL_REPORT.md`](08_FINAL_REPORT.md). On cap-hit → escalate to Gev. / GREEN → Final Report. cap → escalate Գևին։
