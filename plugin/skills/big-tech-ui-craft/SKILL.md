---
name: big-tech-ui-craft
description: >-
  Universal cognitive psychology and craftsmanship standard for high-conviction UI (Apple, Google, Linear, Stripe level). Codifies human perception, Gestalt spatial theory, optical ergonomics, typography physics, and the proactive holistic polish mandate for ANY project, framework, or screen type. Trigger whenever creating, styling, refining, aligning, or redesigning web or mobile interfaces, components, cards, headers, buttons, spacing, margins, padding, text sizes, layout budgets, or visual alignment.
---

# Universal Big-Tech UI Craftsmanship & Cognitive Design Standard

## 1. The Core Philosophy: Why Amateur UIs Feel Cheap vs Why Big-Tech Feels "Right"

Amateur UIs are built by **isolated mathematical placement**: an engineer drops flexboxes, assigns random Tailwind grays, centers bounding boxes, and stops when "it compiles and works." The result is an interface that feels visually dissonant, cluttered, and amateurish—even if technically functional.

Big-tech interfaces (Apple iOS/macOS, Google Material 3, Linear, Stripe, Airbnb) feel effortless because they are engineered around **human visual perception and cognitive ergonomics**:
* The human brain does not process bounding boxes; it processes **visual weight, contrast contours, and alignment axes**.
* Every misaligned pixel, irregular margin, or discordant color tone creates **micro-cognitive friction**—the subconscious effort required for a user's brain to parse relationships, scan content, and locate actions.
* True craft is the **elimination of all micro-cognitive friction**. When an interface obeys natural visual psychology, users describe it as "clean," "intuitive," "fast," and "delightful."

---

## 2. The Cognitive Psychology of Interface Design

### A. The Single-Axis Law (Foveal Scanning & Gestalt Continuity)
* **The Psychology**: During saccadic eye movements (how humans read screens), the fovea centralis tracks linear vertical paths. When elements along a visual column have ragged, irregular left edges (e.g., icon at 32px, title at 28px, description at 34px, button at 30px), the eye must constantly re-acquire the starting point. This causes subconscious reading fatigue.
* **The Rule**: In any visual column or card surface, **all primary content anchors MUST snap to a single, identical X-coordinate guide axis**.
* **Universal Application**:
  - In a feed card: Category icon left edge, title left edge, body copy left edge, timestamp icon left edge, and primary/secondary button left edge all start at the exact same horizontal coordinate.
  - In a form: Field labels, input border left edges, validation messages, and submit buttons all share the same guide axis.
  - In a dashboard widget: Metric icon, title, description, and secondary link snap to the same flush axis.

### B. Optical Center vs Mathematical Center (The Physics of Human Vision)
* **The Psychology**: Mathematical flexbox centering (`align-items: center`, `justify-content: center`) operates on the geometrical bounding box of DOM elements. But human eyes do not judge center by bounding boxes; they judge by **perceived center of gravity**:
  1. **Text Glyphs & Icons**: Alphabet characters sit on a typographical baseline. Capital letters and numbers occupy the top 70% of the box (cap-height), while the bottom accommodates descenders (`p`, `y`, `g`). An SVG icon centered geometrically inside a flex container with text will almost always look **1 to 1.5 pixels too low or floating**.
  2. **Asymmetrical Shapes**: Triangles (play icons, expand chevrons, arrows) have visual mass concentrated toward their flat base. Centered mathematically inside a circular button, a play triangle looks conspicuously shoved to the left.
* **The Universal Rule**:
  - **Text + Icon Pairs**: Always apply optical subpixel compensation (`-translate-y-[0.5px]` or `-translate-y-[1px]` with `leading-none` or flex baseline alignment) so the visual gravity of the icon matches the cap-height of the text.
  - **Directional Glyphs**: Add a 1px optical forward nudge in the direction of the glyph's apex.

### C. Spatial Affordance & Information Coupling (Gestalt Proximity)
* **The Psychology (Gestalt Law of Proximity)**: The human brain instinctively assumes that elements placed physically close to each other are semantically related. If a piece of data is placed far from the action it influences, the user must expend cognitive effort mentally linking them.
* **The Universal Rule**: **Data that justifies an action must be physically coupled to that action.**
  - **Decision Drivers**: If a metric (price, status, deadline, confirmation summary, item count) is the reason a user will tap an action button, anchor that metric directly above or immediately adjacent to that action button.
  - **Negative vs Positive Anchoring**: Secondary metadata (creation time, cancellation terms, auxiliary links) should anchor near the dismissive/secondary action; value metrics (earnings, confirm totals, primary action states) should anchor near the primary action.

### D. Strict 3-Tier Palette Discipline (The Trust Equation)
* **The Psychology (Gestalt Law of Similarity)**: When an interface haphazardly mixes 4, 5, or 6 different shades of gray (e.g. `gray-400`, `slate-500`, `zinc-600`, `neutral-700`), the brain cannot discern systematic meaning. The UI feels messy and unconfident. High-trust products maintain rigorous tonal discipline.
* **The Universal Rule**: Maintain strictly **3 distinct typographic tiers per visual surface**:
  1. **Tier 1 — High-Contrast Anchor (Headings & Key Totals)**: Deepest tone (`text-slate-900` / `#0F172A` in light mode; `text-white` in dark mode). Bold or black weight. Instant semantic anchor for the eye.
  2. **Tier 2 — Uniform Legibility (Body, Timestamps, Metadata, Secondary Labels)**: Pick **ONE** uniform slate tone (`text-slate-700 font-semibold` in light mode; `text-slate-300` in dark mode). Use this single tone consistently across descriptions, metadata rows, and secondary button text. This produces immediate visual calmness.
  3. **Tier 3 — Brand Accent (Primary Actions & Key Metric Highlights)**: The system's primary affirmative color. Reserved exclusively for what matters most: the primary CTA button and the focal highlight metric.

### E. Tactile Physics & Physical Symmetry (Affordance & Fitts's Law)
* **The Psychology**: Digital touch targets represent real physical objects to human motor cognition. When a button is an invisible "ghost" (transparent background with a thin faint border), the brain categorizes it as inactive, disabled, or unimportant. Conversely, harsh solid black borders look aggressive.
* **The Universal Rule**:
  - **Primary CTA**: Solid, high-contrast brand surface. Provides unquestionable clarity of the recommended path.
  - **Secondary CTA**: Must have a **soft, tactile, visible surface** (e.g. `bg-slate-200/75 border border-slate-300/60 text-slate-700 font-bold`). It must look like a physical, tap-friendly surface that invites interaction without competing with the primary CTA.
  - **Physical Symmetry**: Paired action buttons must have identical heights (minimum 38–44px for touch targets), identical corner radii, and balanced proportional widths.
  - **Physical Press Feedback**: Every interactive surface must physically react to human touch (`active:scale-[0.98]` or `active:brightness-95`). A button that does not visibly compress feels dead.

### F. Concentric Radius Continuity (Geometric Harmony)
* **The Psychology**: When an inner element sits inside a rounded container and both have the same border-radius, the corner gap looks warped and uneven.
* **The Universal Rule**: The outer corner radius must equal the inner corner radius plus the padding between them:
  $$\text{Outer Radius} = \text{Inner Radius} + \text{Padding}$$
  If a card has `p-4` (16px) and an inner badge has `rounded-lg` (8px), the card container must be `rounded-2xl` (24px) for perfect concentric visual harmony.

### G. The Multi-Column Vertical Guide Law (The Anti-Zigzag Law)
* **The Psychology**: When humans scan a vertical list of rows, the eye expects secondary metadata (status indicators, telemetry dots, counts, badges) to align into a coherent vertical column. When metadata trails a variable-length title using dynamic inline flexbox (`flex items-center gap-2`), the metadata zigzags horizontally across every row, creating visual chaos.
* **The Universal Rule**: **Secondary metadata across stacked rows MUST snap to a shared vertical column coordinate, NEVER float inline after dynamic text.**
  - **The Fix**: Allocate a fixed or proportional width column to the primary label (`w-[150px] shrink-0` or `grid grid-cols-[150px_auto_1fr]`).
  - **Result**: Every dot, number, and badge forms a razor-sharp vertical straight line down the column axis on the very first pass.

### H. Real-World Entity Scoping (No Ambiguous Fragments)
* **The Psychology**: An interface loses authority when it presents ambiguous or cryptic database slugs. Users must never have to ask "X of what?".
* **The Universal Rule**: Sub-units (hostels, gates, blocks, towers) MUST be scoped to their parent domain in every display coordinate:
  - ❌ `gh-2`, `bh-5`, `gate-1`
  - ✅ `gh2-lpu`, `bh5-lpu`, `bh3-bec`, `gate1-klu`

---

## 3. The Proactive Holistic Polish Mandate (The "Anti-Dumb" Agent Law)

### The Anti-Pattern to Eradicate:
When a user asks: *"Change the spacing here"* or *"Move the button there"*, naive agents execute a lazy 1-line edit. They move the button, leaving adjacent margins unbalanced, typography mismatched, and icons crooked. This forces the user through a frustrating 10-prompt micro-iteration cycle.

### The Mandate for Every Agent:
When asked to touch **any** UI element (layout, spacing, color, sizing, typography, borders):
1. **Never Make Isolated Edits**: Immediately evaluate the entire component, container, or screen hierarchy.
2. **Aggressive Subtractive Default on First Pass**: When refactoring bloated interfaces, ruthlessly delete extraneous wrappers, decorative monograms, nested accordions, and auxiliary math (e.g. distances, GPS badges) on attempt #1. Never cautiously preserve legacy noise.
3. **Proactively Audit All Visual Vectors on the First Attempt**:
   - Align primary labels and secondary metadata into clean vertical column axes (prevent zigzagging).
   - Optically subpixel-compensate all icons against text x-height.
   - Clean up color palette to the strict 3-tier hierarchy.
   - Ensure secondary actions have soft tactile contrast, equal heights, and active tap physics.
   - Anchor decision-driving data directly to its action.
   - Balance white space (tight within groups, generous between sections).
4. **Pre-Flight Visual Self-Critique**: Always render and inspect the visual layout (DevTools / screenshot) before returning. Spot alignment issues, jagged spacing, or ambiguous names and fix them immediately before presenting to the user.
