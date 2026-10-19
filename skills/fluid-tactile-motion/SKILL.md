---
name: fluid-tactile-motion
description: >-
  Universal spring motion physics, tactile micro-interactions, and optimistic UI architecture standard (Apple iOS, Linear, LinkedIn level). Codifies physics-based spring curves, physical tap feedback, hardware-accelerated transitions, and non-blocking state synchronization for ANY web or mobile application. Trigger when implementing animations, modals, bottom sheets, page transitions, button clicks, press highlights, active states, tap feedback, drag gestures, or optimistic server mutations.
---

# Universal Fluid & Tactile Motion Engineering Standard

## 1. The Core Philosophy: Physical Realism & Instant Feedback

Interfaces feel slow and cheap when they either:
1. **Use Linear CSS Easing (`transition: all 0.3s ease`)**: In the real physical world, mass and inertia prevent instant linear stops. Human eyes expect **spring physics** with natural momentum, deceleration, and settling.
2. **Block on Network Latency (The Spinner Trap)**: Forcing a user to wait 500ms–2000ms for a database roundtrip before showing a state change feels sluggish and heavy.

Big-Tech interfaces feel "butter-smooth" because:
- Every touch target physically compresses and springs back.
- State changes update **optimistically in < 16ms** (1 frame) while synchronization occurs silently in the background.
- Motion runs on the **GPU compositor thread** with zero layout thrashing.

---

## 2. Spring Physics Tokens (Framer Motion / Physics Engines)

Never use stiff, arbitrary duration curves. Standardize on these 4 battle-tested spring physics curves:

```ts
import { Transition, Variants } from 'framer-motion';

// 1. Snappy (Buttons, Toggles, Small Icons, Tabs)
export const springSnappy: Transition = {
  type: 'spring',
  stiffness: 420,
  damping: 30,
};

// 2. Jelly / Bouncy (Active selection pills, Celebration badges, XP counters)
export const springJelly: Transition = {
  type: 'spring',
  stiffness: 350,
  damping: 22,
  mass: 0.8,
};

// 3. Dialog / Modal (Center popups, Alert dialogs)
export const springModal: Transition = {
  type: 'spring',
  stiffness: 340,
  damping: 28,
  mass: 0.9,
};

// 4. Sheet / Drawer (Mobile bottom sheets, Navigation drawers)
export const springSheet: Transition = {
  type: 'spring',
  stiffness: 300,
  damping: 32,
  mass: 0.95,
};
```

---

## 3. Tactile Tap Micro-Interactions

Every interactive element must provide tactile visual compression to confirm human input:

```ts
export const tapScale = {
  button: {
    whileTap: { scale: 0.96 },
    transition: springSnappy,
  },
  icon: {
    whileTap: { scale: 0.88 },
    transition: springSnappy,
  },
  card: {
    whileHover: { scale: 1.01 },
    whileTap: { scale: 0.98 },
    transition: springSnappy,
  },
  pill: {
    whileTap: { scale: 0.95 },
    transition: springSnappy,
  },
};
```

* **Tailwind Pure CSS Fallback**: When not using Framer Motion, implement:
  ```css
  .active-scale {
    transition: transform 0.15s cubic-bezier(0.34, 1.56, 0.64, 1);
  }
  .active-scale:active {
    transform: scale(0.97);
  }
  ```

---

## 4. The Optimistic UI Architecture (Instant Response Loop)

Do not block user interactions behind network roundtrips. Decouple the visual interface from backend operations:

```
User Action (Tap Button)
   │
   ├───> [PHASE 1: < 16ms] Immediate Local State Mutation (UI updates, closes, or transitions instantly)
   │
   └───> [PHASE 2: Background Async] Send Network Mutation to Database / API
            │
            ├── Succeeded ──> Silent pass. User is already in their desired state.
            │
            └── Failed ──────> Revert local state + Present informative non-blocking recovery toast.
```

### Golden Implementation Pattern:
```ts
const handleAction = async (itemId: string) => {
  // 1. Snapshot previous state for rollback
  const previousState = [...items];
  
  // 2. Mutate state optimistically in memory (<16ms)
  setItems(prev => prev.filter(item => item.id !== itemId));
  
  try {
    // 3. Sync with backend asynchronously in the background
    await api.performAction(itemId);
  } catch (error) {
    // 4. Rollback only if the backend rejects
    setItems(previousState);
    showToast({ type: 'error', message: 'Could not complete action. Restoring state.' });
  }
};
```

### The Iron Boundary: Optimistic vs. Pessimistic Matrix

> **Core Law**: *Optimistic for user intent on known objects; Pessimistic for discovery of unknown data and irreversible transactions.*

| Strategy | Permitted Domain | Target Actions | UI Contract |
|---|---|---|---|
| **Optimistic** (`<16ms`) | User asserts intent on **known objects**. Failure rate is negligible (<1%) and state is cleanly reversible. | Toggles, upvotes/likes, equipping skills, marking read, adding local drafts. | Mutate state instantly (<16ms), sync in background, roll back with toast on rejection. |
| **Pessimistic** (Blocking) | Server holds **unknown data** or mutation is **irreversible / high-consequence**. | Feed queries, switching hives/sectors, search results, OTP verification, payments, account deletion. | Show spinners, skeletons, or disabled loading states. **Never show stale data as current.** |

#### Invariant: Never Fake Unknown Truth
Never use optimistic rendering to guess server query results. During fast contextual switches (e.g. changing hives), flush stale lists immediately and display an explicit loading indicator. Misleading the user with previous data breaks trust.

---

## 5. Critical Motion Lifecycle & Performance Rules

### A. The AnimatePresence Early-Return Rule
Never return `null` before `<AnimatePresence>`. Doing so abruptly unmounts the component from the DOM, completely destroying exit animations:
```tsx
// ❌ WRONG: Exits with a jarring snap cut
if (!isOpen) return null;
return <AnimatePresence>...</AnimatePresence>;

// ✅ CORRECT: AnimatePresence coordinates clean unmounting
return (
  <AnimatePresence>
    {isOpen && (
      <motion.div variants={modalVariants} initial="initial" animate="animate" exit="exit" />
    )}
  </AnimatePresence>
);
```

### B. Eliminate CSS & JS Transition Collisions
Never apply CSS `transition-all` on elements whose coordinates or transforms are managed by a physics engine (Framer Motion, Spring, Reanimated). Mixing them causes frame jitter and competing calculations.

### C. Hardware-Accelerated Compositing
Animate **only** `transform` and `opacity`. Animating `width`, `height`, `margin`, or `top` triggers layout reflows (recalculating the entire document tree). Transforms run directly on the GPU compositor thread at 60fps/120fps.

---

## 6. Motion Pre-Flight Checklist

- [ ] **Physical Tap Feedback**: Do all buttons and touch targets compress visibly on press (`active:scale-[0.98]`)?
- [ ] **Spring Curves**: Are modal, drawer, and tab transitions powered by springs rather than linear duration easings?
- [ ] **Optimistic State**: Does the UI react instantly to user actions without spinning wait indicators for standard operations?
- [ ] **Exit Transitions**: Are dialogs and banners wrapped in `<AnimatePresence>` with exit animations?
- [ ] **GPU Compositing**: Are transforms (`translate3d`, `scale`, `opacity`) used instead of layout-thrashing properties?
