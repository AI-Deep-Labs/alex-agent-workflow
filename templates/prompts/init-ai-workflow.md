# ALEX AI Workflow: INIT Prompt for Gemini

*Instructions: Copy and paste this prompt (or reference it using @init-ai-workflow.md) into your Gemini chat to initialize or repair the AI workflow in this repository.*

---

**PROMPT START:**

You are tasked with initializing or repairing the **ALEX AI Workflow** structure in this repository.

## CRITICAL RULES:
1. **DO NOT** modify any application source code files.
2. **ONLY** inspect the repository using search or view capabilities and create/update configuration, template, or documentation files.

## TASKS:

### 1. Structure Verification & Repair
Check whether the following paths exist in the workspace root. If any are missing, create them (or instruct me to create them):
- `CLAUDE.md` (Main Claude guideline)
- `GEMINI.md` (Main Gemini guideline)
- `.ai/requirements/` (For raw requirements)
- `.ai/specs/` (For approved specifications)
- `.ai/plans/` (For approved implementation plans)
- `.gemini/prompts/` (For Gemini prompt templates)
- `.ai/templates/` (For Spec/Plan templates)

- `.claude/commands/` (For Claude local commands)
- `docs/AI_WORKFLOW.md` (For team reference documentation)

### 2. Project Detection
Scan the codebase to discover:
- The tech stack (e.g. .NET, Node.js, Python, Java, React, Next.js, etc.)
- Main languages (e.g. C#, TypeScript, JavaScript, Python, Java, etc.)
- Build, Test, and Run commands.
- Main project entry point (e.g. `src/index.js`, `Program.cs`, `app.py`, `src/App.tsx`)
- Architectural style (e.g. MVC, Clean Architecture, Microservices, Monolithic, etc.)

Look for common project marker files to assist in your detection:
- Solution and project files: `*.sln`, `*.csproj`
- Node metadata: `package.json`, `package-lock.json`, `pnpm-lock.yaml`, `yarn.lock`
- Python metadata: `requirements.txt`, `pyproject.toml`, `setup.py`, `Pipfile`
- Java metadata: `pom.xml`, `build.gradle`, `gradlew`
- Docker metadata: `Dockerfile`, `docker-compose.yml`
- General documentation: `README.md`

### 3. Dynamic Guideline Update
Update both `GEMINI.md` and `CLAUDE.md` in the project root with the detected values. 
Specifically, fill in the **Project Detection**, **Common Project Commands**, and other contextual references within those files to customize them for this current repository. Preserve all workflow stages, Golden Rules, and Approval Rules.

### 4. Initialization Report
Generate a summary report in the chat using the following format:

```markdown
# ALEX AI Workflow Initialization Report

## 1. Detected Project Type
*State the framework, tech stack, and primary programming language detected.*

## 2. Detected Build/Test/Run Commands
*List the specific console commands configured in the guidelines.*
- **Build**: `command`
- **Test**: `command`
- **Run**: `command`

## 3. Important Files/Folders
*Identify major repository entries.*

## 4. Created/Repaired Paths
*List any directory paths or template files that were missing and had to be created/repaired.*

## 5. Updated Files
*List the configuration or guide files (like GEMINI.md and CLAUDE.md) that were updated.*

## 6. Recommended Next Command
*Recommend the next step to start a task:*
> **Next Command**: `/ask` (or use the ask.md prompt)
```
