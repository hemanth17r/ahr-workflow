#!/usr/bin/env bash
#
# AHR Autonomous Workflow Installer for Antigravity (macOS & Linux)
# Created by Akkala Hemanth Reddy (ahr) <hemanth17r@gmail.com>
#

set -e

REPO_URL="https://github.com/hemanth17r/ahr-workflow"
GEMINI_HOME="$HOME/.gemini"
CONFIG_DIR="$GEMINI_HOME/config"
SKILLS_DIR="$CONFIG_DIR/skills"
RULES_FILE="$GEMINI_HOME/GEMINI.md"

echo ""
echo "=========================================================="
echo "   AHR Autonomous Workflow Installer for Antigravity      "
echo "   Created by Akkala Hemanth Reddy (ahr)                  "
echo "=========================================================="
echo ""

# 1. Ensure target directories exist
mkdir -p "$CONFIG_DIR"
mkdir -p "$SKILLS_DIR"

# 2. Determine Source Location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || true)"
LOCAL_REPO="$(dirname "$SCRIPT_DIR")"

TEMP_DIR=""
if [ -d "$LOCAL_REPO/skills" ]; then
    echo "[+] Installing from local repository: $LOCAL_REPO"
    SOURCE_SKILLS="$LOCAL_REPO/skills"
    SOURCE_RULES="$LOCAL_REPO/rules/GEMINI.md"
else
    echo "[+] Downloading latest release from GitHub..."
    TEMP_DIR=$(mktemp -d)
    curl -fsSL "$REPO_URL/archive/refs/heads/main.tar.gz" | tar -xz -C "$TEMP_DIR"
    SOURCE_SKILLS="$TEMP_DIR/ahr-workflow-main/skills"
    SOURCE_RULES="$TEMP_DIR/ahr-workflow-main/rules/GEMINI.md"
fi

# 3. Create Backup of Existing Setup if Present
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="$GEMINI_HOME/backup_$TIMESTAMP"

if [ -d "$SKILLS_DIR" ] && [ "$(ls -A "$SKILLS_DIR" 2>/dev/null)" ]; then
    echo "[*] Creating safety backup of existing skills at: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR/skills"
    cp -r "$SKILLS_DIR"/* "$BACKUP_DIR/skills/"
fi

if [ -f "$RULES_FILE" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$RULES_FILE" "$BACKUP_DIR/GEMINI.md"
fi

# 4. Copy Skills
echo "[*] Installing 30 production skills to: $SKILLS_DIR"
cp -r "$SOURCE_SKILLS"/* "$SKILLS_DIR/"

# 5. Copy Rules
if [ -f "$SOURCE_RULES" ]; then
    echo "[*] Installing Global Engineering & Operating Standard to: $RULES_FILE"
    cp "$SOURCE_RULES" "$RULES_FILE"
fi

# 6. Cleanup Temp Files
if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
    rm -rf "$TEMP_DIR"
fi

# 7. Verification
INSTALLED_COUNT=$(ls -1d "$SKILLS_DIR"/*/ 2>/dev/null | wc -l)
echo ""
echo "=========================================================="
echo "   SUCCESS: $INSTALLED_COUNT Skills & Global Rules Installed!           "
echo "=========================================================="
echo ""
echo "Next Step: Restart Google Antigravity or open a new session."
echo "Your agent now operates with AHR's 30 production skills & rules."
echo ""
