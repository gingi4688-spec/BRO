# BRO_HOME authority log / BRO_HOME իշխանության log

> Append-only evidence log. Real system timestamps only. **NO passphrase, NO secret values are ever recorded here.**
> Super Bro own-memory (`memory/_own/`) — operational evidence, NOT project memory.

---

## Entry 1 — BRO_HOME_PASSPHRASE_CONFIGURED

```txt
timestamp: 2026-06-29T04:43:09+04:00
event: BRO_HOME_PASSPHRASE_CONFIGURED
actor: Bro
approved_by: Gev
bro_home: C:\Users\Admin\Desktop\Bro
machine_name: DESKTOP-3SNK3IJ
method: first_run_yes_plus_passphrase
passphrase_source: C:\Users\Admin\Desktop\pwd.txt  (read in place, first line; NOT printed, NOT logged, NOT copied into repo)
passphrase_stored: hash_only — salted PBKDF2-HMAC-SHA256 (100000 iterations). Verifier value is held ONLY in an
                   IGNORED local secrets file, never committed: memory/_own/secrets/bro-home.verifier.json
verification: round-trip PASS (the stored verifier validates the passphrase)
result: SUCCESS — verifier configured
files_changed:
  - bro.home.json  (local authority state, pointer-only — GITIGNORED, never committed)
  - memory/_own/secrets/bro-home.verifier.json  (verifier — GITIGNORED, never committed)
  - memory/_own/authority-log.md  (this committed, sanitized entry)
notes: passphrase never appeared in any output, log, or the repo — only a salted verifier is stored, in an ignored
       local file. This entry does NOT authorize build, push, migration, or any delete beyond Gev-approved cleanup.
```

## Entry 2 — BRO_HOME secret file deleted

```txt
timestamp: 2026-06-29T04:56:20+04:00
event: BRO_HOME_SECRET_FILE_DELETED
actor: Bro
approved_by: Gev (explicit)
target: C:\Users\Admin\Desktop\pwd.txt (temporary secret, OUTSIDE git)
preconditions_verified: verifier configured + round-trip PASS; no plaintext stored anywhere; pwd.txt not copied into repo; pwd.txt not tracked; logs expose no passphrase
result: SUCCESS -- pwd.txt deleted
files_changed: C:\Users\Admin\Desktop\pwd.txt (deleted)
notes: verifier remains only in ignored local secrets file; no secret material in any committed file
```
