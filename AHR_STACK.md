# The AHR Autonomous Stack & Handoff Playbook

> **Author**: Akkala Hemanth Reddy (`ahr`)  
> **Contact**: `hemanth17r@gmail.com`  
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

## ⚡ The Step-by-Step Handoff Playbook

Here is how you connect these services with minimal manual effort:

### 1. Version Control: GitHub Connection
- **Human Role (5%)**: Open [github.com/new](https://github.com/new), create an empty repository, and copy the repository URL. (Or sign into GitHub CLI once with `gh auth login`).
- **Agent Role (95%)**: Run `git init`, set branch to `main`, stage all files, write semantic commits, link `git remote add origin <url>`, and push the codebase cleanly.

### 2. Live Hosting: Vercel Connection
- **Human Role (5%)**: Go to [vercel.com](https://vercel.com), click **Add New Project**, and select your GitHub repository.
- **Agent Role (95%)**: Configures `vite.config.js` and `package.json` build scripts (`npm run build`), ensures the output directory is `dist`, and verifies that zero build or lint errors exist. Every future git push triggers an automatic production deployment.

### 3. Backend & Database: Supabase Connection
- **Human Role (5%)**: Go to [supabase.com](https://supabase.com), create a new project, and copy the `Project URL` and `anon public key` into your `.env` file.
- **Agent Role (95%)**: Writes all PostgreSQL table schemas, configures Row Level Security (RLS) policies, builds RPC procedures, adds PostGIS spatial indexes, and manages zero-downtime database migrations safely.

### 4. Continuous Maintenance
- Whenever you ask Antigravity to *"deploy changes"* or *"ship this"*, it triggers [`apply-migrations-and-push`](./skills/apply-migrations-and-push/SKILL.md), audits staged files for accidental secret leaks, runs build checks, and pushes directly to GitHub—which automatically goes live on Vercel.
