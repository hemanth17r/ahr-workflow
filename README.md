<div align="center">

# ⚡ AHR Autonomous Workflow for Google Antigravity

**The complete 30-skill autonomous operating system and global engineering rules used to build production software solo.**

Created & maintained by **Akkala Hemanth Reddy (`ahr`)**  
[![Email](https://img.shields.io/badge/Contact-hemanth17r%40gmail.com-blue?style=flat-square&logo=gmail)](mailto:hemanth17r@gmail.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](LICENSE)
[![Skills: 30](https://img.shields.io/badge/Skills-30%20Loaded-orange?style=flat-square)](SKILLS_DIRECTORY.md)
[![Platform: Antigravity](https://img.shields.io/badge/Engine-Google%20Antigravity-purple?style=flat-square)](https://ai.google.dev)

</div>

---

## 📺 Complete Walkthrough Video
> **YouTube Video Guide**: *[Link coming soon - Subscribe for release updates]*  
> A complete visual walkthrough covering installation, live debugging, and how Antigravity handles the 95% automated workflow while you only handle the 5% human sign-ins.

---

## 🚀 30-Second Quickstart (1-Click Install)

No manual file copying required. Run one command in your terminal to install all 30 skills and the master rules:

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/hemanth17r/ahr-workflow/main/scripts/install.ps1 | iex
```

### macOS & Linux (Bash)
```bash
curl -fsSL https://raw.githubusercontent.com/hemanth17r/ahr-workflow/main/scripts/install.sh | bash
```

> **What the installer does**:
> 1. Safely backs up any existing skills or rules to `~/.gemini/backup_<timestamp>/`.
> 2. Installs all 30 skills into `~/.gemini/config/skills/`.
> 3. Installs the master `GEMINI.md` Global Engineering Standard into `~/.gemini/GEMINI.md`.
> 4. You simply restart Antigravity, and all skills are active immediately.

---

## 🧠 What Makes This Setup Different?

Most developer prompt collections overwhelm the AI model by dumping thousands of tokens into the context window on every prompt. This workflow is built on two core architectural pillars:

### 1. Progressive Disclosure (Zero Context Waste)
Antigravity loads **only** the title and brief description of each skill into memory. The full skill body is loaded dynamically **only when your prompt triggers that specific intent**. You get 30 enterprise-grade capabilities with zero prompt bloat.

### 2. The 5% Human vs. 95% Agent Rule
You never need to touch complex command lines or webhooks. The agent manages:
- **95%**: Writing code, running automated tests, creating git commits, building SQL schemas, and deploying.
- **5%**: You only click "Authorize" when an authentication screen opens in your browser.

Read the full architecture breakdown in [**AHR_STACK.md**](AHR_STACK.md).

---

## 📂 Repository Layout

```text
ahr-workflow/
├── rules/
│   └── GEMINI.md               # Master Global Engineering & Operating Standard
├── skills/                     # 30 Modular Production Skills
│   ├── root-cause-triage/      # Zero speculative edits until reproduction tests fail
│   ├── big-tech-ui-craft/      # Apple/Linear visual alignment, typography & spacing
│   ├── big-tech-db-craft/      # 4-phase zero-downtime Expand/Contract schema migrations
│   ├── shift-left-verification/# Google Small Tests (<100ms) with zero mocking illusions
│   └── ... (all 30 skills)
├── plugin/                     # Turnkey Antigravity Plugin Package
│   ├── plugin.json             # Manifest file
│   ├── rules/AGENTS.md         # Bundled rules
│   └── skills/                 # Bundled skills
├── scripts/
│   ├── install.ps1             # 1-Click Windows installer
│   └── install.sh              # 1-Click macOS/Linux installer
├── SKILLS_DIRECTORY.md         # Exhaustive 30-skill catalog with triggers & outcomes
├── AHR_STACK.md                # Full production stack (React 19 + Supabase + Vercel)
└── LICENSE                     # MIT License
```

---

## 📚 Complete Skill Catalog

Explore the full inventory of skills, trigger keywords, and guardrails in [**SKILLS_DIRECTORY.md**](SKILLS_DIRECTORY.md).

Quick Highlights:
- **Bug Triage**: `root-cause-triage` strictly forbids touching production code until an isolated, deterministic test proves the bug.
- **Visual Design**: `big-tech-ui-craft` and `fluid-tactile-motion` enforce optical centering, mobile budgeting (375px), and real spring physics.
- **Databases**: `big-tech-db-craft` and `big-tech-db-resilience` enforce lock safety, keyset pagination, and atomic guards.
- **Strategy**: `idea-reality-check` forces a prior-art package audit before letting the agent write bespoke utilities from scratch.

---

## 🔄 Updates & Maintenance

This workflow is actively maintained by **Akkala Hemanth Reddy (`ahr`)** as new Antigravity features and frontier models emerge. 

Have an improvement or a custom skill to contribute? PRs and Issues are welcome!

- **Email**: `hemanth17r@gmail.com`
- **GitHub**: [@hemanth17r](https://github.com/hemanth17r)

---

## 📄 License

Distributed under the [MIT License](LICENSE). Free for personal and commercial use.
