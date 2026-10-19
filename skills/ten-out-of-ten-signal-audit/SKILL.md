---
name: ten-out-of-ten-signal-audit
description: >-
  Universal domain-agnostic 10/10 signal-to-noise ratio audit engine. Audits any system, screen, database schema, API contract, workflow, or proposal by extracting every element into an exhaustive inventory, running the ruthless binary subtractive filter, and stripping all duplicate echoes, conversational filler, and structural fluff. Trigger when asked to "10/10 audit", "signal audit", "signal to noise ratio", "audit signal", "strip noise", "ruthless audit", "cut fluff", "is there any noise", or "10/10 check".
---

# Universal 10/10 Signal-to-Noise Ratio Audit Standard

## 1. The Core Law of Maximum Signal Density

Every component, sentence, database column, API parameter, modal, index, or workflow step exists on a spectrum from pure utility to cognitive/computational waste:

$$\text{Signal Density} = \frac{\text{Information Directly Solving the Problem or Preventing Failure}}{\text{Total Information / Elements Rendered}}$$

Amateur engineering defaults to **Additive Creep**: adding redundant labels, polite conversational prompts, speculative future columns, and explanatory fluff.

**The 10/10 Standard enforces Binary Subtractive Scything:**
> **If an element does NOT either (1) directly execute the core action, or (2) prevent catastrophic failure/data loss, it is strictly classified as NOISE and eliminated.**

---

## 2. Universal 4-Domain Audit Applications

This skill operates uniformly across ANY technical or product domain:

### Domain A: UI, Screens & Microcopy
* **Duplicate State Echo**: Flag when data is rendered in two places in the same view (e.g., `0/1 Locked In` counter card + `Crew Size: 1 Claimer` card).
* **Conversational / Polite Bloat**: Flag polite padding in modals (e.g., `"Are you sure you want to abort this broadcast? Claimers in your Hive will be released"` $\to$ `"Claimers in your Hive will be released."`).
* **Self-Evident Over-Labeling**: Flag field labels when the placeholder or icon already makes it self-evident (e.g., `"Bounty Details"` label over an active textarea).
* **Explanatory Paragraphs**: Flag tutorial text or hand-holding paragraphs. Replace with 2–3 word categorical badges or delete entirely.

### Domain B: Database, Schemas & Migrations
* **Unused Speculative Columns**: Flag columns created for "future flexibility" with zero active consumers.
* **Redundant Indexes**: Flag duplicate composite indexes where a prefix index already satisfies query constraints.
* **Over-Projection**: Flag `SELECT *` across network boundaries; enforce keyset projections strictly targeting required fields.
* **Dead Nullable Chains**: Flag tables with 15 nullable columns that represent separate lifecycle stages. Enforce atomic status structures or lean JSONB boundaries.

### Domain C: API Contracts & Payloads
* **Chatty Roundtrips**: Flag client-server architectures requiring 3 consecutive requests where 1 atomic RPC or batch endpoint suffices.
* **DTO Parameter Echoes**: Flag payloads passing redundant IDs already derived from authenticated session contexts (`auth.uid()`).
* **Decorative Error Envelopes**: Flag overly complex nested error schemas where a standard status code + error message suffices.

### Domain D: Workflows, Plans & Roadmaps
* **Premature Optimization Scaffolding**: Flag tasks preparing for scale before the core MVP is deployed to real users.
* **Process / Bureaucratic Bloat**: Flag checklist steps that generate documentation without shipping code or tests.

---

## 3. The 4-Step Execution Protocol

Whenever triggered to audit any topic, screen, or layer:

### Step 1: Exhaustive Inventory Extraction (Zero Assumptions)
Inspect the target file(s) or concept directly. Extract **every single element** into a literal inventory:
* For UI: Every header, subtitle, button label, placeholder, tooltip, modal title, and subtext.
* For DB: Every column name, constraint, index, and trigger.
* For API/Logic: Every parameter, DTO field, return key, and conditional branch.

### Step 2: The Binary Subtractive Test (The Scythe)
Evaluate every inventory item against two questions:
1. *Does removing this element break functionality or cause user confusion?* (If No $\to$ **FLAG AS NOISE**).
2. *Is this information already visible elsewhere in the immediate context?* (If Yes $\to$ **FLAG AS DUPLICATE NOISE**).

### Step 3: Compute Mathematical Signal Score (1.0 to 10.0)
$$\text{Score} = 10 \times \left(1 - \frac{\text{Noise Elements Found}}{\text{Total Elements Audited}}\right)$$
* **10.0**: Pure signal. Zero duplicate data, zero decorative copy, zero conversational fluff.
* **8.0–9.9**: Minor copy wordiness or slightly repetitive microcopy.
* **< 8.0**: Severe duplication, tutorial paragraphs, or redundant state counters.

### Step 4: Deliver via Strict 3-Field Protocol
Report findings strictly using the 3-field dense format:
- **Before**: Exact broken or noisy state (with line numbers/source references).
- **After**: Surgical replacement code, schema patch, or microcopy diff.
- **Improvement**: Metric, character reduction, query efficiency, or cognitive load impact.
