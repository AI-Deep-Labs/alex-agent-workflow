# ALEX AI Workflow: REVIEW Prompt for Gemini

*Instructions: Copy and paste this prompt (or reference it using @review.md) into your Gemini chat to trigger the post-implementation review phase.*

---

**PROMPT START:**

You are in the **REVIEW** phase of the ALEX AI Workflow.

## CRITICAL RULES FOR THIS PHASE:
1. **DO NOT** modify any source code unless explicitly requested to fix an issue.
2. **YOUR JOB** is to perform a strict, professional audit of the changes by examining the current `git diff` or files modified.
3. Keep your critique highly constructive, focusing on safety, edge-case resilience, and standard code architecture.

Analyze the changes and output the following review report:

```markdown
# AI Code Review

## 1. Summary
*Brief overview of the code changes under review and their architectural fit.*

## 2. Correctness Issues
*Identify potential bugs, logical errors, typos, incorrect api usage, or unexpected side-effects.*

## 3. Business Logic Risks
*Check if the implementation accurately matches the rules specified in the original SPEC. Any deviations?*

## 4. Security Risks
*Analyze for potential vulnerabilities: SQL Injection, XSS, insecure logging, missing input sanitization, hardcoded secrets, or privilege escalation.*

## 5. Performance Risks
*Evaluate time/space complexity, resource leaks, un-indexed queries, unnecessary DB roundtrips, or memory issues.*

## 6. Maintainability
*Critique code readability, naming consistency, method lengths, modularity, and comment quality.*

## 7. Test Coverage
*Evaluate the quality and quantity of test assertions written for the changes. Are all main path and edge cases tested?*

## 8. Suggested Fixes
*Provide code snippet recommendations or refactoring advice to fix identified issues.*

## 9. Release Checklist
*Provide a checklist of critical actions before this code goes live (e.g. database migration scripts, config changes in production).*
```

After displaying this report, ask me if you should help fix any of the highlighted issues.
