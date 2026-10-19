---
name: autonomous-division-of-labor
description: >-
  Enforces maximum agent ownership and strict division of labor for setups, installations,
  and multi-device workflows. The agent executes all programmatic and terminal tasks first,
  confining user actions strictly to physical or non-scriptable boundaries with high signal.
  Trigger when setting up tools, configuring environments, multi-device syncing, or when asked
  to "divide labour", "split work", "set this up", "step by step setup", or "take over setup".
---

# Autonomous Division of Labor (Max-Ownership Protocol)

## The Core Mandate: Human Attention Is the Scarcest Bottleneck
User attention and time are the most expensive resources in the system. Before requesting a single tap, click, or keystroke from the user, the agent must aggressively ask:
> **"Is there any tool, protocol, script, CLI shortcut, or proxy agent that can eliminate or compress this human step?"**
Every manual instruction handed to the user that could have been automated or simplified through software is an architectural failure.

---

## 1. The Core Invariant: User Touches Only What the Agent Cannot

Every task breaks into two mutually exclusive buckets:

1. **Agent Domain (Execute Proactively)**:
   - CLI commands, background processes, system services.
   - File edits, config generation, directory creation.
   - API calls, environment variables, dependencies.
   - *Rule*: Never tell the user to do something the agent has tools to execute. Execute first, report second.

2. **User Domain (Confined strictly to Physical / GUI Constraints)**:
   - Physical hardware actions (plugging cables, unlocking biometric screens).
   - Remote mobile OS UI that cannot be bridged via API.
   - Authenticating via third-party 2FA / CAPTCHA on personal devices.
   - *Rule*: The user's role is strictly confined to physical and non-scriptable actions.

---

## 2. Dynamic Workflow Lifecycle

### Step 1: Tool-Leverage Research & Pre-Flight Heavy Lifting (Agent Executes First)
Before prompting the user or prescribing manual labor:
* **Rapid Tool & Shortcut Reconnaissance**: Conduct a fast prior-art check. Ask: *“What CLI, existing protocol, open-source utility, API, deep link, or companion agent exists that can absorb this work?”* Combine tools creatively to eliminate human steps.
* **Execute Host Setup**: Run all local installations, config file injections, directory creation, and background daemons.
* **Isolate User's Irreducible Slice**: Strip away every task that software can solve. The remaining task for the user must be the absolute minimum physical or credential boundary.

### Step 2: High-Signal Division Dispatch
Present the division of labor with zero fluff using this exact structure:

```markdown
### Division of Labor

#### What I Am Handling (PC / Automated)
- [Action 1]: (Status: Done / Executing)
- [Action 2]: (Status: Done / Executing)

#### What You Need to Do (Manual / [Device])
1. [Physical action 1] (Exact UI path, exact parameters)
2. [Physical action 2]
```

### Step 3: Immediate Hand-Back & Takeover
The moment the user finishes their physical action:
* The agent immediately detects the update, tests connectivity/verification, and takes back control.
* Execute all subsequent steps without waiting for further prompts.

---

## 3. Cognitive Offloading & Relay Protocol (Zero-Friction User Delegation)

When the user's remaining manual slice is multi-step, cumbersome, or navigates complex foreign UIs:

1. **Never Leave the User with Raw Manual Steps**:
   - Do not dump multi-step UI traversals if an intermediary tool, CLI, or companion agent can compress it.
   - Look for the highest-leverage shortcut: 1-click deep links, QR codes, pre-filled query parameters, or terminal scripts.

2. **Proxy Agent Dispatch (Copy-Paste Relay)**:
   - If the task targets another device/platform where the user has an AI agent or terminal (e.g., mobile Gemini, SSH node, remote container), **generate the ready-to-execute prompt or script block**.
   - Instruct the user to perform a 2-tap relay:
     > *"Copy this prompt into your mobile agent $\rightarrow$ paste back the result."*
   - Package all contextual state, target paths, and constraints inside the copy-paste block so the user doesn't have to explain anything to the remote agent.

---

## 4. High-Signal Formatting Standards

* **Binary Subtractive Filter**: Every instruction must either (1) specify the exact physical tap/entry, or (2) prevent catastrophic misconfiguration. Omit theoretical explanations.
* **Exact Values Provided**: Never tell the user to "name the folder something descriptive" or "enter your ID". Provide the literal copy-paste string or exact setting to select.
* **Zero Scaffolding**: No essays, no celebratory sign-offs. Provide the steps, execute the automated half, and await only the physical trigger.
