---
name: ground-up-engineering-protocol
description: >-
  Universal architectural standard for autonomous coding agents to build any software system from scratch. Enforces strict negative scoping, first-principles dependency ordering ("Movement First, Casing Second"), adversarial phase sequence auditing, test-first verification with simulated abstractions, and explicit placement justifications for every phase and sub-phase. Trigger when asked to "build from scratch", "decompose this project", "architect this system", "plan this build", "phase this project", "ground up protocol", "GUEP", or "plan properly from scratch".
---

# Ground-Up Engineering Protocol (GUEP)
## Universal Standard for Scoping, Sequencing, and Building Systems From Scratch

## Core Law: "Movement First, Casing Second"
Inverted dependencies are the root cause of AI hallucinations, messy code rewrites, and wasted tokens.
* **The Analogy:** A watchmaker builds the internal quartz movement (time crystal, gearing, buzzer circuit) and proves it with a multimeter *before* crafting the watch casing, buttons, and dial.
* **The Anti-Pattern:** Designing the user interface, CLI menus, or API controllers first forces you to guess at the underlying engine. When concurrency, state synchronization, or background events are added later, the presentation layer must be ripped apart and rewritten.
* **The Rule:** Always build from the deepest, pure-logic foundation outward toward the presentation boundary. Every phase must produce an independently verifiable layer.

---

## 1. Phase 0: Negative Scope & Technical Contract
Before writing a single line of production code, the agent MUST establish:
1. **Explicit Positive Scope:** 3–5 core capabilities that define minimum operational viability.
2. **Ruthless Negative Scope:** An explicit list of features that are **REJECTED** upfront with engineering rationale:
   * *Persistence:* Reject databases/file storage if in-memory state satisfies the core requirement.
   * *External Packages:* Reject third-party libraries where standard library primitives suffice.
   * *Peripheral Workflows:* Reject secondary features (snooze, recurrence, themes, user accounts) that inflate bug surface area without providing core architectural signal.
3. **Environment & Runtime Invariants:** Operating system, terminal encoding (e.g. avoiding Unicode emojis on Windows `cp1252`), zero-busy-wait CPU requirements.

---

## 2. The 5-Layer Universal Dependency Hierarchy (DAG)

Decompose any system into this strict sequence:

```
┌─────────────────────────────────────────────────────────────┐
│ Layer 4: Presentation & Consumers (CLI / REST / UI / Queue) │
├─────────────────────────────────────────────────────────────┤
│ Layer 3: Boundary Integration & E2E Verification            │
├─────────────────────────────────────────────────────────────┤
│ Layer 2: Fast Deterministic Tests (Mock Clocks / Stubs)     │
├─────────────────────────────────────────────────────────────┤
│ Layer 1: Core Engine & Invariants (Pure Logic, Zero I/O)    │
└─────────────────────────────────────────────────────────────┘
                     ▲ BUILD DIRECTION ▲
```

### Layer 1: Core Domain Engine & Invariants (Headless)
* **What it contains:** Pure data structures, business logic, state machines, math, and lifecycle transitions.
* **Mandatory Constraint:** Zero I/O, zero `print()` / console logs, zero network calls, zero file writing.
* **Concurrency Primitives:** If background tasks or timers are required, the engine must manage thread safety, locks, and lifecycle events (`start()`, `stop()`) internally.
* **Entropy / Clock Abstraction:** Dependence on time, randomness, or network MUST be injected via interfaces or callables (`clock: Callable[[], datetime] = datetime.now`).

### Layer 2: Deterministic Verification Harness (Test-First)
* **What it contains:** Automated unit test suite verifying Layer 1.
* **Why it MUST precede Layer 3:** Catching logic and concurrency bugs before building the presentation layer prevents slow, manual terminal/browser debugging.
* **Mandatory Constraint:** Tests must execute in **milliseconds** using simulated abstractions (e.g., fast-forwarding mock clocks, in-memory stubs). Flaky `sleep()` calls are strictly forbidden.

### Layer 3: Presentation & Consumer Boundary
* **What it contains:** The interactive interface (CLI prompt loop, REST endpoints, GraphQL resolvers, or UI views).
* **Architecture:** Layer 3 is a **thin consumer** of Layer 1. It contains zero business logic and zero date/time arithmetic.
* **Fault Tolerance:** Robust handling of malformed input, missing IDs, out-of-range commands, and environment edge cases.
* **Lifecycle & Signal Traps:** Graceful handling of interrupts (`SIGINT`, `Ctrl+C`, `EOF`) that cleanly shuts down Layer 1 background threads.

### Layer 4: End-to-End Integration & Boundary Stress
* **What it contains:** Live subprocess or end-to-end integration tests that cross process boundaries.
* **Verification Scope:**
  1. Standard I/O pipelines (piping inputs and verifying outputs).
  2. Background event notifications firing into the active presentation layer.
  3. Clean termination (zero hanging daemon threads, exit code 0).
  4. Throttled CPU usage (asserting 0% busy-wait / spinlock behavior).

### Layer 5: Senior Architectural Review & Tradeoff Audit
* **What it contains:** Final adversarial inspection of the codebase.
* **Audit Checklist:**
  * [ ] Zero dead code or uninvoked methods.
  * [ ] Callback execution outside mutex locks (deadlock prevention).
  * [ ] No tight coupling between presentation and engine layers.
  * [ ] Zero external dependencies where standard libraries suffice.
  * [ ] Cross-platform resilience (Linux, macOS, Windows).

---

## 3. The Adversarial Plan Audit (The Trap Detector)

Before adopting a phase plan, inspect it for these three common architectural traps:

| Trap | Symptom | Remediation |
| :--- | :--- | :--- |
| **The Blocking I/O Trap** | Designing a CLI/UI loop before designing concurrency or background events. | Move the background engine and threading into Layer 1. The CLI is merely an observer. |
| **The Late-Stage Testing Trap** | Deferring tests until after the UI/CLI is complete. | Move unit tests to Layer 2 immediately after the engine is written. Test core logic with mock time/stubs before writing UI code. |
| **The Premature Persistence Trap** | Setting up SQLite, ORMs, or JSON serialization before proving domain state transitions. | Strip all persistence. Use in-memory data structures until core business logic is validated. |

---

## 4. Phase Specification Contract (Mandatory Template)

When presenting any phase plan, format every phase and sub-phase using this exact contract:

```markdown
### Phase [X]: [Phase Title]

#### 1. Scope
* **In-Scope:** [Exact list of classes, functions, or components to implement]
* **Explicitly Out-of-Scope:** [Features, abstractions, or libraries rejected]

#### 2. Sequence Justification
* **Why it must be built now:** [What lower-level foundation does it provide?]
* **What subsequent rewrites does this prevent?** [e.g., Prevents ripping apart the UI when threading is added later]

#### 3. Technical Invariants & Decisions
* [Key technical choice and trade-off, e.g., thread locks vs asyncio, dependency injection]

#### 4. Verification Gate
* [How will this exact phase be mathematically or empirically proven before starting the next phase?]
```

---

## 5. Milestone Completion Reporting Protocol

At the end of **every single phase**, pause and output a 5-point report:

1. **What was implemented:** Concrete list of files, classes, and mechanisms created.
2. **Why those features were included:** Architectural rationale linking back to Phase 0.
3. **What was deliberately excluded:** Features intentionally killed to protect scope and simplicity.
4. **Important engineering tradeoffs:** Critical technical choices made (e.g., locks vs queues, ASCII vs Unicode).
5. **What must be verified next:** The exact criteria that the next phase must satisfy.

---

## 6. Sub-Phase Splitting Heuristic
Split a phase into sub-phases (`Phase 1.1`, `Phase 1.2`) ONLY if:
1. **Multiple State Transitions:** A component manages more than one distinct lifecycle (e.g., parsing time vs. managing background worker threads).
2. **High Uncertainty:** A library or API integration has unknown runtime behavior.
3. **Verification Gap:** You cannot write a single fast test that verifies the whole phase at once.
