# production_os / checks — CAPABILITY CHECKS, NOT FILE-PRESENCE / ԿԱՐՈՂՈՒԹՅԱՆ ՍՏՈՒԳՈՒՄ, ՈՉ ՖԱՅԼ-PRESENCE

> **EN:** The check layer exists to REPLACE file-presence "GREEN" with real capability checks (L18). A check that only confirms a file exists proves nothing and may never issue GREEN. **HY:** Check շերտը գոյություն ունի, որ ՓՈԽԱՐԻՆԻ ֆայլ-presence «GREEN»-ը իրական capability check-ով (L18)։ Check, որ միայն հաստատում է ֆայլի գոյությունը, ոչինչ չի ապացուցում ու երբեք GREEN չի տալիս։

## Principle / Սկզբունք

| Instead of (file-presence) | Do (capability) |
|---|---|
| "does `page.tsx` exist?" | render it in a running app + states + viewports + keyboard + axe |
| "does the test file exist?" | RUN the tests, observe pass/fail |
| "does the contract exist?" | run its eval cases (pass/fail/edge) |
| "does the ledger exist?" | check it has a real, labeled entry for the task |

## The two check families / Երկու check ընտանիք

- **Quality gate** (organ 10, → [`08_FINAL_REPORT.md`](../08_FINAL_REPORT.md)): serious task → full structure + labels + freshness; simple → short. Applied to every production report. / quality gate՝ serious → full struct, simple → կարճ։
- **Capability check** (per artifact): the artifact-specific GREEN recipe. UI's is PROVEN and wired: [`ui/verification/UI_VERIFICATION_CHECKLIST.md`](../ui/verification/UI_VERIFICATION_CHECKLIST.md) (tsc + eslint + build + Playwright + axe + controlled-failure). **Code's is now PROVEN and wired** ([`code/verification/CODE_VERIFICATION_CHECKLIST.md`](../code/verification/CODE_VERIFICATION_CHECKLIST.md): tsc + eslint + test + build + red→green + controlled-failure). Research/audit/finance/agent recipes are DECLARED until each earns its slice. / capability check՝ artifact-ի GREEN recipe. UI-ինն ու Code-ինը PROVEN ու wired են. մնացածը DECLARED։

## Status honesty / Կարգավիճակի ազնվություն (L15/L18)

- **UI capability check = PROVEN & runnable** (the Playwright/axe recipe ran 23/23, axe 0 serious). / UI check = PROVEN ու runnable։
- **A generic `capability_check.py` / `run_real_evals.py` harness = DECLARED** — a real, tested harness is a follow-up; shipping an untested script as a "capability gate" would itself be the fake-GREEN this layer exists to kill. Honest label now, PROVEN when it runs. / generic harness-ը DECLARED է. չտest-ված script որպես gate թողարկելը հենց fake-GREEN-ն է։
- **Structural gate stays:** `tools/bro-beast-check.ps1` + `bro-doctor` + `bro-audit` remain the wired structural/governance checks; this layer ADDS the capability dimension on top, never replaces the isolation/D0 checks. / structural gate-ը մնում է. այս շերտը ԱՎԵԼԱՑՆՈՒՄ է capability-ն վրայից։
