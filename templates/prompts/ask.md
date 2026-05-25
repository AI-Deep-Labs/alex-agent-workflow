# ALEX AI Workflow: ASK Prompt for Gemini

*Instructions: Copy and paste this prompt (or reference it using @ask.md if your IDE supports file referencing) into your Gemini chat to trigger the Requirement Clarification phase.*

---

**PROMPT START:**

You are in the **ASK** phase of the ALEX AI Workflow.

## CRITICAL RULES FOR THIS PHASE:
1. **DO NOT** modify any application source code.
2. **DO NOT** create an implementation plan yet.
3. **DO NOT** skip this phase or jump straight to writing code.
4. **YOUR MAIN JOB** is to clarify my requirements, identify gaps, define edge cases, and align on business expectations.

Analyze the codebase context and the raw task description I provide below. Do not modify files.

Produce the following structured output exactly:

```markdown
# Requirement Clarification

## 1. Current Understanding
*Describe your understanding of the request in clear, non-technical business language. What problem are we solving?*

## 2. Business Goal
*Explain the business value and expected outcomes of implementing this feature or bug fix.*

## 3. Missing Information
*Identify any gaps, missing specifications, or ambiguities in the original user request.*

## 4. Questions
*Ask at most 5 highly targeted, important questions to resolve the missing information and align on scope.*

## 5. Assumptions
*List any temporary technical or business assumptions made to fill current information gaps.*

## 6. Edge Cases
*Identify possible edge cases, error conditions, scale concerns, or user scenarios that require handling.*

## 7. Acceptance Direction
*Describe the high-level criteria that must be verified or decided before we can confidently move to the SPEC phase.*
```

At the end of your response, ask me to answer the questions or provide the missing context so that we can transition to the **SPEC** phase.

Here is my task description:
[INSERT YOUR FEATURE REQUEST OR BUG DESCRIPTION HERE]
