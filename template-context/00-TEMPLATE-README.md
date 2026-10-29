# How the LLM Context System Works

**Last Updated:** 2026-10-29 21:15 UTC
**Purpose:** Architecture and setup for a personal context system that every Claude Code session loads on its own, on every machine you use.
**Audience:** Anyone building the same system. Assumes Git, a private Git host, and Claude Code on Windows (PowerShell). The ideas port to macOS and Linux; the hook scripts would need rewriting.

---

## The idea

- Your identity, rules, and domain knowledge live in Markdown files in a private Git repo: the single source of truth.
- Claude Code reads them at the start of every session through `CLAUDE.md` imports. No pasting.
- Only a short core loads every time. Domain detail loads when the topic calls for it. Procedures live in skills, which load on demand.
- Hooks make the parts that must happen actually happen: pull at session start, link new skills, block writing that breaks your rules.
- Git carries state between machines. Nothing important lives only on one machine.

---

## Architecture

```
Per machine (untracked)                      In git (private repos)
-----------------------                      ----------------------
~/.claude/CLAUDE.md  (2 lines)
    @import ------------------------------>  llm-context/global-CLAUDE.md
                                                 @import --> 01_quick_reference/00-core-rules.md  (always loaded)
                                                 names   --> 10_domain_context_files/*  (on demand)

~/.claude/skills/<SKILL>  (junction) ----->  skills/<SKILL>/SKILL.md

~/.claude/settings.json  (hook entries) -->  llm-context/hooks/*.ps1
```

Two private repos, side by side:

```
C:\dev\<WORKSPACE>\
├── llm-context\     identity, rules, domain context, hooks
└── skills\          one folder per Claude Code skill
```

Only three things are machine-specific: the 2-line `~/.claude/CLAUDE.md`, the skill junctions, and the hook entries in `~/.claude/settings.json`. Everything they point at is versioned.

### `llm-context` layout

```
llm-context/
├── 00-README.md                     short intro and this tree
├── CLAUDE.md                        guidance for sessions inside this repo
├── CHANGELOG.md                     one line per change
├── global-CLAUDE.md                 imported by every machine's ~/.claude/CLAUDE.md
├── onboard-machine-playbook.md      set up or audit a machine
├── hooks/                           SessionStart, SessionEnd, PreToolUse scripts and lint tests
├── 01_quick_reference/
│   ├── 00-core-rules.md             always loaded: identity, one line per rule, skill pointers
│   └── 01-quick-reference.md        on demand: machine inventory
├── 10_domain_context_files/         on demand: one domain per file (10-, 11-, ...)
└── 20_supporting_files/             on demand: miscellaneous, supporting docs
```

Templates for each file are in this folder. Hook scripts are in `../hooks/`. Skill examples are in `../skills-template/`.

---

## Loading: the per-machine `CLAUDE.md`

Claude Code loads `~/.claude/CLAUDE.md` in every session on that machine, in any folder. Keep it to two lines:

```
**Local llm-context clone path on this machine:** `C:\dev\<WORKSPACE>\llm-context`

@C:/dev/<WORKSPACE>/llm-context/global-CLAUDE.md
```

How the import works (Claude Code docs, "Import additional files": https://code.claude.com/docs/en/memory):

- `@path` pulls the file into context at session start. Absolute or relative; a relative path resolves from the file that contains it.
- Imported files can import others, up to four hops deep. Here: `CLAUDE.md` to `global-CLAUDE.md` to `00-core-rules.md` is two.
- Imports inside code spans or fenced blocks are skipped, so you can mention a path without loading it.
- Imports from `~/.claude/CLAUDE.md` load without an approval prompt.
- An import does not save tokens: imported text loads in full. Keep the always-loaded chain short.

Why import instead of copy: a copied file drifts the first time you edit the repo and forget a machine. An import is read fresh every session, so a `git pull` updates every machine.

Verify: start a new session and ask "which machine is this?". Claude answers from `00-core-rules.md` only if the import chain loaded.

---

## Tiered loading

| Tier | Files | Loads |
| --- | --- | --- |
| Core | `global-CLAUDE.md`, `00-core-rules.md` | Every session |
| Domain | `01-quick-reference.md`, `10-` to `1x-`, `20-` files | When the topic calls for it |
| Skills | `skills/<SKILL>/SKILL.md` | When the description matches, or on `/<SKILL>` |

#### Notes on tiers

- `00-core-rules.md` holds one line per rule plus a map of which domain file covers which topic. Detail goes in a skill or domain file. Every line in core is paid for in every session.
- Domain files hold facts (gear, environments, projects). Skills hold procedures (how to troubleshoot, how to edit context, how to teach you).
- A rule repeated in two places will drift. One file owns each fact; others point to it.

---

## Skills

A separate private repo, one folder per skill, each with a `SKILL.md` (YAML header, then instructions). Claude Code loads personal skills from `~/.claude/skills/<SKILL>/` (docs: https://code.claude.com/docs/en/skills). Each skill folder is junction-linked from there into the repo, so a `git pull` updates the skill everywhere. Junctions need no administrator rights.

Conventions (full text in `../skills-template/README.md`):

- **Two kinds of skill.**
  - Guardrail or procedure: loads automatically when its `description` matches the request, because its value is running without being asked (troubleshooting method, context editing rules).
  - Lens: a point of view you apply on purpose and compare against normal output. Header has `disable-model-invocation: true`, so it loads only through `/<SKILL>`.
- **Usage and `-help`:** every `SKILL.md` has a `## Usage` section right after the title: a synopsis, three to five examples, and `/<SKILL> -help`, which prints that section and stops. `argument-hint` repeats the synopsis for autocomplete.
- **Adapted third-party skills:** copy only the files the skill uses, standardize the header, add one attribution line under the title (owner/repo, license, copyright, commit). No nested clones, plugins, or hooks from the source.
- **Comparing a lens:** a loaded skill stays in context for the rest of the session. Produce the normal version first, then invoke the lens. New session for a clean baseline.

Claude Code watches `~/.claude/skills/`, so a newly linked skill usually works in the current session.

---

## Hooks

Hooks are commands Claude Code runs on events, registered in `~/.claude/settings.json` (docs: https://code.claude.com/docs/en/hooks). The scripts live in `llm-context/hooks/` so fixes reach every machine through `git pull`; only the `settings.json` entries are per machine. Copies are in `../hooks/`.

| Script | Event | What it does |
| --- | --- | --- |
| `session-start-bearings.ps1` | SessionStart | Reports host, user, folder; status and `git pull` for both repos; links new skill folders; checks `~/.claude/CLAUDE.md` still has its `@` import |
| `session-end-reminder.ps1` | SessionEnd | Shows a sign-off reminder |
| `lint-authored-text.ps1` | PreToolUse | Blocks Markdown and text writes that break your writing rules |
| `test-lint-authored-text.ps1` | (manual) | Regression tests for the lint hook |

#### Notes on hooks

- SessionStart output goes to Claude as `additionalContext`, so the session starts knowing which machine it is on and whether either repo is behind or dirty. A visible `systemMessage` appears only when something is wrong.
- Skill linking: every repo folder holding a `SKILL.md` with nothing at its link path gets a junction. It never replaces or removes a path. A link whose target was deleted upstream is reported, and removing it is your call.
- The hook locates the `skills` repo through one junction (`~/.claude/skills/context-maintenance` in the copies). Create that one by hand on a new machine; the hook links the rest.
- SessionEnd fires after the last turn, so Claude cannot act on it. It is a nudge for you, not enforcement.
- Lint checks only the text being added (not the rest of the file) and skips code spans and fenced blocks. It blocks with exit code 2 and a reason Claude can read and fix. Any parse error exits 0: a broken hook must never block work.
- The banned list in the copy (em-dashes, emojis, checkbox lists, bad `Last Updated` lines, status tags not on your list) is one person's rules. Replace it with yours, then update the tests.
- The registered lint command must end with `; exit $LASTEXITCODE`. Without it, PowerShell 7 reports exit 1 instead of 2, which does not block.
- Run the tests after any hook change. They must report 0 failed.

---

## Where things get saved

| What | Where |
| --- | --- |
| Rule or preference for all projects | `llm-context` (core rules, a skill, or a domain file), as an edit Claude proposes and you approve |
| Fact about one repo | That repo's `CLAUDE.md` or docs |
| One-off incident tied to one folder | Claude auto memory |

#### Notes on saving

- Claude auto memory is stored per machine and never syncs. Anything another machine needs goes in git.
- Have Claude raise an inferred or generalized fact in chat before saving it anywhere. Facts you state outright can be saved directly.

---

## Working across machines

- The SessionStart hook pulls both repos every session. It never pushes. Push before you switch machines.
- Never write "pull on `<MACHINE>`" reminders: the next session pulls on its own. Only an unpushed commit is worth mentioning.
- Before shared-state work (edits to context, redaction, cleanup), fetch and compare `git log origin/main..HEAD` and `git log HEAD..origin/main`. Both non-empty means the machines diverged: stop and decide before merging.
- `CHANGELOG.md`: one line per change, newest first, `YYYY-MM-DD HH:MM UTC - [Tag] file - what changed`, with tags from Keep a Changelog (`Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, `Security`). The why goes in the commit message.
- Content files carry only a `**Last Updated:**` line, full UTC from a command (`Get-Date -AsUTC -Format "yyyy-MM-dd HH:mm 'UTC'"`), never typed from memory.
- Never commit real hostnames, IPs, MACs, or account names unless you decide on a specific exception and write it down. Removing one later leaves it in git history.
- The onboarding playbook checks first and fixes only what fails, so on a machine already set up it is an audit. Run it when the SessionStart hook warns or a machine has sat unused.

---

## Setup order

Do these in order. Each has a check.

1. **Create two private repos** (`llm-context`, `skills`) and clone them side by side under `C:\dev\<WORKSPACE>\`. Done when `git -C <PATH> remote get-url origin` works for both.
2. **Write `00-core-rules.md`** from `00-TEMPLATE-core-rules.md`: who you are, your machines, one line per rule. Done when it fits on one screen.
3. **Write `global-CLAUDE.md`** from `global-CLAUDE.TEMPLATE.md`. Done when its `@` line points at your core rules file.
4. **Write `~/.claude/CLAUDE.md`** with the two lines above. Done when a new session names your machine correctly.
5. **Add one skill** (start from `../skills-template/`) and junction it into `~/.claude/skills/`. Done when `/<SKILL> -help` prints its Usage section.
6. **Add the hooks**: copy `../hooks/` into `llm-context/hooks/`, edit the rules to yours, register them (playbook Step 6), run the tests. Done when the tests report 0 failed.
7. **Add domain files** as topics come up, from `10-TEMPLATE-domain-context.md`. Add each to the map in core rules.
8. **Every other machine:** run `onboard-machine-playbook.md`. Done when Step 7 passes.

---

## Picking your domain files

One domain per numbered file. Ask yourself:

- **Work:** your role, environment, tools, constraints (for example `11-it-sysadmin-context.md`).
- **Skills you use and are building:** languages, frameworks, proven versus learning (`10-cs-engineering-competency.md`).
- **Creative work:** gear, software, workflows (`12-audio-studio-context.md`).
- **Systems you run:** home network, homelab, smart home (`13-home-network-context.md`).
- **Current projects** across all of these, with status and next action (`14-active-projects-context.md`).
- **Everything else:** `20-miscellaneous-context.md`.

Start with core rules and one or two domain files. Split a file when it covers topics you never load together; merge two that always load together.

---

## Status tags

One fixed list, used everywhere. The lint hook copy reads the allowed list from the `## Status tags` section of a skill, so the list lives in one place.

| Tag | Meaning |
| --- | --- |
| `[BRAINSTORMING]` | Early ideation |
| `[PLANNED]` | Approved or scheduled, not started |
| `[RESEARCH]` | Researching options |
| `[ACTIVE]` | Being worked on |
| `[REFINEMENT]` | Working, under review or small improvements |
| `[PAUSED]` | Stopped, may resume |
| `[COMPLETE]` | Finished |
| `[DEPLOYED]` | In production use |
| `[AVAILABLE]` | Ready but not in use |
| `[DEPRECATED]` | No longer relevant |
| `[RETIRED]` | Replaced or out of service, kept for record |

#### Notes on status tags

- Square brackets around an all-caps word mean a status tag and nothing else. Placeholders are `<NAME>` in a code span.

---

## Naming

- Numeric prefixes set sort order: `00-` docs and core, `01-` quick reference, `10-` to `1x-` domains, `20-` supporting.
- Folders use underscores (`01_quick_reference/`), files use hyphens (`01-quick-reference.md`).

---

## Without Claude Code

The same files work with any chat LLM, by hand: paste `00-core-rules.md` first, then the one domain file the question needs. Paste the core rules again when the model drifts from them. Skills and hooks have no equivalent there.
