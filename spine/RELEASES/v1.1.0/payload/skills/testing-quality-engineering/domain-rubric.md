# Testing and Quality Engineering domain rubric

## English

Use this rubric before finalizing a test strategy, flaky-test triage, contract-test plan, quality gate, or release-confidence report. A score of 5 requires the mechanism, evidence, and a checkable domain artifact — not vocabulary, not a coverage percentage.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Risk coverage | Counts tests. | Layers named. | Each feared failure is mapped to the cheapest catching layer (unit/property/integration/contract/E2E/fuzz) with a rationale; the pyramid is not inverted into all-E2E. |
| Signal quality | Flakes reran and ignored. | Retries added. | Flake source, quarantine, owner, and removal condition are explicit; no rerun-as-fix; destructive fixtures assert a disposable target before any destroy. |
| Mechanism depth | Framework names only. | Some examples. | Property invariants, fuzzing, mutation score on critical modules, and consumer-driven contracts are used where they fit; mocking is at boundaries, not internals. |
| Release gate | Manual "looks good." | A CI gate exists. | The gate ties tests, coverage gaps, mutation/contract results, and a named blocking criterion (failing critical test / contract break / mutation drop) it can enforce. |
| Developer usability | Tests are slow and painful. | Some fixtures. | Fast local path, deterministic data (injected clock/seed), boundary-only mocks, and failure messages that point to the repair. |

## Հայերեն

Այս rubric-ը կիրառիր test strategy, flaky-test triage, contract-test plan, quality gate կամ release-confidence report-ը վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և domain-ին հատուկ ստուգելի artifact — ոչ vocabulary, ոչ coverage percentage։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Risk coverage | Test count է հաշվում։ | Layer-երը նշված են։ | Ամեն վախեցող ձախողում կապված է ամենաէժան բռնող layer-ին (unit/property/integration/contract/E2E/fuzz) rationale-ով. pyramid-ը շրջված չէ all-E2E-ի։ |
| Signal quality | Flake-երը rerun ու անտեսված են։ | Retry է ավելացված։ | Flake source-ը, quarantine-ը, owner-ը և removal condition-ը բացահայտ են. ոչ rerun-as-fix. destructive fixture-ները assert են անում disposable target մինչ ցանկացած destroy։ |
| Mechanism depth | Միայն framework name-եր են։ | Որոշ example կա։ | Property invariant-ները, fuzzing-ը, mutation score-ը critical module-ների վրա և consumer-driven contract-ները կիրառված են ըստ տեղին. mocking-ը boundary-ի մոտ է, ոչ internal-ների։ |
| Release gate | Manual «լավ տեսք ունի»։ | CI gate կա։ | Gate-ը կապում է test-երը, coverage gap-ը, mutation/contract result-ը և անվանված block-ի criterion (fail-վող critical test / contract break / mutation-ի անկում), որ կարող է enforce անել։ |
| Developer usability | Test-երը դանդաղ ու painful են։ | Որոշ fixture կա։ | Fast local path, deterministic data (injected clock/seed), միայն-boundary mock, և failure message-ներ, որ ցույց են տալիս repair-ը։ |
