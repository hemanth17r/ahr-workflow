---
name: apply-migrations-and-push
description: >-
  Executes unapplied database migrations, verifies project build safety, and pushes code to GitHub cleanly. Trigger on any deploy or push intent: "push", "push it", "push now", "push changes", "push to github", "sync to github", "deploy code", "ship updates", "apply migrations and push", "run migrations", "deploy changes", "commit and push", "ship this", or "let's push".
---

# Apply Database Migrations & Push to GitHub

## Rules
1. **Verify Project Context**: Check `git remote -v` and project path first to ensure operating on the correct target repository and database environment.
2. **Security & Secrets Guard**: Audit staged files to ensure `.env` files, API keys, passwords, credentials, tokens, or sensitive user data are NEVER staged or committed. Ensure `.gitignore` properly excludes secret files.
3. **Strict Schema-First Migration Gate (Zero-Drift Invariant)**:
   - **Pre-Flight Migration Scan**: Scan `supabase/migrations/` (or `prisma/migrations/`, `drizzle/`) for any untracked, modified, or newly created `.sql` migration files before touching code commits.
   - **Mandatory Execution Before Code Push**: Strictly forbid pushing code referencing new tables, columns, or RPCs before the underlying migration has been executed and verified against the target database (via Supabase MCP, CLI `supabase db push`, or direct migration execution).
   - **Schema-to-Code Parity Verification**: Query the target database or assert migration success to ensure the live database engine matches the code contract before committing.
   - **Backward-Compatible Rollouts**: Adhere strictly to the Expand/Contract lifecycle—never drop active columns, rename tables, or add non-null columns without defaults in a single migration phase while active production clients are running.
4. **Verify Build & Type Safety**: Run project type-checking and build validation commands to ensure zero broken builds before committing.
5. **Auto-Provision Cloud CI Gate**: Verify whether `.github/workflows/ci.yml` exists in the repository root. If missing, automatically stamp the Universal Polyglot CI workflow from `~/.gemini/config/templates/universal-ci.yml` to guarantee cloud-side build and type verification on GitHub.
6. **Clean Remote Push**: Create clear, descriptive git commits and push safely to the verified remote repository.

