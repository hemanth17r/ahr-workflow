---
name: hold-git-push
description: >-
  Prevents auto-pushing code to remote GitHub repositories while allowing local git commits. Trigger when asked to keep commits local: "hold push", "don't push", "no push", "keep it local", "local only", "local commits only", "don't push to github", "stop push", or "hold remote sync".
---

# Hold Remote Git Push

## Rules
1. **Local Commits Allowed**: Staging files and creating local git commits is permitted.
2. **No Remote Push**: Do NOT execute `git push` or push changes to any remote repository.
3. **Verify Context**: Confirm current branch and remote repository identity before staging local changes.
