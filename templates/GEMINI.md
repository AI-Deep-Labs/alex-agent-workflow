# ALEX AI Development Guideline for Gemini

## Golden Rule

> [!IMPORTANT]
> **Gemini MUST NOT modify source code immediately after receiving a new feature request or bug report.**
>
> Every task must follow the standardized ALEX AI Workflow sequentially:
> **ASK ➔ SPEC ➔ PLAN ➔ CODE ➔ REVIEW**

---

## Slash Command Simulation for Gemini
Since Gemini is used in IDE sidebars, Google AI Studio, or Gemini Advanced, it does not have a native local slash command executor like Claude Code. 
Therefore, **you must simulate slash commands**. When the user types one of the following commands in the chat, you must immediately transition to that phase and follow its specific rules and output templates:

* `/ask` - Initiate requirement clarification phase.
* `/spec` - Generate technical specification in `.ai/specs/SPEC-[name].md`.
* `/plan` - Generate implementation plan in `.ai/plans/PLAN-[name].md`.
* `/code` - Implement changes (requires `APPROVED CODE` confirmation).
* `/review` - Conduct a post-implementation code review on the git diff.
* `/init-ai-workflow` - Scan the codebase and setup/repair directories and commands.

---

## Approval Rules

- Gemini can ONLY write or modify application code when the user explicitly provides the following confirmation in the chat:
  ```text
  APPROVED CODE
  ```
- If the user only replies `APPROVED`, it signifies approval of the **SPEC** or **PLAN** (depending on the phase), and **NOT** permission to begin modifying source code.

---

## Scope Control

* **Zero Unrelated Refactoring**: Do not refactor code that is outside the active scope of the approved SPEC/PLAN.
* **API & DB Constraints**: Do not alter public API signatures or database schemas unless explicitly defined in the approved SPEC and authorized by the user.
* **Logic Boundary**: Do not modify business logic outside the approved scope.
* **Stop on Risk**: If a high-risk scenario, architectural conflict, or unexpected side-effect is identified during execution, **stop immediately** and consult the user in the chat.

---

## Phase Output Requirements

### /ask (Clarify Requirements)
Do not write code or plans. Produce this output:
1. **Current Understanding**: Summary of requirements in business/user terms.
2. **Business Goal**: The expected value and business outcome.
3. **Missing Information**: Clarification points or gaps in the raw input.
4. **Questions**: A concise list of up to 5 critical questions.
5. **Assumptions**: Presumptions made to fill temporary gaps.
6. **Edge Cases**: Potential unexpected behaviors or edge-case conditions.
7. **Acceptance Direction**: The high-level parameters required to proceed to the SPEC phase.

### /spec (Technical Specification)
Write a detailed spec and save it under `.ai/specs/SPEC-[short-name].md` using this format:
1. **Goal**: The high-level objective.
2. **Background / Context**: Why this is being built.
3. **Current Behavior**: Description of how the system functions now.
4. **Expected Behavior**: Detailed description of how the system should function.
5. **Business Rules**: Constraints, validations, and functional logic.
6. **System Flow**: Sequence of actions (with Mermaid diagrams).
7. **Input / Output**: Expected inputs, API request/response structures, CLI arguments.
8. **Affected Modules**: Subsystems, modules, or services affected.
9. **Edge Cases**: Detailed list of edge cases and their handling.
10. **Acceptance Criteria**: Verifiable statements of success.
11. **Out of Scope**: Explicit boundaries of what will *not* be addressed.
12. **Open Questions**: Unresolved technical or business dilemmas.

*At the end of `/spec`, prompt:*
> "Do you approve this SPEC? Reply **APPROVED** to continue to implementation planning."

### /plan (Implementation Plan)
Inspect the codebase and save an implementation plan under `.ai/plans/PLAN-[short-name].md` using this format:
1. **Scope**: The boundaries of implementation.
2. **Files Inspected**: Files examined during the codebase analysis.
3. **Files Expected to Change**: Target list of files to create or modify.
4. **Current Architecture Understanding**: Assessment of how the target code works.
5. **Design Approach**: Architectural decisions, patterns, or algorithms to adopt.
6. **Step-by-step Implementation**: Sequential roadmap of changes.
7. **Data Model Changes**: Database schema, migrations, or DTO modifications.
8. **API Changes**: Public or internal API endpoint adjustments.
9. **Config Changes**: Environment variables, configuration files.
10. **Test Plan**: How the changes will be validated.
11. **Risks**: Technical bottlenecks, performance concerns, or regression areas.
12. **Rollback Plan**: Strategy to revert changes.

*At the end of `/plan`, prompt:*
> "Do you approve coding? Reply **APPROVED CODE** to start implementation."

### /code (Execution & Implementation)
Only run if user said exactly `APPROVED CODE`. After coding, output:
1. **Files Changed**: A checklist of modified or created files.
2. **What Changed**: Bullet points explaining key logic modifications.
3. **Build/Test Result**: Output or summary of compilation and unit testing.
4. **How to Test**: Step-by-step instructions for manual validation.
5. **Risks**: Any latent concerns remaining after coding.
6. **Remaining TODO**: Outstanding items.

### /review (Post-implementation Review)
Examine the git diff or modified files and output:
1. **Summary**: Overview of the code changes.
2. **Correctness Issues**: Logical flaws, bugs, typos.
3. **Business Logic Risks**: Divergences from the original SPEC rules.
4. **Security Risks**: Vulnerabilities, sanitization issues, hardcoded keys.
5. **Performance Risks**: Inefficient loops, memory leaks, slow queries.
6. **Maintainability**: Readability, complexity, naming consistency, comments.
7. **Test Coverage**: Evaluation of tests written for the new code.
8. **Suggested Fixes**: Direct improvements or refactoring recommendations.
9. **Release Checklist**: Critical validation steps before deploying.

---

## Project Detection

Upon initialization via `/init-ai-workflow`, you must automatically scan the repository to detect:
- **Project Type / Framework**: .NET, Node.js, Python, Java, Go, etc.
- **Execution Commands**: Build, Test, and Run/Dev commands.
- **Important Folders & Entry Points**: Crucial startup files, routes, or controllers.
- **Architectural Style**: Layered, Clean Architecture, MVC, Microservices, etc.
- Update `GEMINI.md` and `CLAUDE.md` in the project root with the detected values.

---

## Common Project Commands Reference

### .NET
- **Build**: `dotnet build`
- **Test**: `dotnet test`
- **Run**: `dotnet run --project <startup-project>`

### Node.js (npm / yarn / pnpm)
- **Install**: `npm install` | `yarn install` | `pnpm install`
- **Build**: `npm run build` | `yarn build` | `pnpm build`
- **Test**: `npm test` | `yarn test` | `pnpm test`
- **Run**: `npm run dev` | `yarn dev` | `pnpm dev`

### Python
- **Install**: `pip install -r requirements.txt` | `poetry install`
- **Test**: `pytest` | `python -m unittest`
- **Run**: `python <entrypoint>`

### Java / Maven
- **Build**: `mvn clean package`
- **Test**: `mvn test`
- **Run**: `mvn spring-boot:run`

### Java / Gradle
- **Build**: `./gradlew build`
- **Test**: `./gradlew test`
- **Run**: `./gradlew bootRun`

---

## Coding Style & Ethics

1. **Adhere to Codebase Design**: Match the style, design patterns, naming conventions, and linting rules of the existing code.
2. **Safety First**: Prioritize minimal, atomic, and safe modifications over extensive structural changes.
3. **Readability**: Code should be self-documenting, clean, and intuitive.
4. **Pragmatic Dependencies**: Avoid adding new packages or libraries unless absolutely necessary.
5. **Clean Logs**: Use sensible, informative logging without polluting execution logs.
