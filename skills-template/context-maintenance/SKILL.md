---
name: context-maintenance
description: Rules for editing personal context and documentation. Use before writing to llm-context or any repo's docs, CHANGELOG, or CLAUDE.md; before saving to Claude memory; during cleanup, audit, or drift-check sessions; and at session start and end on machines that share these repos.
argument-hint: "[start | end | drift | <file>] | -help"
---

# Context Maintenance

## Usage

```text
/context-maintenance [start | end | drift | <file>]

/context-maintenance start                    divergence check before shared-state work
/context-maintenance end                      end-of-session sweep, Last Updated, CHANGELOG, commit
/context-maintenance drift                    check docs against the live state
/context-maintenance 00-core-rules.md         edit rules for one file
/context-maintenance -help                    print this section and stop
```

Loads automatically before any write to llm-context, a repo's docs or CHANGELOG, or Claude memory. Type the command to load it on purpose.

`-help` (also `--help`, `-h`, `-?`): print this section as written and stop.

## Content tiers (check every write)

- Content docs: current state only, terse bullets, minimal tables. No "how we got here", no dates-as-history, no drafting rationale.
- Tables: only the columns needed for lookup. Caveats and open questions go in a `#### Notes on <table>` bullet subsection right after the table.
- Every touched content file: bump `**Last Updated:**` with full UTC from a command (`Get-Date -AsUTC -Format "yyyy-MM-dd HH:mm 'UTC'"`), never approximated.
- `CHANGELOG.md`: one line, `YYYY-MM-DD HH:MM UTC - [Tag] file - what changed`. Tags: Added, Changed, Deprecated, Removed, Fixed, Security. No why.
- Commit message: the why, root cause, narrative.
- Claude memory: one-off incidents and folder-local notes only.

## Single source of truth

- `llm-context` owns identity, behavior, and domain context. Other repos point to it by path and never keep copies.
- Within a repo, one file owns each fact. Others point, never restate. Flag conflicts; don't pick a side silently.

## Drift

- Documented state contradicted by reality: fix it this session if the new state is confirmed, otherwise flag it as a named follow-up.
- Re-explaining something already covered in a past session means a file failed to capture it. Fix the file.
- A domain file whose Last Updated is older than about 60 to 90 days is unverified for that topic.

## Sessions across machines

- Start: the SessionStart hook only pulls, so before shared-state work run `git fetch` and compare `git log origin/main..HEAD` and `git log HEAD..origin/main`. A SessionStart warning means run `llm-context/onboard-machine-playbook.md`.
- Never record "pull on `<MACHINE>`" reminders anywhere: the SessionStart hook pulls every session; only an unpushed commit needs mentioning.
- Before duplicate-prone work (redaction, cleanup sweeps, onboarding checks): skim the last 5 to 10 `CHANGELOG.md` entries.
- Before any history rewrite or redaction: local must not be ahead of origin.
- End: stale cross-reference sweep for anything renamed; bloat check on this session's edits; every touched file has its Last Updated and CHANGELOG line; commit and push unless the user names it WIP, then state what was committed, pushed, or left.

## Status tags

Use only these. `llm-context/hooks/lint-authored-text.ps1` reads its allowed list from this section: keep each tag in backticks.

- `[BRAINSTORMING]`: early ideation
- `[PLANNED]`: approved or scheduled, not started
- `[RESEARCH]`: researching options
- `[ACTIVE]`: currently being worked on
- `[REFINEMENT]`: working, under review or small improvements
- `[PAUSED]`: stopped, may resume
- `[COMPLETE]`: finished
- `[DEPLOYED]`: in production use
- `[AVAILABLE]`: ready but not in use
- `[DEPRECATED]`: no longer relevant
- `[RETIRED]`: replaced or out of service, kept for record

Square brackets around an all-caps word mean a status tag and nothing else. Placeholders: `<NAME>` in a code span. Hardware buttons: **BOLD**.
