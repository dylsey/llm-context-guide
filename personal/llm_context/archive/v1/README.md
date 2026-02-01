# How to Use the Modular LLM Context System

**Purpose:** This guide explains how to use personalized markdown context files with any LLM (Claude, ChatGPT, or self-hosted models).

**Audience:** Beginners learning prompt engineering and context management, as well as experienced users who want a structured system.

---

## What Are "Tokens" and Why Do They Matter?

**Tokens** are how LLMs measure and process text. Think of them as "words-ish"—a token is roughly 3-4 characters or 0.75 words in English.

### Why Tokens Matter:
- **LLMs have token limits:** Most LLMs can only process 8,000-200,000 tokens per conversation
- **Tokens cost money:** API-based LLMs charge per token (input + output)
- **More tokens ≠ better results:** Loading irrelevant context wastes tokens and can confuse the LLM

### Token Examples:
- "Hello" = 1 token
- "playground" = 1 token
- "I'm using the modular context system" = ~7 tokens
- This entire README file = ~3,500 tokens

**Best practice:** Load only the context files relevant to your current question. Don't paste all 8 files unless absolutely necessary.

---

## File Inventory

You have **8 markdown files** optimized for cloud-hosted LLM memory management:

### Core Context Files (Domain-Specific)

1. **cs-engineering-competency.md** - Programming skills, language proficiency, learning gaps, project history
2. **it-sysadmin-context.md** - IT role, Git repository work, PowerShell automation, enterprise practices
3. **audio-studio-context.md** - Complete studio inventory, QU-5D routing template, DAW workflows
4. **home-network-context.md** - YelNet topology, UniFi migration, homelab goals, security cameras
5. **active-projects-context.md** - Current projects across work, creative, and learning domains

### Supporting Files

6. **miscellaneous-context.md** - Catch-all for preferences, tools, habits, anti-patterns
7. **[yourname]-llm-instructions.md** - Behavioral guidelines for how LLMs should interact with you
8. **[yourname]-quick-reference.md** - ~300-word snapshot for instant context in new conversations

### For Self-Hosted LLMs & MCPs (Model Context Protocol)

**Self-hosted models** (like LLaMA, Mistral, GPT4All) can use these files as:
- **System prompts:** Load `[yourname]-llm-instructions.md` as the base system prompt
- **RAG (Retrieval-Augmented Generation):** Index all context files in a vector database, retrieve relevant sections dynamically
- **MCP servers:** Configure context files as MCP resources for tool-calling workflows

**Example: Self-Hosted with LM Studio**
```
1. Open LM Studio → System Prompt section
2. Paste contents of [yourname]-llm-instructions.md
3. Load domain files via "Context" or "Documents" feature
4. Query normally—LM Studio handles retrieval
```

**Example: MCP Server Integration**
```json
{
  "mcpServers": {
    "context-system": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-server-filesystem"],
      "env": {
        "ALLOWED_DIRECTORIES": "C:\\Dev\\docs\\llm-context"
      }
    }
  }
}
```

---

## For New Users: Identifying Your Context Domains (Q&A Format)

**Not sure which context files you need?** Answer these questions to identify your domains:

### Question 1: What do you do for work?
- **Software developer?** → Create `cs-engineering-competency.md`
- **IT/sysadmin?** → Create `it-sysadmin-context.md`
- **Designer/creative?** → Create `creative-workflow-context.md`
- **Student?** → Create `academic-context.md`

**Example:** "I'm a teacher" → Create `teaching-context.md` (subjects taught, grade levels, classroom tech, curriculum goals)

### Question 2: What hobbies/creative pursuits do you have?
- **Music production?** → Create `audio-studio-context.md`
- **Photography?** → Create `photography-context.md`
- **Cooking?** → Create `cooking-recipes-context.md`
- **Gaming?** → Create `gaming-context.md`

**Example:** "I build mechanical keyboards" → Create `keyboard-building-context.md` (switches, PCBs, soldering equipment, projects)

### Question 3: What technical systems do you manage?
- **Home network?** → Create `home-network-context.md`
- **Smart home?** → Create `home-automation-context.md`
- **Home lab?** → Create `homelab-context.md`
- **3D printing?** → Create `3d-printing-context.md`

**Example:** "I run a Plex media server" → Create `media-server-context.md` (hardware specs, storage, library organization, remote access)

### Question 4: What are you actively learning?
- **New programming language?** → Add to `cs-engineering-competency.md` under "Target Skills"
- **Cybersecurity?** → Create `cybersecurity-learning-context.md`
- **Foreign language?** → Create `language-learning-context.md`

**Example:** "Learning Japanese" → Create `japanese-learning-context.md` (textbooks, apps, study schedule, conversation partners)

### Minimum Recommended Files (Everyone Needs These):
1. **[yourname]-quick-reference.md** - Your identity snapshot
2. **[yourname]-llm-instructions.md** - How LLMs should interact with you
3. **miscellaneous-context.md** - Catch-all for preferences

---

## How to Use This System

### Starting a New LLM Conversation

**Step 1: Always paste `[yourname]-quick-reference.md` first**

This gives the LLM instant baseline context about who you are, what you do, and how you prefer communication.

**Example opening message to LLM:**
```
Hi! I'm pasting my quick reference file so you understand my background and preferences.

[paste entire contents of [yourname]-quick-reference.md]

I'm ready to discuss [your topic] when you've processed this context.
```

⏱️ **Be patient:** The LLM is processing your context (typically 5-15 seconds for 300-500 words).

---

**Step 2: Paste relevant domain file(s) based on your topic**

**Only load what's needed** for the current conversation to avoid wasting tokens and confusing priorities.

**Example:** You're troubleshooting your home network WiFi issues.

**Bad approach (wastes tokens):**
```
[paste quick-reference.md]
[paste cs-engineering-competency.md]
[paste audio-studio-context.md]
[paste home-network-context.md]
[paste active-projects-context.md]
[paste miscellaneous-context.md]

"My WiFi is slow, help?"
```

**Good approach (efficient, focused):**
```
[paste quick-reference.md]
[paste home-network-context.md]

"My WiFi is slow on the Archer AX6000 downstairs. Here's what I've tried so far..."
```

---

**Step 3 (Optional): Include `[yourname]-llm-instructions.md` if needed**

**When to include instructions:**
- First time using a new LLM instance
- The LLM's responses don't match your preferences (too casual, too verbose, uses abbreviations)
- Mid-conversation, the LLM "forgets" your style

**What to do if the LLM forgets instructions mid-conversation:**

**Scenario:** You're 20 messages into a conversation, and suddenly the LLM starts using abbreviated variable names or providing "try this" advice without explanation.

**Solution:**
```
"I notice you're not following my coding style preferences anymore. 

Please re-read my instructions:

[paste [yourname]-llm-instructions.md]

Let's continue—can you refactor that last code snippet using full descriptive names?"
```

**Pro tip:** You can paste just the relevant section of instructions (e.g., "Code Style Requirements") instead of the whole file.

---

## Example Use Cases (With Step-by-Step Walkthroughs)

### Example 1: Music Production Question

**Your Question:** "How should I route my Prophet 10 synth through the QU-5D for recording in Ableton?"

**Files to Load:**
1. Quick Reference (establishes identity)
2. Audio Studio Context (has QU-5D routing template and Prophet 10 details)

**Step-by-step:**
```
1. Open new ChatGPT/Claude conversation
2. Copy/paste [yourname]-quick-reference.md
3. Wait 5 seconds
4. Copy/paste audio-studio-context.md
5. Type your question:
   "How should I route my Prophet 10 through the QU-5D for recording in Ableton? 
   I want to hear it through my monitors while recording, and I need clean 
   direct monitoring without latency."
6. Review LLM's answer
```

**Expected response quality:**
- LLM will reference your existing QU-5D routing (Input 15 = Prophet 10 Local 8)
- LLM knows you use Ableton Live 12 as primary DAW
- LLM understands your preference for direct monitoring without latency

---

### Example 2: Git Repository Setup (Multi-Domain)

**Your Question:** "Help me set up a self-hosted Git server in my homelab for work projects. It needs to integrate with Active Directory."

**Files to Load:**
1. Quick Reference (establishes identity)
2. IT Sysadmin Context (Git repo governance, AD integration requirements, Windows Server environment)
3. Home Network Context (homelab infrastructure, VLANs, security policies)

**Step-by-step:**
```
1. Open new conversation
2. Paste [yourname]-quick-reference.md
3. Paste it-sysadmin-context.md
4. Paste home-network-context.md
5. Type your question:
   "I need to set up a self-hosted Git server in my homelab that integrates 
   with my work's Active Directory forest. It will run on Windows Server 2022. 
   What's the best approach that follows enterprise patterns but is manageable 
   for a 2-person IT team?"
6. LLM now has full context of:
   - Your AD environment (on-prem domain controllers, no Azure)
   - Your homelab topology (VLANs, UniFi plans, security-first mindset)
   - Your work constraints (small team, enterprise-grade requirements)
   - Your security posture (never increase attack surface)
```

**Expected response quality:**
- LLM will recommend solutions compatible with Windows Server 2022 + AD
- LLM will consider your security-first approach
- LLM will suggest starting with file share permissions (your supervisor's guidance)
- LLM will provide enterprise-scalable patterns despite small team size

---

### Example 3: C++ Architecture Discussion

**Your Question:** "I'm refactoring my SDL2 game's bullet management system. Should I use a factory pattern or dependency injection?"

**Files to Load:**
1. Quick Reference
2. CS Engineering Competency (knows about your Contra SDL2 project, BulletFactory experience, ownership patterns)

**Step-by-step:**
```
1. New conversation
2. Paste [yourname]-quick-reference.md
3. Paste cs-engineering-competency.md
4. Ask your question with code snippet (optional):
   "I'm refactoring my SDL2 game's bullet management. Currently using BulletFactory, 
   but wondering if dependency injection would be cleaner. Here's my current approach:
   
   [paste code snippet]
   
   What are the tradeoffs?"
5. LLM knows:
   - You already understand factory patterns (BulletFactory in Contra project)
   - You care about ownership semantics and lifecycle management
   - You prefer readability over cleverness
   - You want full descriptive names
```

**Expected response quality:**
- LLM will compare factory vs DI in context of your existing architecture
- LLM will explain tradeoffs without assuming you're a beginner
- LLM will use full variable names in code examples
- LLM will explain *why* one approach might be better, not just *that* it is

---

## Platform-Specific Usage

### For ChatGPT

**Complete workflow:**
```
1. Start new conversation: https://chat.openai.com
2. Paste: [yourname]-quick-reference.md
3. Type: "Please confirm you've processed my context and are ready to assist."
4. Wait for ChatGPT's acknowledgment
5. Paste relevant domain file(s)
6. Ask your question
7. ChatGPT's memory will retain key details for future sessions (automatic)
```

**ChatGPT-specific notes:**
- Memory is automatic but less structured than Claude
- You may need to re-paste context files every 10-15 conversations
- Use "Custom Instructions" feature to embed key preferences permanently

**Example Custom Instructions for ChatGPT:**
```
What would you like ChatGPT to know about you?
→ Paste shortened version of [yourname]-quick-reference.md here (under 1500 chars)

How would you like ChatGPT to respond?
→ Paste core rules from [yourname]-llm-instructions.md (under 1500 chars)
```

---

### For Claude (Anthropic)

**Complete workflow:**
```
1. Start conversation at https://claude.ai
2. (Optional) Paste [yourname]-quick-reference.md if starting fresh
3. Claude already has core context in persistent memory (if configured)
4. Paste domain file(s) as needed
5. Ask your question
6. Claude's memory persists automatically across all conversations
```

**Claude-specific notes:**
- Claude has structured persistent memory (more reliable than ChatGPT)
- You can view/edit Claude's memory using the memory_user_edits tool
- Context files supplement memory, not replace it
- Claude's memory is per-user, persists across devices/sessions

**Example: Using Claude's Memory System**
```
You: "Remember that I now use Pro Tools 2025.12 instead of the older version."
Claude: [uses memory_user_edits tool to update]
Claude: "Added to memory: User uses Pro Tools 2025.12"
```

---

### For Self-Hosted / Local LLMs

**System prompt workflow:**
```
1. Open your LLM interface (LM Studio, Oobabooga, Ollama, etc.)
2. Navigate to "System Prompt" or "Instructions" section
3. Paste entire [yourname]-llm-instructions.md as system prompt
4. Load domain files via "Context" or "Documents" feature
5. Query normally
```

**RAG (Retrieval-Augmented Generation) workflow:**
```
1. Install vector database (ChromaDB, FAISS, Pinecone)
2. Index all your .md context files:
   ```
   python index_contexts.py --directory C:\Dev\docs\llm-context
   ```
3. Configure LLM to retrieve relevant chunks per query
4. LLM automatically loads context based on query similarity
```

**MCP (Model Context Protocol) workflow:**
```
1. Configure MCP server in your LLM client (Claude Desktop, Continue.dev, etc.)
2. Point MCP to your context directory:
   {
     "command": "mcp-server-filesystem",
     "args": ["--directory", "C:\\Dev\\docs\\llm-context"]
   }
3. LLM can now access files via tool calls
4. Ask: "Read my audio-studio-context and help me with QU-5D routing"
5. LLM calls MCP tool to fetch file, then answers
```

---

## Maintenance & Updates

### When to Update Files (With Examples)

**Update immediately when:**

**Example 1: Hardware change**
```
You bought: Novation Peak Desktop synth
Action: Update audio-studio-context.md
Section: "5) Hardware Synthesizers & Sound Sources"
Add row: | Novation Peak Desktop | Hybrid analog | Multi-timbral, rich modulation |
```

**Example 2: Project status change**
```
You completed: Git repository implementation at work
Action: Update active-projects-context.md
Move project from "High Priority (Active Work)" to "Completed" section
Add completion date and lessons learned
```

**Example 3: Job role change**
```
You got promoted: Senior Systems Engineer
Action: Update it-sysadmin-context.md
Section: "1) Professional Role & Environment"
Change title: "Senior Systems Engineer" (was "Computer Support Analyst")
Update responsibilities to reflect new role
```

**Example 4: Communication preference change**
```
You now prefer: More detailed explanations with examples
Action: Update [yourname]-llm-instructions.md
Section: "4) Teaching Methodology"
Add: "Always provide 2-3 concrete examples for new concepts"
```

---

**Update periodically (monthly):**

Consider setting a **calendar reminder** on the last Friday of each month:

**Monthly review checklist:**
```
[ ] active-projects-context.md - Move completed projects, add new ones
[ ] cs-engineering-competency.md - Update skills from "Target" → "Developing" → "Proven"
[ ] miscellaneous-context.md - Update tool preferences, add new frustrations/learnings
[ ] [yourname]-quick-reference.md - Update active projects list to match priorities
[ ] All files - Fill in UNKNOWN sections as you document things
```

**Automated reminder options:**

**Option 1: Calendar event (simplest)**
```
Google Calendar / Outlook:
- Event: "Review LLM Context Files"
- Recurrence: Last Friday of every month
- Description: "Run through monthly review checklist"
```

**Option 2: PowerShell scheduled task**
```powershell
# Create reminder toast notification
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command ""Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Time to review LLM context files!', 'Monthly Reminder')"""

$Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -At 5PM

Register-ScheduledTask -TaskName "LLM Context Review" -Action $Action -Trigger $Trigger
```

**Option 3: Git hook (advanced)**
```bash
# .git/hooks/pre-commit
# Reminds you if files haven't been updated in 30+ days

#!/bin/bash
find . -name "*-context.md" -mtime +30 | while read file; do
    echo "Warning: $file hasn't been updated in 30+ days"
done
```

---

### How to Update Files

**Step-by-step example:**

**Scenario:** You just bought a Lenovo ThinkPad E14 laptop for personal use.

```
1. Open VS Code: C:\Dev\docs\llm-context\miscellaneous-context.md

2. Find section: "5) Hardware & Physical Environment → Portable Computing"

3. Add new line:
   **Before:**
   - **Workbox:** Dell i7 vPro 7780 (work laptop, Windows 11 Pro)
   - **Surface Book Gen 1:** AlmaLinux 9.6 bare metal (Linux learning platform)
   
   **After:**
   - **Workbox:** Dell i7 vPro 7780 (work laptop, Windows 11 Pro)
   - **Singularity:** Lenovo ThinkPad E14 (personal/creative laptop, Windows 11 Home)
   - **Surface Book Gen 1:** AlmaLinux 9.6 bare metal (Linux learning platform)

4. Update "Last Updated" date at top of file:
   **Last Updated:** 2026-01-28  (was 2026-01-27)

5. Save file (Ctrl+S)

6. Commit to Git:
   cd C:\Dev\docs\llm-context
   git add miscellaneous-context.md
   git commit -m "Added Singularity laptop to hardware inventory"
   git push

7. Test with LLM:
   - Open ChatGPT
   - Paste updated miscellaneous-context.md
   - Ask: "What laptops do I own?"
   - Verify LLM mentions Singularity
```

---

### Version Control Best Practices

**Why use Git for these files:**
- **Time travel:** See how your projects/skills evolved ("I started learning Rust in March 2025")
- **Undo mistakes:** Roll back bad edits ("Oops, I accidentally deleted my studio inventory")
- **Branch experiments:** Test major reorganizations without affecting the main files
- **Sync across machines:** Keep desktop, laptop, and work computer in sync
- **Backup:** Git remote = automatic offsite backup

**Real-world example:**

**Scenario:** You want to reorganize your audio-studio-context.md but aren't sure if the new structure is better.

```bash
# Create experimental branch
cd C:\Dev\docs\llm-context
git checkout -b reorganize-audio-context

# Make changes to audio-studio-context.md
# Save and commit
git add audio-studio-context.md
git commit -m "Experiment: Reorganized studio context by workflow instead of hardware type"

# Test with LLM for a week

# If you like it:
git checkout main
git merge reorganize-audio-context

# If you don't like it:
git checkout main
# Experimental changes are safely isolated in the branch
```

---

## File Organization

**Recommended directory structure:**

This tree shows the **logical flow for new users** while remaining clear for experienced users:

```
C:\Dev\docs\llm-context\
│
├── 📄 README.md (START HERE - this guide)
│
├── 🚀 QUICK START FILES (Load these first in every conversation)
│   ├── [yourname]-quick-reference.md (Load 1st: Your identity snapshot)
│   └── [yourname]-llm-instructions.md (Load 2nd: How LLM should behave)
│
├── 📚 DOMAIN CONTEXT FILES (Load as needed per topic)
│   ├── cs-engineering-competency.md (Programming, languages, projects)
│   ├── it-sysadmin-context.md (IT work, servers, automation)
│   ├── audio-studio-context.md (Music production, equipment, workflows)
│   ├── home-network-context.md (Network topology, homelab, security)
│   ├── active-projects-context.md (Current work across all domains)
│   └── miscellaneous-context.md (Preferences, tools, catch-all)
│
├── 📁 templates/ (Optional - Reusable project templates)
│   ├── new-context-domain-template.md
│   ├── project-documentation-template.md
│   └── troubleshooting-log-template.md
│
├── 📁 archive/ (Optional - Old versions for reference)
│   ├── 2025-01-01-audio-studio-context.md
│   └── 2024-12-15-active-projects-context.md
│
└── 📝 CHANGELOG.md (Optional - Track major updates)
```

**Visual workflow for new users:**
```
1. Read README.md (you are here)
   ↓
2. Create/customize your [yourname]-quick-reference.md
   ↓
3. Create/customize your [yourname]-llm-instructions.md
   ↓
4. Identify your domains (work, hobbies, tech systems)
   ↓
5. Create domain context files (use templates/)
   ↓
6. Start using: Load quick-reference + relevant domain file per conversation
   ↓
7. Monthly: Update files, commit to Git, check CHANGELOG.md
```

**Optional enhancements:**

**1. templates/ folder**
```
C:\Dev\docs\llm-context\templates\new-domain-template.md

# [Domain Name] Context

**Last Updated:** YYYY-MM-DD
**Purpose:** [Brief description]

## 1) Overview
[What this domain covers]

## 2) Equipment/Tools Inventory
| Item | Type | Status | Notes |
|------|------|--------|-------|
|      |      |        |       |

## 3) Workflows & Processes
[How you work in this domain]

## 4) Current Projects
[Active work in this domain]

## 5) Learning Goals
[What you want to learn]

## 6) UNKNOWN Items
- [ ] [Things you need to document]
```

**2. CHANGELOG.md**
```markdown
# Changelog - LLM Context System

## 2026-01-28
- Added Singularity laptop to hardware inventory (miscellaneous-context.md)
- Updated Pro Tools version to 2025.12 (audio-studio-context.md)

## 2026-01-15
- Created new domain: photography-context.md
- Moved completed Git repo project to archive (active-projects-context.md)

## 2025-12-20
- Initial system setup (all 8 core files created)
```

---

## Troubleshooting

### "The LLM isn't following my instructions"

**Symptom:** LLM uses abbreviated variable names, provides vague "try this" advice, or ignores your communication preferences.

**Solution:**
```
1. Paste [yourname]-llm-instructions.md explicitly
2. Type: "Please confirm you're following these guidelines"
3. Wait for LLM acknowledgment
4. Continue conversation
```

**Example message:**
```
"I notice you're not following my coding style preferences. You used 'idx' instead of 'index' and 'mgr' instead of 'manager'.

Please re-read my instructions:

[paste [yourname]-llm-instructions.md]

Now, can you refactor that last code snippet using full descriptive names?"
```

---

### "The LLM has outdated information"

**Symptom:** LLM says "You use Pro Tools 2023" when you're actually on Pro Tools 2025.12.

**Solution:**
1. Check "Last Updated" date in relevant context file
2. Update file with current information
3. Re-paste updated file into conversation

**Example:**
```
"The information you have is outdated. I've updated my audio-studio-context.md file.

[paste updated audio-studio-context.md]

I now use Pro Tools 2025.12, not the older version. Please update your understanding."
```

---

### "I don't know which file to load"

**Symptom:** You have a question but aren't sure which domain context file(s) are relevant.

**Solution:**
- **Start with just [yourname]-quick-reference.md**
- Ask your question
- If LLM's response lacks depth or misses context, add the most relevant domain file
- You can always add more context mid-conversation

**Example:**
```
[paste [yourname]-quick-reference.md]

"How should I organize my sample library for faster workflow in Ableton?"

LLM responds with generic advice...

"Let me give you more context about my studio setup:"

[paste audio-studio-context.md]

"Now, considering my hardware synths and QU-5D routing, how should I organize samples?"
```

---

### "The context files are too long to paste"

**Symptom:** Your audio-studio-context.md is 2,500 words and feels overwhelming to paste into a conversation.

**Solutions:**

**Option 1: Paste only relevant sections**
```
Instead of pasting entire audio-studio-context.md, paste just:
- Section 4 (QU-5D routing)
- Section 5 (Hardware synths)
```

**Option 2: Summarize in quick reference**
```
Keep [yourname]-quick-reference.md comprehensive enough that you rarely need full domain files.
```

**Option 3: Split the file**
```
If audio-studio-context.md exceeds 2,000 words, split into:
- audio-hardware-context.md (equipment inventory)
- audio-workflows-context.md (DAW processes, routing)
```

**Token capacity reference:**
- Most LLMs handle 8,000-200,000 tokens comfortably
- Your longest file (audio-studio-context.md) is ~1,500 tokens
- You can safely paste 3-4 full context files in one conversation

---

## Advanced Usage

### Creating New Context Files

**When to create a new context file:**
- You develop a new major hobby/domain (e.g., photography, cooking, gardening)
- An existing file exceeds 2,000 words
- You have a distinct workflow that doesn't fit existing categories

**Step-by-step: Creating "photography-context.md"**

```
1. Copy existing template:
   cd C:\Dev\docs\llm-context
   cp templates/new-domain-template.md photography-context.md

2. Open in VS Code:
   code photography-context.md

3. Fill in sections:
   # Photography Context
   
   ## 1) Overview
   I shoot landscape and street photography, primarily using Fujifilm X-T4.
   
   ## 2) Equipment Inventory
   | Item | Type | Status |
   |------|------|--------|
   | Fujifilm X-T4 | Camera body | Primary |
   | XF 16-55mm f/2.8 | Zoom lens | Primary walkaround |
   | XF 56mm f/1.2 | Prime lens | Portraits |
   
   ## 3) Workflows
   - Import: Lightroom Classic
   - Editing: Lightroom + Photoshop for complex edits
   - Export: JPEG (web), TIFF (print)
   
   ## 4) Current Projects
   - "Urban Shadows" street photography series (30/100 images)
   
   ## 5) Learning Goals
   - Master off-camera flash
   - Learn focus stacking for landscapes
   
   ## 6) UNKNOWN
   - [ ] Print workflow and color calibration
   - [ ] Backup strategy for RAW files

4. Update [yourname]-quick-reference.md:
   Add to "For deeper context" section:
   photography-context.md | ...

5. Commit to Git:
   git add photography-context.md [yourname]-quick-reference.md
   git commit -m "Created photography domain context"
   git push

6. Test with LLM:
   [paste [yourname]-quick-reference.md]
   [paste photography-context.md]
   "I'm editing a backlit street photo. How should I recover shadow detail?"
```

---

### Merging/Splitting Files

**When to split a file:**
- Exceeds 2,000 words (becomes unwieldy)
- Covers distinct topics rarely used together

**Example: Splitting audio-studio-context.md**

**Before (too long):**
```
audio-studio-context.md (2,500 words)
- DAW workflows
- Hardware synth inventory
- QU-5D routing template
- MIDI infrastructure
- Active music projects
```

**After (split into focused files):**
```
audio-hardware-context.md (800 words)
- Hardware synth inventory
- MIDI utilities
- Monitoring chain

audio-workflows-context.md (900 words)
- DAW workflows
- QU-5D routing template
- Cross-DAW collaboration

audio-projects-context.md (600 words)
- Active music projects
- Creative goals
```

**When to merge files:**
- Both files always used together
- A file is too short (< 300 words) to be standalone

**Example: Merging homelab files**

**Before:**
```
homelab-compute-context.md (200 words) - VM inventory
homelab-network-context.md (2,000 words) - Network topology, VLANs
```

**After:**
```
home-network-context.md (2,200 words)
- Includes both compute (VMs) and network (topology) since they're tightly coupled
```

---

## Next Steps

### For New Users:
1. ✅ **Read this README** (you are here)
2. ✅ **Identify your domains** (use Q&A section above)
3. ✅ **Create [yourname]-quick-reference.md** (start with template)
4. ✅ **Create [yourname]-llm-instructions.md** (define your preferences)
5. ✅ **Create 1-3 domain context files** (start small, expand later)
6. ✅ **Test with ChatGPT/Claude:** Paste quick reference + one domain file
7. ✅ **Iterate:** Update files based on what works/doesn't work

### For Returning Users:
1. ✅ **Review files for accuracy** (monthly)
2. ✅ **Update active-projects-context.md** (as projects evolve)
3. ✅ **Fill in UNKNOWN sections** (as you document things)
4. ✅ **Commit changes to Git** (maintain version history)
5. ✅ **Test updated files** (verify LLM has current info)

### One-Time Setup Tasks:
1. ✅ **Create directory:** `C:\Dev\docs\llm-context\`
2. ✅ **Initialize Git repository:**
   ```bash
   cd C:\Dev\docs\llm-context
   git init
   git add *.md
   git commit -m "Initial LLM context system"
   ```
3. ✅ **Set monthly reminder:** Calendar event or scheduled task
4. ✅ **Create GitHub repo (optional):**
   ```bash
   git remote add origin https://github.com/yourusername/llm-context.git
   git push -u origin main
   ```

---

## Summary

This modular system gives you **precise control** over what context each LLM has access to, while keeping maintenance simple. By updating only the files that change, you avoid the "big monolithic document" problem that becomes outdated and unwieldy.

### Key Principles:
1. **Load minimum context needed** per conversation (saves tokens, improves focus)
2. **Update files incrementally** as projects/skills evolve (not all at once)
3. **Use Git for version control** (track changes, enable rollback)
4. **Start small, expand gradually** (3 files → 8 files over time)
5. **Test frequently** (paste updated files into LLM to verify accuracy)

### Quick Reference (Post This Near Your Desk):
```
┌─────────────────────────────────────────────────┐
│ EVERY LLM CONVERSATION STARTS WITH:             │
│ 1. Paste [yourname]-quick-reference.md          │
│ 2. Paste relevant domain file(s)                │
│ 3. Ask your question                            │
└─────────────────────────────────────────────────┘

MONTHLY MAINTENANCE:
☐ Update active-projects-context.md
☐ Review learning goals (competency files)
☐ Fill in UNKNOWN sections
☐ Git commit + push

TROUBLESHOOTING:
→ LLM not following instructions?
  Paste [yourname]-llm-instructions.md

→ LLM has outdated info?
  Update + re-paste relevant context file

→ Don't know which file to load?
  Start with quick-reference only, add more if needed
```

---

**Questions? Contributions?**

This system is designed to evolve. If you discover better practices or have suggestions, document them in your own `README-improvements.md` and share with the community!
