---
name: adversarial-mechanism-design
description: >-
  Universal mechanism design, reverse game theory, incentive engineering, and adversarial bad-actor defense standard for ANY product, platform, or marketplace. Codifies Goodhart's law audits, the 4 bad-actor exploit personas (Corner-Cutter, Colluder, Blind-Clicker, Extortionist), mutual goodwill & altruism incentives, two-way dignity, real-world interpersonal friction checks, and metric orthogonality. Trigger when designing incentives, gamification, unlock rules, progression ladders, reputation metrics, ratings, badges, marketplace rules, anti-fraud guardrails, or when asked to "design rules", "prevent cheating", "game theory", "mechanism design", "incentives", "bad actors", or "reputation system".
---

# Universal Adversarial Mechanism Design & Incentive Engineering Standard

## 1. The Core Philosophy: Reverse Game Theory

> *"A system's rules define its players' behavior. If you set a naive rule, humans will game it ruthlessly."*

Standard software engineering writes code for **ideal, honest users**.  
Mechanism design writes rules for **adversarial, rational humans**:
* **Forward Game Theory**: Given the rules of a game, what will players do?
* **Reverse Game Theory (Mechanism Design)**: Given the outcome we want (honest work, mutual trust, community goodwill, zero fraud), **what exact rules make honest behavior the dominant winning strategy, and make gaming/cheating unprofitable?**

Never trust that users will "do the right thing" out of politeness. Design the mechanism so that good actors naturally rise and bad actors are mathematically neutralized.

---

## 2. The 4 Bad-Actor Personas (The Pre-Flight Red Team)

Before proposing or approving ANY rule, progression unlock, badge, or reward metric, simulate these 4 archetypes:

### A. The Corner-Cutter (Minimum Effort Exploiter)
* **The Exploit**: *"How do I do 5% of the work to get 100% of the reward?"*
* **The Failure Mode**: A timer measuring fast turnaround (e.g., *"Finish in under 15 minutes"*) causes workers to deliver broken items, cut corners, drive recklessly, and lie to beat the clock.
* **The Invariant**: **Never measure per-task duration as an incentive.** Measure **calendar cadence** (e.g., *30 completed tasks across 45 days with a 4+ star rating*) — rewarding high active hustle without incentivizing sloppy rushing on any single task.

### B. The Blind-Clicker / Reflex Camper (Speed Gamer)
* **The Exploit**: *"How do I click so fast that I beat everyone else without reading?"*
* **The Failure Mode**: Rewarding fast claims (e.g., *"Claim in under 60 seconds"*) causes users to spam-click task buttons before reading descriptions, resulting in instant forfeits, broken commitments, and angry posters.
* **The Invariant**: Never incentivize twitch claim reflexes. Incentivize **deliberate commitment and completion streaks**.

### C. The Colluder / Sybil Ring (Fake Trading)
* **The Exploit**: *"How can two friends or duplicate accounts pass transactions back and forth to farm badges?"*
* **The Failure Mode**: Any rule that says *"Complete 15 tasks"* or *"Get 10 reviews"* will be farmed by two roommates creating 15 dummy tasks in 10 minutes.
* **The Invariant**: Always enforce a **Unique Counterparty Constraint**:
  * ❌ *Complete 15 goodwill tasks.*
  * ✅ *Complete 15 goodwill tasks across at least 10 UNIQUE deployers.*

### D. The Extortionist / Hostage Taker (Weaponized Rules)
* **The Exploit**: *"How can I use this metric to threaten or silence other users?"*
* **The Failure Mode**: Zero-tolerance rules (e.g., *"Complete 50 tasks with 0 disputes"*) make users terrified of legitimate disagreements. Bad actors weaponize this by threatening to report petty disputes to ruin another user's unlock, or bullying victims into not reporting real misconduct.
* **The Invariant**: Never use shared zero-dispute metrics. Track **unilateral user-initiated forfeits** (e.g., *Claimer-initiated cancellations*) so one bad actor cannot hold another user's record hostage.

---

## 3. Goodhart’s Law & Perverse Incentives

> *"When a measure becomes a target, it ceases to be a good measure."* — Goodhart's Law

Whenever a metric is tied to prestige, status, or unlockable rewards:
1. **The Target Distortion Check**: Ask: *"If a user optimizes 100% for this number, what terrible behavior emerges?"*
   * Target: Lines of code written $\to$ Bloated, unmaintainable code.
   * Target: Number of commits $\to$ Automated green-dot bot spam.
   * Target: Task speed $\to$ Rushed, damaged, and sloppy work.
   * Target: Raw spend amount $\to$ Dumping money into a single self-funded task.
2. **The Quality Floor**: Any volume or cadence metric MUST have an integrated quality floor:
   * ❌ *Complete 30 bounties in 45 days.*
   * ✅ *Complete 30 bounties in 45 days with no rating below 4 stars.*

---

## 4. The Goodwill & Cultural Core (Unfakeable Proof of Work)

Commercial volume alone does not build lasting community trust. Healthy platforms actively celebrate and elevate **goodwill**:

### A. Rewarding Uncompensated Mutual Aid
* In peer-to-peer and community platforms, broke users often need urgent favors (borrowing notes, urgent chargers, moving a chair).
* Identify vectors of **Goodwill Proof of Work**: e.g., completing ₹0 / volunteer community tasks.
* This proves authentic community citizenship that cannot be bought with money.

### B. Two-Way Mutual Dignity
* Never build a one-sided reputation hierarchy where workers are graded like cattle while employers/posters act with impunity.
* **The Symmetry Invariant**: Every marketplace has two sides. A complete mechanism must reward:
  * **The Exemplary Worker / Claimer**: Craftsmanship, punctuality, and politeness.
  * **The Exemplary Employer / Deployer**: Clear task scopes, prompt payout verification, fair compensation, and respectful communication.

---

## 5. Physical & Social Friction Reality Check

Virtual code has physical, real-world consequences:
* **The Hallway Confrontation Test**: Will this rule cause two users to get into an argument in a physical dorm or office corridor? (e.g., *"Why did you report a dispute? You ruined my unlock!"*).
* **The Dynamic Relocation Test**: Does the rule assume users stay in one place forever? (e.g., *"Home Hive"* vs. *"Within a single Hive"*). Users relocate, graduate, change jobs, and switch apartments. Rules must be location-portable.
* **Integer Realism**: Never use arbitrary fake decimals in rules (e.g., *4.9 rating*) when underlying databases store discrete integers (1 to 5 stars).

---

## 6. Dimensional Orthogonality (The Non-Overlap Mandate)

Never design a progression system where 6 badges are just different rephrasings of the same metric (e.g., 3 versions of `COUNT(*)`).

Every badge, tier, or unlock MUST measure a **completely distinct, non-overlapping virtue**:

| Dimension | What It Actually Measures | Who It Evaluates | Anti-Cheat Defense |
| :--- | :--- | :--- | :--- |
| **1. Altruism & Goodwill** | Selfless community favors (₹0) | Worker / Claimer | Unique counterparty constraint (10+ distinct posters) |
| **2. Craftsmanship & Quality** | Pure 5-star perfection | Worker / Claimer | Pure integer 5/5 reviews across unique users |
| **3. Reliability & Trust** | Unbroken commitment streak | Worker / Claimer | Specifically tracks *worker-initiated* drops |
| **4. Operational Cadence** | Active weekly presence | Worker / Claimer | Calendar timeframe (45 days) + 4-star quality floor |
| **5. Employer Dignity** | Fair treatment, instant approvals | Employer / Deployer | 5-star ratings received from distinct workers |
| **6. Economic Patronage** | Capital catalyst funding others | Employer / Deployer | Distributed across 25+ distinct completed jobs |

---

## 7. The Mandatory 5-Gate Pre-Flight Verification Checklist

Before proposing or implementing ANY rule, unlock criterion, or gamification metric:
- [ ] **Gate 1: Perverse Incentive Check**: Does this reward rushing, corner-cutting, or blind clicking?
- [ ] **Gate 2: Collusion & Sybil Defense**: Can two friends pass fake actions back and forth to farm this? (Is there a unique counterparty requirement?)
- [ ] **Gate 3: Hostage / Retaliation Defense**: Can a bad actor use this to extort, bully, or silence another user?
- [ ] **Gate 4: Two-Way Balance**: Does the system reward good behavior on BOTH sides of the platform (producers and consumers)?
- [ ] **Gate 5: Orthogonality**: Is this rule completely distinct from existing platform systems (e.g., Admin Wars, leaderboards, volume counters)?
