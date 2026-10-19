---
name: start-dev-server
description: >-
  Automatically handles starting the local development server (npm run dev) and ensures the environment is clean by terminating any stale processes blocking the required port (e.g., 5173). Trigger when opening a project for the first time, on a fresh restart, or when asked to "start the server", "run the app", "start dev server", "npm run dev", "run dev", "preview this", "open in browser", or "spin up local server".
---

# Start Dev Server

## Overview
This skill starts the local development server using `npm run dev`. It first clears out any stale processes occupying the dev port (default 5173) to ensure a clean startup.

## Workflow

### 1. Clean up Stale Processes
Run the following PowerShell command to forcefully terminate any processes running on port 5173 (this handles the "port already in use" error).

```powershell
$port = 5173
$tcp = Get-NetTCPConnection -LocalPort $port -ErrorAction SilentlyContinue
if ($tcp) { Stop-Process -Id $tcp.OwningProcess -Force -ErrorAction SilentlyContinue }
```

### 2. Start the Server
Run the local development server command as a background task.
```powershell
npm run dev
```
*(Wait a couple of seconds for the background task to start, check the logs to ensure the server is running without errors).*

### 3. Handle Missing Dependencies (Optional)
If the server fails to start with errors indicating missing modules, run `npm install` and then repeat step 2.

## Common Mistakes
- **Polling for status:** Do not wait for `npm run dev` to finish. It is a long-running process and should be sent to the background using your command execution tool.
- **Not cleaning up the port:** Always run the cleanup PowerShell script first, otherwise the new server instance will crash if port 5173 is occupied.
