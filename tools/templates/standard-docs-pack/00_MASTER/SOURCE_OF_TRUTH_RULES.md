# SOURCE_OF_TRUTH_RULES.md

Conflict resolution rules for STANDARD_PROJECT_DOCS_PACK.

## Purpose

This file defines which document wins when two documents appear to overlap or contradict each other.

## Business / Product Priority

```txt
PROJECT_CONTEXT.md
PROJECT_BRIEF.md
PROJECT_GOALS.md
MVP_SCOPE.md
PRODUCT_REQUIREMENTS.md
BUSINESS_RULES.md
FEATURE_SPEC.md
USER_STORIES.md
ACCEPTANCE_CRITERIA.md
```

Rule: business intent beats implementation detail.

## Access / Security Priority

```txt
PERMISSION_SYSTEM.md
ACCESS_CONTROL_MATRIX.md
AUTH_SYSTEM.md
SESSION_RULES.md
SECURITY_CHECKLIST.md
THREAT_MODEL.md
```

Rule: permission and security files beat UI convenience.

## UX / UI Priority

```txt
INFORMATION_ARCHITECTURE.md
ROUTES_AND_NAVIGATION.md
PAGE_INVENTORY.md
UI_PAGE_STRUCTURE.md
DESIGN_TOKENS.md
COMPONENT_SPEC.md
```

Rule: design tokens beat component styling. Information architecture beats page-level improvisation.

## Technical Implementation Priority

```txt
FRONTEND_ARCHITECTURE.md
BACKEND_ARCHITECTURE.md
API_SPEC.md
DATABASE_SCHEMA.md
DATA_DICTIONARY.md
ENV_AND_SECRETS.md
DEPLOYMENT_OPERATIONS.md
```

Rule: architecture files define system direction. Implementation files must not contradict architecture files.

## Governance Priority

```txt
DECISIONS_LOG.md
CHANGELOG.md
ANTI_DRIFT_RULES.md
BUILDER_HANDOFF.md
README_FOR_AI_BUILDERS.md
```

Rule: approved decisions beat later assumptions.

## Duplicate Role Rules

- `ROADMAP.md` = high-level timeline and milestones.
- `PRODUCT_ROADMAP.md` = feature evolution by release.
- `FEATURE_SPEC.md` = exact approved feature behavior.
- `FEATURE_CATALOG.md` = inventory of possible/current/planned/rejected features.
- `DATA_MODEL.md` = conceptual entities and relationships.
- `DATABASE_SCHEMA.md` = actual tables, fields, constraints, indexes.
- `DATA_DICTIONARY.md` = field meanings and allowed values.
- `COOKIE_POLICY.md` = internal technical/legal cookie rules.
- `COOKIE_POLICY_PAGE.md` = public page copy.
