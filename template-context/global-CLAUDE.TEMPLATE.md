# Global Claude Code instructions

**Purpose:** imported live into `~/.claude/CLAUDE.md` on every machine, so every Claude Code session, in any folder, loads your core rules and knows where your context lives.

**Setup on a new machine:** `~/.claude/CLAUDE.md` is untracked and holds two lines: the local clone path and an import of this file.

```
**Local llm-context clone path on this machine:** `C:\dev\<WORKSPACE>\llm-context`

@C:/dev/<WORKSPACE>/llm-context/global-CLAUDE.md
```

Imports are read fresh every session: edit this file in the repo and every machine picks it up after its next pull.

---

## Context repository

`llm-context` is the single source of truth for identity, behavior, and domain context. The SessionStart hook pulls it every session; push before switching machines.

**Sibling repos under `C:\dev\<WORKSPACE>\`:** `skills` (Claude Code skills, one folder per skill, junction-linked into `~/.claude/skills/`). Add one line per other repo you work in, naming its domain. Clone paths can differ by machine: verify before assuming.

## What to load, and when

- `00-core-rules.md` loads in every session:

@01_quick_reference/00-core-rules.md

- `01-quick-reference.md` (machine inventory) loads on demand.
- Load a domain file only when the topic calls for it: the file-to-topic map is in `00-core-rules.md`.
- A project's own `CLAUDE.md` wins for anything it explicitly owns.

## Git operations

Confirm before any state-changing git command (commit, push, reset, rm, rebase, branch deletion). Default branch name: `main`.

## Hard guardrails

List paths and actions Claude must never touch without your explicit instruction in that moment, one per paragraph. Example:

**Never touch `<PRODUCTION_PATH>`**: no reads, writes, or commands, unless you give a specific instruction for that exact action. A prior yes does not carry over.

**`~/.ssh`:** filenames, `config`, and `.pub` files are fine to read. Never read or transmit private key contents.
