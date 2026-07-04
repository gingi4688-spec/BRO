# Telecom, ISP, and Network Operations domain rubric

## English

Use this rubric before finalizing an outage triage, change MOP, route-risk review, PON budget sheet, BNG diagnosis, or SLA report. A score of 5 requires the mechanism, the evidence, and a checkable domain artifact — not vocabulary.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Triage order | Random checks; jumps to app layer. | Some layers named. | Blast radius and last change fixed first; OSI descended in order; lowest alarming layer found before going up; fiber faults never chased at the app layer. |
| Routing safety | Policy pasted, no guards. | Rollback mentioned. | Prefix filters by intent, max-prefix, communities/local-pref/MED, an expected route-count, validation, monitoring, and a tested rollback trigger are all concrete; leak and blackhole are designed out. |
| Access network | Customer device blamed. | Light checked. | OLT/ONU Rx read before dispatch; per-element loss summed against the class budget (B+ = 28 dB); shared-plant vs single-ONT distinguished; rogue ONU and non-standard 1:128 split flagged. |
| Subscriber & CPE edge | Core blamed for a session fault. | PPPoE/IPoE named. | PPPoE vs IPoE identified, RADIUS exchange traced (Accept/Reject/accounting), CoA/Disconnect used for live policy, and TR-069/TR-369 firmware staged (canary → rings → halt-on-failure with rollback). |
| SLA & mediation | Availability vague; CDRs rated raw. | Downtime listed. | Availability/MTTR/latency/loss/jitter computed with stated exclusions (99.9% ≈ 43.2 min); mediation dedups/normalizes before rating, handles TAP3 for roaming, and picks OCS (live balance) vs batch by requirement. |

## Հայերեն

Այս rubric-ը կիրառիր outage triage, change MOP, route-risk review, PON budget sheet, BNG diagnosis կամ SLA report վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և domain-ին հատուկ ստուգելի artifact — ոչ vocabulary։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Triage order | Random check-եր. ցատկում է app layer։ | Որոշ layer նշված է։ | Blast radius-ն ու last change-ը նախ ֆիքսված. OSI-ն հերթով իջեցված. ամենացածր alarm-ող շերտը գտնված մինչև վեր գնալը. fiber fault-երը երբեք app layer-ում չհետապնդված։ |
| Routing safety | Policy pasted, առանց guard-ի։ | Rollback նշված է։ | Prefix filter ըստ intent-ի, max-prefix, communities/local-pref/MED, expected route-count, validation, monitoring և ստուգված rollback trigger՝ բոլորը կոնկրետ. leak-ն ու blackhole-ը design-out արված։ |
| Access network | Customer device-ն է մեղադրվում։ | Light-ը checked է։ | OLT/ONU Rx-ը կարդացված dispatch-ից առաջ. per-element loss-ը գումարված class budget-ի դեմ (B+ = 28 dB). shared-plant ընդդեմ single-ONT տարբերակված. rogue ONU-ն և ոչ-standard 1:128 split-ը flag-ված։ |
| Subscriber & CPE edge | Core-ն մեղադրված session fault-ի համար։ | PPPoE/IPoE նշված է։ | PPPoE ընդդեմ IPoE նույնականացված, RADIUS exchange trace-ված (Accept/Reject/accounting), CoA/Disconnect օգտագործված live policy-ի համար, և TR-069/TR-369 firmware staged (canary → ring-եր → halt-on-failure՝ rollback-ով)։ |
| SLA & mediation | Availability-ն vague է. CDR-ները raw rate-ված։ | Downtime listed է։ | Availability/MTTR/latency/loss/jitter հաշված՝ նշված exclusion-ներով (99.9% ≈ 43.2 min). mediation-ը dedup/normalize է անում rating-ից առաջ, handle է անում TAP3 roaming-ի համար, և ընտրում OCS (live balance) ընդդեմ batch-ի՝ ըստ պահանջի։ |
