---
name: phonepe-visual-ui-craft
description: >-
  Universal visual-first UI architecture and audit engine inspired by PhonePe's hyper-intuitive, zero-literacy interface standard. Audits any web or mobile screen and refactors text-heavy cognitive friction into instant, semantic icon-anchored action tiles with 1-2 supporting words. Trigger when asked for "phonepe ui", "phonepe style", "phonepe audit", "icon first ui", "visual first ui", "too much reading", "make it visual like phonepe", "zero literacy ui", or when auditing interfaces for visual recognition over reading.
---

# Universal Visual-First UI Craft & Audit Standard (PhonePe Archetype)

## 1. The Core Philosophy: Visual Cognition Over Reading

Amateur interfaces force users to read sentences, parse syntax, and deduce action targets. 

**PhonePe achieved rapid scale across 500M+ users across diverse languages and literacy levels because it eliminated the cognitive reading layer:**
> **"The human brain decodes visual metaphors in under 100ms. Reading requires an active, fatiguing translation cycle (Text → Syntax → Mental Image → Intent). Anchor the action in a universal real-world icon; use text only as a minimal 1–2 word stabilizer."**

### The Cognitive Hierarchy
```
[ 1. PHYSICAL ICON ANCHOR ] ──► Instant optical recognition (<100ms)
            │
[ 2. STABILIZER LABEL ]     ──► 1–2 words maximum; eliminates ambiguity
            │
[ 3. PHYSICAL FEEDBACK ]    ──► Spring press scale; tactile reassurance
```

---

## 2. The 4 Invariants of the PhonePe Action Tile

Every primary action, navigation target, or category in a visual-first interface must adhere to these 4 invariants:

### Invariant 1: Physical Metaphor Over Abstract Geometry
* ❌ **Anti-Pattern**: Using generic abstract shapes (hexagons, random diamonds, meaningless decorative circles).
* ✅ **Standard**: Ground icons in tangible real-world physical objects:
  - Banking/Treasury → Classical bank pillar facade
  - People/Transfers → Human silhouette or contact book
  - Payments/Passbook → Physical wallet or physical receipt/ledger
  - Location/Hive → Physical directional compass or street pin
  - Tasks/Operations → Physical lightning bolt or toolpack

### Invariant 2: High-Contrast Tactile Container
* Every icon lives in an intentional tactile housing:
  - Mobile: `w-12 h-12` to `w-14 h-14` rounded squircle (`rounded-2xl`) or perfect circle (`rounded-full`).
  - Palette: Subtle tinted background (5–10% opacity of brand accent) with high-contrast glyph.
  - Active state: Physical spring scale (`active:scale-95`).

### Invariant 3: The 1–2 Word Microcopy Stabilizer
* Never display naked, cryptic icons without supporting labels (causes guessing).
* Never display verbose phrases. Text must be strictly 1–2 words:
  - ❌ *"Send money to mobile contact"* → ✅ **`To Mobile`**
  - ❌ *"Check your bank account balance"* → ✅ **`Check Balance`**
  - ❌ *"Transfer to bank account or UPI ID"* → ✅ **`To Bank`**
  - ❌ *"Click here to view operations"* → ✅ **`Operations`**
  - ❌ *"Add external proof and skills"* → ✅ **`Add Socials`**

### Invariant 4: Vertical Center-Aligned Grid Rhythms
* Action tiles are structured vertically: **Icon Top, Label Bottom**.
* Rendered in rigid, predictable grids (strictly 4-column on mobile, or 2-column split cards), never jagged horizontal wraps.

---

## 3. The 5 Visual-First Audit Traps (The Scythe Pass)

Whenever auditing any interface against this standard, search for and eliminate these 5 flaws:

### Trap 1: The Paragraph Card
* ❌ **Flaw**: A card containing 2–3 sentences explaining what a feature does before offering a link.
* ✅ **Fix**: Delete the paragraph. Replace with an icon-anchored tactile tile or a 3-tile grid with 1-word action triggers.

### Trap 2: The Naked Cryptic Glyph
* ❌ **Flaw**: Standalone icons in headers or rows with no text, leaving users guessing whether an icon means "history", "clock", or "activity".
* ✅ **Fix**: Pair the icon with a 1-word label directly underneath or to the right.

### Trap 3: The Verbose Action Button
* ❌ **Flaw**: Rectangular buttons crammed with instructional prose (*"Submit Verification Request"*).
* ✅ **Fix**: Icon + 1–2 words: `[ShieldCheck Icon] Verify`.

### Trap 4: Text-Only Filter Rows
* ❌ **Flaw**: Rows of plain text pill filters that look like boring documentation tags.
* ✅ **Fix**: Prefix each filter with its physical semantic glyph (`[★] 4.8+`, `[Compass] My Hive`, `[Zap] Instant`).

### Trap 5: Asymmetric Visual Weights
* ❌ **Flaw**: Mixing disparate icon sizes, stroke weights, or container radiuses on the same screen.
* ✅ **Fix**: Standardize icon bounding box (`w-5 h-5` stroke `[2.2]`), container bounds (`w-12 h-12`), and font sizes (`text-[11px]` font-bold).

---

## 4. The Standard Audit Deliverable Protocol

When triggered on any file, screen, or component, output the audit strictly using this 4-field dense format per item:

```markdown
### Visual Audit: [Screen/Component Name]

#### Item [N]: [Element Name]
- **Current Cognitive Friction**: [Exact sentence/text or broken visual layout causing cognitive reading delay]
- **Physical Metaphor**: [Physical icon chosen + rationale why it maps to mental memory]
- **Compressed Stabilizer**: [1–2 word replacement label]
- **Tactile Tile Transformation**: [Exact JSX/Tailwind snippet showing the icon container + vertical label layout]
```

---

## 5. Reference Archetype (JSX Blueprint)

```jsx
// Universal PhonePe Action Tile (React + Tailwind)
<button
  type="button"
  onClick={handleAction}
  className="flex flex-col items-center justify-center p-2 group active:scale-95 transition-all cursor-pointer text-center"
>
  {/* Tactile Icon Housing */}
  <div className="w-12 h-12 rounded-2xl bg-primary/10 text-primary border border-primary/20 flex items-center justify-center mb-1.5 shadow-2xs group-hover:bg-primary/20 transition-colors">
    <Building2 className="w-6 h-6 stroke-[2.2]" />
  </div>

  {/* 1-2 Word Stabilizer Label */}
  <span className="text-[11px] font-black text-slate-800 leading-tight tracking-tight line-clamp-1">
    To Bank
  </span>
</button>
```
