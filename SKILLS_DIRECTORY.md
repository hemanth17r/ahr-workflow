# AHR Skills Directory (Master 30-Skill Registry)

> **Maintained by**: Akkala Hemanth Reddy (`ahr`)  
> **Contact**: `hemanth17r@gmail.com`  
> **Philosophy**: Zero bloat. Every skill serves as a high-conviction guardrail that prevents the agent from hallucinating, making speculative edits, or wasting context window tokens.

Antigravity leverages **Progressive Disclosure**: only the skill name and description are kept in memory until the conversation intent requires it. This keeps prompt budgets fast and inexpensive.

---

## 🛠️ Category 1: Core Engineering & Bug Triage

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`root-cause-triage`](./skills/root-cause-triage/SKILL.md) | *"debug this bug"*, *"why is this failing"*, *"fix error"* | **Zero Speculative Edits**: Forbids modifying production code until an automated, deterministic reproduction test is written and failing first. |
| [`strict-ground-truth-audit`](./skills/strict-ground-truth-audit/SKILL.md) | *"audit everything"*, *"verify logics"*, *"ground truth check"* | Verifies all data layers end-to-end (persistence, query syntax, data mappers, edge cases). Prohibits reporting completion without live proof. |
| [`shift-left-verification`](./skills/shift-left-verification/SKILL.md) | *"write tests"*, *"test this"*, *"add test coverage"* | Enforces Google Small Tests (<100ms, zero I/O) and co-development. Eliminates mocking illusions and implementation-detail testing. |
| [`blackbox-logic-flow-audit`](./skills/blackbox-logic-flow-audit/SKILL.md) | *"audit wiring"*, *"state flow check"*, *"verify data travel"* | Runs fast headless simulations (<50ms) to ensure Source-to-Sink Column Preservation (zero dropped fields) and Navigation Reversibility. |
| [`ground-up-engineering-protocol`](./skills/ground-up-engineering-protocol/SKILL.md) | *"build from scratch"*, *"plan this build"*, *"decompose project"* | Enforces "Movement First, Casing Second" dependency ordering. Audits architectural phases before any line of feature code is written. |
| [`semver-release-craft`](./skills/semver-release-craft/SKILL.md) | *"prepare release"*, *"cut release"*, *"bump version"* | Single Source of Truth versioning across `package.json`, automated SemVer bump rules, structured CHANGELOGs, and annotated Git tags. |

---

## 🎨 Category 2: UI, Motion & Visual Polish

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`big-tech-ui-craft`](./skills/big-tech-ui-craft/SKILL.md) | *"style this screen"*, *"clean up UI"*, *"visual polish"* | Big-tech aesthetic standard (Apple/Linear/Stripe): optical centering, 3-tier color palettes, 375px mobile viewport budgets, and typography hierarchies. |
| [`fluid-tactile-motion`](./skills/fluid-tactile-motion/SKILL.md) | *"add animation"*, *"spring motion"*, *"tactile feedback"* | Implements real physics-based spring curves, active tap highlights, hardware-accelerated transitions, and non-blocking optimistic UI updates. |
| [`phonepe-visual-ui-craft`](./skills/phonepe-visual-ui-craft/SKILL.md) | *"phonepe ui"*, *"visual first"*, *"too much reading"* | Audits screens for zero-literacy cognitive friction: converts dense text blocks into instant semantic icon tiles with 1–2 supporting words. |
| [`big-tech-product-ux`](./skills/big-tech-product-ux/SKILL.md) | *"ux audit"*, *"simplify flow"*, *"modal design"* | Enforces cognitive psychology, visual anchoring, zero-redundancy copy, and balanced friction-vs-flavor mechanics. |
| [`interpretive-ui-craft`](./skills/interpretive-ui-craft/SKILL.md) | *"strip clutter"*, *"self explanatory"*, *"app launcher style"* | Removes patronizing explanatory banners, hand-holding paragraphs, and documentation clutter, creating a confident, self-evident UI. |

---

## 🗄️ Category 3: Database Architecture & Concurrency

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`big-tech-db-craft`](./skills/big-tech-db-craft/SKILL.md) | *"create table"*, *"schema change"*, *"new migration"* | Enforces the 4-phase Expand/Contract zero-downtime lifecycle, query projection restraint (no `SELECT *`), keyset cursor pagination, and defensive indexing. |
| [`big-tech-db-resilience`](./skills/big-tech-db-resilience/SKILL.md) | *"lock safety"*, *"concurrency check"*, *"prevent race conditions"* | Production lock timeout safety, 2-phase constraint validation (`NOT VALID` $\to$ `VALIDATE`), atomic updates, and circuit-breaker query timeouts. |
| [`apply-migrations-and-push`](./skills/apply-migrations-and-push/SKILL.md) | *"apply migrations and push"*, *"deploy changes"*, *"ship this"* | Automatically checks secrets, runs pending database migrations, verifies type/build safety, and pushes clean commits to GitHub. |

---

## ⚡ Category 4: Agent Control & Execution Boundaries

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`autonomous-division-of-labor`](./skills/autonomous-division-of-labor/SKILL.md) | *"divide labour"*, *"step by step setup"*, *"take over setup"* | Enforces maximum agent ownership. The agent executes 100% of terminal and scriptable tasks, confining human actions strictly to physical authentication. |
| [`brainstorm-and-qa`](./skills/brainstorm-and-qa/SKILL.md) | *"brainstorm"*, *"just answer"*, *"no code changes"* | Read-only conversational brainstorming mode. Prohibits editing codebase files or generating complex implementation plans. |
| [`plan-only-mode`](./skills/plan-only-mode/SKILL.md) | *"plan only"*, *"don't edit files yet"*, *"wait for approval"* | Locks agent in read-only advisory mode. Prohibits applying changes until the user gives explicit greenlight. |
| [`hold-git-push`](./skills/hold-git-push/SKILL.md) | *"hold push"*, *"don't push to github"*, *"local commits only"* | Allows local git commits but strictly prevents auto-pushing to remote GitHub repositories. |
| [`start_dev_server`](./skills/start_dev_server/SKILL.md) | *"start the server"*, *"run dev"*, *"open in browser"* | Forcefully cleans up stale processes occupying port 5173 before launching `npm run dev` in the background cleanly. |
| [`browser-devtools-audit`](./skills/browser-devtools-audit/SKILL.md) | *"use browser devtools"*, *"inspect in browser"* | Uses Chrome DevTools MCP to test and inspect live web interfaces, network requests, console errors, and DOM elements. |
| [`ten-out-of-ten-signal-audit`](./skills/ten-out-of-ten-signal-audit/SKILL.md) | *"10/10 audit"*, *"signal to noise ratio"*, *"strip noise"* | Extracts every element into an exhaustive inventory and applies a binary subtractive filter to remove conversational filler and structural fluff. |
| [`production-performance-and-efficiency`](./skills/production-performance-and-efficiency/SKILL.md) | *"optimize performance"*, *"speed this up"*, *"reduce latency"* | Minimizes execution latency, eliminates redundant network payloads, and optimizes high-overhead database operations. |

---

## 🎯 Category 5: Business, Strategy & Communication

| Skill | Trigger Keywords | Physical Screen / Developer Outcome |
| :--- | :--- | :--- |
| [`idea-reality-check`](./skills/idea-reality-check/SKILL.md) | *"prior art check"*, *"does this package exist"*, *"already solved"* | Open-source watchdog: checks npm, PyPI, and standard CLI tools to prevent writing custom code for problems already solved by active libraries. |
| [`probabilistic-idea-evaluator`](./skills/probabilistic-idea-evaluator/SKILL.md) | *"evaluate startup"*, *"business idea check"*, *"will people buy this"* | Replaces blind cheerleading with decision-grade operator analysis: human friction, unit economics, bull/bear cases, and a 14-day low-code acid test. |
| [`adversarial-mechanism-design`](./skills/adversarial-mechanism-design/SKILL.md) | *"design rules"*, *"prevent cheating"*, *"game theory"*, *"incentives"* | Simulates 4 bad-actor personas (Corner-Cutter, Colluder, Blind-Clicker, Extortionist) to design cheat-proof rating, unlocking, and marketplace rules. |
| [`principle-over-literalism`](./skills/principle-over-literalism/SKILL.md) | *"don't take it literally"*, *"extract the principle"* | Prevents AI sycophancy: extracts core architectural goals from loose user metaphors instead of blindly writing literal code. |
| [`ruthless-intellectual-honesty`](./skills/ruthless-intellectual-honesty/SKILL.md) | *"be honest"*, *"challenge assumptions"*, *"push back"* | Proactive watchdog against premature optimization and scope creep. Challenges tasks that break the strict MVP sequence. |
| [`feynman-intuitive-explainer`](./skills/feynman-intuitive-explainer/SKILL.md) | *"explain simply"*, *"ELI5"*, *"use analogies"*, *"plain english"* | Translates complex technical architecture and math into crystal-clear everyday physical mental models. |
| [`grounded-founder-outreach`](./skills/grounded-founder-outreach/SKILL.md) | *"write outreach message"*, *"apply to startup"*, *"pitch founder"* | Generates ultra-dense (<55 word) cold messages and job applications anchored to verified live project proofs with zero AI marketing fluff. |
| [`send-outreach-email`](./skills/send-outreach-email/SKILL.md) | *"send email"*, *"dispatch email"*, *"mail the founder"* | Automated Python SMTP dispatch script using environment variables (`GMAIL_USER`, `GMAIL_APP_PASSWORD`) with verified delivery logs. |
