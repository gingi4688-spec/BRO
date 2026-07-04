# production_os / 03 — BEST-SOLUTION ENGINE / ԼԱՎԱԳՈՒՅՆ ԼՈՒԾՄԱՆ ՇԱՐԺԻՉ

> **EN:** Step 4. No best solution without compared alternatives (supermachine rule #2). Generate 3–5 candidates, score them, name the winner and why the runner-up lost. **HY:** 4-րդ քայլ։ Լավագույն լուծում չկա առանց համեմատված այլընտրանքների։ Գեներացրու 3–5 թեկնածու, գնահատիր, անվանիր հաղթողն ու ինչու runner-up-ը պարտվեց։

## 1. Generate / Գեներացիա

Produce **3–5 genuinely distinct candidates** for the task (not one dressed three ways). For a wide solution space, diversify the angle (e.g. MVP-first · risk-first · user-first). / Արտադրիր **3–5 իրապես տարբեր թեկնածու**. լայն space-ի դեպքում՝ դիվերսիֆիկացրու անկյունը (MVP-first · risk-first · user-first)։

## 2. Score / Գնահատում

Score each candidate 0–5 on ten criteria, then weight by what the task actually needs:

| # | Criterion | # | Criterion |
|---|---|---|---|
| 1 | correctness | 6 | risk |
| 2 | feasibility | 7 | reversibility |
| 3 | time-to-result | 8 | cost |
| 4 | maintainability | 9 | user-fit |
| 5 | scalability | 10 | evidence-strength |

Weighted score = Σ(score × weight). Weights are stated, not hidden. / Weighted score = Σ(score × weight). weight-երը հայտարարվում են, ոչ թաքցվում։

## 3. Decide + explain / Որոշում + բացատրություն

State: **winner** · **weighted score** · **runner-up** · **why the runner-up lost** · **what single fact would flip the decision**. This rationale is required output (L14's "why best" + "rejected alternatives"). / Հայտարարիր՝ **winner** · score · **runner-up** · **ինչու runner-up-ը պարտվեց** · **որ մեկ փաստը կշրջեր որոշումը**։ Սա պարտադիր output է (L14)։

## 4. Guardrails / Պահակ-ճաղեր

- Do not fabricate criteria scores; an unmeasurable criterion is labeled ASSUMED/UNKNOWN (L15). / Մի հորինիր score. չչափելի չափանիշը՝ ASSUMED/UNKNOWN (L15)։
- Reversibility and risk carry extra weight for anything touching the spine, laws, or the remote (D0). / Reversibility-ն ու risk-ը ավելի ծանր են spine/law/remote-ի համար (D0)։

Output → the winning solution + rationale → Execution Planner ([`04_EXECUTION_PLANNER.md`](04_EXECUTION_PLANNER.md)). / Output → հաղթող լուծում + rationale → Execution Planner։
