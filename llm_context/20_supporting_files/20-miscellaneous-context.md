# Dylan — Miscellaneous Context & Preferences

**Last Updated:** 2026-01-27
**Purpose:** Catch-all for preferences, habits, tools, and contextual information that doesn't fit primary domain categories

---

## 1) Communication & Interaction Preferences

### Response Style Requirements

**Preferred Tone:**
- Expert mentor / senior engineer level
- Precise and technical, no fluff or excessive friendliness
- Professional but not stiff
- Most correct and modern answer first

**Response Structure:**
- Structured headings when appropriate
- Exact file paths and commands when relevant
- Verification steps ("how to confirm it worked")
- Explicit reasoning without unnecessary bloat
- Avoid unexplained abbreviations (standard terms like API, URL are fine)

**What Dylan Values:**
- Understanding the "why" behind solutions
- Root cause analysis over quick fixes
- Official documentation references
- Step-by-step explanations for new concepts

**What Dylan Dislikes:**
- "Try this random thing" troubleshooting without rationale
- Solutions that create technical debt
- Vague advice without actionable steps
- Changing his code without explicit permission

---

## 2) Teaching & Learning Methodology

### Three-Part Installation Instruction Format

When introducing new tools, packages, or configurations, Dylan expects:

1. **What is this?** (Brief description of the tool/concept)
2. **What does it do?** (Purpose and capabilities)
3. **Check if installed first** (Verification command before proceeding)

**Example:**
```
PowerShell's built-in `Test-Path` cmdlet checks if files/folders exist.
It returns True/False and is used for conditional logic in scripts.
To check if it's available (it's built-in to PowerShell):
Get-Command Test-Path
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
- Refuses to enable VBScript for Excel automation (prefers Power Query/Python instead)
- Evaluates all automation approaches through security lens first
- Plans for credential management and secrets handling
- Understands enterprise compliance requirements in public sector

**When Uncertain:**
- Err on the side of caution
- Offer safer alternatives
- Explain security implications clearly
- Defer to official security guidance (CIS, NIST)

---

## 4) Tools & Software Preferences

### Operating Systems

**Primary Platforms:**
| OS | Use Case | Preference Level |
|----|----------|------------------|
| **Windows 11 Pro** | Primary work and home desktop environment | Preferred for daily work |
| **Windows Server 2022** | Work server environments | Standard for public sector IT |
| **AlmaLinux 9.6/RHEL-Based** | Server and learning environment | Preferred Linux distribution |
| **Arch Linux** | Personal Linux tinkering | Secondary preference |
| **KDE Plasma on Wayland** | Linux desktop environment | Strong preference over GNOME/others |

### Shell & Scripting Preferences

**Windows:**
- **PowerShell** (default) over CMD or Git Bash
- PowerShell 7.5+ on personal machines
- PowerShell 5.1 in work server environments

**Linux:**
- **Bash** for shell scripting
- Learning zsh but not yet primary

### Development Tools

**Version Control:**
- Git (command-line proficiency)
- Building enterprise Git workflows

**IDEs & Editors:**
- **Visual Studio 2022** (C++ development)
- **Visual Studio Code** (general-purpose, scripting)

**Package Managers:**
- Windows: **winget** (community packages can be problematic, prefer vendor direct downloads for critical tools)
- Linux: **dnf/yum** (AlmaLinux native)

---

## 5) Hardware & Physical Environment

### Primary Workstation (Dungeon_Master)

**PC Build Specifications:**
| Component | Model/Spec |
|-----------|------------|
| **CPU** | AMD Ryzen 9 9900X (12-core, 4.4 GHz) |
| **CPU Cooler** | Noctua NH-D15 chromax.black |
| **Motherboard** | MSI MAG X870 TOMAHAWK WIFI (AM5) |
| **RAM** | TEAMGROUP T-Create Expert 128 GB (4×32 GB) DDR5-6000 CL34 |
| **Storage** | Samsung 850 Evo 500 GB SSD (×2), Crucial P3 4 TB NVMe, WD_BLACK SN850X 4 TB NVMe |
| **GPU** | MSI VENTUS 3X OC GeForce RTX 3060 Ti LHR 8 GB (future upgrade planned) |
| **Case** | Corsair 4000D Airflow |
| **PSU** | Corsair RM850x (2021) 850W 80+ Gold |
| **Monitors** | Gigabyte M27Q-P 27" 1440p 170 Hz (×2) |

### Other Hardware

**Portable Computing:**
- **Workbox:** Dell i7 vPro 7780 (work laptop, Windows 11 Pro)
- **Singularity:** Lenovo ThinkPad E14 (personal/creative laptop, Windows 11 Home)
- **Surface Book Gen 1:** AlmaLinux 9.6/RHEL-Based bare metal (Linux learning platform)
- **uConsole ClockworkPi:** Raspberry Pi CM4, Bookworm OS and ParrotOS (portable Linux handheld)

**Raspberry Pi Experience:**
- uConsole troubleshooting (WiFi, time sync, NTP issues)
- Dual-boot Bookworm OS and ParrotOS on uConsole
- General familiarity with Raspberry Pi ecosystem
- Portable cybersecurity/learning device

---

## 6) Daily Workflows & Habits

### Time Management & Focus

**Work Hours:**
- Full-time IT role at State of Arkansas Public Defender Commission
- Professional obligations take priority during workday

**Personal Project Time:**
- Evenings and weekends for creative and learning projects
- Balances music production, homelab work, and software development

**Decision Framework for New Work:**
1. Does this solve a real problem?
2. Does this teach valuable skills?
3. Is this achievable with available time/resources?
4. Does this align with career/learning goals?
5. Can this be broken into incremental milestones?

---

## 7) Geographic & Timezone Context

**Location:** Little Rock, Arkansas, United States
**Timezone:** America/Chicago (Central Time)

**Relevance:**
- Local technology community awareness
- State government employment context
- Timezone considerations for scheduling discussions

---

## 8) Career Development & Learning Goals

### Professional Development Trajectory

**Current Role:** Computer Support Analyst (IT generalist)

**Growing Responsibilities:**
- Repository administration and governance
- PowerShell automation at scale
- Enterprise architecture planning (despite small team)

**Skill Development Priorities:**
1. **Git administration:** Enterprise patterns, self-hosting
2. **Cybersecurity:** Homelab-driven learning, fundamentals to advanced
3. **PowerShell mastery:** From scripting to module development
4. **Network engineering:** DNS, VLANs, firewalls, monitoring
5. **Systems administration:** Windows Server, Linux server management
6. **Infrastructure as Code:** Terraform, Ansible basics
7. **Automation & Orchestration:** CI/CD pipelines, task automation
8. **Cloud fundamentals:** Azure/AWS basic services and architecture
9. **Software development:** C++ proficiency, best practices

**Long-Term Direction:**
- Systems engineering role with security focus
- Infrastructure as Code proficiency
- Automation and orchestration expertise
- Possible certifications (UNKNOWN specific targets)

---

## 9) Collaboration & Teamwork

### Work Collaboration Style

**Team Structure:**
- 2-person IT team (Dylan + supervisor/coworker)
- Must build practices that scale beyond current team size
- Documentation serves as knowledge transfer and onboarding

**Collaboration Preferences:**
- Clear documentation over tribal knowledge
- Repeatable processes over one-off fixes
- Decision logs for architectural choices
- Peer review when possible

### Creative Collaboration

**Music/Audio Partners:**
- **Louis:** Art installation and sound projects collaborator
- Logic Pro users: Cross-DAW workflows (AAF/OMF exchange)
- Premiere editors: Film audio post collaboration

---

## 10) Problem-Solving Approach

### Debugging & Troubleshooting Methodology

**Dylan's Process:**
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
- Music production and composition
- Sound design and audio engineering
- Film scoring and audio post work

**Learning as Recreation:**
- Homelab projects are enjoyable, not just educational
- Cybersecurity challenges (TryHackMe) as "puzzle-solving"
- Building/tinkering with hardware and networks

**Burnout Prevention:**
- Recognizes importance of creative work alongside technical work
- Balances structured learning with exploratory projects
- Takes breaks when troubleshooting becomes frustrating

---

## 13) Known Pain Points & Frustrations

### Technical Frustrations

**Package Managers:**
- Windows winget community packages can be unreliable
- Prefers vendor-direct downloads for critical tools (e.g., iZotope Product Portal)

**Windows Quirks:**
- USB stability issues with audio interfaces (requires power setting hardening)
- Network profile switching complexities

**Cross-Platform Challenges:**
- File format compatibility (Mac ↔ Windows collaboration)
- Path separator differences (Windows `\` vs Linux `/`)

### Process Frustrations

**Public Sector Constraints:**
- Budget approval processes
- Change management overhead
- Compliance requirements limiting technical options

---

## 14) Personal Interests & Side Knowledge

### Music Genre Preferences
- **Production Style:** Ambient synth-driven music, film scoring
- **Listening:** Wide range (UNKNOWN specific artists/genres to avoid assumptions)

### Gaming
- Gaming devices present on network (consoles/PCs)
- Contra NES project suggests familiarity with classic games
- **Details:** UNKNOWN (genres, current games, platforms)

### Other Technical Interests
- Raspberry Pi and embedded systems
- Hardware modular synthesis (extensive synth collection)
- Film and video production (DaVinci Resolve usage)

---

## 15) Anti-Patterns & Things to Avoid

### Communication Anti-Patterns

**Don't do this:**
- Assume Dylan is a beginner without evidence
- Provide abbreviated variable names or "clever" code without his request
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

**Infrastructure as Code:**
- Terraform for infrastructure management
- Ansible for configuration management
- Docker/containers for consistent environments

**Observability:**
- Prometheus/Grafana for metrics
- ELK/Splunk for log aggregation
- Distributed tracing concepts

**Software Architecture:**
- Microservices patterns
- Event-driven architecture
- Domain-driven design

**Programming Paradigms:**
- Functional programming concepts
- Async/concurrent programming patterns
- Type systems and static analysis

---

## Notes for LLMs Using This Context

- **This file is a catch-all:** Information here may be lower priority than domain-specific context files
- **Preferences may evolve:** Communication style and tool preferences can change over time
- **Unknowns are intentional:** Don't invent details about Dylan's personal interests or preferences not explicitly stated
- **Security mindset is constant:** Even in miscellaneous context, security considerations apply
- **Flexibility within structure:** Dylan values structure but also adapts to practical needs
