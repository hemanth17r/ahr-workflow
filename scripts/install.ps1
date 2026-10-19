<#
.SYNOPSIS
    Installs the AHR Autonomous Workflow (Skills & Rules) for Google Antigravity on Windows.
.DESCRIPTION
    Backs up existing configurations, installs 30 domain skills into ~/.gemini/config/skills,
    and sets ~/.gemini/GEMINI.md as the Global Engineering & Operating Standard.
#>

[CmdletBinding()]
param(
    [string]$RepoUrl = "https://github.com/hemanth17r/ahr-workflow",
    [switch]$Force
)

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   AHR Autonomous Workflow Installer for Antigravity      " -ForegroundColor Yellow
Write-Host "   Created by Akkala Hemanth Reddy (ahr)                  " -ForegroundColor White
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

$geminiHome = Join-Path $HOME ".gemini"
$configDir  = Join-Path $geminiHome "config"
$skillsDir  = Join-Path $configDir "skills"
$rulesFile  = Join-Path $geminiHome "GEMINI.md"

# 1. Ensure target directories exist
if (-not (Test-Path $configDir)) {
    New-Item -ItemType Directory -Path $configDir -Force | Out-Null
}
if (-not (Test-Path $skillsDir)) {
    New-Item -ItemType Directory -Path $skillsDir -Force | Out-Null
}

# 2. Determine Source Location
$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
$localRepoRoot = if ($scriptRoot) { Split-Path -Parent $scriptRoot } else { $null }

$tempDir = $null
if ($localRepoRoot -and (Test-Path (Join-Path $localRepoRoot "skills"))) {
    $sourceSkills = Join-Path $localRepoRoot "skills"
    $sourceRules  = Join-Path $localRepoRoot "rules\GEMINI.md"
    Write-Host "[+] Installing from local repository: $localRepoRoot" -ForegroundColor Green
} else {
    Write-Host "[+] Downloading latest release from GitHub..." -ForegroundColor Cyan
    $tempDir = Join-Path $env:TEMP ("ahr-workflow-" + [Guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
    
    $zipUrl = "$RepoUrl/archive/refs/heads/main.zip"
    $zipFile = Join-Path $tempDir "repo.zip"
    
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile -UseBasicParsing
    Expand-Archive -Path $zipFile -DestinationPath $tempDir -Force
    
    $extractedFolder = Join-Path $tempDir "ahr-workflow-main"
    $sourceSkills = Join-Path $extractedFolder "skills"
    $sourceRules  = Join-Path $extractedFolder "rules\GEMINI.md"
}

# 3. Create Backup of Existing Setup if Present
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupDir = Join-Path $geminiHome "backup_$timestamp"

if ((Test-Path $skillsDir) -and (Get-ChildItem -Path $skillsDir -ErrorAction SilentlyContinue).Count -gt 0) {
    Write-Host "[*] Creating safety backup of existing skills at: $backupDir" -ForegroundColor Yellow
    New-Item -ItemType Directory -Path (Join-Path $backupDir "skills") -Force | Out-Null
    Copy-Item -Path "$skillsDir\*" -Destination (Join-Path $backupDir "skills") -Recurse -Force
}
if (Test-Path $rulesFile) {
    if (-not (Test-Path $backupDir)) {
        New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
    }
    Copy-Item -Path $rulesFile -Destination (Join-Path $backupDir "GEMINI.md") -Force
}

# 4. Copy Skills
Write-Host "[*] Installing 30 production skills to: $skillsDir" -ForegroundColor Cyan
$skillFolders = Get-ChildItem -Path $sourceSkills -Directory
foreach ($folder in $skillFolders) {
    $dest = Join-Path $skillsDir $folder.Name
    Copy-Item -Path $folder.FullName -Destination $dest -Recurse -Force
}

# 5. Copy Rules
if (Test-Path $sourceRules) {
    Write-Host "[*] Installing Global Engineering & Operating Standard to: $rulesFile" -ForegroundColor Cyan
    Copy-Item -Path $sourceRules -Destination $rulesFile -Force
}

# 6. Cleanup Temp Files
if ($tempDir -and (Test-Path $tempDir)) {
    Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}

# 7. Verification
$installedCount = (Get-ChildItem -Path $skillsDir -Directory).Count
Write-Host ""
Write-Host "==========================================================" -ForegroundColor Green
Write-Host "   SUCCESS: $installedCount Skills & Global Rules Installed!           " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next Step: Restart Google Antigravity or open a new session." -ForegroundColor White
Write-Host "Your agent now operates with AHR's 30 production skills & rules." -ForegroundColor White
Write-Host ""
