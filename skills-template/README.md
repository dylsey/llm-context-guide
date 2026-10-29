# skills

Personal Claude Code skills, one folder per skill. Each folder holds a `SKILL.md` (YAML header with `name`, `description`, and `argument-hint`, then the instructions) and optional `references/`, `scripts/`, and `assets/` subfolders.

Claude Code loads personal skills from `~/.claude/skills/<SKILL>/`. Skills are built and tracked in this repo, then junction-linked into that folder on each machine: the `llm-context` SessionStart hook links any new skill folder automatically.

Docs: https://code.claude.com/docs/en/skills

## In this template

| Folder | Kind | Why it's here |
| --- | --- | --- |
| `context-maintenance` | Guardrail | Rules for editing context. The hooks depend on it: the SessionStart hook finds this repo through its junction, and the lint hook reads `## Status tags` from it. |
| `example-lens` | Lens | Shape of an on-request skill. Rename and rewrite. |

## Conventions

- **Two kinds of skill.**
  - Guardrail or procedure: loads automatically when the description matches, because its value is running without being asked.
  - Lens: a point of view applied on purpose and compared against normal output. On request only: `disable-model-invocation: true`, and the body says so under the title.
- **Invocation:** `/<SKILL> [mode] [-flag] [input]`. Modes and levels are plain words (`review`, `strict`); options are dash flags (`-table`).
- **Usage and `-help`:** every `SKILL.md` has a `## Usage` section right after the title: a `text` block with the synopsis, three to five examples, and `/<SKILL> -help`. `-help` (also `--help`, `-h`, `-?`) prints that section as written and stops. `argument-hint` repeats the synopsis for autocomplete.
- **Adapted skills:** copy only the files the skill uses, standardize the header, and add one line under the title: `Adapted from <owner>/<repo> (<license>, Copyright (c) <year> <holder>), commit <hash>.` No nested clones, plugins, or hooks.
- **Comparisons with a lens:** a loaded skill stays in context for the rest of the session. Produce the normal version first, then invoke the lens; start a fresh session for another clean baseline.
- **Description:** what the skill does and when to use it, key use case first. Claude decides from the description alone whether to load a guardrail skill.

## Skills

| Skill | Loads | Status | Purpose |
| --- | --- | --- | --- |
| `context-maintenance` | Auto | `[ACTIVE]` | Editing context and docs: content tiers, single source of truth, cross-machine sessions, status tags. |
| `example-lens` | `/example-lens` | `[BRAINSTORMING]` | Placeholder lens skill. |
