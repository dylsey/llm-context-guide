# Troubleshooting Guide: Common Mistakes & How to Fix Them

**Purpose:** Quick solutions to problems you might encounter while maintaining your LLM context system

---

## Table of Contents

1. [Cross-Reference Issues](#cross-reference-issues)
2. [File Organization Problems](#file-organization-problems)
3. [Information Consistency Errors](#information-consistency-errors)
4. [Status Tag Problems](#status-tag-problems)
5. [Update Workflow Issues](#update-workflow-issues)
6. [LLM Behavior Problems](#llm-behavior-problems)
7. [Git & Version Control Issues](#git--version-control-issues)

---

## Cross-Reference Issues

### Problem 1: "I updated information but the LLM still references old data"

**Symptoms:**
- LLM quotes outdated information
- Cross-references point to content that no longer exists
- Information contradicts between files

**Diagnosis:**
1. Check if you updated ALL files that contain the information
2. Verify cross-references still point to correct sections
3. Confirm you're loading the updated file in your LLM conversation

**Fix:**
```bash
# Search for all instances of the old information
grep -r "old information" *.md

# Update each file found
# Then verify cross-references are still accurate
grep -r "Cross-references:" *.md
```

**Prevention:**
- Keep a checklist of which files reference each topic
- Use git diff to see what changed
- Test by loading files into LLM after updates

---

### Problem 2: "Cross-reference says 'see File X' but that file doesn't have the info"

**Symptoms:**
- Cross-reference claims File X contains topic Y
- File X doesn't actually have topic Y (or it's minimal)

**Diagnosis:**
Check the cross-reference accuracy:
```bash
# Find the cross-reference
grep "See.*11-it-sysadmin" *.md

# Open File 11 and search for claimed content
# Verify it actually exists and is substantial
```

**Fix:**
1. If content exists but is minimal → Update cross-reference to be more specific
2. If content doesn't exist → Remove the cross-reference OR add the content
3. If content moved to different file → Update cross-reference to point to new location

**Example fix:**
```markdown
# BEFORE (vague)
- **Cross-references:** See `11-it-sysadmin-context.md` for PowerShell

# AFTER (specific)
- **Cross-references:** See `11-it-sysadmin-context.md` Section 2 for PowerShell automation practices
```

---

### Problem 3: "I added a cross-reference but it's not bidirectional"

**Symptoms:**
- File A references File B
- File B doesn't reference File A back

**Diagnosis:**
This is only a problem if the files truly have reciprocal relationships.

**When bidirectional is needed:**
- Files 10 ↔ 11 (CS skills inform IT work, IT work demonstrates CS skills)
- Files 11 ↔ 13 (IT infrastructure knowledge applies to homelab)

**When bidirectional is NOT needed:**
- File 14 → other files (projects reference domains, but domains don't need to reference all projects)

**Fix (if needed):**
Add reciprocal cross-reference in File B:
```markdown
- **Cross-references:** See `[File A].md` for [relevant context]
```

---

## File Organization Problems

### Problem 4: "I don't know which file this information should go in"

**Symptoms:**
- Information seems to fit multiple files
- Unsure if it's File 10, 11, or 20
- End up duplicating information across files

**Fix:**
Use the [Decision Tree (98-decision-tree.md)](98-decision-tree.md) to determine correct placement.

**Quick rule:**
1. **Identity info** → File 01 (brief) or 20 (detailed)
2. **Skills** → Files 10-13 (domain-specific)
3. **Active projects** → File 14
4. **Preferences** → File 02 (LLM behavior) or 20 (general)
5. **Everything else** → File 20

**Prevention:**
- Review decision tree before adding information
- Check if similar information already exists elsewhere
- When in doubt, use File 20 (miscellaneous) as catch-all

---

### Problem 5: "My file is getting too long and hard to navigate"

**Symptoms:**
- File exceeds 500 lines
- Multiple distinct topics in one file
- Scrolling to find information is slow

**Diagnosis:**
Check file size:
```bash
wc -l [filename].md
```

**Fix (if > 500 lines):**
Split into multiple files using alphanumeric sub-numbering:

**Example:**
```
BEFORE:
12-audio-studio-context.md (800 lines)

AFTER:
12a-audio-hardware-context.md (300 lines)
12b-audio-workflows-context.md (300 lines)
12c-audio-projects-context.md (200 lines)
```

**Steps:**
1. Identify distinct sections that are rarely used together
2. Create new files with sub-letter naming
3. Update cross-references
4. Update File 01 and README if needed
5. Commit changes with clear message

---

### Problem 6: "I have duplicate information in multiple files"

**Symptoms:**
- Same hardware list in Files 01 and 13
- Same project description in Files 14 and domain file

**Diagnosis:**
Determine which file should be the "source of truth":
- **Hardware specs** → Domain file is detailed, File 01 is summary
- **Projects** → File 14 is detailed, domain files cross-reference
- **Skills** → Domain file is detailed, File 01 is summary

**Fix:**
1. Choose primary location (usually the domain file)
2. Keep full details there
3. Other files either:
   - Have brief summary only, OR
   - Cross-reference to primary file

**Example:**
```markdown
# File 01 (brief summary)
- Workbox: Dell i7 vPro 7780, Windows 11 Pro (work laptop)

# File 13 (full details)
| Machine | CPU | RAM | Storage | Role |
|---------|-----|-----|---------|------|
| Workbox | Intel i7 vPro 7780 | 16 GB DDR4 | 512 GB NVMe | Work laptop, Hyper-V host |
```

---

## Information Consistency Errors

### Problem 7: "Different files have conflicting information"

**Symptoms:**
- File 01 says project status is `[ACTIVE]`
- File 14 says project status is `[RESEARCH]`
- Machine specs differ between File 01 and File 13

**Diagnosis:**
Find all instances:
```bash
# Search for the conflicting information
grep -n "PROJECT_NAME" *.md
```

**Fix:**
1. Determine which file has the CORRECT information
2. Update all other files to match
3. Add to change logs

**Prevention:**
- Update all related files at the same time
- Use git commits to track related changes together
- Periodically run consistency checks (grep for key terms)

---

### Problem 8: "Status tags don't match between files"

**Symptoms:**
- File 01 shows `[ACTIVE]` for a project
- File 14 shows `[COMPLETE]` for same project

**Fix:**
1. Determine actual current status
2. Update ALL files that reference the project
3. Files to check: 01, 14, and relevant domain files

**Checklist for project status updates:**
- [ ] Updated File 14 (active-projects)
- [ ] Updated File 01 (quick-reference active projects list)
- [ ] Updated domain file if project demonstrates skill or uses infrastructure
- [ ] Logged change in change logs

---

## Status Tag Problems

### Problem 9: "I used a status tag that's not in the reference table"

**Symptoms:**
- Using custom tags like `[IN_PROGRESS]`, `[NOT_CONFIGURED]`, `[TESTING]`
- Tags aren't defined in Status Tag Reference (File 01 or README)

**Diagnosis:**
Check if tag exists:
```bash
# Find all status tags in use
grep -oh '\[.*\]' *.md | sort | uniq

# Compare to official list in File 01 or README
```

**Fix:**
Replace non-standard tag with standard tag:
```markdown
# Non-standard tags → Standard replacements
[IN_PROGRESS] → [ACTIVE]
[NOT_CONFIGURED] → [PLANNED]
[TESTING] → [RESEARCH]
[BROKEN] → [ON_HOLD]
[DONE] → [COMPLETE]
```

**Prevention:**
- Always check Status Tag Reference before adding tags
- If you need a new tag, add it to reference table first
- Keep tags to standard vocabulary

---

### Problem 10: "I don't know which status tag to use"

**Quick reference:**

| Situation | Use This Tag |
|-----------|--------------|
| Currently working on it | `[ACTIVE]` |
| Approved/scheduled for future | `[PLANNED]` |
| Researching options | `[RESEARCH]` |
| Making small improvements | `[REFINEMENT]` |
| Paused/waiting | `[ON_HOLD]` |
| Finished | `[COMPLETE]` |
| In production use | `[DEPLOYED]` |
| Ready but not used | `[AVAILABLE]` |
| No longer relevant | `[DEPRECATED]` |
| Replaced by newer | `[RETIRED]` |
| Early ideation | `[BRAINSTORMING]` |

---

## Update Workflow Issues

### Problem 11: "I updated a file but forgot to update the 'Last Updated' date"

**Symptoms:**
- File content changed but header date is old
- Change log has entries but header date unchanged

**Fix:**
```markdown
# Update header to current date
**Last Updated:** 2026-01-31 18:32 UTC

# Add change log entry
- 2026-01-31 18:32 UTC - [Description of changes]
```

**Prevention:**
Create update checklist:
- [ ] Made content changes
- [ ] Updated "Last Updated" in header
- [ ] Added change log entry
- [ ] Committed to git with descriptive message

---

### Problem 12: "I made changes but didn't log them in the change log"

**Symptoms:**
- File content changed but change log is empty
- Last change log entry is weeks/months old

**Fix:**
Add retroactive change log entry:
```markdown
- 2026-01-31 18:32 UTC - Updated [section name]: [brief description of changes]
```

**Prevention:**
- Make change log update part of your workflow
- Review change logs before git commits
- Use git commit messages as source for change log entries

---

### Problem 13: "I updated File 14 (projects) but forgot to update File 01"

**Symptoms:**
- File 14 shows current project priorities
- File 01 active projects list is outdated

**Fix:**
1. Open both files side-by-side
2. Update File 01 active projects to match File 14
3. Ensure priority order is correct
4. Update both "Last Updated" dates
5. Commit both files together

**Prevention:**
**Create linked update checklist:**
When updating File 14:
- [ ] Updated project in File 14
- [ ] Updated priority in File 14
- [ ] Updated File 01 active projects list
- [ ] Updated both change logs
- [ ] Committed both files together

---

## LLM Behavior Problems

### Problem 14: "LLM is not following my instructions in File 02"

**Symptoms:**
- LLM using abbreviated variable names despite instructions
- LLM not providing verification steps
- LLM using casual tone instead of expert tone

**Diagnosis:**
1. Check if you loaded File 02 in the conversation
2. Verify File 02 contains correct instructions
3. Confirm LLM actually processed the file

**Fix:**
**In current conversation:**
```
"You're not following my coding style preferences. Please re-read my instructions:

[paste 02-llm-instructions.md]

Going forward, use full descriptive variable names like `distance_miles`, not `dist`."
```

**For future conversations:**
- Always load File 02 in first message for new LLM instances
- Include File 01 + File 02 together for critical work
- Remind LLM mid-conversation if it forgets

---

### Problem 15: "LLM has outdated information about my setup"

**Symptoms:**
- LLM thinks you're using old software version
- LLM references hardware you replaced
- LLM mentions projects that are complete

**Diagnosis:**
1. Check if you updated the relevant context file
2. Verify you loaded the current version of the file
3. Confirm file actually contains updated info

**Fix:**
**Immediate:**
```
"Update: I'm now using [new software/hardware]. Please disregard previous information about [old item]."
```

**Long-term:**
1. Update appropriate context file
2. Update change log
3. Reload file in LLM
4. Verify LLM acknowledges update

---

### Problem 16: "LLM loads wrong context file for my question"

**Symptoms:**
- Asked network question, LLM loaded audio context
- Asked work question, LLM loaded personal project context

**Diagnosis:**
LLM may not understand which file is appropriate.

**Fix:**
**Be explicit in your request:**
```
# VAGUE (LLM might guess wrong)
"Help me configure my firewall"

# SPECIFIC (LLM knows which context)
"Help me configure my homelab firewall. I've loaded my network context:
[paste 13-home-network-context.md]"
```

**Use File 01 as starting point:**
File 01 (quick-reference) mentions all domains, helping LLM select appropriate detailed files.

---

## Git & Version Control Issues

### Problem 17: "I want to roll back a bad change"

**Symptoms:**
- Made update that broke consistency
- Deleted information by accident
- Want to restore previous version

**Fix:**
```bash
# See recent commits
git log --oneline -10

# View specific commit
git show [commit-hash]

# Restore file from specific commit
git checkout [commit-hash] -- [filename].md

# Or restore from previous commit
git checkout HEAD~1 -- [filename].md

# Review restored file, then commit if good
git add [filename].md
git commit -m "Restored [filename] from [date]"
```

**Prevention:**
- Commit frequently with descriptive messages
- Review diffs before committing
- Use branches for major restructuring

---

### Problem 18: "My git repository is a mess with unclear commits"

**Symptoms:**
- Commit messages like "update", "fix", "changes"
- Multiple unrelated changes in one commit
- Can't find when specific change was made

**Fix:**
**Going forward, use structured commit messages:**
```bash
# BAD
git commit -m "update"

# GOOD
git commit -m "Update File 14: Changed Louis project status to [RESEARCH]"

# BETTER
git commit -m "Update active projects: Louis status [RESEARCH], added token estimates to README

- Changed Louis project from [BRAINSTORMING] to [RESEARCH] in Files 01 and 14
- Added token count estimates to README file inventory
- Updated change logs in both files"
```

**Prevention:**
Use commit template:
```bash
# Create commit template
cat > ~/.gitmessage << 'EOF'
# [Action] [File(s)]: [Brief summary]
#
# - Detailed change 1
# - Detailed change 2
# - Cross-references updated: [if applicable]
EOF

# Configure git to use template
git config --global commit.template ~/.gitmessage
```

---

### Problem 19: "I want to see history of specific information"

**Example:** "When did I change my PowerShell proficiency level?"

**Fix:**
```bash
# Search git history for specific text
git log -S "PowerShell" --source --all

# See all changes to specific file
git log --follow -p -- 10-cs-engineering-competency.md

# Search commit messages
git log --grep="PowerShell"

# See changes between dates
git log --since="2024-01-01" --until="2024-12-31" --oneline
```

---

## Prevention: Best Practices Checklist

### Before Making Changes
- [ ] Identified which file(s) need updates
- [ ] Checked decision tree if unsure
- [ ] Reviewed current content in those files
- [ ] Planned which sections to update

### While Making Changes
- [ ] Updated all related files (use grep to find references)
- [ ] Maintained consistent formatting
- [ ] Used standard status tags
- [ ] Verified cross-references still accurate

### After Making Changes
- [ ] Updated "Last Updated" date in header
- [ ] Added change log entry
- [ ] Ran git diff to review changes
- [ ] Wrote descriptive git commit message
- [ ] Tested by loading file into LLM

### Monthly Maintenance
- [ ] Review all UNKNOWN placeholders
- [ ] Check File 14 for completed projects
- [ ] Verify File 01 active projects match File 14
- [ ] Update status tags for changed situations
- [ ] Fill in known information
- [ ] Archive old change log entries (optional)

---

## Quick Diagnostic Commands

```bash
# Find all status tags in use
grep -oh '\[.*\]' *.md | sort | uniq

# Find all cross-references
grep -n "Cross-references:" *.md

# Find all UNKNOWN placeholders
grep -n "UNKNOWN" *.md

# Check file sizes
wc -l *.md | sort -n

# Find recent changes
git log --since="1 week ago" --oneline

# Search for specific term across all files
grep -r "search term" *.md

# Find duplicate information
grep -n "specific phrase" *.md
```

---

## Still Having Issues?

1. **Check the decision tree:** [98-decision-tree.md](98-decision-tree.md)
2. **Review file relationships:** [97-file-relationships.md](97-file-relationships.md)
3. **Read the README:** [00-README.md](00-README.md)
4. **Ask in conversation:** Load File 01 + File 02 and ask the LLM for help

---

**Remember:** The system is designed to be forgiving. Small inconsistencies won't break functionality. Fix issues as you find them, and use git to track your corrections.
