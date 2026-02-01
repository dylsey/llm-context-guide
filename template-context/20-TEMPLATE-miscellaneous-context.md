# [YOUR_NAME] — Miscellaneous Context & Preferences

**Last Updated:** YYYY-MM-DD HH:MM UTC
**Purpose:** Catch-all for preferences, habits, tools, and contextual information that doesn't fit primary domain categories

---

## 1) Communication & Interaction Preferences

### Response Style Requirements

**Preferred Tone:**
- [Tone level - e.g., Expert mentor / senior engineer level, Conversational peer, Professional consultant]
- Precise and technical, no fluff or excessive friendliness
- Professional but not stiff
- Most correct and modern answer first

**Response Structure:**
- Structured headings when appropriate
- Exact file paths and commands when relevant
- Verification steps ("how to confirm it worked")
- Explicit reasoning without unnecessary bloat
- Avoid unexplained abbreviations (standard terms like API, URL are fine)

**What [YOUR_NAME] Values:**
- Understanding the "why" behind solutions
- Root cause analysis over quick fixes
- Official documentation references
- Step-by-step explanations for new concepts

**What [YOUR_NAME] Dislikes:**
- "Try this random thing" troubleshooting without rationale
- Solutions that create technical debt
- Vague advice without actionable steps
- Changing their code without explicit permission

---

## 2) Teaching & Learning Methodology

### Three-Part Installation Instruction Format

When introducing new tools, packages, or configurations, [YOUR_NAME] expects:

1. **What is this?** (Brief description of the tool/concept)
2. **What does it do?** (Purpose and capabilities)
3. **Check if installed first** (Verification command before proceeding)

**Example:**
```
[Tool]'s built-in `[command]` checks if [functionality exists].
It returns [output type] and is used for [purpose].
To check if it's available:
[verification_command]
```

**Goal:** Build understanding, not cargo-cult commands

---

## 3) Security & Safety Posture

### Non-Negotiable Security Rules

**Core Principles:**
1. Never suggest solutions that increase attack surface
2. Prefer secure-by-default configurations
3. Official hardening guidance over convenience shortcuts
4. Principle of least privilege for permissions
5. Explicit documentation of security tradeoffs

**Example Decisions:**
- Refuses to enable [insecure legacy feature] for [modern task] (prefers [secure alternative] instead)
- Evaluates all automation approaches through security lens first
- Plans for credential management and secrets handling
- Understands [industry/domain-specific] compliance requirements

**When Uncertain:**
- Err on the side of caution
- Offer safer alternatives
- Explain security implications clearly
- Defer to official security guidance ([security standard references - e.g., CIS, NIST])

---

## 4) Tools & Software Preferences

### Operating Systems

**Primary Platforms:**
| OS | Use Case | Preference Level |
|----|----------|------------------|
| **[Primary_OS_1]** | [Use case - e.g., Primary work and home desktop environment] | Preferred for daily work |
| **[Secondary_OS_1]** | [Use case - e.g., Server environments] | Standard for [context] |
| **[Primary_Linux_Distro]** | [Use case - e.g., Server and learning environment] | Preferred Linux distribution |
| **[Secondary_OS_2]** | [Use case - e.g., Personal tinkering] | Secondary preference |
| **[Desktop_Environment]** | [OS] desktop environment | Strong preference over [alternatives] |

### Shell & Scripting Preferences

**[Primary_OS_1]:**
- **[Primary_Shell]** (default) over [alternative shells]
- [Shell Version] on personal machines
- [Shell Version] in [context - e.g., work server environments]

**[Primary_OS_2]:**
- **[Primary_Shell]** for shell scripting
- Learning [new shell] but not yet primary

### Development Tools

**Version Control:**
- [VCS - e.g., Git] (command-line proficiency)
- Building [scale - e.g., enterprise] workflows

**IDEs & Editors:**
- **[IDE 1]** ([primary use - e.g., C++ development])
- **[IDE 2]** ([primary use - e.g., general-purpose, scripting])

**Package Managers:**
- [OS]: **[package_manager]** ([notes - e.g., community packages can be problematic, prefer vendor direct downloads for critical tools])
- [OS]: **[package_manager]** ([native package manager])

---

## 5) Hardware & Physical Environment

### Primary Workstation ([Machine_Name])

**PC Build Specifications:**
| Component | Model/Spec |
|-----------|------------|
| **CPU** | [Make/Model] |
| **CPU Cooler** | [Model] |
| **Motherboard** | [Model] |
| **RAM** | [Amount] [Type] |
| **Storage** | [Drive 1], [Drive 2], etc. |
| **GPU** | [Model] ([future plans if applicable]) |
| **Case** | [Model] |
| **PSU** | [Model/Wattage] |
| **Monitors** | [Model/Specs] |

### Other Hardware

**Portable Computing:**
- **[Machine_1]:** [Description] ([primary use])
- **[Machine_2]:** [Description] ([primary use])
- **[Machine_3]:** [Description] ([primary use])
- **[Device]:** [Description] ([primary use])

**[Specialized Hardware Category] Experience:**
- [Specific experience 1]
- [Specific experience 2]
- [General familiarity notes]
- [Use case description]

---

## 6) Daily Workflows & Habits

### Time Management & Focus

**Work Hours:**
- [Work description - e.g., Full-time role at organization]
- Professional obligations take priority during workday

**Personal Project Time:**
- [Time blocks - e.g., Evenings and weekends] for creative and learning projects
- Balances [domain 1], [domain 2], and [domain 3]

**Decision Framework for New Work:**
1. Does this solve a real problem?
2. Does this teach valuable skills?
3. Is this achievable with available time/resources?
4. Does this align with career/learning goals?
5. Can this be broken into incremental milestones?

---

## 7) Geographic & Timezone Context

**Location:** [City, State/Province, Country]
**Timezone:** [Timezone - e.g., America/New_York, Europe/London]

**Relevance:**
- Local technology community awareness
- [Employment context if applicable - e.g., Government, Corporate]
- Timezone considerations for scheduling discussions

---

## 8) Career Development & Learning Goals

### Professional Development Trajectory

**Current Role:** [Job Title] ([Role description])

**Growing Responsibilities:**
- [Responsibility 1]
- [Responsibility 2]
- [Planning aspect - e.g., Enterprise architecture planning]

**Skill Development Priorities:**
1. **[Skill 1]:** [Description]
2. **[Skill 2]:** [Description]
3. **[Skill 3]:** [Description]
4. **[Skill 4]:** [Description]
5. **[Skill 5]:** [Description]
6. **[Skill 6]:** [Description]
7. **[Skill 7]:** [Description]
8. **[Skill 8]:** [Description]
9. **[Skill 9]:** [Description]

**Long-Term Direction:**
- [Career goal 1]
- [Career goal 2]
- [Career goal 3]
- Possible certifications ([Known targets] or UNKNOWN)

---

## 9) Collaboration & Teamwork

### Work Collaboration Style

**Team Structure:**
- [Team description - e.g., 2-person team, 10-person department]
- Must build practices that scale beyond current team size
- Documentation serves as knowledge transfer and onboarding

**Collaboration Preferences:**
- Clear documentation over tribal knowledge
- Repeatable processes over one-off fixes
- Decision logs for architectural choices
- Peer review when possible

### Creative Collaboration

**[Domain] Partners:**
- **[Collaborator/Role]:** [Type of collaboration]
- [Tool/Platform] users: [Cross-platform workflow notes]
- [Software] users: [Collaboration format - e.g., AAF/OMF exchange]

---

## 10) Problem-Solving Approach

### Debugging & Troubleshooting Methodology

**[YOUR_NAME]'s Process:**
1. **Understand the problem:** What is actually broken? What's the expected behavior?
2. **Gather information:** Error messages, logs, system state
3. **Form hypotheses:** What are the likely causes?
4. **Test systematically:** Change one variable at a time
5. **Document findings:** What worked, what didn't, why
6. **Implement solution:** With verification steps
7. **Prevent recurrence:** Document for future reference

**Avoids:**
- Random trial-and-error without reasoning
- Copying commands without understanding
- Quick fixes that mask underlying issues
- Undocumented changes

---

## 11) Information Organization & Documentation

### File Organization Principles

**Naming Conventions:**
- Descriptive, not abbreviated
- Lowercase with hyphens for multi-word files (kebab-case)
- Date prefixes for versioned documents (YYYY-MM-DD format)

**Documentation Standards:**
- Every project has a README
- Installation/setup instructions mandatory
- Dependency lists and version requirements
- Troubleshooting sections
- Change logs for significant updates

**Version Control Discipline:**
- Meaningful commit messages
- Atomic commits (one logical change per commit)
- Branch naming conventions (feature/, bugfix/, etc.)

---

## 12) Stress & Burnout Awareness

### Work-Life Balance

**Creative Outlets:**
- [Creative activity 1]
- [Creative activity 2]
- [Creative activity 3]

**Learning as Recreation:**
- [Learning activity] projects are enjoyable, not just educational
- [Learning platform/activity - e.g., Capture the flag competitions] as "puzzle-solving"
- Building/tinkering with [hardware/systems]

**Burnout Prevention:**
- Recognizes importance of creative work alongside technical work
- Balances structured learning with exploratory projects
- Takes breaks when troubleshooting becomes frustrating

---

## 13) Known Pain Points & Frustrations

### Technical Frustrations

**Package Managers:**
- [OS] [package_manager] [specific issues - e.g., community packages can be unreliable]
- Prefers [approach - e.g., vendor-direct downloads] for critical tools

**[OS/Platform] Quirks:**
- [Specific issue 1]
- [Specific issue 2]

**Cross-Platform Challenges:**
- File format compatibility ([Platform A] ↔ [Platform B] collaboration)
- Path separator differences ([OS 1] vs [OS 2])

### Process Frustrations

**[Work/Industry Context] Constraints:**
- [Constraint 1 - e.g., Budget approval processes]
- [Constraint 2 - e.g., Change management overhead]
- [Constraint 3 - e.g., Compliance requirements limiting technical options]

---

## 14) Personal Interests & Side Knowledge

### [Interest Category 1] Preferences
- **[Specific area]:** [Description]
- **[General area]:** Wide range (UNKNOWN specific details to avoid assumptions)

### [Interest Category 2]
- [Devices/platforms] present on network
- [Project reference] suggests familiarity with [topic area]
- **Details:** UNKNOWN ([what's unknown - e.g., genres, current games, platforms])

### Other Technical Interests
- [Interest 1]
- [Interest 2]
- [Interest 3]

---

## 15) Anti-Patterns & Things to Avoid

### Communication Anti-Patterns

**Don't do this:**
- Assume [YOUR_NAME] is a beginner without evidence
- Provide abbreviated variable names or "clever" code without their request
- Skip explanations of new syntax or concepts
- Suggest security-degrading shortcuts
- Invent facts or details not explicitly stated

**Don't offer unsolicited advice on:**
- Code refactoring unless asked
- Tool/language choices without understanding constraints
- Architecture changes without discussing tradeoffs

---

## 16) Future Topics to Explore (Potential Interests)

### Technical Areas (Not Yet Deeply Explored)

**[Category 1]:**
- [Technology 1] for [use case]
- [Technology 2] for [use case]
- [Technology 3] for [use case]

**[Category 2]:**
- [Technology 1] for [use case]
- [Technology 2] for [use case]
- [Technology 3] for [use case]

**[Category 3]:**
- [Concept 1]
- [Concept 2]
- [Concept 3]

**[Category 4]:**
- [Concept 1]
- [Concept 2]
- [Concept 3]

---

## Notes for LLMs Using This Context

- **This file is a catch-all:** Information here may be lower priority than domain-specific context files
- **Preferences may evolve:** Communication style and tool preferences can change over time
- **Unknowns are intentional:** Don't invent details about [YOUR_NAME]'s personal interests or preferences not explicitly stated
- **Security mindset is constant:** Even in miscellaneous context, security considerations apply
- **Flexibility within structure:** [YOUR_NAME] values structure but also adapts to practical needs
- **Cross-references:** See `10-[skill-domain]-context.md` for [description], `11-[work-domain]-context.md` for [description], `12-[creative-domain]-context.md` for [description], `13-[specific-domain]-context.md` for [description], `14-active-projects-context.md` for [description]

---

## Change Log

**Format:** `YYYY-MM-DD HH:MM UTC - Description of changes`

- YYYY-MM-DD HH:MM UTC - Initial creation from template
- *(Future changes will be logged here)*

---
