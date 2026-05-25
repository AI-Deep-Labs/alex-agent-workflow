# ALEX AI Workflow Template Installer
# For Windows PowerShell

$ErrorActionPreference = "Stop"

# Determine the directory containing this installer script
$SCRIPT_DIR = $PSScriptRoot
if (-not $SCRIPT_DIR) {
    $SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
}
$TEMPLATES_DIR = Join-Path $SCRIPT_DIR "templates"

# Target directories to create in the current working directory
$TARGET_DIRS = @(
    ".ai\requirements",
    ".ai\specs",
    ".ai\plans",
    ".ai\templates",
    ".claude\commands",
    ".gemini\prompts",
    ".cursor\prompts",
    "docs"
)

# Files to copy
$FILES_TO_COPY = @(
    @{ Src = "CLAUDE.md"; Dest = "CLAUDE.md" },
    @{ Src = "GEMINI.md"; Dest = "GEMINI.md" },
    @{ Src = ".cursorrules"; Dest = ".cursorrules" },
    @{ Src = "AI_WORKFLOW.md"; Dest = "docs\AI_WORKFLOW.md" },
    @{ Src = "SPEC-template.md"; Dest = ".ai\templates\SPEC-template.md" },
    @{ Src = "PLAN-template.md"; Dest = ".ai\templates\PLAN-template.md" },
    @{ Src = "commands\ask.md"; Dest = ".claude\commands\ask.md" },
    @{ Src = "commands\spec.md"; Dest = ".claude\commands\spec.md" },
    @{ Src = "commands\plan.md"; Dest = ".claude\commands\plan.md" },
    @{ Src = "commands\code.md"; Dest = ".claude\commands\code.md" },
    @{ Src = "commands\review.md"; Dest = ".claude\commands\review.md" },
    @{ Src = "commands\init-ai-workflow.md"; Dest = ".claude\commands\init-ai-workflow.md" },
    @{ Src = "prompts\ask.md"; Dest = ".gemini\prompts\ask.md" },
    @{ Src = "prompts\spec.md"; Dest = ".gemini\prompts\spec.md" },
    @{ Src = "prompts\plan.md"; Dest = ".gemini\prompts\plan.md" },
    @{ Src = "prompts\code.md"; Dest = ".gemini\prompts\code.md" },
    @{ Src = "prompts\review.md"; Dest = ".gemini\prompts\review.md" },
    @{ Src = "prompts\init-ai-workflow.md"; Dest = ".gemini\prompts\init-ai-workflow.md" },
    @{ Src = "cursor\prompts\ask.md"; Dest = ".cursor\prompts\ask.md" },
    @{ Src = "cursor\prompts\spec.md"; Dest = ".cursor\prompts\spec.md" },
    @{ Src = "cursor\prompts\plan.md"; Dest = ".cursor\prompts\plan.md" },
    @{ Src = "cursor\prompts\code.md"; Dest = ".cursor\prompts\code.md" },
    @{ Src = "cursor\prompts\review.md"; Dest = ".cursor\prompts\review.md" },
    @{ Src = "cursor\prompts\init-ai-workflow.md"; Dest = ".cursor\prompts\init-ai-workflow.md" }
)



Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "  ALEX AI Workflow Installer (Windows PS)" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "Source: $TEMPLATES_DIR"
Write-Host "Target: $($PWD.Path)"
Write-Host "---------------------------------------------"

# 1. Create target folders
foreach ($dir in $TARGET_DIRS) {
    $fullDir = Join-Path $PWD.Path $dir
    if (-not (Test-Path -Path $fullDir)) {
        New-Item -ItemType Directory -Force -Path $fullDir | Out-Null
        Write-Host "[CREATED DIR] $dir" -ForegroundColor Green
    }
}

# 2. Copy/Generate files with safety backup
foreach ($item in $FILES_TO_COPY) {
    $srcFile = Join-Path $TEMPLATES_DIR $item.Src
    $destFile = Join-Path $PWD.Path $item.Dest
    
    if (-not (Test-Path -Path $srcFile)) {
        Write-Error "Error: Source template file not found: $srcFile"
        return
    }
    
    # Ensure parent directory of destination exists (precautionary)
    $destDir = Split-Path -Parent $destFile
    if (-not (Test-Path -Path $destDir)) {
        New-Item -ItemType Directory -Force -Path $destDir | Out-Null
        Write-Host "[CREATED DIR] $(Split-Path $item.Dest -Parent)" -ForegroundColor Green
    }
    
    if (Test-Path -Path $destFile) {
        # File exists, create backup before overwriting
        $timestamp = Get-Date -Format "yyyyMMddHHmmss"
        $backupFile = "${destFile}.bak.${timestamp}"
        
        Copy-Item -Path $destFile -Destination $backupFile -Force
        Write-Host "[BACKUP] $($item.Dest) -> $(Split-Path $backupFile -Leaf)" -ForegroundColor Yellow
        
        Copy-Item -Path $srcFile -Destination $destFile -Force
        Write-Host "[UPDATED] $($item.Dest)" -ForegroundColor Cyan
    } else {
        # File does not exist, copy new
        Copy-Item -Path $srcFile -Destination $destFile -Force
        Write-Host "[NEW FILE] $($item.Dest)" -ForegroundColor Green
    }
}

Write-Host "---------------------------------------------"
Write-Host " SUCCESS: Installation completed successfully!" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "For Claude Code users:" -ForegroundColor Yellow
Write-Host "  1. Run: claude" -ForegroundColor White
Write-Host "  2. Run in Claude Code: /init-ai-workflow" -ForegroundColor White
Write-Host "  3. Start task with: /ask" -ForegroundColor White
Write-Host "---------------------------------------------" -ForegroundColor Cyan
Write-Host "For Gemini users:" -ForegroundColor Yellow
Write-Host "  1. Copy instructions from GEMINI.md to your chat." -ForegroundColor White
Write-Host "  2. Reference the templates under .gemini/prompts/ for tasks." -ForegroundColor White
Write-Host "  3. Start task by sending the prompt in .gemini/prompts/ask.md" -ForegroundColor White
Write-Host "---------------------------------------------" -ForegroundColor Cyan
Write-Host "For Cursor users:" -ForegroundColor Yellow
Write-Host "  1. Cursor automatically loads your rules from .cursorrules." -ForegroundColor White
Write-Host "  2. Start Composer (Ctrl+I) or chat (Ctrl+L)." -ForegroundColor White
Write-Host "  3. Reference templates in .cursor/prompts/ (e.g. @ask.md)." -ForegroundColor White
Write-Host "=============================================" -ForegroundColor Cyan




