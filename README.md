# ALEX AI Workflow Template for Claude Code & Gemini

A standardized, highly structured development workflow template built specifically for teams using **Claude Code** and **Gemini** (including Gemini Advanced, Gemini Code Assist, and Google AI Studio).

This repository contains reusable configurations, custom commands, prompt templates, and automated installers that instantly bootstrap any software project with the **ALEX AI Development Workflow**.

---

## 1. Core Objectives

* **Zero Premature Coding**: AI models MUST NOT write or modify application code directly from raw requirements.
* **Rigorous Clarification & Planning**: Every change is driven by a clear, step-by-step technical spec and implementation plan.
* **Explicit Guardrails**: Safe code boundaries, no out-of-scope refactoring, and strict developer approvals are hardcoded in the guidelines.
* **Universal Automation**: A single command runs the installers to bootstrap or repair the workflow files in seconds.

---

## 2. Directory Layout

### A. Template Repository Structure
The repository is structured as follows:


```text
ALEX-ai-workflow-template/
├── install-ai-workflow.sh      # Installer for macOS, Linux, and Git Bash
├── install-ai-workflow.ps1     # Installer for Windows PowerShell
├── README.md                   # Project documentation (this file)
└── templates/                  # Base configuration templates
    ├── CLAUDE.md               # Main Claude guideline and tech command reference
    ├── GEMINI.md               # Main Gemini guideline and simulated commands
    ├── AI_WORKFLOW.md          # Comprehensive workflow documentation
    ├── SPEC-template.md        # Technical Specification template
    ├── PLAN-template.md        # Technical Implementation Plan template
    ├── commands/               # Claude Code custom slash commands
    │   ├── init-ai-workflow.md # Slash command: /init-ai-workflow
    │   ├── ask.md              # Slash command: /ask
    │   ├── spec.md             # Slash command: /spec
    │   ├── plan.md             # Slash command: /plan
    │   ├── code.md             # Slash command: /code
    │   └── review.md           # Slash command: /review
    └── prompts/                # Gemini workflow prompt templates
        ├── init-ai-workflow.md # Prompt: init-ai-workflow
        ├── ask.md              # Prompt: ask
        ├── spec.md             # Prompt: spec
        ├── plan.md             # Prompt: plan
        ├── code.md             # Prompt: code
        └── review.md           # Prompt: review
```

### B. Installed Target Project Structure
After running the installer in a target project, the following clean, symmetrical layout is created:

```text
your-target-project/
├── CLAUDE.md                   # Main Claude guideline and tech command reference
├── GEMINI.md                   # Main Gemini guideline and simulated commands
├── .ai/                        # Core AI spec/plan storage
│   ├── requirements/           # Raw customer requirement files (optional)
│   ├── specs/                  # Approved specifications (SPEC-[name].md)
│   ├── plans/                  # Approved implementation plans (PLAN-[name].md)
│   └── templates/              # Base templates for SPECs and PLANs
├── .claude/
│   └── commands/               # Local Claude Code commands (/ask, /spec, etc.)
├── .gemini/
│   └── prompts/                # Copied Gemini prompts (ask.md, spec.md, etc.)
└── docs/
    └── AI_WORKFLOW.md          # Comprehensive reference guide for the team
```

---


## 3. The 5-Step Workflow Lifecycle

When this template is installed in a target repository, the AI behaves according to the following states:

1. **ASK** (`/ask`): AI clarifies requirements, extracts business goals, list edge cases, and raises up to 5 critical questions.
2. **SPEC** (`/spec`): AI writes a formal system specification under `.ai/specs/SPEC-[short-name].md` and waits for `APPROVED` confirmation.
3. **PLAN** (`/plan`): AI analyzes code files, designs structural modifications, lists risks, saves a plan to `.ai/plans/PLAN-[short-name].md`, and waits for `APPROVED CODE` confirmation.
4. **CODE** (`/code`): AI writes code strictly matching the approved plan, runs build/test commands, and reports a comprehensive changelog.
5. **REVIEW** (`/review`): AI reviews the git diff to flag security vulnerabilities, performance regressions, and logical bugs.

---

## 4. How to Install in Your Project

Open your terminal, navigate to the root of your target project, and run the script relative to this directory.

### macOS / Linux / Git Bash
```bash
/path/to/ALEX-ai-workflow-template/install-ai-workflow.sh
```

### Windows (PowerShell)
```powershell
& "C:\path\to\ALEX-ai-workflow-template\install-ai-workflow.ps1"
```

---

## 5. Post-installation Steps

Once the installer runs successfully in your target project:

### A. If using Claude Code:
1. Open **Claude Code** in the root of your project:
   ```bash
   claude
   ```
2. Initialize or repair the workflow in Claude:
   ```text
   /init-ai-workflow
   ```
3. Start your first task:
   ```text
   /ask I want to add cash payment option to the checkout page.
   ```

### B. If using Gemini (IDE Sidebar / Browser Chat):
1. Copy the system guidelines in **`GEMINI.md`** and paste them into your Gemini chat session.
2. Open and copy the prompt in **`.gemini/prompts/init-ai-workflow.md`** to let Gemini scan your repository, verify folder structures, and update files.
3. Start your first task by copying the prompt in **`.gemini/prompts/ask.md`**, replacing the placeholder text with your requirement:
   ```text
   [INSERT YOUR FEATURE REQUEST OR BUG DESCRIPTION HERE]
   ```

### C. If using Gemini in Antigravity (Native Agentic Slash Commands):
Since **Antigravity** is a fully autonomous agent with file system, CLI execution, and search tools:
1. **You do NOT need to copy-paste anything.**
2. Simply type the slash command directly in our chat box!
   - `/init-ai-workflow` - To automatically configure, scan your stack, and update `CLAUDE.md`/`GEMINI.md`.
   - `/ask <requirement>` - To clarify requirements and list edge cases.
   - `/spec` - To scan and write `.ai/specs/SPEC-[name].md`.
   - `/plan` - To scan and write `.ai/plans/PLAN-[name].md`.
   - `/code` - To implement changes after you type `APPROVED CODE`.
   - `/review` - To run automated git diff review and audit.
3. Antigravity will dynamically load these template files from `.gemini/prompts/` (or `.claude/commands/`) in your project and perform the action immediately on your workspace!



