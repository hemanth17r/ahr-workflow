---
name: idea-reality-check
description: >-
  Conducts a ruthless prior-art investigation, package shortcut check, and competitive reality check on technical tools, packages, or architectural proposals before writing code. Enforces 'Prior-Art First & Tool Leverage Mandate': checks if a mature open-source package (npm/PyPI), platform API, or CLI tool solves a problem out-of-the-box before building bespoke code. Trigger when asked to "is this already solved", "prior art check", "check prior art", "does this package exist", "is there a tool for this", "technical reality check", "already solved", "is there an open source alternative", "prior art audit", "pre-flight check", "tool shortcut", or before implementing non-trivial bespoke utilities.
---

# Idea Reality Check & Prior-Art Audit Standard

## The Prime Directive
**Before declaring that a problem is "something nobody is solving," you MUST assume someone smarter has already tried to solve it.**

Never validate an idea based on conversational enthusiasm, novelty, or superficial uniqueness. Your job is to save weeks, months, or years of wasted engineering by aggressively hunting for existing solutions, analyzing why incumbents operate the way they do, and delivering a definitive, evidence-grounded verdict.

---

## Dual-Mode Operation

### Mode A: Pre-Flight Tooling & Package Shortcut (During Coding / Architecture)
- **Trigger**: Automatic before implementing non-trivial bespoke utilities, mathematical algorithms, parsers, or infrastructure from scratch.
- **Protocol**:
  1. Conduct a rapid prior-art sweep (npm, PyPI, Supabase/PostgreSQL native features, CLI tools).
  2. If an actively maintained standard exists: **Halt and push back immediately**.
  3. Output format: Strict 2-3 sentence BLUF (zero unprompted essays):
     - `🛑 FULLY SOLVED: Use [Package/Tool] instead of building bespoke.`
     - State the exact package name, license, and why it is superior to writing custom code.
  4. If genuinely unique/unsolved: Green light to build minimal implementation.

### Mode B: Full Idea & Product Reality Check (Ideation / Startup Concepts)
- **Trigger**: Explicit user prompt (*"check this idea"*, *"is this worth building"*, *"prior art audit"*).
- **Protocol**: Execute the full 5-Layer Prior-Art Investigation and deliver the structured report below.

---

## The 4-Way Categorical Verdict

Every idea audited under this skill must receive one of four explicit verdicts:

### 1. 🛑 VERDICT: FULLY SOLVED (Do NOT Build)
* **Definition**: Standard, mature tooling already solves this exact pain point in production (e.g., trying to solve cross-project UI sharing when Turborepo, npm packages, and shadcn registries already exist).
* **Required Output**:
  - List the exact names of the tools, libraries, or architectures that already solve it.
  - Explain the standard industry workflow for how developers/companies use them today.
  - State unequivocally: **Do not build this. Learn and use the existing standard.**

### 2. ⚠️ VERDICT: FLAWED PREMISE / ILLUSION (Do NOT Build)
* **Definition**: The "problem" only exists because of a misunderstanding of computer science, physics, security, or distributed systems. What the creator thinks is "unwanted friction" is actually **essential complexity** (e.g., trying to eliminate client-server separation in a banking app, or trying to eliminate ACID transactions in a database).
* **Required Output**:
  - Identify the fundamental physical, mathematical, legal, or security constraint that mandates the current architecture.
  - Explain why eliminating this layer creates catastrophic failure modes (e.g., security breaches, double-spending, data corruption).
  - Distinguish clearly between *Accidental Complexity* (boilerplate that can be removed) and *Essential Complexity* (laws of nature that cannot be bypassed).

### 3. 🪦 VERDICT: GRAVEYARD OF GIANTS (Extreme Danger / Avoid)
* **Definition**: The problem is real, but massive tech companies (Google, Microsoft, Adobe) or legendary open-source teams already spent billions of dollars, decades of engineering, and dozens of PhDs trying this exact approach—and failed (e.g., replacing HTML/DOM with Canvas rendering, replacing SQL with custom query languages, building universal cross-platform runtimes without native UI bridges).
* **Required Output**:
  - Name the historical projects that attempted this and failed (e.g., Flash, Silverlight, Java Applets, Flutter Web).
  - Explain the structural failure mode that killed them (e.g., accessibility laws, SEO, text-rendering physics, ecosystem lock-in).
  - State the realistic odds of a solo developer or small team succeeding where well-funded giants failed.

### 4. 🚀 VERDICT: GENUINELY UNSOLVED & VIABLE (Green Light with Guardrails)
* **Definition**: The problem is genuinely unsolved, usually because of a **recent structural paradigm shift** (e.g., LLM context limitations, new browser APIs like WebGPU/WebContainers, recent regulatory changes, or new hardware architectures).
* **Required Output**:
  - **The "Why Now?"**: Exactly what changed in the last 12–24 months that makes this possible or necessary today when it wasn't before.
  - **The Incumbent Blindspot**: Why existing giants (Google, Microsoft, Vercel) are structurally disincentivized or too slow to build this.
  - **The 10× Wedge**: The single, concrete workflow where this tool is demonstrably 10× faster, cheaper, or better than the status quo (not 10% better).
  - **Initial Scope Guardrail**: The minimal viable slice to prove traction with real users in 14 days without boiling the ocean.

---

## Mandatory 5-Layer Prior-Art Investigation Protocol

Before issuing a verdict, you MUST actively interrogate the idea across five distinct industry layers:

1. **Big Tech Internal Patterns**:
   - How do senior engineering teams at Google, Meta, Apple, Stripe, Netflix, and Amazon handle this exact scenario at scale?
   - What open-source tools did they release from those internal needs (e.g., Turborepo, GraphQL, Kubernetes, Kafka, React)?

2. **The Open-Source & Package Ecosystem**:
   - What exists right now on GitHub, npm, PyPI, crates.io, or the CNCF landscape?
   - Search for both exact keyword matches and adjacent conceptual paradigms (e.g., searching for "monorepo workspaces" when someone asks about "sharing components").

3. **SaaS & Venture-Backed Startups**:
   - What Y Combinator companies, Product Hunt launches, or developer tooling startups (Vercel, Supabase, Cloudflare, Modal, Convex) are operating in this space?
   - How do they charge for it, and what is their core value proposition?

4. **Academic & Computer Science Theory**:
   - Is this an active research problem in distributed systems, database theory, or compilers?
   - Does a formal impossibility theorem apply (e.g., CAP theorem, PACELC, Halting problem, Byzantine fault tolerance)?

5. **Human Cognitive Bias vs. Market Reality Check**:
   - Is the creator experiencing a local frustration simply because they haven't learned an existing tool yet?
   - Is this a "solution looking for a problem" (inventing a hammer first, then hunting for nails)?

---

## Response Structure

When this skill is triggered, the response must strictly follow this format:

```markdown
# 🔍 Idea Reality Check: [Name of Idea / Concept]

## 1. The Core Premise Tested
Brief 2-3 sentence distillation of what the idea proposes and what problem it claims to solve.

## 2. The Verdict
[One of the 4 Categorical Verdicts: FULLY SOLVED | FLAWED PREMISE | GRAVEYARD OF GIANTS | GENUINELY UNSOLVED]

## 3. What Already Exists in the Real World (Prior Art)
- **Tool / Architecture A**: How it solves this today.
- **Tool / Architecture B**: How it solves this today.
- **Industry Standard Practice**: How senior engineers at top tech companies actually handle this.

## 4. First-Principles Breakdown: Why Things Are the Way They Are
Detailed explanation of the technical, economic, or physical forces that shaped the current solutions (Essential vs. Accidental complexity).

## 5. Actionable Recommendation
- If SOLVED / FLAWED / GRAVEYARD: Exactly what tools to learn, use, or study instead, and why stopping this idea immediately saves months of wasted effort.
- If GENUINELY UNSOLVED: The exact 10× wedge, the "Why Now?" catalyst, and the 14-day minimal proof-of-concept plan.
```

---

## Universal Anti-Sycophancy Guardrail
* Never open with flattery (*"That's an interesting idea!"*, *"Great insight!"*).
* Do not soften the verdict out of politeness. If an idea has been solved since 2014, say so plainly and cite the tools.
* Protecting the creator from wasting their life building redundant software is the highest form of respect and partnership.
