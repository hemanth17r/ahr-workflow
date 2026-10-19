---
name: interpretive-ui-craft
description: >-
  Universal standard for self-explanatory, interpretive interfaces (Apple, Google App Launcher, Linear level). Strips away explanatory clutter, redundant copy, hand-holding paragraphs, and documentation-style cards, transforming web interfaces into confident, tactile, exploration-driven product hubs. Trigger whenever asked to "less explaining", "interpretive", "self explanatory", "don't explain everything", "exploration vs interpretation", "strip clutter", "app launcher style", "make it clean and minimal", or when hiding/removing explanatory sections, cards, banners, or fluff.
---

# Universal Interpretive UI Craft & Cognitive Restraint Standard

## 1. The Core Philosophy: Exploration Over Explanation

Amateur interfaces feel the need to explain *everything*—treating users like students reading documentation. They crowd cards, modals, and headers with paragraphs describing mechanics, features, and step-by-step instructions.

**Big-Tech and high-craft interfaces (Apple, Google, Linear, Stripe) operate on the exact opposite principle:**
> **"Provide only the essential visual coordinates. Leave the rest to human perception and active exploration."**

When an interface exercises cognitive restraint:
1. **Curiosity replaces passive fatigue**: Users do not read didactic essays; they click, inspect, and experience software through interaction.
2. **Authority replaces self-justification**: A component that requires three explanatory sentences signals design weakness and lack of conviction. A component identified solely by its visual anchor, name, and functional archetype signals unshakeable confidence.
3. **The canvas breathes**: Eliminating explanatory paragraphs transforms bloated text boxes into compact, tactile, hardware-grade tiles.

---

## 2. The Explanation-to-Exploration Continuum

Every interface surface falls somewhere on this spectrum:

```
[ LEVEL 1: DOCUMENTATION ] ──► [ LEVEL 2: MARKETING SLOGAN ] ──► [ LEVEL 3: INTERPRETIVE LAUNCHER ]
 (3-line how-it-works blurb)         (1-line catchy hook)             (Symbol + Name + Archetype)
       Amateur / Heavy                   Transitional                     Big-Tech / Pure Craft
```

* **Level 1 (Anti-Pattern on Dashboards & Catalogs)**: Paragraphs detailing operations, features, or value propositions. Belongs strictly inside documentation manuals or onboarding walkthroughs—never on primary browsing surfaces.
* **Level 2 (Transitional)**: A single tight evocative phrase (under 6 words). Acceptable for marketing hero headers, but suboptimal for scalable product grids.
* **Level 3 (The Gold Standard)**: **Pure Interpretive Architecture.** The interface provides the physical icon anchor, the entity title, and a tight categorical archetype. The software itself proves the rest upon entry.

---

## 3. The 5 Universal Over-Explaining Traps (The Scythe Pass)

Whenever auditing or refactoring any interface, search for and eliminate these 5 cognitive redundancies:

### Trap 1: The Didactic Paragraph (Instructional Bloat)
* ❌ **The Anti-Pattern**: Writing body copy explaining what a module does or how to use it:
  - *"This service lets you monitor network latency, view uptime graphs, and set automated alerts across global server regions."*
* ✅ **The Fix**: **Delete the paragraph.** Replace it with a 2–4 word categorical archetype:
  - **`Real-Time Network Telemetry`**

### Trap 2: The Redundant Slug Echo
* ❌ **The Anti-Pattern**: Repeating the entity name or identifier in an uppercase badge directly adjacent to the main title:
  - Tag: `[ANALYTICS]` placed directly above Heading: `Analytics Engine`.
* ✅ **The Fix**: Delete the tag completely. The icon anchor and the heading establish identity instantly.

### Trap 3: The Apologetic / Meta Hero Blurb
* ❌ **The Anti-Pattern**: Giant headings and subtitle paragraphs explaining *why* the page exists or *what* the author/team created:
  - *"Welcome to our centralized ecosystem of products engineered with speed and craft to solve complex problems."*
* ✅ **The Fix**: Strip the hero down to its irreducible core—or remove it completely. If the product tiles speak for themselves, let the interface lead directly into the filter bar and interactive grid.

### Trap 4: Verb & Noun Over-Labeling
* ❌ **The Anti-Pattern**: Action buttons and filter pills weighed down by stating the obvious:
  - `All Products (12)` -> Redundant noun.
  - `Filter by Active Status (4)` -> Didactic clutter.
  - `Click here to visit dashboard` -> States the obvious.
* ✅ **The Fix**:
  - `All (12)`
  - `Active (4)`
  - Direct directional glyph (`arrow-up-right`). Zero wasted ink.

### Trap 5: The Bloated Card Footprint
* ❌ **The Anti-Pattern**: Cards forced to `min-h-[220px]` or `min-h-[300px]` simply to accommodate body paragraphs, creating awkward empty space and uneven rows.
* ✅ **The Fix**: Compact, tactile bounds (`min-h-[140px]` to `min-h-[160px]`). Dense, balanced, and feels like an authentic OS launcher tile.

### Trap 6: The Additive Stacking Trap (Feature/Copy Accumulation)
* ❌ **The Anti-Pattern**: When introducing a constraint or policy, adding text across multiple surfaces simultaneously (e.g., adding an in-form caption + a footer button + a modal + an introductory sentence).
* ✅ **The Fix**: **Enforce Net-Zero Surface Expansion.** Pick the single highest-leverage touchpoint (e.g. an interactive modal or a single atomic trigger). Delete adjacent explanatory paragraphs and redundant captions.

### Trap 7: The Meta-Reminder Echo (Hand-Holding Prose)
* ❌ **The Anti-Pattern**: Writing conversational preambles before lists or rule sets:
  - *"Keep these 2 reminders in mind before posting your first bounty:"*
  - *"Here is what you need to know about safety:"*
* ✅ **The Fix**: **Delete the preamble entirely.** The heading and the structured cards provide 100% of the cognitive coordinates. Let the user scan the items directly without reading meta-instructions.

---

## 4. The 3-Coordinate Identity Architecture

Every interactive card or tile requires strictly three visual coordinates—nothing more:

```
┌────────────────────────────────────────────────────────┐
│  [Coordinate 1: Icon Anchor]       [Status Badge / ↗]  │
│                                                        │
│                                                        │
│  [Coordinate 2: Primary Entity Title]                  │
│  [Coordinate 3: Categorical Archetype (2-4 words)]     │
└────────────────────────────────────────────────────────┘
```

1. **Coordinate 1 — Physical Icon Anchor**: A universally recognized glyph or geometric symbol seated inside a tactile container. Provides instant optical recognition (<100ms).
2. **Coordinate 2 — Primary Entity Title**: High-contrast typography (Tier 1 font weight). Unambiguous entity naming.
3. **Coordinate 3 — Categorical Archetype**: A crisp 2–4 word noun phrase defining the entity's functional class (e.g., `Payment Gateway`, `Telemetry Substrate`, `Identity Engine`, `Asset Library`), rendered in the entity's thematic accent.

---

## 5. Chromatic & Spatial Physics

With explanatory copy eliminated, visual physics carry the weight:

1. **Chromatic Separation**: Never allow adjacent tiles to share duplicate or muddy tones. Alternate across warm, cool, and organic spectrums (e.g. Flame Orange, Royal Blue, Electric Cyan, Deep Emerald, Cosmic Violet).
2. **Concentric Radius Law**: The container radius must equal the inner badge radius plus the padding:
   $$\text{Outer Radius} = \text{Inner Radius} + \text{Padding}$$
3. **Tactile Feedback Physics**: Every tile must react physically to human interaction:
   - Ambient hover glow (`blur-xl` radial gradient).
   - Subtle interactive 3D perspective tilt on cursor movement.
   - Physical compression on click (`active:scale-[0.98]`).

---

## 6. The 4-Step Transformation Workflow for Any Interface

When invoked on ANY web screen, application, or interface:

```
[Step 1: Scythe Pass] ──► [Step 2: Archetype Extraction] ──► [Step 3: Visual Anchoring] ──► [Step 4: Spatial Tightening]
(Cut paragraphs/slugs)     (Condense subtext to 2-4 words)    (Chromatic palette & glyph)     (Compact, tactile tiles)
```

1. **Step 1: Scythe Pass**: Scan all cards, modules, and headers. Ruthlessly delete all explanatory body paragraphs, redundant uppercase slug tags, and self-justifying meta copy.
2. **Step 2: Archetype Extraction**: Convert remaining descriptions into 2–4 word categorical archetypes.
3. **Step 3: Visual Anchoring**: Ensure each entity has a distinct physical icon, a distinct vibrant accent color, and an atmospheric backdrop.
4. **Step 4: Spatial Tightening**: Reduce vertical card height to compact bounds (`~150px`), tighten horizontal container widths to avoid awkward text stretching, and simplify filter pills to single nouns and counts.

---

## 7. Verification Checklist

Before considering an interpretive transformation complete, verify:
- [ ] **Zero Explanatory Body Paragraphs**: Are there any 2+ line descriptive sentences remaining inside cards or preview tiles? If yes, delete them.
- [ ] **Zero Redundant Slugs**: Does any card display an uppercase tag duplicating its title? If yes, remove it.
- [ ] **Zero Self-Justifying Meta Copy**: Is there any header blurb explaining *why* the page exists or praising the creator? If yes, strip it.
- [ ] **Zero Additive Stacking**: Is a concept communicated across multiple redundant touchpoints (e.g. caption AND button label AND modal)? Consolidate to ONE.
- [ ] **Zero Meta-Prose Preambles**: Are there any conversational intro phrases like *"Keep these reminders in mind"*? If yes, eliminate them.
- [ ] **Pre-Flight Lifecycle Interception**: Are modal confirmations and safety notices intercepted *before* the route transition begins, preventing double-layer animation jank and clumsy back-navigation?
- [ ] **Single-Line Mobile Litmus Test**: Do primary titles, dialog headings, and action button labels fit strictly on a single line on a 375px mobile viewport?
- [ ] **Minimal Filter Copy**: Are filter buttons stripped to atomic terms (`All`, `Active`, `Archived`) with clean numeric counts?
- [ ] **Tactile Proportions**: Are cards compact (`min-h-[140px]` to `min-h-[160px]`) and tactile rather than stretched?
- [ ] **Chromatic Distinction**: Does each product/module feature a distinct, vivid spectral accent rather than monotonous gray?
