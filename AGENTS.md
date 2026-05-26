# ALEX Agent Operating Rules

## Mission
Use a controlled software delivery workflow: ASK -> SPEC -> PLAN -> CODE -> REVIEW.

## Hard gates
1. Do not create or modify application source code during ASK, SPEC, or PLAN.
2. `APPROVED` only approves the current document phase. It does not authorize coding.
3. Coding may start only after the user writes exactly: `APPROVED CODE`.
4. During CODE, modify only files listed in the approved PLAN unless the user explicitly expands scope.
5. Stop and report before changing public API contracts, database schema, authentication/authorization logic, payment/order logic, or deployment configuration unless already approved in SPEC and PLAN.

## Canonical artifacts
- Requirements: `.ai/requirements/REQ-[short-name].md`
- Specification: `.ai/specs/SPEC-[short-name].md`
- Plan: `.ai/plans/PLAN-[short-name].md`
- Decision records: `.ai/decisions/ADR-[short-name].md`
- Review reports: `.ai/reviews/REVIEW-[short-name].md`
- Build/test run logs: `.ai/runs/RUN-[short-name]-YYYYMMDD-HHMM.md`

## Skill loading
For each workflow phase, read the corresponding skill:
- ASK: `.agents/skills/ask/SKILL.md`
- SPEC: `.agents/skills/spec/SKILL.md`
- PLAN: `.agents/skills/plan/SKILL.md`
- CODE: `.agents/skills/code/SKILL.md`
- REVIEW: `.agents/skills/review/SKILL.md`
- INIT: `.agents/skills/init-ai-workflow/SKILL.md`
- PROJECT-OVERVIEW: `.agents/skills/project-overview/SKILL.md`

## Response language
Default to the user's language. Keep outputs structured and action-oriented.
