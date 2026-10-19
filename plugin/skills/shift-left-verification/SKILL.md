---
name: shift-left-verification
description: >-
  Universal progressive testing and shift-left verification standard (Google Small Tests, Stripe level). Codifies fast deterministic unit tests (<100ms, zero I/O), atomic co-development (commit logic and test in the same changeset), milestone verification gates, and eliminates the 3 testing traps (mocking illusions, testing private implementation details, and pixel assertions). Trigger when writing unit tests, setting up test suites, verifying milestones, practicing TDD/co-development, designing testable architecture, or when asked to "write tests", "add tests", "test this", "need tests", "add test coverage", or "how should we test this".
---

# Shift-Left Progressive Verification Standard

## 1. The Core Philosophy: Verification as an Architecture Forcing Function

In high-performance engineering, testing is not an afterthought phase; it is an **architectural forcing function** executed continuously at each milestone.
* Code that is difficult to unit test is **badly architected code** (spaghetti coupling, hidden side-effects, hardcoded clocks, or direct network calls inside domain logic).
* Designing for testability naturally forces code to be **pure, modular, and dependency-injected**.
* Catching a bug at the local authoring gate takes **3 seconds**. Catching it in a staging or production environment takes **hours**.

---

## 2. Principle 1: Google's "Small Tests" Rule (The Zero I/O Mandate)

Classify unit tests strictly by execution physics. **80%+ of a project's tests must be Small Tests**:

```
                       ┌────────────────────────────────────────┐
                       │       GOOGLE SMALL TEST STANDARD       │
                       ├────────────────────────────────────────┤
                       │  • Execution Time: < 100 milliseconds  │
                       │  • Network Access: ZERO (Banned)       │
                       │  • Disk File I/O:  ZERO (Banned)       │
                       │  • Sleep / Delays: ZERO (Banned)       │
                       │  • Environment:    Single Process      │
                       └────────────────────────────────────────┘
```

* **Implementation**: Keep business calculations, state machines, math, data mappers, and validation logic pure and headless.
* **Execution**: A suite of 50 pure unit tests must execute in **under 100ms** locally (e.g. via `Vitest`, `Jest`, `pytest`), giving instant developer feedback with zero latency.

---

## 3. Principle 2: Atomic Co-Development & Micro-Commits

Never accumulate large unverified feature branches. Break work into atomic, milestone-gated slices:

1. **Write an Atomic Slice**: Implement a single pure unit of logic (30 to 100 lines).
2. **Co-Locate the Test**: Keep the test file immediately adjacent to the source:
   ```
   src/features/bounties/
      ├── calculateReward.ts
      └── calculateReward.test.ts
   ```
3. **Run the Verification Gate**: Confirm tests pass locally before touching downstream presentation or storage layers.
4. **Atomic Commit**: Commit the implementation and its corresponding test together in the **exact same commit**:
   ```bash
   git commit -m "feat(bounties): implement dynamic sector reward calculation with unit test"
   ```

---

## 4. The 3 Testing Traps to Eliminate

Tests must accelerate development velocity, not become brittle maintenance liabilities.

### Trap 1: The "Mocking Illusion"
* ❌ **Anti-Pattern**: Mocking the database, the ORM, the network client, and external APIs. You end up testing mock configuration while production crashes on real schemas.
* ✅ **The Fix**: Never mock what you can keep pure. Test core logic with real in-memory inputs and outputs. Reserve real I/O verification for separate integration tests.

### Trap 2: Testing Implementation Details Instead of Contracts
* ❌ **Anti-Pattern**: Using spies to assert that an internal private method was invoked:
  ```ts
  expect(service._privateCacheHelper).toHaveBeenCalledTimes(1);
  ```
  Refactoring internal implementation breaks the test, even when the external behavior is 100% correct.
* ✅ **The Fix**: Treat components and functions as black boxes. **Assert public inputs and observable outputs/state changes only.**

### Trap 3: Unit-Testing Pixels & Styling
* ❌ **Anti-Pattern**: Writing unit tests asserting CSS classes or DOM heights (`expect(el).toHaveClass('px-4 py-2')`).
* ✅ **The Fix**: Test **state, data flow, and user interaction**, not visual styling. Verify that clicking an item toggles selection; verify visual aesthetics through browser inspection.

---

## 5. Pre-Flight Verification Checklist

Before marking any milestone or task complete, verify:
- [ ] **Zero I/O**: Do unit tests execute without network, file, or database roundtrips?
- [ ] **Sub-Second Speed**: Does the test suite run in milliseconds?
- [ ] **Co-Located Test Files**: Is the test placed directly next to the module it tests?
- [ ] **Contract-Only Assertions**: Are tests asserting public outputs rather than private implementation details?
- [ ] **Zero Pixel Tests**: Are tests free from fragile CSS class or DOM geometry assertions?
- [ ] **Edge Cases Covered**: Are boundary conditions (empty lists, null values, negative counts, zero thresholds) explicitly tested?
- [ ] **Atomic Commit Ready**: Is the unit test staged and committed alongside the feature code?
