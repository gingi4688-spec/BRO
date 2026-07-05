# analysis-primary — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: DECLARED.** Contract complete and anchored to this skill's `domain-rubric.md` + `tests/eval-prompts.md` + `tests/red-team-prompts.md`. **Not PROVEN:** no independent reasoning-eval has been RUN through a grader yet (L15/L18). The always-on framing lens is exercised live every session, but a live turn is not an independent evidence artifact. Next proof slice: an L2 LLM-graded reasoning eval (Block 2).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ DECLARED։** Contract-ը լրիվ է ու խարսխված skill-ի `domain-rubric.md`-ին + tests-ին։ **Ոչ PROVEN․** անկախ reasoning-eval դեռ չի վազել grader-ով (L15/L18)։ Հաջորդ ապացույցի slice՝ L2 LLM-graded reasoning eval (Block 2)։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — issue tree, driver decomposition, assumption ledger, Bayesian update, Fermi estimate, decision brief, diagnosis + the dispatch-to-lead-skill call. / issue tree, driver-decompose, assumption ledger, decision brief, diagnosis + dispatch։
2. **Inputs** — the raw question/situation · stakes · constraints · what's known vs assumed. / հարց/իրավիճակ · stakes · constraint · հայտնի-vs-ենթադրյալ։
3. **Evidence** — the framing names the real decision; drivers are decomposed (MECE); each claim carries an L15 label (PROVEN/INFERRED/ASSUMED/UNKNOWN); the dispatched lead skill's output is verified in the running system. / շրջանակը անվանում է իրական որոշումը, driver-ները MECE, ամեն claim L15-պիտակ, արդյունքը verify աշխատող համակարգում։
4. **Verification gate** — decision correctly framed · assumptions surfaced not buried · biases named · dispatch matched the artifact · verify-in-running done. (`domain-rubric.md` 4-lens.) / որոշումը շրջանակված, ենթադրություններ դուրս, bias անվանված, dispatch ճիշտ, verify արած։
5. **GREEN** — the reasoning is checkable (tree/ledger shown), the label discipline holds, and the downstream artifact was verified independently (L18). / reasoning ստուգելի, պիտակ-կարգապահություն, downstream artifact-ը independent verify արած։
6. **YELLOW** — framing produced but a load-bearing assumption stayed unchecked, or dispatch made without verify-in-running. / assumption անստուգ մնաց կամ verify չեղավ։
7. **RED** — ASSUMED/UNKNOWN presented as fact · issue tree not MECE (gaps/overlaps) · confident conclusion off unverified inputs. / ASSUMED որպես փաստ · tree ոչ-MECE · վստահ եզրակացություն անստուգ input-ից։
8. **Approval-required (D0)** — none of its own; it dispatches, and any critical action of the lead skill stays Gev-gated. / սեփականը չկա. dispatch է անում, lead-ի կրիտիկականը Gev-gated։
9. **Refusal / boundary** — no confident answer built on ASSUMED/UNKNOWN dressed as fact; no skipping the framing on high-stakes input to jump to an answer. / ոչ վստահ պատասխան ASSUMED-ի վրա. ոչ շրջանցում բարձր-stakes-ի ժամանակ։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (ambiguous/high-stakes framing prompts) + `tests/red-team-prompts.md` (confident-answer-on-unknowns trap). Prompts written; **not yet RUN** through an independent grader — that RUN is the next proof slice.
