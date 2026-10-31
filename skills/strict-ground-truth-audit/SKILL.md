---
name: strict-ground-truth-audit
description: >-
  Enforces rigorous, end-to-end empirical code audits across all layers (persistence, query syntax, data mappers, state lifecycle, business/date math, edge cases, type safety, and build integrity). Strictly bans frontend-only mock fixtures and mandates seeding the real database when test data is absent. Prohibits guessing feature status or reporting success without empirical runtime/log proof. Trigger when asked to "check all wirings", "verify logics", "audit everything", "check if working properly", "is this actually working", "verify this", "double check", "ground truth check", "strict audit", "seed data", "missing data", or "no mock data".
---

# Strict Ground-Truth Audit & Zero-Guesswork Protocol

## Fundamental Mandate
**NEVER state that a feature, API, query, filter, state transition, or system wiring is working based on assumptions, high-level documentation, or superficial inspections.**

When triggered to verify system logic or perform an audit:
1. Conduct a mandatory, end-to-end empirical inspection across all architectural layers (Data Store → Transport → Business Logic → Presentation/CLI).
2. Trace every parameter mapping, query operator, data type constraint, state mutation, boundary condition, and fallback path in the code.
3. Run the fastest sufficient static type checks and build verification commands for the current tech stack.
4. If any layer or execution path cannot be empirically verified through code inspection or execution, explicitly report it as **Unverified / Unknown** rather than asserting success.

---

## Universal 6-Layer Empirical Audit Checklist

Audits must evaluate all 6 layers regardless of language, framework, or architecture:

### 1. Persistence & Query Mechanics
- **Schema & Type Coercion**: Verify data types (e.g. `DATE` vs `TIMESTAMP` vs `VARCHAR`) and ensure queries match backend storage constraints (preventing invalid type casts, pattern matching on non-string types, etc.).
- **Query Operators**: Inspect raw SQL, ORM queries, PostgREST filters, GraphQL selectors, or REST query parameters for accurate operator selection (`>=`, `<=`, `ILIKE`, `IN`, `AND`/`OR` grouping).
- **Sorting & Pagination**: Verify sorting directions (ascending vs descending), null ordering (`NULLS LAST`), pagination offsets/cursors, and limit boundaries.

### 2. Data Transformation & Interface Contracts
- **Serialization / Deserialization**: Audit DTOs, data mappers, struct tags, and payload converters between storage schema and application interfaces.
- **Naming & Key Alignment**: Confirm property name consistency across boundaries (e.g. `snake_case` database fields to `camelCase` application fields).
- **Null Safety & Fallbacks**: Check default fallback values, optional fields, and missing key handling.

### 3. State Management & Control Flow
- **Lifecycle & Mutability**: Audit reactive subscriptions, component hooks, state machine transitions, event loops, or global store updates.
- **State Synchronization**: Confirm dependent state invalidations and filter/parameter resets when primary inputs change.
- **Async & Concurrency**: Inspect promises, goroutines, async/await handlers, race conditions, loading states, and error handling.

### 4. Domain & Mathematical Logic
- **Boundary & Date Math**: Verify calculations involving date ranges, timezones, epoch timestamps, leap years, array indices, and numerical precision.
- **Business Rules & Permissions**: Trace authorization checks, status lifecycle transitions, feature flags, and conditional execution branches.
- **Edge Case Precedence**: Confirm ordering rules, filter precedence, and tie-breaking algorithms.

### 5. Intersectional Filters & System Resilience
- **Multi-Filter Intersections**: Audit truth tables when multiple filter criteria are applied simultaneously (e.g., Category + Date Range + Search Query + Location).
- **System View States**: Verify presentation states for Loading, Error Handling, Empty Results, and Success rendering.
- **Offline & Failure Resilience**: Inspect behavior when external APIs time out, database queries return zero records, or network connection fails.

### 6. Static Verification & Build Integrity
- **Type Safety**: Execute language-specific static type checkers (`npx tsc --noEmit`, `mypy`, `cargo check`, `go vet`, etc.).
- **Build Verification**: Execute production build commands (`npm run build`, `go build`, `cargo build`, etc.) to confirm compilation safety.

---

## Audit Output Structure & Framing Rules

- **Universal Screen-First Root Framing**: Even during deep backend, database, or API audits, every finding MUST first be introduced through the **physical persona screen journey** (who taps what, what fails on their screen) before explaining the underlying technical cause.
- **Audit Defect vs. Enhancement Litmus Filter**: Strictly distinguish between **Core-Loop Functional/Security Blockers** (data loss, auth bypass, transaction crashes, unhandled errors) vs. **Post-MVP Enhancements / Missing CRUD conveniences** (e.g., custom avatar/logo uploaders, advanced filters, cosmetic settings). Forbid reporting non-essential conveniences or unused optional schema columns as defects; actively push back on them as scope creep.

When reporting results, categorize findings into three standard sections:

1. **Empirically Verified (Pass)**: Features, data flows, and logic confirmed line-by-line in code with specific file/line references.
2. **Defects Discovered & Resolved (Fixed)**: Genuine core-loop blockers or security flaws identified and corrected during the audit.
3. **Unverified Areas (Warnings)**: System components, third-party integrations, or production environments that require staging runtime verification.

---

## Production-Fidelity DB Seeding & Zero Frontend Mocking Protocol

### 1. Absolute Ban on Frontend-Only Mock Fixtures
- Strictly forbid creating in-memory dummy arrays, hardcoded mock objects, or component-level fallback state to simulate features, test screens, or demonstrate UI workflows.
- All rendered cards, lists, counts, and statuses must originate directly from the database and flow through real server actions, API routes, or database RPCs.

### 2. Proactive Missing-Data Workflow (Halt & Seed, Never Fake)
When executing an audit, testing a newly entered area/postcode, or verifying a physical user flow where database rows are missing:
1. **Never Intercept or Fake the UI**: Strictly forbid intercepting user inputs (e.g. search bars, form inputs) to show artificial mock cards or simulate success when the database query returns 0 rows.
2. **Halt & Announce the Data Boundary**: State the direct factual gap to the operator: *"No real data exists in PostgreSQL for [area/postcode/workflow]. Halting to seed production-fidelity records."*
3. **Execute Direct Database Seeding**: Inspect the target schema and generate authentic, production-structured seed rows directly in PostgreSQL/Supabase:
   - Authentic geographic coordinates (lat/lng, postal districts).
   - Valid UUID primary keys and existing foreign key relations.
   - Realistic business attributes (names, prices, brands, pack sizes, stock counts, images).
4. **End-to-End Verification**: Re-trigger the real database query/RPC and verify that the physical screen renders the persisted records end-to-end.

