---
name: big-tech-product-ux
description: >-
  Universal product design, cognitive psychology, microcopy economy, and UX architecture standard (Apple, Google, Stripe level). Codifies visual anchoring, nuanced explanation taxonomy, zero-redundancy copywriting, and the flavor-vs-friction matrix for ANY project or screen type. Trigger when designing or adjusting user flows, writing microcopy/labels, architecting navigation, deciding on explanations, creating forms and modals, or organizing information hierarchy.
---

# Universal Big-Tech Product UX & Cognitive Architecture Standard

## 1. The Core Philosophy: The 0.1-Second Intuition Rule

A user should never have to stop and think: *"Wait, what does this mean?"*
Big-Tech interfaces (Apple, Google, Stripe, Airbnb) feel intuitive because they leverage **existing mental models**. They do not force users to decode novel UI jargon or navigate cluttered canvases. Every screen communicates its core purpose in **0.1 seconds**.

---

## 2. Universal Visual Anchoring (Symbols Before Text)

The human visual cortex parses shapes, iconography, and spatial cues orders of magnitude faster than alphanumeric text.
* **The Rule**: Whenever introducing a concept—especially one with branding or unique flavor—**anchor it with an unmistakable, universally recognized visual symbol**.
* **Visual Anchor Matrix**:
  | Concept | Universal Symbol Anchor | Example Label | Why It Succeeds |
  | :--- | :--- | :--- | :--- |
  | **Reputation / Rating** | `⭐` (Star) | `⭐ 4.9` | The star immediately signals "rating". Text label is optional. |
  | **Financial / Currency** | `$` / `€` / `£` / `¥` (Currency Glyph) | `$120` / `€95` | The currency symbol does 100% of the identification work. |
  | **Location / Radius** | `📍` (Map Pin) | `📍 Downtown (2.5 km)` | The pin instantly communicates geography. |
  | **Activity / Quests** | `🎯` / `⚡` (Target / Bolt) | `⚡ 12 Active` | Symbol prevents confusion with static counts. |
  | **Status / Safety** | `🛡️` / `✓` (Shield / Checkmark) | `✓ Verified Profile` | Symbol conveys trust in <100ms. |

* **The Unanchored Trap**: Never use creative, branded, or domain-specific words (e.g., *Loadout*, *Telemetry*, *Outlay*, *Roster*) without an immediate, universally recognized physical icon next to them.

---

## 3. Microcopy Economy ("Every Word Must Earn Its Pixel")

Amateur interfaces clutter the screen with repetitive, stating-the-obvious helper text. Big-Tech interfaces practice rigorous verbal restraint:

### A. The Zero-Redundancy Rule
Never repeat the same noun across the label, placeholder, and button.
* ❌ **Amateur / Redundant:**
  - Label: `User Email Address`
  - Placeholder: `Enter your email address here`
  - Button: `Submit Email Address`
* ✅ **Big-Tech Standard:**
  - Label: `Email`
  - Placeholder: `alex@example.com`
  - Button: `Continue`

### B. Action-Verb Primacy
Buttons should lead with a strong, single-action verb (1–2 words maximum):
* Use `Save`, `Create`, `Send`, `Submit`, `Confirm`, `Connect`.
* Avoid bloated phrasing like `Click Here to Submit Information`.

### C. The Anti-Additive Duplication Law
Never announce the same concept across multiple adjacent surfaces (e.g. an in-form caption + a button label + a modal + a subtitle). 
* Choose the single primary interactive touchpoint (e.g. an interactive `Safety Guidelines` button).
* Ruthlessly delete adjacent passive paragraphs, duplicate captions, and summary echoes.

### D. The Anti-Preamble Law (Zero Meta-Prose)
Eliminate all conversational preambles and meta-instructions:
* ❌ *"Keep these 2 reminders in mind before posting your first bounty:"*
* ❌ *"Here are a few quick tips to get started:"*
* ✅ **Delete the preamble completely.** The heading and cards speak for themselves with zero hand-holding.

---

## 4. Nuanced Explanation Taxonomy: When to Explain vs. When to Be Silent

> [!IMPORTANT]
> **Eliminating clutter does NOT mean deleting critical explanations.** Big-Tech apps explain constantly, but they do so **purposefully, concisely, and contextually**.

| Context | Action | Big-Tech Standard | Anti-Pattern to Avoid |
| :--- | :--- | :--- | :--- |
| **Permissions** | **Always Explain** | State *why* before triggering OS prompt: *"App needs your location to show nearby items within 5 km."* | Blank prompt with no explanation, or a 4-paragraph legal treatise. |
| **Financial & Fees** | **Always Explain** | Be 100% transparent: *"0% platform fee during beta. Direct peer-to-peer settlement upon completion."* | Hiding fees in the name of "minimalism." |
| **Privacy & Data Security** | **Always Explain** | Reassure where data goes: *"Your phone number is only shared with confirmed participants."* | Stating the obvious: *"This field is for entering your phone number."* |
| **Destructive Actions** | **Always Explain** | Detail consequences clearly: *"Deleting this project will permanently remove 14 tasks and cannot be undone."* | Silent deletion or a generic "Are you sure?" dialog. |
| **Self-Explanatory Inputs** | **Never Explain** | Keep completely silent. The label (`Name`) and placeholder (`Felix Wing`) are sufficient. | Adding a subtitle: *"Enter your full legal name so other users can see who you are."* |

---

## 5. The "Flavor vs. Friction" Decision Matrix

Every product must balance personality with functional utility. Use this matrix to govern terminology across your application:

```
                          HIGH FRICTION RISK (Account / Auth / Payments / Settings)
                                                  ▲
                                                  │  STRICT PLAIN UTILITY ONLY
                                                  │  • Name, Phone, Email, Password
                                                  │  • Card / Bank / UPI Details
                                                  │  • Legal Terms & Privacy Disclosures
                                                  │  • Save, Delete, Cancel buttons
                                                  │
──────────────────────────────────────────────────┼──────────────────────────────────────────────────►
                                                  │  THEMATIC, GAMIFIED & BRAND FLAVOR
                                                  │  • Levels, XP Bars, Progression
                                                  │  • Badges, Avatars, Milestones
                                                  │  • Quests, Challenges, Achievement Tags
                                                  │  • Community Ranks & Leaderboards
                                                  │
                                                  ▼
                          LOW FRICTION RISK (Progression / Delight / Discovery)
```

* **Rule**: When money, authentication, or account data is on the line, speak with absolute clarity (zero playful jargon). Save your brand personality and gamification for discovery, progression, and celebration moments.

---

## 6. The Industry Benchmark Principle (Never Invent in a Vacuum)

Whenever designing a component or interaction pattern (search filter sheet, drawer, address selector, payment confirmation, notification center):
1. **Identify the Proven Industry Standard**: Look at how Apple, Google, Stripe, or Airbnb solved the exact same interaction.
2. **Borrow the Battle-Tested Ergonomics**: Adopt the proven tap targets, natural dismissal gestures, keyboard avoidance math, and visual hierarchy.
3. **Apply Your Product's Visual Theme**: Wrap that rock-solid ergonomic foundation in your brand's color tokens, typography, and iconography. Never force users to learn experimental, unverified interaction models.

---

## 7. Progressive Disclosure Architecture

Keep the primary canvas clean and airy. If contextual help or secondary options are needed:
* Use a subtle info trigger (`<Info size={14} />`) that reveals an optical popover or tooltip on demand.
* Use expandable summary drawers (`<details>` / accordion) for multi-step or advanced settings.
* Never dump secondary instruction manuals onto the primary screen canvas.

---

## 8. UX Pre-Flight Checklist (For Every Feature)

- [ ] **Visual Anchor Check**: Does every numerical metric or key status lead with a universal icon (`⭐`, `$`, `📍`, `✓`)?
- [ ] **Zero-Redundancy Check**: Are labels, placeholders, and buttons free from repeating the same words?
- [ ] **Explanation Context Check**: Are explanations reserved for privacy, financial, permission, and destructive safety, while self-explanatory inputs remain clean?
- [ ] **Friction Check**: Are billing, settings, and auth fields written in 100% plain English without confusing brand jargon?
- [ ] **Button Decisiveness**: Are CTA buttons 1 to 2 words leading with an action verb?
