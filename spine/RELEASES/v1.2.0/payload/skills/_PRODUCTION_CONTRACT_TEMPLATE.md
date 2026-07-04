# _PRODUCTION_CONTRACT_TEMPLATE — per-skill / SKILL-Ի PRODUCTION CONTRACT ՁԱԲԼՈՆ

> **EN:** The 10-question contract every skill gets (upgrade, don't add — §8.10). A skill cannot close a task GREEN on good reasoning alone; GREEN needs artifact-specific proof (L18). Copy this to `skills/<skill>/PRODUCTION_CONTRACT.md` and answer all 10 for that skill. **HY:** 10-հարցանի contract, որ ամեն skill ստանում է (upgrade, ոչ ավելացնել — §8.10)։ Skill-ը չի կարող task GREEN փակել մենակ լավ reasoning-ով. GREEN-ը պահանջում է artifact-specific ապացույց (L18)։ Copy արա `skills/<skill>/PRODUCTION_CONTRACT.md` ու պատասխանիր 10-ն էլ։

> **STATUS DISCIPLINE / ԿԱՐԳԱՎԻՃԱԿԻ ԿԱՐԳԱՊԱՀՈՒԹՅՈՒՆ:** the template is proven on the two reference slices (UI, Code) BEFORE being stamped across all 32 — a v0 placeholder in 32 files is the empty-scaffold trap (§8.10). Fill opportunistically, group by group, each labeled PROVEN or DECLARED. / Template-ը ապացուցվում է 2 slice-ով ՄԻՆՉ 32-ի stamp-ը. լցնել opportunistically, ամեն մեկը PROVEN կամ DECLARED պիտակով։

---

## The 10 questions / 10 հարցը

1. **Artifact types produced** — what concrete outputs does this skill make? / ի՞նչ կոնկրետ output է սարքում։
2. **Required inputs** — what must be provided to start? / ի՞նչ input է պետք սկսելու։
3. **Evidence required** — what proves the artifact is right (domain-specific)? / ի՞նչ է ապացուցում artifact-ը (ըստ ոլորտի)։
4. **Verification gate** — the exact checks that run. / ի՞նչ check-եր են վազում։
5. **GREEN** — the pass condition (independent evidence, L18). / GREEN-ի պայմանը (անկախ evidence, L18)։
6. **YELLOW** — builds but a required check missing/blocked. / build, բայց check պակասում/blocked։
7. **RED** — the fail conditions. / ձախողման պայմանները։
8. **Approval-required-when** — the D0-gated actions for this skill. / D0-gated գործողությունները։
9. **Refusal / human-boundary** — what this skill must refuse or route to a human. / ինչ պիտի հրաժարվի/ուղղորդի մարդուն։
10. **Eval cases** — real pass / fail / edge cases. / իրական pass/fail/edge case-եր։

## Group patterns (shared GREEN) / Խմբային pattern-ներ

Core-Brain · **UI (proof slice 1)** · **Code/DevOps/Test/Data/Mobile/ML (proof slice 2)** · Security (authorized-only) · Telecom (diagnostic, no fake certainty) · Product/Business/Finance (labeled assumptions, no invented CAC/LTV) · Legal/People/Comms/Teaching (human-boundary) · Data (validation) · Research (no source → no factual GREEN) · Agent-builder (no empty shell, evals mandatory). Each skill still owns its OWN contract. / Ամեն skill իր contract-ը ունի. խմբերը կիսում են GREEN pattern-ը։
