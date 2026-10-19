---
name: root-cause-triage
description: >-
  Universal scientific bug triage, incident diagnosis, and root-cause analysis standard. Strictly enforces the 'Zero Speculative Edits' law: forbids modifying production code until a minimal, deterministic reproduction test is written and failing. Diagnoses the exact broken invariant or logic boundary, applies minimal surgical patches, and verifies regression safety. Trigger when asked to "debug this bug", "fix this issue", "root cause triage", "investigate error", "diagnose failure", "why is this failing", "debug failure", or "trace bug".
---

# Root-Cause Triage & Deterministic Incident Analysis Standard

## The Prime Directive
**NEVER make speculative code edits based on guesswork or superficial error messages.**

Randomly changing lines of code, adding defensive `if (x != null)` checks to mask symptoms, or shotgun-debugging without proving the root cause creates technical debt, hides the real defect, and introduces catastrophic regressions.

Every bug fix must follow the **Scientific Debugging Protocol**: Reproduce $\to$ Isolate $\to$ Diagnose $\to$ Surgically Patch $\to$ Verify.

---

## 1. The 4-Step Scientific Triage Protocol

Whenever a bug, test failure, crash, or unexpected behavior is reported:

### Step 1: Isolate (Extract Minimum Reproduction State)
* Strip away noisy logs, UI distractions, and unrelated subsystems.
* Identify the exact triad that produced the defect:
  1. **Initial State ($S_0$):** What was the exact state of the database, memory, or component before the event?
  2. **Event / Payload ($E$):** What exact user input, API payload, or network signal triggered it?
  3. **Expected vs. Actual:** What exact invariant, return value, or screen behavior failed?

### Step 2: Reproduce (Write the Failing Test FIRST)
* **The Non-Negotiable Law:** Write a minimal, deterministic test case reproducing the failure **before modifying a single line of application source code.**
* **Constraints for the Reproduction Test:**
  - Must run in **$< 100\text{ms}$** with zero external network or disk I/O.
  - Must explicitly assert the expected correct behavior.
  - Run the test suite: **The test MUST fail with the reported defect.**
  - If the test passes, your reproduction model is incomplete. Do not proceed to code editing until the test fails reliably.

### Step 3: Diagnose (Identify the True Root Cause)
Trace the exact mechanical failure mode in the code:
* *Is it an unhandled boundary condition (off-by-one, empty array, null pointer)?*
* *Is it an implicit type coercion or JSON serialization mismatch?*
* *Is it a race condition or stale closure state?*
* *Is it a missing invariant or corrupted state transition?*
Locate the single, exact line or function where the contract was broken.

### Step 4: Surgical Patch & Verification Gate
1. **Apply the Minimal Surgical Fix:**
   - Modify only the code necessary to satisfy the contract.
   - Do NOT rewrite unrelated functions or refactor adjacent architecture during a bug fix.
2. **Execute the Verification Gate:**
   - Run the reproduction test: **Must turn GREEN.**
   - Run the entire existing test suite: **0 regressions allowed.**
   - The reproduction test remains permanently in the test suite as a regression guard.

---

## 2. The 3 Forbidden Anti-Patterns

1. **The Symptom Masker:**
   - ❌ *Anti-Pattern:* Adding `if (!data) return null;` or wrapping the function in an empty `try/catch` block.
   - *Why It Breaks:* The error stops crashing, but downstream state becomes corrupted silently.
2. **Shotgun Debugging:**
   - ❌ *Anti-Pattern:* Modifying 5 different files simultaneously hoping one of them fixes the problem.
   - *Why It Breaks:* You cannot determine what actually resolved the issue, and you introduce 3 new latent bugs.
3. **The Print-Statement Maze:**
   - ❌ *Anti-Pattern:* Scattering 20 `console.log()` or `print()` statements across the codebase and leaving them committed.
   - *Why It Breaks:* Clutters production logs, slows down execution, and reveals lack of structured test harness.

---

## 3. Triage Summary Format
When reporting triage completion, summarize using this structured format:
* **Defect Identified:** Root cause explanation in 1–2 sentences.
* **Reproduction Test:** Name and location of the new test case (`tests/...`).
* **Surgical Fix:** Exact file and line modified, explaining why this solves the root cause.
* **Verification Proof:** Test output showing the reproduction test passing and 0 regressions.
