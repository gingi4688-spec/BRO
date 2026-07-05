# mobile-engineering — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: DECLARED.** Contract complete and anchored to this skill's `domain-rubric.md` + `tests/`; mobile logic inherits the **PROVEN Code adapter** (CODESLICE-001) pattern. **Not PROVEN:** not itself exercised on a slice with independent runtime evidence (L15/L18). Next proof slice: reuse the Code adapter on a mobile-logic slice (offline-sync reducer red→green + conflict-resolution case).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ DECLARED։** Contract-ը լրիվ է, mobile logic-ը ժառանգում է PROVEN Code adapter-ի pattern-ը։ **Ոչ PROVEN․** ինքը slice-ի վրա չի վազել։ Հաջորդ slice՝ Code adapter-ի reuse offline-sync-ի վրա։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — mobile architecture plans, offline-first sync designs, lifecycle/state-restoration logic, performance-triage reports (cold start, 60fps, ANR), secure-storage/pinning designs, native-vs-cross-platform decisions, staged-rollout/kill-switch plans, localization/RTL. / mobile arch, offline-sync, lifecycle, perf triage, secure storage, native-vs-cross, rollout plan, RTL։
2. **Inputs** — platform target(s) · connectivity model · perf budget · security requirements · store/release constraints · device matrix. / platform · connectivity · perf budget · security · store · device matrix։
3. **Evidence** — sync reducer tested (offline→online converges) · conflict resolution deterministic · frame budget met (16ms) · secure storage verified · rollout has a kill switch. / sync converges · conflict deterministic · 16ms · secure storage · kill switch։
4. **Verification gate** — pure sync/lifecycle logic under tests (Code adapter) · perf measured on-device · security check (no plaintext secrets) · staged-rollout gate. / logic tested · perf measured · security · rollout gate։
5. **GREEN** — the offline-sync/lifecycle logic passes tests, conflicts resolve deterministically, evidence independent of author say-so (L18); device-level perf/security is measured, not asserted. / logic tested, conflict deterministic, perf measured, independent։
6. **YELLOW** — logic tested but on-device perf/security not measured, or rollout lacks a kill switch. / logic tested բայց perf/security չmeasured կամ rollout առանց kill-switch-ի։
7. **RED** — a sync design that loses writes on conflict · secrets in plaintext storage · a "fast" claim with no on-device measurement · a rollout with no kill switch. / sync loses writes · plaintext secret · fast առանց measurement · rollout առանց kill-switch-ի։
8. **Approval-required (D0)** — store submission · production rollout · touching real user data/keys. Gev-gated. / store submit · prod rollout · real user data/keys։ Gev-gated։
9. **Refusal / boundary** — no data-losing sync · no insecure at-rest secrets · no perf/battery claim without measurement. / ոչ data-losing sync · ոչ insecure secret · ոչ perf claim առանց measurement-ի։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (sync/lifecycle/perf prompts) + `tests/red-team-prompts.md` (write-loss + plaintext-secret traps). Prompts written; **not yet RUN** through an independent grader — that RUN is the next proof slice.
