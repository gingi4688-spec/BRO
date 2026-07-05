# analysis-primary — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: PROVEN (graded-eval, DC-002 · 2026-07-05).** An independent, blind, adversarial grader scored every `domain-rubric.md` dimension ≥4 (5-senior bar), re-derived the arithmetic, found no fabrication, and confirmed every safety/UPL/HR/dual-use gate held (DC-002 · C1 clean). Producer/grader separated (L18); session-orchestrated MEASURED evidence (L17), NOT an external human audit or a runtime slice. Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` + `skills/CONTRACT_MATRIX.md`. Graded-eval-PROVEN (distinct from the runtime-PROVEN reference adapters); a runtime domain slice can upgrade it later (optional).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ PROVEN (graded-eval, DC-002 · 2026-07-05)։** Անկախ blind adversarial grader-ը գնահատեց `domain-rubric.md`-ի ամեն dimension ≥4 (5-senior), ինքը վերահաշվեց arithmetic-ը, չգտավ fabrication, ու հաստատեց բոլոր safety/UPL/HR/dual-use gate-երը (DC-002 · C1 clean)։ Producer/grader բաժանված (L18)․ session-orchestrated ՉԱՓՎԱԾ evidence (L17), ՈՉ արտաքին human audit կամ runtime slice։ Evidence՝ `memory/_evidence/DEEPCHECK_EVIDENCE.md`։

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
