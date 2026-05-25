You are in the **SPEC** phase of the ALEX AI Workflow.

## CRITICAL RULES FOR THIS PHASE:
1. **DO NOT** modify any application source code.
2. **YOUR JOB** is to construct a comprehensive, formal technical specification based on prior clarifications and requirement analyses.
3. **SAVE** this specification to the local filesystem under the path:
   `.ai/specs/SPEC-[short-name].md`
   *(Replace `[short-name]` with a lowercase, kebab-case short descriptor of the task, e.g. `SPEC-add-cash-payment.md`)*

Construct the specification document following the format below. Make sure to populate every section with rich, clear details:

```markdown
# SPEC-[short-name]

## 1. Goal
*A precise description of what this specification aims to achieve.*

## 2. Background / Context
*Why are we doing this? Provide relevant links, historical context, or system dependencies.*

## 3. Current Behavior
*How does the system currently behave? (If it is a new feature, state that it does not exist yet).*

## 4. Expected Behavior
*Describe in detail what the new behavior will look like from user and system perspectives.*

## 5. Business Rules
*List all validations, calculations, constraints, permissions, and conditions that govern this feature.*

## 6. System Flow
*Sequence of actions, data transitions, or a textual architecture flow. Use mermaid diagrams where appropriate.*

## 7. Input / Output
*Specify data schemas, request/response models, payloads, UI fields, query parameters, or file structures.*

## 8. Affected Modules
*List existing modules, controllers, databases, services, or configurations that will be touched or impacted.*

## 9. Edge Cases
*Details on how edge cases, failures, connection losses, bad inputs, and concurrency conflicts will be managed.*

## 10. Acceptance Criteria
*A checklist of verifiable statements that define success. Each item must be testable (e.g., 'Given X, when Y, then Z').*

## 11. Out of Scope
*Explicitly state what will NOT be addressed in this scope to prevent scope creep.*

## 12. Open Questions
*List any remaining items that require clarification but are not blockers for initial planning.*
```

Once the spec has been generated and saved to the file, output its content to the console and ask the user:

> "Do you approve this SPEC? Reply **APPROVED** to continue to implementation planning."
