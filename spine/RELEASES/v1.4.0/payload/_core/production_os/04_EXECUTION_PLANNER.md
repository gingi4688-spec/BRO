# production_os / 04 — EXECUTION PLANNER / ԿԱՏԱՐՄԱՆ ՊԼԱՆԱՎՈՐՈՂ

> **EN:** Step 5. Turn the winning solution into a concrete, checkable execution package (L14). This is the "road to the destination" — without it, the recommendation is incomplete work. **HY:** 5-րդ քայլ։ Հաղթող լուծումը դարձրու կոնկրետ, ստուգելի կատարման փաթեթ (L14)։ Սա «ճանապարհն է դեպի հասցեն». առանց դրա recommendation-ը թերի է։

## 1. The execution package / Կատարման փաթեթ (L14)

Every result-task carries all of:

1. **Target outcome** — the exact end state. / ճշգրիտ վերջնավիճակ։
2. **Steps** — ordered, concrete actions. / քայլեր ըստ հերթի։
3. **Files / artifacts / changes** — the exact paths to create or modify. / ճշգրիտ path-եր։
4. **Commands** — the literal commands to run (build/test/lint/etc.). / գործարկվող հրամաններ։
5. **Verification method** — how each success criterion is checked (→ Verifier). / ինչպես է ստուգվում ամեն criterion։
6. **Success criteria** — the pass conditions, in advance. / pass պայմանները՝ նախապես։
7. **Risks + rollback** — what could go wrong and how to undo it. / ռիսկ + rollback։
8. **Approval gate** — which steps need Gev (D0): push · delete · migrate · release · promote-to-spine · lock · law · cross-project memory · prod creds. / որ քայլերն են Գևի հաստատում պահանջում (D0)։

## 2. Sequencing rules / Հերթականության կանոններ

- **Branch, never main**, for anything touching the repo. / branch, երբեք main։
- **Reversible-first:** build and verify on a branch/sandbox; the irreversible tail (push, spine-seed, release) lands LAST, after GREEN. / reversible-first. անշրջելի պոչը՝ վերջում, GREEN-ից հետո։
- **No step marked done without its check** (L16). / ոչ մի քայլ done առանց իր check-ի (L16)։

## 3. If execution is blocked / Եթե կատարումը blocked է

If D0, access, missing files, or safety block direct execution, still produce the COMPLETE package and mark exactly what needs Gev's approval — never downgrade to bare advice (L14). / Եթե blocked է, միևնույն է արտադրիր ԼՐԻՎ փաթեթը ու նշիր ինչ է պահանջում Գևի հաստատում — երբեք մի իջեցրու մերկ խորհրդի (L14)։

Output → Executor ([`05_EXECUTOR.md`](05_EXECUTOR.md)) if allowed; else the package returns to Gev as an approval-gated plan. / Output → Executor եթե թույլ է. այլապես փաթեթը վերադառնում է Գևին որպես approval-gated plan։
