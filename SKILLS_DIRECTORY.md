# Master Autonomous Skills & Capabilities Register

| Metadata | Specification |
| :--- | :--- |
| **Artifact ID** | `SYS-03` |
| **Date Tag** | `261031` (31 Oct 2026) |
| **Domain** | Autonomous Agent Systems & Workflow Standards |
| **Status** | Active Master Register (34 Skills) |
| **Scope** | Directory of all codified autonomous skills, trigger phrases, and operational outcomes |

---

## 1. Operating Architecture: Progressive Disclosure

Antigravity leverages **Progressive Disclosure**: only the skill metadata (name, description, trigger phrases) resides in working memory until user intent invokes it. When triggered, the specific instruction set dynamically loads, keeping agent execution high-speed and context budgets minimal.

```
┌────────────────────────────────────────────────────────┐
│                   HUMAN OPERATOR                       │
│    Trigger Phrase (e.g. "curate findings", "audit")   │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│               ANTIGRAVITY ROUTER                       │
│    Matches intent to 1 of 34 specialized skill rules   │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│                 AUTONOMOUS SKILL                       │
│    Executes domain standard with 10/10 signal density  │
└────────────────────────────────────────────────────────┘
```

---

## 2. Master Category Directory

### Category 1: Core Engineering, Testing & Bug Triage

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`root-cause-triage`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/root-cause-triage/SKILL.md) | *"debug this bug"*, *"why is this failing"*, *"fix error"* | **Zero Speculative Edits**: Forbids modifying production code until an automated, deterministic reproduction test is written and failing first. |
| [`strict-ground-truth-audit`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/strict-ground-truth-audit/SKILL.md) | *"audit everything"*, *"verify logics"*, *"ground truth check"*, *"seed data"* | Bans frontend mocks; enforces Halt & Seed PostgreSQL. Verifies all data layers end-to-end with screen-first root framing and empirical live proof. |
| [`shift-left-verification`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/shift-left-verification/SKILL.md) | *"write tests"*, *"test this"*, *"add test coverage"* | Enforces Google Small Tests (<100ms, zero I/O) and Progressive Slice-by-Slice Wiring Gate (zero dummy controls, tactile feedback, state reversibility). |
| [`blackbox-logic-flow-audit`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/blackbox-logic-flow-audit/SKILL.md) | *"audit wiring"*, *"state flow check"*, *"verify data travel"* | Runs fast headless simulations (<50ms) to ensure Source-to-Sink Column Preservation (zero dropped fields) and Navigation Reversibility. |
| [`headless-userflow-slice-test`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/headless-userflow-slice-test/SKILL.md) | *"test user flows"*, *"slice test"*, *"verify user journey"* | Threshold-gated headless live database persistence and multi-actor flow tests. Catches RLS breaches, trigger failures, and multi-tenant isolation leaks. |
| [`ground-up-engineering-protocol`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/ground-up-engineering-protocol/SKILL.md) | *"build from scratch"*, *"plan this build"*, *"decompose project"* | Enforces "Movement First, Casing Second" dependency ordering. Audits architectural phases before any line of feature code is written. |
| [`semver-release-craft`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/semver-release-craft/SKILL.md) | *"prepare release"*, *"cut release"*, *"bump version"* | Single Source of Truth versioning across `package.json`, automated SemVer bump rules, structured CHANGELOGs, and annotated Git tags. |

---

### Category 2: UI, Motion & Visual Polish

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`big-tech-ui-craft`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/big-tech-ui-craft/SKILL.md) | *"style this screen"*, *"clean up UI"*, *"visual polish"* | Big-tech aesthetic standard (Apple/Linear/Stripe): Automated Pre-Completion Design Gate, optical centering, subtractive minimalism, and host token confinement. |
| [`fluid-tactile-motion`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/fluid-tactile-motion/SKILL.md) | *"add animation"*, *"spring motion"*, *"tactile feedback"* | Implements physics-based spring curves, active tap highlights, hardware-accelerated transitions, and non-blocking optimistic UI updates. |
| [`phonepe-visual-ui-craft`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/phonepe-visual-ui-craft/SKILL.md) | *"phonepe ui"*, *"visual first"*, *"too much reading"* | Audits screens for zero-literacy cognitive friction: converts dense text blocks into instant semantic icon tiles with 1–2 supporting words. |
| [`big-tech-product-ux`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/big-tech-product-ux/SKILL.md) | *"ux audit"*, *"simplify flow"*, *"modal design"* | Enforces cognitive psychology, visual anchoring, zero-redundancy copy, and 3-State Taxonomy Threshold Gate (automated legend triggers). |
| [`interpretive-ui-craft`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/interpretive-ui-craft/SKILL.md) | *"strip clutter"*, *"self explanatory"*, *"app launcher style"* | Removes patronizing explanatory banners, hand-holding paragraphs, and documentation clutter, creating a confident, self-evident UI. |

---

### Category 3: Database Architecture & Concurrency

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`big-tech-db-craft`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/big-tech-db-craft/SKILL.md) | *"create table"*, *"schema change"*, *"new migration"* | Enforces the 4-phase Expand/Contract zero-downtime lifecycle, query projection restraint (no `SELECT *`), keyset cursor pagination, and defensive indexing. |
| [`big-tech-db-resilience`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/big-tech-db-resilience/SKILL.md) | *"lock safety"*, *"concurrency check"*, *"prevent race conditions"* | Production lock timeout safety, 2-phase constraint validation (`NOT VALID` $\to$ `VALIDATE`), atomic updates, and circuit-breaker query timeouts. |
| [`apply-migrations-and-push`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/apply-migrations-and-push/SKILL.md) | *"apply migrations and push"*, *"deploy changes"*, *"ship this"* | Enforces strict schema-first zero-drift migration gate, auto-provisions cloud CI, and safely pushes verified commits to GitHub. |

---

### Category 4: Agent Control, Boundaries & Knowledge Curation

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`curate-software-findings`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/curate-software-findings/SKILL.md) | *"curate findings"*, *"save to software findings"*, *"distill this"* | Automatically extracts, structures, and files high-conviction conversation insights into your permanent `Software Findings` library. |
| [`codify-system-standard`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/codify-system-standard/SKILL.md) | *"codify this"*, *"codify rule"*, *"lock this rule"*, *"codify standard"* | Automatically extracts, strips project specifics, and permanently locks engineering invariants and standards into `GEMINI.md` or domain skills. |
| [`autonomous-division-of-labor`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/autonomous-division-of-labor/SKILL.md) | *"divide labour"*, *"step by step setup"*, *"take over setup"* | Enforces maximum agent ownership. The agent executes 100% of terminal and scriptable tasks, confining human actions strictly to physical authentication. |
| [`brainstorm-and-qa`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/brainstorm-and-qa/SKILL.md) | *"brainstorm"*, *"just answer"*, *"no code changes"* | Read-only conversational brainstorming mode. Prohibits editing codebase files or generating complex implementation plans. |
| [`plan-only-mode`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/plan-only-mode/SKILL.md) | *"plan only"*, *"don't edit files yet"*, *"wait for approval"* | Locks agent in read-only advisory mode. Prohibits applying changes until the user gives explicit greenlight. |
| [`hold-git-push`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/hold-git-push/SKILL.md) | *"hold push"*, *"don't push to github"*, *"local commits only"* | Allows local git commits but strictly prevents auto-pushing to remote GitHub repositories. |
| [`start_dev_server`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/start_dev_server/SKILL.md) | *"start the server"*, *"run dev"*, *"open in browser"* | Forcefully cleans up stale processes occupying port 5173 before launching `npm run dev` in the background cleanly. |
| [`browser-devtools-audit`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/browser-devtools-audit/SKILL.md) | *"use browser devtools"*, *"inspect in browser"* | Uses Chrome DevTools MCP to test and inspect live web interfaces, network requests, console errors, and DOM elements. |
| [`ten-out-of-ten-signal-audit`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/ten-out-of-ten-signal-audit/SKILL.md) | *"10/10 audit"*, *"signal to noise ratio"*, *"strip noise"* | Extracts every element into an exhaustive inventory and applies a binary subtractive filter to remove conversational filler and structural fluff. |
| [`production-performance-and-efficiency`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/production-performance-and-efficiency/SKILL.md) | *"optimize performance"*, *"speed this up"*, *"reduce latency"* | Minimizes execution latency, enforces Just-In-Time (JIT) telemetry with 0ms in-memory living shell, and eliminates redundant payloads. |

---

### Category 5: Business, Strategy & Communication

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`idea-reality-check`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/idea-reality-check/SKILL.md) | *"prior art check"*, *"does this package exist"*, *"already solved"* | Open-source watchdog: checks npm, PyPI, and standard CLI tools to prevent writing custom code for problems already solved by active libraries. |
| [`probabilistic-idea-evaluator`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/probabilistic-idea-evaluator/SKILL.md) | *"evaluate startup"*, *"business idea check"*, *"will people buy this"* | Replaces blind cheerleading with decision-grade operator analysis: human friction, unit economics, bull/bear cases, and a 14-day low-code acid test. |
| [`adversarial-mechanism-design`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/adversarial-mechanism-design/SKILL.md) | *"design rules"*, *"prevent cheating"*, *"game theory"*, *"incentives"* | Simulates 4 bad-actor personas (Corner-Cutter, Colluder, Blind-Clicker, Extortionist) to design cheat-proof rating, unlocking, and marketplace rules. |
| [`principle-over-literalism`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/principle-over-literalism/SKILL.md) | *"don't take it literally"*, *"extract the principle"* | Prevents AI sycophancy: extracts core architectural goals from loose user metaphors instead of blindly writing literal code. |
| [`ruthless-intellectual-honesty`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/ruthless-intellectual-honesty/SKILL.md) | *"be honest"*, *"challenge assumptions"*, *"push back"*, *"scope guardrails"* | Proactive watchdog against premature optimization. Runs the 3-Test Reality Filter (Thumb Test, Combinatorial Trap, Strict Sequence Litmus) before coding. |
| [`musk-client-dm`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/musk-client-dm/SKILL.md) | *"DM"*, *"client DM"*, *"draft a DM"*, *"message to client"* | Generates ultra-dense, zero-fluff Elon Musk style client/stakeholder updates wrapped in a single 1-click copyable code block (` ```text `). |
| [`feynman-intuitive-explainer`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/feynman-intuitive-explainer/SKILL.md) | *"explain simply"*, *"ELI5"*, *"use analogies"*, *"plain english"* | Translates complex technical architecture and math into crystal-clear everyday physical mental models. |
| [`grounded-founder-outreach`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/grounded-founder-outreach/SKILL.md) | *"write outreach message"*, *"apply to startup"*, *"pitch founder"* | Generates ultra-dense (<55 word) cold messages and job applications anchored to verified live project proofs with zero AI marketing fluff. |
| [`send-outreach-email`](file:///C:/Users/AKKALA%20HEMANTH%20REDDY/.gemini/config/skills/send-outreach-email/SKILL.md) | *"send email"*, *"dispatch email"*, *"mail the founder"* | Automated Python SMTP dispatch script using environment variables (`GMAIL_USER`, `GMAIL_APP_PASSWORD`) with verified delivery logs. |
