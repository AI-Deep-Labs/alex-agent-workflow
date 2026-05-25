You are in the **PLAN** phase of the ALEX AI Workflow.

## CRITICAL RULES FOR THIS PHASE:
1. **DO NOT** modify any application source code yet.
2. **YOU MAY** inspect the codebase using appropriate commands/tools (e.g. searching, viewing files) to understand context.
3. **CREATE** a detailed technical implementation plan based on the approved SPEC.
4. **SAVE** this plan under the path:
   `.ai/plans/PLAN-[short-name].md`
   *(Replace `[short-name]` with the matching short descriptor used in the SPEC, e.g. `PLAN-add-cash-payment.md`)*

Construct the plan document following the format below. Make sure to populate every section with precise engineering steps:

```markdown
# PLAN-[short-name]

## 1. Scope
*Briefly outline the physical boundary of this implementation.*

## 2. Files Inspected
*List of codebase files examined to design this plan.*

## 3. Files Expected To Change
*List of files that will be created, deleted, or modified. Mark them as (Create) or (Modify).*

## 4. Current Architecture Understanding
*Explain how the current code structure, dependency injection, routing, or state management works in the target modules.*

## 5. Design Approach
*Outline design patterns, data flows, UI designs, error management, or algorithmic details you plan to introduce.*

## 6. Step-by-step Implementation
*Provide a numbered, logical roadmap. Break down complex tasks into atomic steps so they can be written and verified safely.*

## 7. Data Model Changes
*Describe any changes to database tables, models, schemas, or migrations (if any).*

## 8. API Changes
*Detail new or modified REST API endpoints, GraphQL queries, WebSocket messages, or function parameters (if any).*

## 9. Config Changes
*List any new environment variables, configuration parameters, appsettings, or package dependencies.*

## 10. Test Plan
*Describe how the changes will be tested. Include unit tests, integration tests, and manual verification steps.*

## 11. Risks
*Identify technical risks (e.g., performance issues, circular dependencies, breaking backward compatibility) and mitigation strategies.*

## 12. Rollback Plan
*Provide instructions on how to quickly revert changes in case of failure during deploy/test.*

## 13. Code Approval
*Instruction to the user to approve this plan before coding begins.*
```

Once the plan has been saved to the file, display it to the user and prompt:

> "Do you approve coding? Reply **APPROVED CODE** to start implementation."
