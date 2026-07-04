# FAILURE LEDGER / ՁԱԽՈՂՈՒՄՆԵՐԻ ՄԱՏՅԱՆ

> **EN:** Append-only record of real failures the Verifier caught, and how the Repairer fixed them (L16). Failure is memory, not shame — each entry makes the next build safer. **HY:** Verifier-ի բռնած իրական ձախողումների ու Repairer-ի ուղղումների append-only գրառում (L16)։ Ձախողումը հիշողություն է, ոչ ամոթ։

## FL-001 — Drawer does not close on Escape (CONTROLLED)
- **What failed:** Escape did not close the customer detail drawer.
- **Why:** planted defect — `CONTROLLED_DEFECT_ESC_NOOP=true` swallowed the Base UI `escape-key` close reason (X-button + backdrop still worked).
- **Gate that caught it:** Verifier — Playwright `drawer closes on Escape` timed out on run #1.
- **Fix:** flip the flag to `false`; `handleOpenChange` honors every close reason.
- **Re-verification:** run #2 — test PASSED; focus-restore still passes.
- **Date:** 2026-07-05.

## FL-002 — "Churned" status badge fails WCAG AA contrast (REAL / unplanned)
- **What failed:** axe `color-contrast` (serious) on the destructive badge, 3 states.
- **Why:** kit's soft destructive badge = `#e7000b` on `#fde6e7` = **4.0:1** at 12px (< AA 4.5:1).
- **Gate that caught it:** Verifier — axe dumps `axe/{populated,permission-denied,drawer-open}.json`.
- **Fix:** solid destructive fill — white on `--destructive` = **4.77:1** ≥ AA; semantic red preserved.
- **Re-verification:** run #2 — all 5 axe checks pass, dumps empty `[]`.
- **Date:** 2026-07-05.

> **Lesson recorded (see [`REPAIR_PATTERNS.md`](REPAIR_PATTERNS.md), [`NEVER_REPEAT.md`](NEVER_REPEAT.md)):** FL-002 was NOT planted — an independent Verifier catching an *unplanned* real defect is the proof the gate is capability, not ceremony. / FL-002-ը planted չէր. անկախ Verifier-ի՝ չնախատեսված defect բռնելը gate-ի կարողության ապացույցն է։
