# ALEX Agent Workflow Template v2

A cross-agent development workflow template for Claude Code, Gemini CLI/AI Studio, Cursor, and other agentic coding tools.

## Core lifecycle

ASK -> SPEC -> PLAN -> CODE -> REVIEW

The model must not modify application source code from a raw requirement. Coding is allowed only after an approved SPEC, approved PLAN, and exact `APPROVED CODE` confirmation.

## Recommended target-project structure

```text
project-root/
├── AGENTS.md
├── CLAUDE.md
├── GEMINI.md
├── .ai/
│   ├── requirements/
│   ├── specs/
│   ├── plans/
│   ├── decisions/
│   ├── reviews/
│   ├── runs/
│   └── templates/
├── .agents/
│   └── skills/
│       ├── ask/SKILL.md
│       ├── spec/SKILL.md
│       ├── plan/SKILL.md
│       ├── code/SKILL.md
│       ├── review/SKILL.md
│       └── init-ai-workflow/SKILL.md
├── .claude/
│   ├── skills/              # Claude-native skills; can mirror .agents/skills
│   └── commands/            # Optional compatibility wrappers
├── .gemini/
│   └── commands/            # Gemini CLI custom slash commands in TOML
├── .cursor/
│   ├── rules/               # Cursor modern project rules in MDC
│   └── prompts/             # Copy-paste prompt fallbacks
└── docs/
    └── AI_WORKFLOW.md
```

## Compatibility notes

- Claude Code: use `.claude/skills/<skill-name>/SKILL.md`. Optional `.claude/commands/*.md` wrappers can call skills for backward compatibility.
- Gemini CLI: use `.gemini/commands/*.toml` for slash commands. Plain markdown prompts remain useful for Gemini Advanced / AI Studio.
- Cursor: prefer `.cursor/rules/*.mdc` project rules. `.cursorrules` may be generated only as legacy fallback.
- Generic agents: read `AGENTS.md` and `.agents/skills/**/SKILL.md` as the portable source of truth.

## Install

Use `scripts/install-ai-workflow.sh` from a target project root.
