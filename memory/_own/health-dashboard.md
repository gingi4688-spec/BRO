# Health Dashboard (snapshot) / Health Dashboard (snapshot)

> **EN:** Generated read-only snapshot (NOT a live service, §2). Source: tools/bro-health.ps1 (runs bro-doctor + bro-audit, read-only).
> **HY:** Գեներացված read-only snapshot (ոչ live service, §2)։ Աղբյուր՝ tools/bro-health.ps1 (bro-doctor + bro-audit, read-only)։

```txt
last_run: 2026-06-29T12:11:07+04:00
phase:    ep-rollout-beast-corrected
doctor:   RESULT: YELLOW  (problems=0, warnings=1) (exit=1)
audit:    RESULT: GREEN  (problems=0, warnings=0)
authority: current (verify-only; no passphrase prompt)
enforcement: 5 structural hooks installed in .claude/settings.json (forbidden-path-write, cross-memory-read,
             critical-command-gate, log-append-only, SessionStart preflight); evidence logs append-only.
projects:
  project[EP]: RESULT: GREEN  (problems=0, warnings=0) (exit=0, registry-status=INSTALLED, consumer-only L10)
  project[DB]: RESULT: GREEN  (problems=0, warnings=0) (exit=0, registry-status=INSTALLED, consumer-only L10)
scope:    SuperBro factory GREEN; registered Project Bro(s) INSTALLED + isolated + consumer-only (L10);
          Desktop\EP\memory untouched; no second project; no adopt/migrate/mirror; no release re-cut; no push.
```
