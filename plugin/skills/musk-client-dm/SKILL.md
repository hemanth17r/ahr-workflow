---
name: musk-client-dm
description: >-
  Generates ultra-dense, zero-fluff, Elon Musk style direct messages (DMs) for clients, founders, and stakeholders wrapped in a single 1-click copyable code block. Trigger whenever the user says "DM", "draft DM", "client DM", "write a DM", "send a DM", "message to client", "reply to client", "DM the client", or "musk style DM".
---

# Musk-Style Client DM Protocol (Zero-Noise Direct Messaging)

## Core Law
When an operator or founder communicates progress, scope boundaries, or triage decisions to a client or stakeholder, **noise is fatal**. Corporate jargon, diplomatic hedging, and robotic AI politeness ("I hope this message finds you well", "Thank you so much for sharing") erode credibility. Speak as a high-velocity technical operator: direct, clear, plain-spoken, and razor-sharp.

---

## 1. Trigger Conditions
Automatically activate this protocol whenever the prompt contains or implies:
* `"DM"`
* `"client DM"`
* `"draft DM"` / `"draft a DM"`
* `"send a DM"`
* `"message the client"` / `"message to client"`
* `"reply to client"`
* `"write a DM"`

---

## 2. Non-Negotiable Delivery Format: 1-Click Copy Code Block
* **Strict Single Code Block Requirement:** The entire client-ready draft MUST be wrapped in a single ` ```text ` or ` ```markdown ` code block so the user can copy it in exactly one click from the chat UI without manual formatting.
* **Zero Structural Scaffolding Outside:** Keep any commentary outside the code block to 1 sentence maximum, or output the code block directly.

---

## 3. Structural Anatomy of a Musk-Grade DM
Every DM follows this exact 4-part architecture:

1. **The Lead (1 sentence):** Direct factual acknowledgment without groveling or filler.
   * *Good:* "Reviewed the screens. Visual direction is solid."
   * *Bad:* "Hi there! Thank you so much for taking the time to share these wonderful wireframes with us."

2. **The Shipped / Live Scope (Bullet points):** 
   * State what was built, what screen it changes, and why it benefits the end user.
   * Plain English only. Strictly ban internal plumbing jargon (no hooks, RPC names, SQL schemas, or framework terms).

3. **The Cut / Out-of-Scope Scope (Bullet points with Ruthless ROI Reasons):**
   * Never just say "out of scope"—explain the direct business, conversion, or performance reason why cutting it benefits the launch.
   * Examples:
     * *Maps:* "Live mileage gives the exact same proximity signal in 0ms without paid API costs or mobile lag."
     * *Reviews:* "Showing 0 reviews kills customer trust; building moderation forms delays launch."
     * *Splash gates:* "Web shoppers bounce if forced through a welcome screen before seeing products."

4. **The Closing (1 sentence):** Direct handoff to test live.
   * *Good:* "Ready for you to test live." / "Live on staging for your review."

---

## 4. Banned Anti-Patterns
* ❌ "Hope you're having a great week!"
* ❌ "Please don't hesitate to reach out if you have any questions or concerns."
* ❌ "We have successfully refactored the RPC endpoints and Tailwind CSS tokens."
* ❌ "Per our contractual scope agreement..."
* ❌ Paragraph essays where 3 bullet points suffice.
