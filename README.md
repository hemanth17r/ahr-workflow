<div align="center">

# ⚡ AHR Autonomous Workflow for Google Antigravity

**The complete 30-skill autonomous operating system and global engineering rules used to build production software solo.**

Created & maintained by **Akkala Hemanth Reddy (`ahr`)**  

[![YouTube](https://img.shields.io/badge/YouTube-%40hemanth17a-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/@hemanth17a)
[![X (Twitter)](https://img.shields.io/badge/X-%40hemanth17rr-000000?style=flat-square&logo=x&logoColor=white)](https://x.com/hemanth17rr)
[![Instagram](https://img.shields.io/badge/Instagram-%40hemanth17a-E4405F?style=flat-square&logo=instagram&logoColor=white)](https://www.instagram.com/hemanth17a/)
[![GitHub](https://img.shields.io/badge/GitHub-%40hemanth17r-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/hemanth17r)
[![Email](https://img.shields.io/badge/Email-hemanth17r%40gmail.com-blue?style=flat-square&logo=gmail&logoColor=white)](mailto:hemanth17r@gmail.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](LICENSE)

</div>

---

## 📺 Complete Walkthrough Video
> **YouTube Video Guide**: Subscribe on [**YouTube (@hemanth17a)**](https://www.youtube.com/@hemanth17a) for the complete video walkthrough.  
> The video covers installation, live debugging, and how Antigravity handles the 95% automated workflow while you only handle the 5% human sign-ins.

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

## 🌐 Connect & Community

Follow for upcoming workflow releases, agent breakdowns, and project drops:

| Platform | Handle | Direct Link |
| :--- | :--- | :--- |
| **YouTube** | `@hemanth17a` | [youtube.com/@hemanth17a](https://www.youtube.com/@hemanth17a) |
| **X (Twitter)** | `@hemanth17rr` | [x.com/hemanth17rr](https://x.com/hemanth17rr) |
| **Instagram** | `@hemanth17a` | [instagram.com/hemanth17a](https://www.instagram.com/hemanth17a/) |
| **GitHub** | `@hemanth17r` | [github.com/hemanth17r](https://github.com/hemanth17r) |
| **Email** | `hemanth17r@gmail.com` | [hemanth17r@gmail.com](mailto:hemanth17r@gmail.com) |

---

## 🔄 Updates & Maintenance

This workflow is actively maintained by **Akkala Hemanth Reddy (`ahr`)** as new Antigravity features and frontier models emerge. Have an improvement or a custom skill to contribute? PRs and Issues are welcome!

---

## 📄 License

Distributed under the [MIT License](LICENSE). Free for personal and commercial use.
