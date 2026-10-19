# The AHR Autonomous Connection Guide
### Zero-to-Production: Browser DevTools MCP + GitHub CLI + Supabase + Vercel

> **Author**: Akkala Hemanth Reddy (`ahr`)  
> **Contact**: `hemanth17r@gmail.com` | [YouTube (@hemanth17a)](https://www.youtube.com/@hemanth17a) | [X (@hemanth17rr)](https://x.com/hemanth17rr)  
> **Philosophy**: You should **never** follow a 30-step manual dashboard tutorial. Antigravity includes Chrome DevTools MCP by default. The human only performs the physical account logins (Google/GitHub SSO & 2FA); the agent navigates the screens, clicks the buttons, links repos, and extracts keys.

---

## 🧭 The Autonomous Setup Map

```
┌────────────────────────────────────────────────────────┐
│                      HUMAN OPERATOR                    │
│   • Runs 1-Click Installer (or tells agent to install) │
│   • Types Master Passwords / Approves 2FA in Browser   │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│               GOOGLE ANTIGRAVITY AGENT                 │
│                                                        │
│  [Terminal Automation]         [Browser DevTools MCP]  │
│  • Runs GitHub CLI (`gh`)      • Opens Supabase/Vercel │
│  • Pushes code & git commits   • Clicks "Import Repo"  │
│  • Writes schemas & migrations • Copies API Keys       │
└──────────────┬──────────────────────────┬──────────────┘
               │                          │
               ▼                          ▼
┌──────────────────────────┐   ┌──────────────────────────┐
│   GITHUB REPOSITORY      │   │   SUPABASE + VERCEL      │
│   • Created via `gh`     │   │   • Database configured  │
│   • Synced on push       │   │   • Deployed to live URL │
└──────────────────────────┘   └──────────────────────────┘
```

---

## ⚡ Step-by-Step Connection Protocol

### Step 1: Install Antigravity & Mount the AHR Workflow
1. Download and open **Google Antigravity**.
2. Run the 1-click installer:
   - **Agent Way (Recommended)**: Tell Antigravity:  
     `Install the AHR Autonomous Workflow from https://github.com/hemanth17r/ahr-workflow onto this machine.`
   - **Terminal Way**:  
     ```powershell
     irm https://raw.githubusercontent.com/hemanth17r/ahr-workflow/main/scripts/install.ps1 | iex
     ```
3. Restart Antigravity. All 30 skills and master engineering rules (`GEMINI.md`) are now live.

---

### Step 2: GitHub Connection (1-Time Browser Auth)
To let Antigravity create repositories and push commits autonomously without asking for credentials:

1. **Tell Antigravity**:
   > *"Check if GitHub CLI is installed, and run `gh auth login` for me."*
2. **What the Agent Does (95%)**:
   - Checks/installs GitHub CLI (`winget` / `brew`).
   - Runs `gh auth login` selecting `GitHub.com` $\rightarrow$ `HTTPS` $\rightarrow$ `Web browser auth`.
3. **What You Do (5%)**:
   - A browser tab opens automatically; click **"Authorize github"** to confirm your account.
4. **Result**: From this moment on, you never touch git again. When you say *"ship this project"*, Antigravity runs `git init`, creates the remote repo via `gh repo create`, stages files, and pushes code automatically.

---

### Step 3: Vercel Connection via Chrome DevTools MCP
You don't need to manually click through deployment wizards:
1. **What You Do (5%)**: Log into your [vercel.com](https://vercel.com) account in Chrome once.
2. **What the Agent Does (95%)**: Tell Antigravity:
   > *"Using browser devtools, navigate to Vercel, import my new GitHub repository, and deploy it to production."*
3. The agent activates **Chrome DevTools MCP**:
   - Opens Vercel in Chrome.
   - Detects your GitHub repos and clicks **"Import"**.
   - Verifies the framework preset is **Vite**, build command is `npm run build`, and output directory is `dist`.
   - Clicks **"Deploy"** and reports the live production URL back to you in chat.

---

### Step 4: Supabase Connection & API Key Extraction
1. **What You Do (5%)**: Log into [supabase.com](https://supabase.com) in your browser and click "New Project" (or ask the agent to open the new project screen for you).
2. **What the Agent Does (95%)**:
   - Tell Antigravity:  
     > *"Navigate to my Supabase project API settings using browser devtools, copy the Project URL and anon public key, and write them into my project's `.env` file."*
   - The agent reads the page snapshot, copies the credentials, creates your `.env` file (`VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`), and injects them into Vercel's Environment Variables settings page via DevTools MCP.

---

### Step 5: Direct Database Management (Supabase MCP)
To allow Antigravity to run database migrations, inspect tables, and configure Row Level Security (RLS) directly without you ever opening SQL editors:
1. Antigravity connects to your project using the **Supabase MCP server**.
2. When you say *"create a users table with RLS"*, the agent executes the migration directly via MCP, verifies index creation, and tests access rules in real time.

---

## 🔁 The Complete Autonomous Loop

Once these 4 connections are active, your entire workflow operates through a single prompt:

```
You: "Add Google Authentication and an interactive dashboard screen, then ship to live."
  ↓
Agent:
1. Writes the frontend components (React 19 + Tailwind v4).
2. Runs tests and verifies build integrity (`npm run build`).
3. Executes database migrations via Supabase MCP.
4. Commits and pushes changes via GitHub CLI (`git push origin main`).
5. GitHub webhooks trigger Vercel to auto-deploy to your live domain in <60s.
  ↓
Agent: "Done. Deployed live to https://your-project.vercel.app with zero errors."
```
