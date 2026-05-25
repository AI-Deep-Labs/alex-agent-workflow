# ALEX AI Workflow: CODE Prompt for Gemini

*Instructions: Copy and paste this prompt (or reference it using @code.md) into your Gemini chat to trigger the Implementation phase.*

---

**PROMPT START:**

You are in the **CODE** phase of the ALEX AI Workflow.

## CRITICAL RULES FOR THIS PHASE:
1. **ONLY PROCEED** if the user has explicitly replied with:
   `APPROVED CODE`
   *(If the user did not say exactly this phrase, stop immediately and ask for it).*
2. **IMPLEMENT** strictly according to the approved implementation PLAN.
3. **DO NOT** modify files outside the list defined in the PLAN unless absolutely necessary and discussed beforehand.
4. **DO NOT** perform unrelated refactoring.
5. **DO NOT** modify public API schemas, database tables, or config variables unless explicitly approved in the SPEC/PLAN.
6. **DO NOT** introduce new dependencies unless approved.
7. **RUN** (or instruct me to run) build and test commands (e.g. `npm test`, `dotnet test`, etc.) immediately after implementing to verify correctness.
8. **IF THE PLAN DEVIATES** during implementation, stop and explain the technical reason.
9. **IF A NEW RISK IS DISCOVERED**, stop immediately and consult the user before making further modifications.

Execute the implementation meticulously. Once finished and all tests are passing, provide a complete summary of the changes in the format below:

```markdown
# Implementation Summary

## 1. Files Changed
*A checklist of files that were modified or created, with their respective status.*
- [ ] `path/to/file1` (Created/Modified)

## 2. What Changed
*Provide bullet-point descriptions of the core modifications, design choices, and logic adjustments made.*

## 3. Build/Test Result
*Paste the output or summarize the results of your compilation and automated test runs.*

## 4. How To Test
*Provide clear, step-by-step instructions for manual testing or validation of the changes.*

## 5. Risks
*Highlight any latent edge cases, integration risks, or performance factors to be aware of during deployment.*

## 6. Remaining TODO
*List any cleanup, documentation, or subsequent refactoring tasks left for future scope.*
```

At the end of your response, suggest running `/review` to conduct an automated code review on the git diff.
