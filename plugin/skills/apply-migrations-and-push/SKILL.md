---
name: apply-migrations-and-push
description: >-
  Executes unapplied database migrations, verifies project build safety, and pushes code to GitHub cleanly. Use when you say "apply migrations and push", "push to github", "run migrations", "deploy changes", "commit and push", "ship this", "let's push", or "push this".
---

# Apply Database Migrations & Push to GitHub

## Rules
1. **Verify Project Context**: Check `git remote -v` and project path first to ensure operating on the correct target repository and database environment.
2. **Security & Secrets Guard**: Audit staged files to ensure `.env` files, API keys, passwords, credentials, tokens, or sensitive user data are NEVER staged or committed. Ensure `.gitignore` properly excludes secret files.
3. **Apply Pending Migrations**: Audit unapplied database migration files and safely execute the project's migration command, preserving data integrity and backward compatibility.
4. **Verify Build & Type Safety**: Run project type-checking and build validation commands to ensure zero broken builds before committing.
5. **Clean Remote Push**: Create clear, descriptive git commits and push safely to the verified remote repository.
