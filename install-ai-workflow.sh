#!/usr/bin/env bash

# ALEX AI Workflow Template Installer
# For macOS, Linux, and Git Bash

set -e

# Determine the directory containing this installer script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEMPLATES_DIR="${SCRIPT_DIR}/templates"

# Target directories to create in the current working directory
TARGET_DIRS=(
    ".ai/requirements"
    ".ai/specs"
    ".ai/plans"
    ".ai/templates"
    ".claude/commands"
    ".gemini/prompts"
    ".cursor/prompts"
    "docs"
)

# Files to copy
# Format: "source_relative_path:target_relative_path"
FILES_TO_COPY=(
    "CLAUDE.md:CLAUDE.md"
    "GEMINI.md:GEMINI.md"
    ".cursorrules:.cursorrules"
    "AI_WORKFLOW.md:docs/AI_WORKFLOW.md"
    "SPEC-template.md:.ai/templates/SPEC-template.md"
    "PLAN-template.md:.ai/templates/PLAN-template.md"
    "commands/ask.md:.claude/commands/ask.md"
    "commands/spec.md:.claude/commands/spec.md"
    "commands/plan.md:.claude/commands/plan.md"
    "commands/code.md:.claude/commands/code.md"
    "commands/review.md:.claude/commands/review.md"
    "commands/init-ai-workflow.md:.claude/commands/init-ai-workflow.md"
    "prompts/ask.md:.gemini/prompts/ask.md"
    "prompts/spec.md:.gemini/prompts/spec.md"
    "prompts/plan.md:.gemini/prompts/plan.md"
    "prompts/code.md:.gemini/prompts/code.md"
    "prompts/review.md:.gemini/prompts/review.md"
    "prompts/init-ai-workflow.md:.gemini/prompts/init-ai-workflow.md"
    "cursor/prompts/ask.md:.cursor/prompts/ask.md"
    "cursor/prompts/spec.md:.cursor/prompts/spec.md"
    "cursor/prompts/plan.md:.cursor/prompts/plan.md"
    "cursor/prompts/code.md:.cursor/prompts/code.md"
    "cursor/prompts/review.md:.cursor/prompts/review.md"
    "cursor/prompts/init-ai-workflow.md:.cursor/prompts/init-ai-workflow.md"
)



echo "============================================="
echo "  ALEX AI Workflow Installer (macOS/Linux)"
echo "============================================="
echo "Source: $TEMPLATES_DIR"
echo "Target: $(pwd)"
echo "---------------------------------------------"

# 1. Create target folders
for dir in "${TARGET_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo "[CREATED DIR] $dir"
    fi
done

# 2. Copy/Generate files with safety backup
for item in "${FILES_TO_COPY[@]}"; do
    src_rel="${item%%:*}"
    dest_rel="${item#*:}"
    
    src_file="${TEMPLATES_DIR}/${src_rel}"
    dest_file="$(pwd)/${dest_rel}"
    
    if [ ! -f "$src_file" ]; then
        echo "Error: Source template file not found: $src_file"
        exit 1
    fi
    
    # Ensure parent directory of destination exists (precautionary)
    dest_dir=$(dirname "$dest_file")
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
        echo "[CREATED DIR] $dest_dir"
    fi
    
    if [ -f "$dest_file" ]; then
        # File exists, create backup before overwriting
        timestamp=$(date +"%Y%m%d%H%M%S")
        backup_file="${dest_file}.bak.${timestamp}"
        
        cp "$dest_file" "$backup_file"
        echo "[BACKUP] $dest_rel -> $(basename "$backup_file")"
        
        cp "$src_file" "$dest_file"
        echo "[UPDATED] $dest_rel"
    else
        # File does not exist, copy new
        cp "$src_file" "$dest_file"
        echo "[NEW FILE] $dest_rel"
    fi
done

echo "---------------------------------------------"
echo "✔ Installation completed successfully!"
echo "============================================="
echo "For Claude Code users:"
echo "  1. Run: claude"
echo "  2. Run in Claude Code: /init-ai-workflow"
echo "  3. Start task with: /ask"
echo "---------------------------------------------"
echo "For Gemini users:"
echo "  1. Copy instructions from GEMINI.md to your chat."
echo "  2. Reference the templates under .gemini/prompts/ for tasks."
echo "  3. Start task by sending the prompt in .gemini/prompts/ask.md"
echo "---------------------------------------------"
echo "For Cursor users:"
echo "  1. Cursor automatically loads your rules from .cursorrules."
echo "  2. Start Composer (Ctrl+I) or chat (Ctrl+L)."
echo "  3. Reference templates in .cursor/prompts/ (e.g. @ask.md)."
echo "============================================="



