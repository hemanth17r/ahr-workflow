# The AHR Autonomous Stack & Handoff Playbook

> **Author**: Akkala Hemanth Reddy (`ahr`)  
> **Contact**: `hemanth17r@gmail.com` | [YouTube (@hemanth17a)](https://www.youtube.com/@hemanth17a) | [X (@hemanth17rr)](https://x.com/hemanth17rr) | [Instagram (@hemanth17a)](https://www.instagram.com/hemanth17a/) | [GitHub (@hemanth17r)](https://github.com/hemanth17r)  
> **Status**: Actively maintained & continuously updated as AI agent architectures evolve.

---

## 📌 Executive Philosophy: The 5% Human Rule

Most people fail with AI coding agents because they try to micromanage every terminal command, or they expect the agent to guess their passwords and OAuth screens.

The **AHR Philosophy** divides labor with mathematical precision:
- **The Agent does 95%**: Writing modular code, running type checks, configuring build pipelines, writing SQL migrations, setting up RLS policies, and committing to git.
- **The Human does 5%**: Physical authentication (clicking "Authorize" in the browser) and providing business intent.

---

## 🏗️ The Production Tech Stack Architecture

This is the exact stack used to build and deploy high-performance applications like HelpHive and CivicLens solo:

```
┌────────────────────────────────────────────────────────┐
│                   HUMAN OPERATOR                       │
│    Intent Prompting (95%) + Browser Logins (5%)       │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│               GOOGLE ANTIGRAVITY ENGINE                │
│    Master GEMINI.md Router + 30 Autonomous Skills      │
└──────────────┬──────────────────────────┬──────────────┘
               │                          │
               ▼                          ▼
┌──────────────────────────┐   ┌──────────────────────────┐
│     FRONTEND / CLIENT    │   │      BACKEND / DATA      │
│  • React 19 + Vite 8     │   │  • Supabase (PostgreSQL) │
│  • Tailwind CSS v4       │   │  • PostGIS Spatial Index │
│  • Lucide React Icons    │   │  • Row Level Security    │
│  • Offline-First PWA     │   │  • Realtime WebSockets   │
└──────────────┬───────────┘   └──────────┬───────────────┘
               │                          │
               ▼                          │
┌──────────────────────────┐              │
│       DEPLOYMENTS        │              │
│  • GitHub (Version SSOT) ◄──────────────┘
│  • Vercel Edge Network   │
│    (Auto-deploy on push) │
└──────────────────────────┘
```

---

## ⚡ The Autonomous Handoff Playbook

Here is how the 5% human / 95% agent division actually operates:

### 1. Version Control: GitHub Connection (Zero Manual Repo Creation)
- **Human Role (5%)**: Complete the one-time browser popup when `gh auth login` prompts for authorization.
- **Agent Role (95%)**: Checks/installs GitHub CLI, runs `git init`, creates the remote GitHub repository autonomously (`gh repo create --public --source=. --push`), writes semantic commit messages, and pushes without asking for passwords.

### 2. Live Hosting: Vercel Connection (Zero Dashboard Clicking)
- **Human Role (5%)**: Log into [vercel.com](https://vercel.com) in Chrome once.
- **Agent Role (95%)**: Opens Vercel via **Chrome DevTools MCP**, clicks "Import", links your GitHub repository, configures the build command (`npm run build`) and output directory (`dist`), and deploys to production.

### 3. Backend & Database: Supabase Connection (Zero Copy-Pasting Keys)
- **Human Role (5%)**: Log into [supabase.com](https://supabase.com) in Chrome once and approve new project creation.
- **Agent Role (95%)**: Navigates to Supabase API settings via **Chrome DevTools MCP**, extracts `Project URL` and `anon public key`, automatically writes `.env`, injects environment variables into Vercel, and executes database schemas and RLS policies via **Supabase MCP**.

### 4. Continuous Autonomous Deployments
- You simply tell Antigravity: *"Deploy my updates and ship to live."*
- The agent activates [`apply-migrations-and-push`](./skills/apply-migrations-and-push/SKILL.md), audits staged files to prevent secret leaks, executes database migrations, verifies type safety, and pushes to GitHub—which automatically goes live on Vercel in under 60 seconds.

---

## 🛠️ Step-by-Step Connection Manual
For the complete browser-driven setup using Chrome DevTools MCP, GitHub CLI, and Supabase MCP, see the full guide:  
👉 [**SETUP_AND_CONNECTIONS.md**](SETUP_AND_CONNECTIONS.md)

