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

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T08:28:19+04:00
actor: hook
session_id: R1
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\bro\memory\PROJECT_MEMORY.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into another project memory (cross-project, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T08:28:20+04:00
actor: hook
session_id: R1
action: WRITE_BLOCKED
target: C:\Users\Admin\.claude\projects\c--Users-Admin-Desktop-EP\memory\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write outside BRO_HOME (clean-build zero-touch)
files_changed: none
```

## BLOCK - log-append-only-guard
```txt
timestamp: 2026-06-29T08:28:21+04:00
actor: hook
session_id: R1
action: LOG_EDIT_BLOCKED
target: C:\Users\Admin\Desktop\Bro\memory\_own\audit-log.md
source_command: Edit tool
authority: hook
result: BLOCKED
reason: evidence logs are append-only (use tools/bro-log.ps1); edit/delete requires explicit Gev command
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-06-29T08:28:21+04:00
actor: hook
session_id: R1
action: CRITICAL_COMMAND_BLOCKED
target: git push origin main
source_command: Bash tool
authority: hook
result: BLOCKED
reason: git push (push = Gev-gated critical action, §8A) requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-06-29T08:28:22+04:00
actor: hook
session_id: R1
action: CRITICAL_COMMAND_BLOCKED
target: pwsh -NoProfile -File ./tools/bro-release.ps1 -Version v1
source_command: Bash tool
authority: hook
result: BLOCKED
reason: critical SuperBro script execution requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:11:49+04:00
actor: hook
session_id: G1
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\bro\memory\PROJECT_MEMORY.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into another project memory (cross-project, B4/L8)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T09:11:49+04:00
actor: hook
session_id: G1
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\memory\SECRET.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: cross-project memory read forbidden (B4/L8); a Bro reads only its own project's memory
files_changed: none
```

## BLOCK - log-append-only-guard
```txt
timestamp: 2026-06-29T09:11:50+04:00
actor: hook
session_id: G1
action: LOG_EDIT_BLOCKED
target: C:\Users\Admin\Desktop\Bro\memory\_own\audit-log.md
source_command: Edit tool
authority: hook
result: BLOCKED
reason: evidence logs are append-only (use tools/bro-log.ps1); edit/delete requires explicit Gev command
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-06-29T09:11:51+04:00
actor: hook
session_id: G1
action: CRITICAL_COMMAND_BLOCKED
target: git push origin main
source_command: Bash tool
authority: hook
result: BLOCKED
reason: git push (push = Gev-gated critical action, §8A) requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-06-29T09:11:54+04:00
actor: hook
session_id: G1
action: CRITICAL_COMMAND_BLOCKED
target: pwsh -NoProfile -File ./tools/bro-release.ps1 -Version v1
source_command: Bash tool
authority: hook
result: BLOCKED
reason: critical SuperBro script execution requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:14:43+04:00
actor: hook
session_id: G2
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\notes.txt
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:14:43+04:00
actor: hook
session_id: G2
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\memory\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:14:44+04:00
actor: hook
session_id: G2
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\bro\memory\seed.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:14:45+04:00
actor: hook
session_id: G2
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:14:46+04:00
actor: hook
session_id: G2
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\memory\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:14:46+04:00
actor: hook
session_id: G2
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\notes.txt
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:14:47+04:00
actor: hook
session_id: G2
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:14:48+04:00
actor: hook
session_id: G1
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\bro\memory\PROJECT_MEMORY.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T09:35:09+04:00
actor: hook
session_id: G7
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\EP\bro\memory\MEMORY.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: SuperBro (own_only) attempted a direct project-memory read of 'ep' (use a sealed mirror; B4/B6)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T09:35:10+04:00
actor: hook
session_id: G7
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\memory\SECRET.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: SuperBro (own_only) attempted a direct project-memory read of 'db' (use a sealed mirror; B4/B6)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T09:35:12+04:00
actor: hook
session_id: G7
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\memory\SECRET.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: project Bro 'ep' attempted to read project 'db' memory (cross-project, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:35:12+04:00
actor: hook
session_id: G7
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\memory\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:35:13+04:00
actor: hook
session_id: G7
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\notes.txt
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:35:14+04:00
actor: hook
session_id: G7
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-06-29T09:58:15+04:00
actor: hook
session_id: G1
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
timestamp: 2026-06-29T09:59:02+04:00
actor: hook
session_id: EP
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T09:59:03+04:00
actor: hook
session_id: EP
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\memory\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T09:59:04+04:00
actor: hook
session_id: EP
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\memory\s.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: SuperBro (own_only) attempted a direct project-memory read of 'db' (use a sealed mirror; B4/B6)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T09:59:05+04:00
actor: hook
session_id: EP
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\EP\bro\memory\MEMORY.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: SuperBro (own_only) attempted a direct project-memory read of 'ep' (use a sealed mirror; B4/B6)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T10:02:19+04:00
actor: hook
session_id: G4
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\HACK\bro\evil.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write outside BRO_HOME (clean-build zero-touch)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T10:02:19+04:00
actor: hook
session_id: G4
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\memory\s.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: SuperBro (own_only) attempted a direct project-memory read of 'db' (use a sealed mirror; B4/B6)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T10:04:18+04:00
actor: hook
session_id: EP
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T10:04:19+04:00
actor: hook
session_id: EP
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\memory\s.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: SuperBro (own_only) attempted a direct project-memory read of 'db' (use a sealed mirror; B4/B6)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-06-29T10:04:20+04:00
actor: hook
session_id: G1
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
timestamp: 2026-06-29T10:04:49+04:00
actor: hook
session_id: EP
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - forbidden-path-write-guard
```txt
timestamp: 2026-06-29T10:04:50+04:00
actor: hook
session_id: EP
action: WRITE_BLOCKED
target: C:\Users\Admin\Desktop\EP\memory\x.md
source_command: Write tool
authority: hook
result: BLOCKED
reason: write into a project path outside its registered \bro\ (cross-project / non-bro, B4/L8)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T10:04:51+04:00
actor: hook
session_id: EP
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\DB\bro\memory\s.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: SuperBro (own_only) attempted a direct project-memory read of 'db' (use a sealed mirror; B4/B6)
files_changed: none
```

## BLOCK - cross-memory-read-guard
```txt
timestamp: 2026-06-29T10:04:52+04:00
actor: hook
session_id: EP
action: CROSS_MEMORY_READ_BLOCKED
target: C:\Users\Admin\Desktop\EP\bro\memory\MEMORY.md
source_command: Read tool
authority: hook
result: BLOCKED
reason: SuperBro (own_only) attempted a direct project-memory read of 'ep' (use a sealed mirror; B4/B6)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-06-29T10:04:53+04:00
actor: hook
session_id: G1
action: CRITICAL_COMMAND_BLOCKED
target: git push origin main
source_command: Bash tool
authority: hook
result: BLOCKED
reason: git push (push = Gev-gated critical action, §8A) requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - log-append-only-guard
```txt
timestamp: 2026-06-29T10:11:19+04:00
actor: hook
session_id: n/a
action: LOG_EDIT_BLOCKED
target: C:\Users\Admin\Desktop\Bro\memory\_own\audit-log.md
source_command: Edit tool
authority: hook
result: BLOCKED
reason: evidence logs are append-only (use tools/bro-log.ps1); edit/delete requires explicit Gev command
files_changed: none
```

## BLOCK - log-append-only-guard
```txt
timestamp: 2026-06-29T10:12:10+04:00
actor: hook
session_id: n/a
action: LOG_EDIT_BLOCKED
target: C:\Users\Admin\Desktop\Bro\memory\_own\audit-log.md
source_command: Edit tool
authority: hook
result: BLOCKED
reason: evidence logs are append-only (use tools/bro-log.ps1); edit/delete requires explicit Gev command
files_changed: none
```

## BLOCK - log-append-only-guard
```txt
timestamp: 2026-06-29T10:12:20+04:00
actor: hook
session_id: n/a
action: LOG_EDIT_BLOCKED
target: C:\Users\Admin\Desktop\Bro\memory\_own\audit-log.md
source_command: Edit tool
authority: hook
result: BLOCKED
reason: evidence logs are append-only (use tools/bro-log.ps1); edit/delete requires explicit Gev command
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-07-01T03:42:05+04:00
actor: hook
session_id: n/a
action: CRITICAL_COMMAND_BLOCKED
target: pwsh -NoProfile -File tools/bro-new-project.ps1 -ProjectId X -Execute -Yes
source_command: Bash tool
authority: hook
result: BLOCKED
reason: critical SuperBro script execution requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-07-01T03:42:06+04:00
actor: hook
session_id: n/a
action: CRITICAL_COMMAND_BLOCKED
target: pwsh -NoProfile -File tools/bro-wire-root.ps1 -ProjectId EP -Execute -Yes
source_command: Bash tool
authority: hook
result: BLOCKED
reason: critical SuperBro script execution requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-07-01T03:42:07+04:00
actor: hook
session_id: n/a
action: CRITICAL_COMMAND_BLOCKED
target: pwsh -NoProfile -File tools/bro-install.ps1 -ProjectId X -Execute -Yes
source_command: Bash tool
authority: hook
result: BLOCKED
reason: critical SuperBro script execution requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-07-01T03:42:08+04:00
actor: hook
session_id: n/a
action: CRITICAL_COMMAND_BLOCKED
target: git push origin main
source_command: Bash tool
authority: hook
result: BLOCKED
reason: git push (push = Gev-gated critical action, §8A) requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-07-02T08:35:16+04:00
actor: hook
session_id: dba8cfdb-0dfe-430e-a651-0e516b9b7d67
action: CRITICAL_COMMAND_BLOCKED
target: cd "c:/Users/Admin/Desktop/Bro" && git push origin main 2>&1 && echo "" && echo "== confirm pushed ==" && git status -sb | head -1
source_command: Bash tool
authority: hook
result: BLOCKED
reason: git push (push = Gev-gated critical action, §8A) requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-07-02T12:15:25+04:00
actor: hook
session_id: dba8cfdb-0dfe-430e-a651-0e516b9b7d67
action: CRITICAL_COMMAND_BLOCKED
target: cd "c:\Users\Admin\Desktop\Bro"
foreach ($id in 'EP','DB','GAA','SCOUT','MENQ') {
  "===== $id ====="
  pwsh -NoProfile -File tools\bro-wire-root.ps1 -ProjectId
source_command: PowerShell tool
authority: hook
result: BLOCKED
reason: critical SuperBro script execution requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-07-02T18:07:36+04:00
actor: hook
session_id: e97a34e6-04ed-4784-a22c-e743f648ca5c
action: CRITICAL_COMMAND_BLOCKED
target: $sd = "C:\Users\Admin\AppData\Local\Temp\claude\c--Users-Admin-Desktop-Bro\e97a34e6-04ed-4784-a22c-e743f648ca5c\scratchpad\pushurl-test"
Remove-Item -Recurse -F
source_command: PowerShell tool
authority: hook
result: BLOCKED
reason: git push (push = Gev-gated critical action, §8A) requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```

## BLOCK - critical-command-gate
```txt
timestamp: 2026-07-02T18:07:49+04:00
actor: hook
session_id: e97a34e6-04ed-4784-a22c-e743f648ca5c
action: CRITICAL_COMMAND_BLOCKED
target: $sd = "C:\Users\Admin\AppData\Local\Temp\claude\c--Users-Admin-Desktop-Bro\e97a34e6-04ed-4784-a22c-e743f648ca5c\scratchpad\pushurl-test"
Remove-Item -Recurse -F
source_command: PowerShell tool
authority: hook
result: BLOCKED
reason: git push (push = Gev-gated critical action, §8A) requires explicit Gev approval (set BRO_GEV_APPROVED=1)
files_changed: none
```
