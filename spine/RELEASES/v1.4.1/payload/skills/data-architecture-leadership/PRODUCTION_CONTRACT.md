# data-architecture-leadership — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: DECLARED.** Contract complete and anchored to this skill's `domain-rubric.md` + `tests/`. **Not PROVEN:** no independent design-decision eval RUN yet (L15/L18). This is a decision/design skill — its proof is a reviewed decision against stated criteria + trade-off record, not runtime code. Next proof slice: an L2 LLM-graded design-decision eval (Block 2).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ DECLARED։** Contract-ը լրիվ է, խարսխված `domain-rubric.md`-ին + tests-ին։ **Ոչ PROVEN․** անկախ design eval դեռ չի վազել։ Հաջորդ slice՝ L2 LLM-graded design eval (Block 2)։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — warehouse/lake/lakehouse/mesh selections, dimensional / Data-Vault / 3NF models + grain, data contracts + schema-evolution rules, MDM/golden-record rulebooks, governance + decision-rights maps, medallion layering, team-maturity/coaching plans. / store selection, dimensional model, data contract, MDM rulebook, governance map, medallion, maturity plan։
2. **Inputs** — workloads + consumers · data domains · SLAs · org/ownership context · existing platform · governance requirements. / workload+consumer · domain · SLA · org · platform · governance։
3. **Evidence** — the decision matrix scores options against stated criteria · grain declared · contract specifies schema + evolution mode · MDM survivorship rules explicit · trade-offs recorded. / decision matrix · grain · contract · MDM survivorship · trade-offs։
4. **Verification gate** — criteria stated before the choice · trade-off record present · contract testable · governance decision-rights unambiguous · review against `domain-rubric.md`. / criteria նախ · trade-off · contract testable · decision-rights · review։
5. **GREEN** — the recommendation is scored against explicit criteria with a trade-off record, contract/grain/MDM rules are testable, reviewed independently (L18). / criteria-scored, trade-off, testable rules, independent review։
6. **YELLOW** — decision made but the trade-off record or the alternative scoring is missing. / որոշում առանց trade-off record-ի կամ alternative-ի։
7. **RED** — a store/model choice with no criteria or trade-offs · a data contract with no evolution mode · MDM with no survivorship rule · governance with ambiguous ownership. / choice առանց criteria · contract առանց evolution · MDM առանց survivorship · ambiguous ownership։
8. **Approval-required (D0)** — adopting an architecture standard · promoting a contract to org-wide. Gev-gated. / architecture standard · org-wide contract։ Gev-gated։
9. **Refusal / boundary** — no architecture verdict without criteria + trade-offs · route pipeline build to `data-engineering-pipelines`, role/hiring to `operating-data-roles`. / ոչ verdict առանց criteria/trade-off · dispatch build/role։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (store-selection/modeling/contract prompts) + `tests/red-team-prompts.md` (no-criteria-choice + evolution-less-contract traps). Prompts written; **not yet RUN** through an independent grader — that RUN is the next proof slice.
