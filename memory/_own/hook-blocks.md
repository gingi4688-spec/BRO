# Hook Blocks (evidence) / Hook-ի block-եր (evidence)

> **EN:** Append-only evidence — every structural-hook block (forbidden-path write, cross-memory read, critical-command-gate, log-append-only). **Tracked `.md` (P0-R2):** `*.log` is gitignored, so this evidence uses `.md` to stay tamper-evident in Git history. The hooks themselves are installed in **Phase 2** — empty until then.
> **HY:** Append-only evidence — ամ. structural-hook-ի block։ **Tracked `.md` (P0-R2):** `*.log`-ը gitignored է, ուստի այս evidence-ը `.md` է՝ Git-ում tamper-evident մնալու։ Hook-երը install են **Phase 2**-ում — մինչ այդ դատարկ։

<!-- block entries appended below by the append-only script; do not hand-edit (D7/§13A) -->

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T07:54:41+04:00
actor: hook
session_id: P2TEST
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\bro\memory\PROJECT_MEMORY.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into another project memory (cross-project, B4/L8)
files_changed: none
```

## BLOCK - log-append-only-guard
```txt
timestamp: 2026-06-29T07:54:42+04:00
actor: hook
session_id: P2TEST
action: LOG_EDIT_BLOCKED
target: C:\Users\Admin\Desktop\Bro\memory\_own\audit-log.md
source_command: Edit tool
authority: hook
result: BLOCKED
reason: evidence logs are append-only (use tools/bro-log.ps1); edit/delete requires explicit Gev command
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T07:54:43+04:00
actor: hook
session_id: P2TEST
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\memory\SECRET.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: cross-project memory read forbidden (B4/L8); a Bro reads only its own project's memory
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-06-29T07:54:44+04:00
actor: hook
session_id: P2TEST
action: CRITICAL_COMMAND_BLOCKED
target: git push origin main
source_command: Bash tool
authority: hook
result: BLOCKED
reason: git push (push = Gev-gated critical action, §8A) requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T07:54:46+04:00
actor: hook
session_id: P2TEST
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\bro\memory\PROJECT_MEMORY.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into another project memory (cross-project, B4/L8)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-06-29T08:04:15+04:00
actor: hook
session_id: 491f71cd-7f98-4db3-961f-5d814326a60c
action: CRITICAL_COMMAND_BLOCKED
target: cd "C:/Users/Admin/Desktop/Bro"
echo "=== [1] DOCTOR (Phase 3) ==="
pwsh -NoProfile -Command "& ./tools/bro-doctor.ps1 | Select-Object -Last 2; 'doctor exit=' +
source_command: Bash tool
authority: hook
result: BLOCKED
reason: critical SuperBro script invocation requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```
