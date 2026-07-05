# UI SMOKE EVIDENCE — L3 runtime Playwright/axe runs / L3 runtime UI smoke evidence

> **EN:** Append-only record of REAL UI runtime smoke runs (Playwright render × states × viewports + axe a11y +
> keyboard + screenshots). `tools/checks/bro-ui-smoke.ps1` reads the LAST `## UI SMOKE RUN` block and reports its
> recorded verdict — it reports this evidence, it never invents it (L18). GREEN requires all tests PASS + axe 0
> serious/critical, fresh. The smoke sandbox lives in a scratchpad (not committed — same pattern as the original
> UISLICE-001 external sandbox); this file is the durable record.
>
> **HY:** REAL UI runtime smoke run-երի append-only գրառում (Playwright render × state × viewport + axe + keyboard +
> screenshot)։ `bro-ui-smoke.ps1`-ը կարդում է վերջին `## UI SMOKE RUN` block-ը ու հաղորդում — կարդում է, երբեք չի
> հորինում (L18)։ GREEN = բոլոր test PASS + axe 0 serious, թարմ։ Sandbox-ը scratchpad-ում է (ոչ committed)։

## UI SMOKE RUN — US-001
- date: 2026-07-05
- tests: 13
- PASS: 13
- FAIL: 0
- axe_serious: 0
- viewports: 2 (mobile 375×812, desktop 1280×800)
- states: 6 (data, loading, empty, error, no-permission, partial)
- verdict: GREEN
- recipe: render assertion per state × viewport + a real `@axe-core/playwright` scan (0 serious/critical asserted) + a keyboard test (Tab→focus Refresh, Enter→activate) + a screenshot per case.
- toolchain: node v22.22.3 · @playwright/test 1.61.1 · @axe-core/playwright 4.12.1 · chromium (Desktop Chrome device).
- result: `13 passed (16.8s)` — Playwright JSON report stats: expected=13, unexpected=0, flaky=0, skipped=0. 37 screenshots captured.
- artifacts (scratchpad sandbox, not committed): scratchpad/ui-smoke/ — index.html, smoke.spec.js, playwright.config.js, smoke-report.json (26 KB), test-results/**/*.png (37 screenshots).
- independence: a real Chromium runtime exercised the actual page + axe engine; evidence is the browser's own output (exit code + JSON report + screenshots), not the author's say-so (L18).
- note: this is a MINIMAL smoke reusing the proven UI recipe on a self-contained page — it exercises the smoke automation end-to-end with real runtime evidence. It complements (does not replace) UISLICE-001, the full Next.js reference slice.
