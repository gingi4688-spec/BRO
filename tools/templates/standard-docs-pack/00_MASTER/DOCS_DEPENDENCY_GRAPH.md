# DOCS_DEPENDENCY_GRAPH.md

Dependency and fill-order graph for STANDARD_PROJECT_DOCS_PACK.

## Core Rule

Do not treat a downstream document as final if its upstream source documents are missing, unstable, or still open.

## Main Dependency Chain

```txt
STANDARD_PROJECT_DOCS_PACK.md
  ↓
FILE_STATUS_MATRIX.md
  ↓
PACK_DECISION_TREE.md
  ↓
PROJECT_DOCS_SELECTION.md
  ↓
PROJECT_CONTEXT.md
  ↓
PROJECT_BRIEF.md
  ↓
PROJECT_GOALS.md
  ↓
MVP_SCOPE.md
  ↓
PRODUCT_REQUIREMENTS.md
  ↓
BUSINESS_RULES.md
  ↓
FEATURE_SPEC.md
  ↓
USER_ROLES.md
  ↓
PERMISSION_SYSTEM.md
  ↓
INFORMATION_ARCHITECTURE.md
  ↓
ROUTES_AND_NAVIGATION.md
  ↓
UI_PAGE_STRUCTURE.md
  ↓
FRONTEND_ARCHITECTURE.md
  ↓
BACKEND_ARCHITECTURE.md
  ↓
DATA_MODEL.md
  ↓
DATABASE_SCHEMA.md
  ↓
API_SPEC.md
  ↓
SECURITY_CHECKLIST.md
  ↓
TEST_PLAN.md
  ↓
DEPLOYMENT_OPERATIONS.md
  ↓
BUILDER_HANDOFF.md
```

## Rule

A file can be drafted early, but it cannot be treated as final until its upstream dependencies are stable.

## Optional Modules

Optional module files depend on:

```txt
PROJECT_DOCS_SELECTION.md
PRODUCT_REQUIREMENTS.md
BUSINESS_RULES.md
USER_ROLES.md
PERMISSION_SYSTEM.md
DATA_MODEL.md
API_SPEC.md
SECURITY_CHECKLIST.md
```

## Conflict Rule

If a downstream document conflicts with an upstream document:

1. Check `SOURCE_OF_TRUTH_RULES.md`.
2. Use the higher-priority source.
3. If unclear, add the issue to `OPEN_ITEMS_LOG.md`.
4. When resolved, record the decision in `DECISIONS_LOG.md`.
