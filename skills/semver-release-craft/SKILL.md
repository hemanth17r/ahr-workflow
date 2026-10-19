---
name: semver-release-craft
description: >-
  Universal semantic versioning, release management, and Git tagging standard. Enforces Single Source of Truth (SSOT) version registers (package.json, pyproject.toml, Cargo.toml), automated SemVer bump classification (MAJOR.MINOR.PATCH), structured CHANGELOG maintenance, and annotated Git release tagging. Trigger when asked to "prepare release", "tag version", "cut release", "bump version", "semver release", "release version", "tag release", or "publish release".
---

# SemVer Release Craft & Release Architecture Standard

## The Prime Directive
**Never commit or deploy software with disconnected, arbitrary, or unpinned version states.**

Every release must have a mathematically consistent Semantic Version (`vMAJOR.MINOR.PATCH`), a verified Single Source of Truth (SSOT) register in the codebase, an annotated Git tag, and a synchronized changelog entry.

---

## 1. The 3-Tier SemVer Decision Matrix

When preparing a release, analyze the Git diff since the last release tag:

```
v MAJOR . MINOR . PATCH
    │       │       │
    │       │       └── PATCH (0.0.X): Bug fixes, styling polish, microcopy, internal refactors
    │       └────────── MINOR (0.X.0): Additive new features, new endpoints/screens, backward-compatible
    └────────────────── MAJOR (X.0.0): Breaking API changes, schema removals, fundamental paradigm shifts
```

---

## 2. Universal 5-Step Release Execution Protocol

Whenever this skill is triggered, execute these 5 steps in order:

### Step 1: Detect the Single Source of Truth (SSOT)
Scan the repository root for the language-specific version register:
* **Node / TypeScript / JavaScript:** `package.json` (`"version": "X.Y.Z"`)
* **Python:** `pyproject.toml` (`version = "X.Y.Z"`) or `setup.py`
* **Rust:** `Cargo.toml` (`version = "X.Y.Z"`)
* **Go:** `version.go` or Git tags only
* **Dart / Flutter:** `pubspec.yaml` (`version: X.Y.Z+build`)

If the application has an internal constant (e.g. `export const APP_VERSION`), ensure it dynamically references or mirrors the SSOT register to prevent drift.

### Step 2: Determine Current vs. Target Version
1. Query existing tags: `git tag --sort=-v:refname`
2. Read current version from SSOT file.
3. Compare diff: `git log $(git describe --tags --abbrev=0)..HEAD --oneline`
4. Apply SemVer rules to calculate the exact next version:
   - Contains breaking changes? $\to$ Bump **MAJOR** (e.g., `1.2.4` $\to$ `2.0.0`).
   - Contains new features/screens? $\to$ Bump **MINOR** (e.g., `1.2.4` $\to$ `1.3.0`).
   - Contains only bug fixes/polish? $\to$ Bump **PATCH** (e.g., `1.2.4` $\to$ `1.2.5`).

### Step 3: Update the SSOT Version Register
Update the target version in `package.json`, `pyproject.toml`, or `Cargo.toml`. Never leave it stale.

### Step 4: Update or Generate `CHANGELOG.md`
Prepend a structured entry following standard Keep a Changelog conventions:
```markdown
## [vX.Y.Z] - YYYY-MM-DD
### Added
- New features added in this release.
### Fixed
- Bugs and defects resolved.
### Changed
- Backward-compatible updates or refactors.
### Breaking Changes (if MAJOR)
- List breaking modifications.
```

### Step 5: Commit and Cut Annotated Git Tag
1. Stage modified version and changelog files:
   ```bash
   git add <version_file> CHANGELOG.md
   git commit -m "chore(release): vX.Y.Z"
   ```
2. Create an annotated Git tag with a release summary:
   ```bash
   git tag -a vX.Y.Z -m "Release vX.Y.Z: <Summary of changes>"
   ```
3. Push commit and tag to remote (unless hold-git-push is active):
   ```bash
   git push origin <branch> --tags
   ```

---

## 3. Pre-Release Verification Checklist
Before cutting any release tag:
- [ ] Working tree is clean (no uncommitted dirty files).
- [ ] Test suite passes with 0 failures (`pytest`, `npm test`, `cargo test`).
- [ ] Production build succeeds (`npm run build`, `cargo build`, etc.).
- [ ] No temporary debug logs, print statements, or secrets are committed.
