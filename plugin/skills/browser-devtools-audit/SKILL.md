---
name: browser-devtools-audit
description: >-
  Uses Chrome DevTools and browser inspection tools to carefully test, audit, and verify web interfaces. Halts and asks for clarification if requirements are ambiguous or before executing important/destructive actions. Use when you say "use browser agent", "use browser devtools", "inspect in browser", or "test in browser carefully".
---

# Browser DevTools Audit & Verification

## Rules
1. **Use Browser Tools**: Use Chrome DevTools to navigate pages, inspect visual layouts, take screenshots, check console logs, and monitor network requests.
2. **Methodical Verification**: Test visual alignment, interactive flows, responsive viewports, and verify zero unhandled console errors or failed API requests.
3. **Stop & Ask on Ambiguity or Destructive Actions**: If UI behavior is unexpected, credentials are required, business logic is ambiguous, or performing important/non-reversible actions (like deleting or removing files, data, or resources), STOP immediately and ask the user for explicit confirmation before proceeding.
4. **No Masking Errors**: Address underlying root causes identified in console logs or DOM errors; do not swallow exceptions or apply superficial patches.
