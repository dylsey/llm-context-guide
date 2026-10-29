# Machine Onboarding Playbook

**For:** any Windows machine joining the `llm-context` setup, or re-checking one already on it. Each step checks first and fixes only what fails, so on an onboarded machine this is an audit.

**Rules:** read-only checks run without asking. Every fix (clone, file write, settings edit, push, pull) waits for your yes. Claude reports each step's result before starting the next.

Replace `<WORKSPACE>` and `<GIT_HOST_USER>` throughout.

| Item | Standard path |
| --- | --- |
| `llm-context` clone | `C:\dev\<WORKSPACE>\llm-context` |
| `skills` clone | `C:\dev\<WORKSPACE>\skills` |
| Global instructions | `~/.claude/CLAUDE.md` |
| Skill links | `~/.claude/skills/<SKILL>` |
| Hook registration | `~/.claude/settings.json` |

---

## Step 1: Identify the machine

**Check:**

```powershell
$env:COMPUTERNAME
```

**Pass:** the hostname matches a machine in `00-core-rules.md` ("Who").

**Fix:** unknown hostname means a new machine. Continue, and add its entries in Step 7.

---

## Step 2: `llm-context` clone

**Check,** one command at a time:

```powershell
$repoPath = "C:\dev\<WORKSPACE>\llm-context"
```

```powershell
git -C $repoPath remote get-url origin
```

```powershell
git -C $repoPath fetch
```

```powershell
git -C $repoPath status --short
```

```powershell
git -C $repoPath log --oneline origin/main..HEAD
```

```powershell
git -C $repoPath log --oneline HEAD..origin/main
```

**Pass:** remote is your `llm-context` repo, no uncommitted files, nothing ahead (fourth command) or behind (fifth).

**Fix:**

- Absent: clone it to the standard path.
- Clone found at another path: stop. Move it to the standard path or record the exception.
- Uncommitted files: show them; you decide to commit, stash, or leave.
- Ahead only: push after your yes.
- Behind only, clean tree: `git -C $repoPath pull`.
- Ahead and behind: stop. No merge or rebase without you.

---

## Step 3: `skills` clone

**Check and Fix:** same as Step 2, with `$repoPath = "C:\dev\<WORKSPACE>\skills"`.

---

## Step 4: Global `CLAUDE.md`

**Check:**

```powershell
Get-Content "$env:USERPROFILE\.claude\CLAUDE.md"
```

**Pass:** the file holds exactly these lines:

```
**Local llm-context clone path on this machine:** `C:\dev\<WORKSPACE>\llm-context`

@C:/dev/<WORKSPACE>/llm-context/global-CLAUDE.md
```

**Fix:**

- Absent: create `~/.claude` if needed and write the lines above.
- Present but different: show it, then ask. Never overwrite hand edits unseen.
- The `@` line uses forward slashes. The file stays two lines: `global-CLAUDE.md` carries everything else.

---

## Step 5: Skill junctions

The SessionStart hook finds the `skills` repo through the `~/.claude/skills/context-maintenance` junction, and the lint hook reads its status tags from that skill. Once that junction exists, the hook links every other skill folder (one holding a `SKILL.md`) that has no link yet, each session, and reports links whose target was deleted.

**Check:**

```powershell
Get-ChildItem "C:\dev\<WORKSPACE>\skills" -Directory | ForEach-Object { [PSCustomObject]@{ Skill = $_.Name; LinkType = (Get-Item "$env:USERPROFILE\.claude\skills\$($_.Name)" -Force -ErrorAction SilentlyContinue).LinkType } }
```

**Pass:** every row shows `Junction`.

**Fix:**

- Blank `LinkType` on a new machine: create the `context-maintenance` junction; the hook links the rest next session.

```powershell
New-Item -ItemType Junction -Path "$env:USERPROFILE\.claude\skills\context-maintenance" -Target "C:\dev\<WORKSPACE>\skills\context-maintenance"
```

- A row that exists but is not a junction (a plain folder): stop. It may hold local work.

---

## Step 6: Hooks

Three hooks, all versioned in `llm-context/hooks/`:

- `session-start-bearings.ps1` (SessionStart): reports host, paths, and git state of both repos; links new skills; flags gaps from Steps 2 to 5.
- `session-end-reminder.ps1` (SessionEnd): sign-off reminder.
- `lint-authored-text.ps1` (PreToolUse): blocks `.md`, `.markdown`, and `.txt` writes that break your writing rules.

**Check:** read `~/.claude/settings.json`.

**Pass:** it parses as JSON and holds all three entries below.

**Fix:** merge in only the missing entries. Keep every other key, especially `permissions`. Absent file: create it with this block.

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "& \"C:\\dev\\<WORKSPACE>\\llm-context\\hooks\\lint-authored-text.ps1\"; exit $LASTEXITCODE",
            "shell": "powershell",
            "timeout": 10
          }
        ]
      }
    ],
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "& \"C:\\dev\\<WORKSPACE>\\llm-context\\hooks\\session-start-bearings.ps1\"",
            "shell": "powershell",
            "timeout": 30,
            "statusMessage": "Getting bearings from llm-context..."
          }
        ]
      }
    ],
    "SessionEnd": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "& \"C:\\dev\\<WORKSPACE>\\llm-context\\hooks\\session-end-reminder.ps1\"",
            "shell": "powershell",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

The lint command must end with `; exit $LASTEXITCODE`: without it, the script's `exit 2` collapses to 1, which does not block.

After any fix, confirm the file parses:

```powershell
Get-Content "$env:USERPROFILE\.claude\settings.json" -Raw | ConvertFrom-Json | Out-Null
```

Then run the lint regression tests (must report 0 failed):

```powershell
pwsh -NoProfile -File "C:\dev\<WORKSPACE>\llm-context\hooks\test-lint-authored-text.ps1"
```

Edits to an existing `settings.json` apply in the running session. A newly created file needs a Claude Code restart.

---

## Step 7: Verify

Start a fresh Claude Code session in `C:\dev\<WORKSPACE>`.

**Pass:**

- The SessionStart output names the host, shows both repo paths with a clean pull, and raises no warning.
- Claude names the machine from `00-core-rules.md`, which proves the `@` import loaded.
- A Write of a scratch `.md` file containing an unchecked checkbox list item is blocked by `lint-authored-text`.

**Report:** machine name, then each step as passed or fixed.

**New machine:** add its hostname line to `00-core-rules.md` and its entry to `01-quick-reference.md`.
