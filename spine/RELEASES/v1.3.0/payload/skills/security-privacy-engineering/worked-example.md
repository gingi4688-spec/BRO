# Security and Privacy Engineering worked examples

## English

### Example A — Threat model (STRIDE) for a multi-tenant billing feature

**Prompt.** A SaaS app lets a customer's admin invite users and grant them billing access. Build a senior threat model.

**Senior answer.** **System & boundaries.** Components: browser (untrusted) → API gateway → app service → billing service → datastore. Trust boundaries: (B1) browser ↔ API (an Internet boundary, every request is attacker-controllable), (B2) app ↔ billing (a privilege boundary — billing is more sensitive), (B3) app ↔ datastore (tenant isolation must hold here). Assets: invitee identity, role grants, invoices/payment data, the audit log itself.

**STRIDE per boundary (with mitigation → detection):**
- **Spoofing (B1)** — stolen session or replayed token impersonates the admin. Mitigation: OIDC auth code + PKCE, MFA required for billing-admin actions, session bound to device/IP signal. Detection: alert on impossible-travel logins and on MFA-bypass attempts.
- **Tampering (B1/B3)** — client tampers the role field to grant itself billing access. Mitigation: role is decided **server-side**; the client value is display-only; the grant endpoint re-checks the actor's permission. Detection: log every role change with actor, target, and before/after.
- **Repudiation** — an admin denies making a grant or viewing billing. Mitigation: append-only audit log of invite, role-change, and billing-view, tamper-evident and shipped off-host. Detection: alert if the audit pipeline stops or gaps.
- **Information disclosure (B3)** — IDOR: `/billing/invoice/{id}` returns another tenant's invoice if id is iterated. Mitigation: **owner/tenant check at the data layer on every invoice read** — the query is scoped to the caller's tenant, not filtered in the client. Detection: alert on a burst of 403s on invoice ids (an enumeration probe).
- **Denial of service (B1)** — invite/grant endpoints are flooded. Mitigation: rate-limit and quota per tenant; idempotent invite. Detection: alert on per-tenant request-rate anomaly.
- **Elevation of privilege (B2)** — a normal user reaches a billing-admin-only function directly. Mitigation: **per-action function-level authz** on the billing endpoints (not a hidden button); least-privilege token audience so an app token cannot call billing-admin. Detection: alert on authz-denial spikes against billing functions.

**Privacy slice.** Invitee email — purpose: deliver the invitation; basis: flag to legal; retained until account deletion or invite expiry, then purged; access logged with a pseudonymous actor id (not the raw email) so the audit log is not a second copy of the PII.

**Residual risk & owners.** Phished admin with MFA fatigue remains a residual risk → owner: identity team, compensating control: number-matching MFA + anomaly alerting. Out of scope here and routed: lawful-basis sufficiency → legal; SOC tuning of these alerts at scale → cybersecurity-operations-soc.

**Why this passes.** It is a *model*, not a checklist: it draws three named trust boundaries (Internet, privilege, tenant-isolation) and runs all six STRIDE classes against them, so the analysis is anchored to where data actually changes privilege. The two highest-impact threats for a multi-tenant billing system — **IDOR/BOLA** (Information disclosure) and **elevation via function-level authz** — are caught explicitly and fixed server-side at the data layer and on the endpoint, with client-side hiding rejected as a non-control. Critically, every mitigation is **paired with a detection** (impossible-travel, role-change log, 403-burst on invoice ids, authz-denial spike), so a bypassed control is observable rather than silent. It separates the privacy slice (purpose, retention, deletion, pseudonymized access log) from the security controls, names a residual risk with an owner and a compensating control instead of pretending risk is zero, and routes the lawful-basis question to legal rather than inventing it.

### Example B — Auth / authorization review of an existing API

**Prompt.** Review this design: "Users log in with our SPA. After login we issue a JWT. The frontend hides admin features for non-admins. The reports API is `GET /api/reports/{reportId}` and returns the report. Tokens don't expire so users stay logged in. We use the OAuth implicit flow for the SPA."

**Senior answer.** This conflates authentication with authorization and has four concrete flaws; here is each one with the fix and how to verify it.

1. **IDOR on `/api/reports/{reportId}` (Information disclosure, high).** The endpoint returns whatever `reportId` is passed if the JWT is valid — but a valid token only proves *authentication*, not that *this user owns that report*. Iterating ids reads other users' reports. **Fix:** add a server-side ownership/tenant check in the query (`WHERE owner_id = :caller AND id = :reportId`), not a post-fetch filter. **Verify live:** log in as user A, request user B's reportId, confirm **403** (not 200, not an empty 200).

2. **Broken function-level authorization (Elevation, high).** "The frontend hides admin features" is display, not authz — a non-admin can call the admin endpoints directly. **Fix:** enforce a per-action role/permission check on every admin/privileged endpoint server-side. **Verify live:** call an admin route with a non-admin token and confirm it is denied.

3. **Non-expiring tokens (Spoofing/replay, high).** A token that never expires cannot be revoked in practice; a stolen token is valid forever. **Fix:** short-lived access tokens with refresh-token rotation and a revocation path; bind to the session; expire on logout/credential change. **Verify live:** revoke a session and confirm the old token is rejected.

4. **Implicit flow for a public client (token leakage, high).** Implicit flow returns the token in the URL fragment, exposing it to history, referrers, and injection. **Fix:** move the SPA to **authorization code + PKCE**; validate the redirect URI against an allowlist, carry `state` and `nonce`, and validate the token **audience** so the reports API rejects a token minted for another service. **Verify live:** present a token whose audience is a different service and confirm the reports API rejects it.

**Net.** AuthN was fine; **authZ was the gap** — object-level and function-level checks were missing, the token lifecycle was unsafe, and the flow was the wrong grant. Each fix is server-side and each has a live verification (the wrong actor gets a 403), so "documented as enabled" is not accepted as done. Detection to add alongside: alert on 403 bursts against report ids (IDOR probing) and on admin-endpoint authz denials.

**Why this passes.** It refuses to treat a valid login as authorization and names the exact failure mode by class — IDOR (object-level), broken function-level authz, unsafe token lifecycle, and the wrong OAuth grant — instead of a vague "tighten security." Every fix is enforced **server-side at the data layer or the endpoint**, and client-side hiding is explicitly rejected as a non-control. Each item ends with a **live verification** (wrong-actor 403, non-admin denied, revoked-token rejected, wrong-audience rejected), holding the "verify in the running system, not in the doc" line, and it adds the matching detection so the abuse path is observable. It invents no CVE or vendor claim and keeps the dual-use boundary — it reviews and hardens the defender's own API, it does not write the attack.

### Example C — supply-chain control plan

**Prompt.** After a dependency-confusion scare, leadership asks: "how do we know our build isn't shipping a compromised dependency?" Design the supply-chain control plan.

**Senior answer.** You cannot defend what you cannot inventory, and you cannot trust what you cannot verify — so the plan is **inventory → scan → pin → verify provenance → fail the build → isolate**, each a concrete gate, not a policy sentence.

1. **SBOM — inventory everything.** Generate a **Software Bill of Materials** (CycloneDX/SPDX) of direct *and transitive* dependencies at build time, per artifact. You cannot assess a dependency you do not know is there; transitive deps are where the risk hides.
2. **SCA gate — scan, fail the build.** Run **Software Composition Analysis** in CI against known-vulnerable and yanked versions; **fail the build on an unreviewed critical/high** (not a warning that scrolls by). A finding is either remediated (bump) or gets an explicit, time-boxed, owner-signed exception — never a silent pass.
3. **Pin + lockfile — no floating versions.** Pin exact versions with a committed lockfile and hashes; a floating `^` range lets a different artifact enter without a code change. Hashes make the resolved tree reproducible and tamper-evident.
4. **Verify provenance / signatures.** Verify package signatures / provenance attestations (e.g. Sigstore / SLSA provenance) so a swapped package (typosquat, **dependency-confusion**, compromised maintainer/registry) is rejected. For the dependency-confusion class specifically: **scope internal packages** to a private-registry namespace and configure the resolver so an internal name can *never* be silently satisfied by a public package of the same name — the exact hole the scare hit.
5. **Isolate the build + restrict publish.** Build hermetically (no arbitrary egress pulling unpinned things at build time), restrict who/what can publish, and **verify the artifact you ship is the artifact you built** (built digest == deployed digest).
6. **Detection + response.** Alert on a new critical in an already-shipped dependency (the SBOM answers "are we affected by CVE-X?" in minutes) with a rollback/patch path.

Assumption to label: specific tools and any version/CVE are **verify-before-use** against current tooling; the *control structure* (SBOM → SCA-gate → pin → provenance → fail-closed → isolate) is the transferable answer.

**Why this passes.** It answers "how do we know" with a **verifiable control chain**, not a policy: **SBOM** (direct + transitive inventory), an **SCA gate that fails the build** on an unreviewed critical (not a warning), **pinning + lockfile + hashes** (no floating version slips in), and **provenance/signature verification** so a swapped package is rejected — and it targets the specific **dependency-confusion** class by namespacing internal packages so an internal name cannot be satisfied by a public one. It closes the loop with a **hermetic build + publish restriction + built-vs-shipped digest check** and a **detection path** (SBOM answers "are we affected?" fast). Tools/CVEs are marked verify-before-use; the transferable deliverable is the fail-closed control structure — exactly what a copy-ready supply-chain plan is.

## Հայերեն

### Օրինակ A — Threat model (STRIDE) multi-tenant billing feature-ի համար

**Prompt.** SaaS app-ը թույլ է տալիս customer-ի admin-ին user invite անել և billing access տալ։ Կառուցիր senior threat model։

**Senior պատասխան.** **Համակարգ և boundary-ներ.** Component-ներ․ browser (untrusted) → API gateway → app service → billing service → datastore։ Trust boundary-ներ․ (B1) browser ↔ API (Internet boundary, ամեն request attacker-controllable է), (B2) app ↔ billing (privilege boundary — billing-ն ավելի sensitive է), (B3) app ↔ datastore (tenant isolation-ը պետք է այստեղ պահի)։ Asset-ներ․ invitee identity, role grant-եր, invoice/payment data, հենց audit log-ը։

**STRIDE ամեն boundary-ի (mitigation → detection)․**
- **Spoofing (B1)** — գողացված session կամ replay-ված token impersonate է անում admin-ին։ Mitigation․ OIDC auth code + PKCE, MFA պարտադիր billing-admin action-ների համար, session-ը bound device/IP signal-ին։ Detection․ alert impossible-travel login-ի և MFA-bypass փորձի վրա։
- **Tampering (B1/B3)** — client-ը tamper է անում role field-ը՝ ինքն իրեն billing access տալու։ Mitigation․ role-ը որոշվում է **server-side**. client-ի value-ն display-only է. grant endpoint-ը վերստուգում է actor-ի permission-ը։ Detection․ log արա ամեն role change actor-ով, target-ով և before/after-ով։
- **Repudiation** — admin-ը ժխտում է grant անելը կամ billing-ը դիտելը։ Mitigation․ append-only audit log invite-ի, role-change-ի և billing-view-ի, tamper-evident և host-ից դուրս ուղարկված։ Detection․ alert, եթե audit pipeline-ը կանգնում է կամ gap է տալիս։
- **Information disclosure (B3)** — IDOR․ `/billing/invoice/{id}`-ն վերադարձնում է ուրիշ tenant-ի invoice, եթե id-ն iterate-վի։ Mitigation․ **owner/tenant check data layer-ում ամեն invoice read-ի վրա** — query-ն scope-ված է caller-ի tenant-ին, ոչ client-ում filter-ված։ Detection․ alert invoice id-ների վրա 403-ների burst-ի (enumeration probe)։
- **Denial of service (B1)** — invite/grant endpoint-ները flood են լինում։ Mitigation․ rate-limit և quota ամեն tenant-ի. idempotent invite։ Detection․ alert per-tenant request-rate anomaly-ի վրա։
- **Elevation of privilege (B2)** — սովորական user-ը ուղիղ հասնում է billing-admin-only function-ի։ Mitigation․ **per-action function-level authz** billing endpoint-ների վրա (ոչ թաքնված button). least-privilege token audience, որ app token-ը billing-admin չկարողանա կանչել։ Detection․ alert authz-denial spike-ի վրա billing function-ների դեմ։

**Privacy slice.** Invitee email — purpose․ invitation-ը մատուցել. basis․ flag legal-ին. retained մինչև account deletion կամ invite expiry, հետո purged. access logged pseudonymous actor id-ով (ոչ raw email-ով), որ audit log-ը PII-ի երկրորդ copy չլինի։

**Residual risk և owner-ներ.** MFA fatigue-ով phished admin-ը մնում է residual risk → owner․ identity team, compensating control․ number-matching MFA + anomaly alerting։ Այստեղ scope-ից դուրս և ուղղորդված․ lawful-basis-ի բավարարություն → legal. այս alert-ների SOC tuning մեծ scale-ով → cybersecurity-operations-soc։

**Ինչու է անցնում gate-ը.** Սա *model* է, ոչ checklist․ այն գծում է երեք անվանված trust boundary (Internet, privilege, tenant-isolation) և վազեցնում է վեց STRIDE class-ն էլ դրանց դեմ, ուստի վերլուծությունը anchor-ված է այնտեղ, որտեղ data-ն իրականում փոխում է privilege։ Multi-tenant billing system-ի երկու ամենա-high-impact threat-ները — **IDOR/BOLA** (Information disclosure) և **elevation function-level authz-ով** — բռնված են բացահայտ և ուղղված server-side data layer-ում ու endpoint-ի վրա, client-side թաքցնելը մերժված որպես non-control։ Կարևորը՝ ամեն mitigation **զուգված է detection-ի հետ** (impossible-travel, role-change log, invoice id-ների վրա 403-burst, authz-denial spike), ուստի bypass-ված control-ը observable է, ոչ լուռ։ Այն բաժանում է privacy slice-ը (purpose, retention, deletion, pseudonymize-ված access log) security control-ներից, անվանում է residual risk owner-ով և compensating control-ով, քան ձևացնի, թե risk-ը զրո է, և ուղղորդում է lawful-basis-ի հարցը legal-ին, քան հորինի այն։

### Օրինակ B — Auth / authorization review գոյություն ունեցող API-ի

**Prompt.** Review արա այս design-ը․ «User-երը login են անում մեր SPA-ով։ Login-ից հետո JWT ենք issue անում։ Frontend-ը թաքցնում է admin feature-ները non-admin-ների համար։ Reports API-ն `GET /api/reports/{reportId}` է և վերադարձնում է report-ը։ Token-ները չեն expire լինում, որ user-երը logged in մնան։ SPA-ի համար OAuth implicit flow ենք օգտագործում»։

**Senior պատասխան.** Սա շփոթում է authentication-ը authorization-ի հետ և ունի չորս կոնկրետ թերություն. ահա ամեն մեկը fix-ով և ինչպես verify անել։

1. **IDOR `/api/reports/{reportId}`-ի վրա (Information disclosure, high)։** Endpoint-ը վերադարձնում է ինչ `reportId` էլ փոխանցվի, եթե JWT-ն վավեր է — բայց վավեր token-ը միայն *authentication* է ապացուցում, ոչ որ *այս user-ը տիրում է այդ report-ին*։ Id-ները iterate անելը կարդում է ուրիշ user-ների report-ները։ **Fix․** ավելացրու server-side ownership/tenant check query-ում (`WHERE owner_id = :caller AND id = :reportId`), ոչ post-fetch filter։ **Verify live․** login արա որպես user A, հարցրու user B-ի reportId-ն, հաստատիր **403** (ոչ 200, ոչ դատարկ 200)։

2. **Broken function-level authorization (Elevation, high)։** «Frontend-ը թաքցնում է admin feature-ները»-ը display է, ոչ authz — non-admin-ը կարող է ուղիղ կանչել admin endpoint-ները։ **Fix․** enforce արա per-action role/permission check ամեն admin/privileged endpoint-ի վրա server-side։ **Verify live․** կանչիր admin route non-admin token-ով և հաստատիր, որ deny է։

3. **Չ-expire-վող token-ներ (Spoofing/replay, high)։** Token, որ երբեք չի expire լինում, գործնականում չի կարող revoke-վել. գողացված token-ը ընդմիշտ վավեր է։ **Fix․** short-lived access token՝ refresh-token rotation-ով և revocation path-ով. bound session-ին. expire logout/credential change-ին։ **Verify live․** revoke արա session և հաստատիր, որ հին token-ը reject է լինում։

4. **Implicit flow public client-ի համար (token leakage, high)։** Implicit flow-ը token-ը վերադարձնում է URL fragment-ում՝ exposing այն history-ին, referrer-ին և injection-ին։ **Fix․** տեղափոխիր SPA-ն **authorization code + PKCE**. validate արա redirect URI-ն allowlist-ի դեմ, կրիր `state` և `nonce`, և validate արա token **audience**-ը, որ reports API-ն reject անի ուրիշ service-ի համար minted token-ը։ **Verify live․** ներկայացրու token, որի audience-ը ուրիշ service է, և հաստատիր, որ reports API-ն reject է անում։

**Net.** AuthN-ը նորմալ էր. **authZ-ն էր gap-ը** — object-level և function-level check-երը բացակայում էին, token lifecycle-ն unsafe էր, և flow-ը սխալ grant էր։ Ամեն fix server-side է և ամեն մեկն ունի live verification (սխալ actor-ը ստանում է 403), ուստի «documented as enabled»-ը done չի ընդունվում։ Detection ավելացնելու․ alert report id-ների դեմ 403 burst-ի (IDOR probing) և admin-endpoint authz denial-ի վրա։

**Ինչու է անցնում gate-ը.** Այն հրաժարվում է վավեր login-ը authorization համարելուց և անվանում է ստույգ failure mode-ը ըստ class-ի — IDOR (object-level), broken function-level authz, unsafe token lifecycle և սխալ OAuth grant — ոչ թե անորոշ «ամրացրու security-ն»։ Ամեն fix enforce-ված է **server-side data layer-ում կամ endpoint-ի վրա**, և client-side թաքցնելը բացահայտ մերժված է որպես non-control։ Ամեն item-ը ավարտվում է **live verification**-ով (սխալ-actor 403, non-admin deny, revoked-token reject, wrong-audience reject)՝ պահելով «verify running system-ում, ոչ doc-ում» գիծը, և ավելացնում է համապատասխան detection-ը, որ abuse path-ը observable լինի։ Այն ոչ մի CVE կամ vendor claim չի հորինում և պահում է dual-use սահմանը — այն review և harden է անում defender-ի սեփական API-ն, ոչ թե գրում հարձակումը։

### Օրինակ C — supply-chain control plan

**Prompt.** Dependency-confusion վախից հետո leadership-ը հարցնում է․ «ինչպե՞ս ենք իմանում, որ մեր build-ը compromised dependency չի ship անում»։ Նախագծիր supply-chain control plan-ը։

**Senior պատասխան.** Չես կարող պաշտպանել այն, ինչ չես inventory անում, և չես կարող վստահել այն, ինչ չես կարող verify անել — ուստի plan-ը՝ **inventory → scan → pin → verify provenance → fail the build → isolate**, ամեն մեկը կոնկրետ gate, ոչ policy նախադասություն։

1. **SBOM — inventory արա ամեն ինչ.** Generate արա **Software Bill of Materials** (CycloneDX/SPDX) direct *և transitive* dependency-ների, build-time-ին, ամեն artifact-ի։ Չես կարող գնահատել dependency, որ չգիտես կա. transitive dep-երն են, որտեղ ռիսկը թաքնվում է։
2. **SCA gate — scan արա, fail արա build-ը.** Գործարկիր **Software Composition Analysis** CI-ում known-vulnerable ու yanked version-ների դեմ. **fail արա build-ը unreviewed critical/high-ի վրա** (ոչ warning, որ scroll է անում)։ Finding-ը կա՛մ remediate է լինում (bump), կա՛մ ստանում է explicit, time-boxed, owner-signed exception — երբեք silent pass։
3. **Pin + lockfile — ոչ floating version.** Pin արա ճշգրիտ version-ները committed lockfile-ով ու hash-երով. floating `^` range-ը թույլ է տալիս, որ ուրիշ artifact մտնի առանց code փոփոխության։ Hash-երը resolved tree-ն reproducible ու tamper-evident են դարձնում։
4. **Verify արա provenance / signature.** Verify արա package signature / provenance attestation (օր.՝ Sigstore / SLSA provenance), որ swap արված package-ը (typosquat, **dependency-confusion**, compromised maintainer/registry) reject-վի։ Dependency-confusion class-ի համար հատուկ․ **scope արա internal package-ները** private-registry namespace-ի և configure արա resolver-ը, որ internal name-ը *երբեք* լուռ չբավարարվի նույն անունով public package-ով — հենց այն ծակը, որ վախը կպավ։
5. **Isolate արա build-ը + restrict արա publish-ը.** Build արա hermetically (ոչ arbitrary egress, որ build-time-ին unpinned բան է քաշում), restrict արա ով/ինչ կարող է publish անել, և **verify արա, որ ship արածդ artifact-ը build արածդ artifact-ն է** (built digest == deployed digest)։
6. **Detection + response.** Alert արա արդեն-ship-ված dependency-ում նոր critical-ի վրա (SBOM-ը րոպեներում պատասխանում է «ազդված ե՞նք CVE-X-ից»)՝ rollback/patch path-ով։

Label-ելու assumption․ կոնկրետ tool-երն ու ցանկացած version/CVE **verify-before-use** են ընթացիկ tooling-ի դեմ. *control structure*-ը (SBOM → SCA-gate → pin → provenance → fail-closed → isolate) transferable պատասխանն է։

**Ինչու է անցնում gate-ը.** Այն «ինչպե՞ս ենք իմանում»-ին պատասխանում է **verifiable control chain**-ով, ոչ policy-ով․ **SBOM** (direct + transitive inventory), **SCA gate, որ fail է անում build-ը** unreviewed critical-ի վրա (ոչ warning), **pinning + lockfile + hash** (ոչ floating version չի սողոսկում), և **provenance/signature verification**, որ swap արված package reject-վի — և թիրախավորում է կոնկրետ **dependency-confusion** class-ը internal package-ները namespace-ելով, որ internal name-ը public-ով չբավարարվի։ Այն փակում է loop-ը **hermetic build + publish restriction + built-vs-shipped digest check**-ով և **detection path**-ով (SBOM-ը արագ պատասխանում «ազդված ե՞նք»)։ Tool/CVE-ները նշված verify-before-use. transferable deliverable-ը fail-closed control structure-ն է — հենց այն, ինչ copy-ready supply-chain plan-ն է։
