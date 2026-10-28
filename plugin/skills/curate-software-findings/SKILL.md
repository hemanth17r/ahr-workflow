---
name: curate-software-findings
description: >-
  Universal knowledge distillation and intellectual property curator. Automatically extracts, synthesizes, and files high-value insights, technical solutions, startup ideas, product UX models, or architectural breakthroughs from the current conversation directly into the user's permanent Software Findings repository. Trigger on any save/curate intent: "save this", "curate findings", "save to software findings", "distill this", "save findings", "curate this", "extract findings", "capture finding", "add to findings", "add to software findings", "store finding", "save this insight", or "distill conversation".
---

# Universal Software Findings Curator Standard

## 1. Core Operating Philosophy: The IP Synthesis Mandate

When the user triggers this skill, it is an explicit high-conviction signal:
> **"What was discovered, designed, or debated in this conversation represents permanent intellectual property. Extract it, structure it into a decision-grade document, and file it in the Software Findings repository."**

The agent must never dump raw chat logs or superficial summaries. It must act as a Senior Research & Architecture Editor: applying a ruthless **10/10 Binary Subtractive Filter** to strip all conversational chatter, debugging rabbit holes, and transient friction, condensing the discussion into an authoritative, permanent asset.

---

## 2. The Repository Root & Taxonomy

The permanent repository root is located at:
```
G:\My Drive\Software Findings\
```

### The 5 Standard Categories:
1. **`1_standards/`**: Hard engineering rules, database patterns, location/spatial math, security protocols, and system architecture playbooks (`DB-01`, `LOC-01`, `TEST-01`, `ENG-01`, `SYS-01`).
2. **`2_product_and_ux/`**: Cognitive psychology, interface ergonomics, visual anchoring, copywriting taxonomies, design systems, and visual inspiration references (`DES-01`, `UX-01`).
3. **`3_business_physics/`**: Startup viability models, market teardowns, unit economics, founder outreach protocols, game theory, and overarching thesis papers.
4. **`4_reusable_modules/`**: Portable, copy-pasteable production code primitives extracted from client work (e.g., payment handlers, specialized hooks, headless engines).
5. **`5_project_blueprints/`**: Executive tech stack specifications, MVP feature definitions, and system architecture blueprints organized into project subfolders (e.g., `helphive/`, `civiclens/`, `spurkle/`, `mlue/`, `svara/`).

### Dynamic Category Rule:
If the finding represents a completely distinct, orthogonal domain that does not naturally belong to the 5 standard categories (e.g., `hardware_and_edge_nodes`, `ai_agent_evals`, or `regulatory_compliance`), **create a clean new numbered category** (`6_<category_slug>/`) or an appropriate subfolder rather than forcing it into an unnatural category.

---

## 3. The 4 Insight Archetypes & Document Schemas

The agent must automatically detect the archetype of the conversation's core breakthrough and render the document using the corresponding schema:

---

### Archetype A: System Architecture & Technical Breakthroughs
* **Target:** `1_standards/` or `4_reusable_modules/`
* **Naming:** `[PREFIX-ID]_[YYMMDD]_[kebab_case_slug].md` (e.g. `LOC-02_261028_turn_by_turn_dispatch.md`)
* **Prefix Taxonomy:**
  * `DB-` (Database, Migrations, Locking)
  * `LOC-` (Geospatial, Mapping, Addressing)
  * `SYS-` (System Architecture, Protocols, Sync)
  * `TEST-` (Verification, TDD, Audits)
  * `SEC-` (Authentication, RLS, Cryptography)
  * `DEP-` (DevOps, CI/CD, Zero-Downtime)
* **Required Document Structure:**
  1. **Metadata Table:** Artifact ID, Date Tag (`YYMMDD`), Domain, Status (`Active Standard`), Scope.
  2. **Core Philosophy / Problem Statement:** Why existing approaches fail or carry excessive cost/friction.
  3. **Architectural Comparison Matrix:** Trade-offs across cost, latency, complexity, and failure modes.
  4. **The Screen & System Flow:** Visual ASCII or Mermaid diagram of data travel and user screens.
  5. **The Concrete Implementation / Code:** The pure mathematical formula, SQL schema, or TypeScript primitive.
  6. **Edge Cases & Operational Mitigations:** What breaks in the real world and how to prevent it.

---

### Archetype B: Product Design, UX & Behavioral Mechanics
* **Target:** `2_product_and_ux/`
* **Naming:** `[DES|UX]-[ID]_[YYMMDD]_[kebab_case_slug].md`
* **Required Document Structure:**
  1. **Metadata Table:** Artifact ID, Date Tag, Domain, Focus Area.
  2. **The Psychological Invariant:** The human cognitive principle driving the design (e.g. visual anchoring over text).
  3. **The Physical Screen Journey:** What the user sees in 0.1s, what they tap, how the UI provides immediate tactile feedback.
  4. **Before vs. After Contrast:** Bad UX (high cognitive friction) vs. Good UX (zero-literacy clarity).
  5. **Vernacular & Microcopy Rules:** Exact forbidden words vs. approved action verbs.

---

### Archetype C: Startup Theses, Market Physics & Problem Teardowns
* **Target:** `3_business_physics/`
* **Naming:** `[YYMMDD]_[kebab_case_slug].md` or `[kebab_case_slug].md`
* **Required Document Structure:**
  1. **Executive Thesis:** Core contrarian truth or market opportunity in 1–2 sentences.
  2. **The Incumbent Flaw:** Why existing giants (Google, Amazon, Swiggy) cannot solve this due to incentive structures or legacy architectures.
  3. **Incentive & Actor Dynamics:** What drives each stakeholder (producers, consumers, operators) and where bad actors cheat.
  4. **The Unit Economics & Distribution Model:** How value is captured without heavy capital burn.
  5. **14-Day Low-Code Acid Test:** How to empirically validate market demand before building heavy software.

---

### Archetype D: Project Tech Stacks & Feature Blueprints
* **Target:** `5_project_blueprints/<project_name>/`
* **Naming:** `[ProjectName]_[Specification_Type].md` (or PDF if converting a formal document)
* **Required Document Structure:**
  1. **Product Identity:** Working name, core one-sentence value proposition, target customer persona.
  2. **Core Loop:** The primary 3-step transactional loop of the platform.
  3. **Production Tech Stack:** Frontend, Backend, Database, Auth, Third-Party APIs, and Hosting.
  4. **Data Model & Entity Boundaries:** Primary tables, relations, and state transition enums.
  5. **Deployment & Cost Strategy:** Free-tier utilization, scaling bottlenecks, and launch milestones.

---

## 4. Execution Workflow Protocol

When triggered, execute these steps sequentially without pausing for unnecessary confirmations:

1. **Scan Conversation Context:**
   * Identify the central technical solution, strategic insight, or architectural debate that occurred.
   * Strip away all conversational scaffolding, trivial debugging errors, and temporary instructions.

2. **Inspect Existing Repository State:**
   * Scan `G:\My Drive\Software Findings\` to check existing files, subdirectories, and highest prefix numbers (e.g., if `LOC-01` exists, assign `LOC-02`).

3. **Synthesize the Document:**
   * Apply the appropriate Archetype Schema (A, B, C, or D).
   * Ensure maximum information density (10/10 Signal-to-Noise).
   * Formulate KaTeX math equations, Mermaid diagrams, and code snippets where appropriate.

4. **Write to Destination:**
   * Write the file cleanly to its designated category in `G:\My Drive\Software Findings/`.
   * If a project folder or specialized category does not exist, create it automatically.

5. **Deliver Dense Verification Report:**
   Output strictly a 3-field report with zero conversational filler:
   * **Item:** Artifact ID and Title.
   * **Location:** Clickable Markdown link (`[filename.md](file:///G:/My%20Drive/Software%20Findings/...)`).
   * **Core Insight Codified:** 1–2 dense sentences summarizing the permanent knowledge preserved.
