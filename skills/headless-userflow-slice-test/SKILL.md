---
name: headless-userflow-slice-test
description: >-
  Universal headless end-to-end user-flow and slice-by-slice persistence verification standard. Mandates programmatic, headless multi-actor script execution against real database endpoints whenever user flows, transaction boundaries, or cross-actor state pipelines are added, modified, or removed. Enforces a strict trigger threshold to exempt small fixes, styling, or isolated utilities while catching database RLS breaches, trigger failures, auth scanner bugs, and multi-tenant isolation leaks. Trigger when adding, altering, or removing user flows, multi-store transactions, fulfillment pipelines, counter verifications, or when asked to "test user flows", "slice test", "verify user journey", "headless e2e", "e2e slice verification", or "test flows sequentially".
---

# Universal Headless User-Flow & Slice Verification Standard

## 1. The Core Law: Slice-by-Slice Live Verification Over Mock Illusions
- **Build compilation and TypeScript checks only prove syntax and type contracts—they NEVER prove that database triggers, generated columns, foreign keys, or Row Level Security (RLS) policies work at runtime.**
- In-memory mock tests pass 100% on broken PostgreSQL triggers, missing schema search paths, GoTrue auth scanner scan crashes, and cross-tenant RLS leaks because mocks bypass the real database engine.
- Manual browser UI clicking is 20x slower, non-deterministic, and cannot easily verify low-level database constraints or multi-tenant boundaries.
- **The Ground-Truth Mandate**: Whenever user flows or state-bearing transactional pipelines are added or modified, they MUST be verified slice-by-slice via headless programmatic test scripts executing against the real database and real server actions/RPCs.

---

## 2. Mandatory Trigger Threshold (Signal-to-Noise Filter)

To prevent developer drag and avoid running heavy verification on trivial changes, this protocol enforces a strict binary trigger threshold:

### EXEMPT (Zero Live Slice Test Required)
- **Visual & UI Polish**: Pure styling, CSS, Tailwind utility classes, typography, optical centering, padding/margins, animations.
- **Microcopy & Presentation**: Static text, spelling, marketing copy, label adjustments, button icons.
- **Isolated Pure Utilities**: Formatting functions (dates, currencies, string truncation, pure math) covered by fast `<50ms` unit tests.
- **Internal Component Refactors**: Code reorganizations that do not change what data is transmitted across the network or persisted to the database.

### MANDATORY TRIGGER (Must Execute Headless Slice-by-Slice Verification)
- **User Flow Additions, Modifications, or Deletions**: Adding, altering, or removing steps in an end-to-end workflow (e.g., onboarding, catalog stocking, cart checkout, multi-store splitting, fulfillment pipeline, counter collection, admin governance).
- **Database Triggers, Stored Functions & Auth Hooks**: Writing or updating PostgreSQL triggers (e.g., `handle_new_user`), database RPCs, or authentication lifecycle handlers.
- **Multi-Actor & Cross-Tenant State Pipelines**: Workflows where two or more distinct personas interact with shared data (e.g., Customer $\rightarrow$ Merchant 1 $\rightarrow$ Merchant 2 $\rightarrow$ Counter Staff $\rightarrow$ Admin).
- **Row Level Security (RLS) & Authorization Changes**: Altering database access policies, tenant isolation rules, or role-based permission checks.

---

## 3. The 4-Step Slice-by-Slice Protocol

Never test the entire platform in one monolithic script. Decompose the user flow into sequential, single-responsibility slices:

```
Slice 1: Merchant Stocking ──► Slice 2: Customer Discovery ──► Slice 3: Split Checkout ──► Slice 4: Fulfillment ──► Slice 5: Till Handover
      [PASS & FREEZE]               [PASS & FREEZE]                [PASS & FREEZE]             [PASS & FREEZE]             [PASS & FREEZE]
```

### Step 1: Slice Inventory & Sequencing
Identify every distinct actor and state transition in the user journey. Number them sequentially from entrypoint to settlement (e.g., Slice 1: Merchant Onboarding, Slice 2: Shelf Stocking, Slice 3: Discovery, Slice 4: Split Checkout, Slice 5: Store Fulfillment, Slice 6: Till Handover, Slice 7: Admin Governance).

### Step 2: Write Headless Test Script (`scratch/test_sliceX.mjs`)
Create a deterministic Node.js test script using the project's actual database client (e.g. `@supabase/supabase-js`) executing against real credentials:
1. Seed realistic pilot data (never random meaningless strings).
2. Authenticate as the specific actor (Customer, Merchant A, Merchant B, Admin).
3. Execute the exact Server Action, API endpoint, or database RPC.

### Step 3: Assert the 3 Non-Negotiable Live Invariants
1. **Source-to-Sink Column Preservation**: Query the persisted database row directly. Assert every single column sent from the user action exists, has the expected data type, and has zero dropped fields or `NULL` corruptions.
2. **Cross-Tenant RLS & Security Isolation**: Execute a malicious or out-of-tenant query (e.g., Merchant A attempts to mutate or read Merchant B's order). Assert the database returns zero rows affected or permission denied.
3. **Mathematical & State Orthogonality Invariant**: Assert child subtotals strictly equal parent grand totals, and state changes (e.g. Out of Stock toggle) do NOT purge or corrupt the underlying shelf inventory.

### Step 4: Strict Zero Speculative Edits & Slice Freezing
- If a slice fails (e.g., Postgres trigger error, scanner crash, RLS denial):
  1. Halt immediately. Never proceed to the next slice.
  2. Diagnose the exact runtime database error log.
  3. Apply the minimal surgical fix.
  4. Re-run `test_sliceX.mjs` until 100% pass rate is achieved.
  5. Only once a slice passes 100% is it frozen and the agent advances to the next slice.

---

## 4. Deliverable Reporting Standard

When reporting completion of a headless user-flow test, provide strict high-signal data:
1. **Slice Name & Actors**: Exact flow tested and seeded entities.
2. **Database Evidence**: Persisted row IDs, exact mathematical sums, and RLS audit result.
3. **Flaws Identified & Fixed**: Any database triggers, scanner errors, or policy gaps caught and resolved.
