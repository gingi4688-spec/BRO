# auditing — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: DECLARED.** Contract complete and anchored to this skill's `domain-rubric.md` + `tests/`. **Not PROVEN:** no independent audit-eval has been RUN through a grader (L15/L18). Next proof slice: an L2 LLM-graded audit eval (criteria-first + completeness + severity calibration cases) (Block 2).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ DECLARED։** Contract-ը լրիվ է, խարսխված `domain-rubric.md`-ին + tests-ին։ **Ոչ PROVEN․** անկախ audit-eval դեռ չի վազել grader-ով (L15/L18)։ Հաջորդ ապացույցի slice՝ L2 LLM-graded audit eval (Block 2)։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — audit reports, findings (5 C's), criteria maps, evidence logs, sampling plans, severity-calibrated finding registers. / audit report, finding (5 C's), criteria map, evidence log, sampling plan, severity register։
2. **Inputs** — the subject under audit · the DEFINED criteria of "good" · scope/period · risk + materiality · access to evidence. / subject · criteria · scope · risk/materiality · evidence access։
3. **Evidence** — sufficient + appropriate evidence per finding · criteria stated first · independence held · design-vs-operating effectiveness distinguished · completeness (nothing uncovered). / evidence ամեն finding-ի · criteria նախ · independence · design-vs-operating · completeness։
4. **Verification gate** — criteria-first · risk/materiality set · sampling justified · each finding evidence-backed · severity calibrated · root cause · reasonable-not-absolute assurance. (`domain-rubric.md`.) / criteria · sampling · evidence · severity · root cause · reasonable assurance։
5. **GREEN** — every finding maps to evidence against a stated criterion, coverage is complete (completeness law), severities are calibrated, and the assessment is independent of the producer (L18). / ամեն finding→evidence→criteria, complete coverage, calibrated severity, independent։
6. **YELLOW** — audit run but a coverage area unsampled, or a finding lacks a criterion/evidence anchor. / coverage-gap կամ finding առանց criteria/evidence։
7. **RED** — a finding with no evidence · criteria invented after the fact · self-review passed off as independent · a gap silently uncovered. / finding առանց evidence · criteria հետո հորինված · self-review որպես independent · լուռ gap։
8. **Approval-required (D0)** — issuing an audit verdict that gates a release/lock/promote is Gev-gated (the verdict informs; the action is Gev's). / verdict, որ gate է release/lock/promote՝ Gev-gated։
9. **Refusal / boundary** — no opinion without evidence · no absolute assurance claimed · dispatch domain criteria to the owning skill, don't fabricate them · no "clean" on unsampled scope. / ոչ opinion առանց evidence · ոչ absolute assurance · dispatch criteria · ոչ «clean» անstampled scope-ի վրա։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (criteria-first audit prompts) + `tests/red-team-prompts.md` (finding-without-evidence + coverage-gap traps). Prompts written; **not yet RUN** through an independent grader — that RUN is the next proof slice.
