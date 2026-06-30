# PROJECT_DOCS_SELECTION.md

Project-specific documentation selection file for STANDARD_PROJECT_DOCS_PACK.

## Purpose

This file defines the exact documentation set selected for this specific project.

STANDARD_PROJECT_DOCS_PACK is the master framework.
This file is the project-level selection contract.

The goal is not to copy the full master universe into every project.
The goal is to select only the documentation files and optional modules that match this project’s real needs.

---

## Project Identity

Project Name:  
Project Type:  
Project Owner:  
Selected By:  
Selection Date:  
Reference Profile: CUSTOM  
Final Selection Type: CUSTOM  

---

## Project Summary

Write a short summary of the project.

---

## Selection Method

Selection is based on:

- actual project features
- business model
- user roles
- admin needs
- payment needs
- content needs
- SEO needs
- security risk
- compliance needs
- integrations
- team size
- build complexity
- long-term maintenance needs

---

## User Decision Values

Allowed values:

```txt
MUST
GOOD_TO_HAVE
CONDITIONAL_MUST
ENTERPRISE
TEMPLATE
NOT_NEEDED
```

## Final Status Mapping

```txt
MUST              → MUST
GOOD_TO_HAVE      → SHOULD
CONDITIONAL_MUST  → CONDITIONAL_MUST
ENTERPRISE        → ENTERPRISE
TEMPLATE          → TEMPLATE
NOT_NEEDED        → EXCLUDED
```

## Activated Core Areas

- [ ] 00_MASTER
- [ ] 01_CORE
- [ ] 02_PRODUCT_STRATEGY
- [ ] 03_USER_ACCESS_ROLES
- [ ] 04_UX_INFORMATION_ARCHITECTURE
- [ ] 05_UI_DESIGN_SYSTEM
- [ ] 06_CONTENT_SEO_BRAND
- [ ] 07_FRONTEND_ARCHITECTURE
- [ ] 08_BACKEND_API_DATA
- [ ] 09_AUTH_SECURITY_PRIVACY
- [ ] 10_ADMIN_OPERATIONS
- [ ] 11_PAYMENTS_BILLING
- [ ] 12_ANALYTICS_MONITORING_REPORTS
- [ ] 13_QA_TESTING_RELEASE
- [ ] 14_DEPLOYMENT_DEVOPS
- [ ] 15_GOVERNANCE_HANDOFF

---

## Activated Optional Modules

- [ ] 16_OPTIONAL_ENTERPRISE
- [ ] 17_OPTIONAL_MOBILE_APP
- [ ] 18_OPTIONAL_AI_AUTOMATION
- [ ] 19_OPTIONAL_MARKETPLACE_ECOMMERCE
- [ ] 20_OPTIONAL_BOOKING_SCHEDULING
- [ ] 21_OPTIONAL_CRM_SALES_SUPPORT
- [ ] 22_OPTIONAL_INVENTORY_LOGISTICS
- [ ] 23_OPTIONAL_LEGAL_POLICY
- [ ] 25_OPTIONAL_FINTECH_COMPLIANCE
- [ ] 26_OPTIONAL_HEALTHCARE_MEDICAL
- [ ] 27_OPTIONAL_EDUCATION_LMS
- [ ] 28_OPTIONAL_REAL_ESTATE
- [ ] 29_OPTIONAL_HARDWARE_IOT
- [ ] 30_OPTIONAL_GAMING_COMMUNITY
- [ ] 31_OPTIONAL_BLOCKCHAIN_WEB3
- [ ] 32_OPTIONAL_GOVERNMENT_PUBLIC_SECTOR
- [ ] 33_OPTIONAL_DATA_AI_ADVANCED
- [ ] 34_OPTIONAL_COMMUNICATIONS
- [ ] 35_OPTIONAL_DOCUMENTS_FILES
- [ ] 36_OPTIONAL_SEARCH_DISCOVERY
- [ ] 37_OPTIONAL_MIGRATION_LEGACY

---

## Selected Files Matrix

| Folder | File | Default Status | When Required | User Decision | Final Status | Notes |
|---|---|---:|---|---|---|---|
| 00_MASTER | STANDARD_PROJECT_DOCS_PACK.md | MUST | Always required | MUST | MUST | Canonical framework |
| 00_MASTER | PROJECT_DOCS_SELECTION.md | MUST | Always required before build | MUST | MUST | This file |

---

## Excluded Files / Modules

| Folder / File | Reason |
|---|---|
| 17_OPTIONAL_MOBILE_APP | No native mobile app in this project |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | No marketplace/vendor model |
| 31_OPTIONAL_BLOCKCHAIN_WEB3 | No wallet, token, or smart contract requirement |

---

## Conditional Files

| File | Condition | Decision |
|---|---|---|
| AUTH_SYSTEM.md | Required if login/auth exists |  |
| PERMISSION_SYSTEM.md | Required if user roles or access control exist |  |
| ADMIN_PANEL_SPEC.md | Required if admin panel exists |  |
| PAYMENT_SYSTEM.md | Required if payments exist |  |
| PAYMENT_WEBHOOKS.md | Required if payment provider sends webhooks |  |
| DATABASE_SCHEMA.md | Required if database exists |  |
| API_SPEC.md | Required if backend/API exists |  |
| BOOKING_SYSTEM.md | Required if bookings/appointments exist |  |
| CRM_MODEL.md | Required if CRM module exists |  |
| INVENTORY_SYSTEM.md | Required if inventory/warehouse logic exists |  |

---

## Final Selected File List

Replace this example with the real selected file list.

```txt
00_MASTER/
  STANDARD_PROJECT_DOCS_PACK.md
  PROJECT_DOCS_SELECTION.md
```

---

## Fill Order for This Project

1. PROJECT_CONTEXT.md
2. PROJECT_BRIEF.md
3. PROJECT_GOALS.md
4. MVP_SCOPE.md
5. PRODUCT_REQUIREMENTS.md
6. USER_ROLES.md
7. PERMISSION_SYSTEM.md
8. INFORMATION_ARCHITECTURE.md
9. ROUTES_AND_NAVIGATION.md
10. UI_PAGE_STRUCTURE.md
11. FRONTEND_ARCHITECTURE.md
12. BACKEND_ARCHITECTURE.md
13. API_SPEC.md
14. DATABASE_SCHEMA.md
15. TEST_PLAN.md
16. DEPLOYMENT_OPERATIONS.md
17. BUILDER_HANDOFF.md

---

## Open Questions

| Question | Owner | Status | Notes |
|---|---|---|---|
| Should this project include online payments? | Product Owner | OPEN | Decide before selecting payment docs |
| Does this project require user roles and permissions? | Product Owner | OPEN | Decide before selecting access-control docs |
| Is SEO required for this project? | Product Owner | OPEN | Decide before selecting SEO/content docs |

---

## Approval

Selection status: DRAFT  
Approved by:  
Approval date:  

---

## Final Selection Decision

```txt
PROJECT-SPECIFIC DOCS SELECTION — APPROVED

This project does not use a fixed package.
This project uses a custom selected documentation set based on actual project needs.

Only the files listed in this PROJECT_DOCS_SELECTION.md should be created inside the project.
Optional modules must only be created if explicitly activated.

The master framework remains complete.
The project documentation set remains focused.
```
