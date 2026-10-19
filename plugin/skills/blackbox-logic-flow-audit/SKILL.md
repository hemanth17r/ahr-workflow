---
name: blackbox-logic-flow-audit
description: >-
  Universal programmatic black-box logic, wiring, and state flow verification standard across ANY software project. Mandates fast, headless in-memory simulations (<50ms, zero browser/DOM click overhead) whenever data mappers, parsers, state mutations, or navigation stacks are modified. Enforces 3 non-negotiable flow invariants: Source-to-Sink Column Preservation (zero dropped fields), Action Orthogonality (e.g. Pause/Toggle vs. Delete/Remove state isolation), and Navigation Reversibility (push/pop stack symmetry). Trigger when modifying data models, parsers, state stores, navigation routers, or when asked to "audit wiring", "black box test", "verify data travel", "prevent regression", "state flow check", or "logic flow verification".
---

# Universal Black-Box Logic & Wiring Flow Standard

## 1. The Core Law: Zero Blind-Assumptions on Data Travel
- **Build compilation (`npm run build`, `cargo check`, etc.) only proves syntax and types—it NEVER proves runtime data flow or state correctness.**
- Passing isolated math unit tests does NOT prove that database columns survive ingestion, or that UI actions don't clobber each other.
- **The Ground-Truth Mandate**: Before any non-trivial logic or wiring changeset is declared complete, the code MUST pass programmatic, headless in-memory flow simulations verifying the journey from source to sink.

---

## 2. Mandatory Trigger Threshold (Signal-to-Noise Filter)

To prevent developer drag, this protocol enforces a strict binary trigger threshold:

### EXEMPT (Zero flow test required)
- Pure styling, CSS, Tailwind classes, color adjustments, padding/margins.
- Static copy, spelling, typographic adjustments, labels.
- SVG assets, static illustrations, presentation-only layout wrappers.

### MANDATORY TRIGGER (Must execute programmatic flow verification)
- **Data Ingestion & Mappers**: Modifying functions that parse, serialize, deserialize, or transform database/API payloads into application state (e.g., `parseProfileData`, DTO converters).
- **Dual-Action / Multi-Intent Interfaces**: Controls where two related actions exist on the same entity (e.g., Toggle/Pause vs. Delete/Remove; Archive vs. Trash; Mute vs. Block).
- **Navigation & Routing Stacks**: Logic controlling screen pushes, screen pops, modal stacks, tab bars, or history reversibility.
- **State Store Mutations**: Reducers, context setters, store actions, or cache updaters modifying collections or active selection states.

---

## 3. The 3 Universal In-Memory Flow Invariants (< 50ms, Zero DOM I/O)

Every flow simulation must run headlessly in memory (Google Small Test standard: `< 50ms`, zero network, zero disk I/O, zero slow browser clicking):

### Invariant 1: Source-to-Sink Column Preservation (Zero-Drop Contract)
- **The Problem**: A schema adds `saved_skills` or `metadata`, but the parser only extracts `skills`. The new column is silently dropped to `undefined`, breaking downstream consumers.
- **The Simulation**:
  1. Construct a comprehensive mock raw backend payload containing every current schema field.
  2. Pass it through the ingestion mapper/parser function.
  3. **Assert**: Every single field is present, mapped to its canonical type, and non-undefined in the parsed output object.

### Invariant 2: Action Orthogonality (State Separation Contract)
- **The Problem**: Clicking "Toggle OFF" updates the active list by deleting the item entirely, mimicking the "Delete" button.
- **The Simulation**:
  1. Initialize state with an entity active in both the *inventory* and the *active radar/duty list*.
  2. Execute **Action A (Deactivate / Toggle OFF)**.
     - **Assert**: Item is removed from the *active list*, but strictly REMAINS in the *inventory list* in an inactive state.
  3. Execute **Action B (Permanent Delete / Remove)**.
     - **Assert**: Item is purged from BOTH the *active list* and the *inventory list*.

### Invariant 3: Navigation Reversibility (Stack Symmetry Contract)
- **The Problem**: Screen navigation mutates a secondary tab/global state alongside the screen stack. Popping the screen stack leaves the secondary state orphaned, requiring a double-back or hiding the shell header.
- **The Simulation**:
  1. Record starting root state: `Stack = [Root]`, `ActiveScreen = Root`.
  2. Trigger `pushScreen(DetailScreen)`.
  3. Trigger single `popScreen()`.
  4. **Assert**: State returns strictly to `Stack = [Root]`, `ActiveScreen = Root`, with ZERO hanging subscreen flags or tab locks.

---

## 4. Verification & Delivery Protocol

When completing a task that crossed the Mandatory Trigger Threshold, document the verification in the standard deliverable protocol:
- **Before**: Broken data travel, dropped column, or state collision.
- **After**: Surgical code fix and co-developed deterministic flow test.
- **Improvement**: Programmatic proof showing the `< 50ms` in-memory test suite passing.
