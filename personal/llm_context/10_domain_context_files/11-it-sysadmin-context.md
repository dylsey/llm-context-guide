# Dylan — IT & Systems Administration Context

**Last Updated:** 2026-01-31 18:32 UTC
**Purpose:** Professional IT role, operational practices, and infrastructure responsibilities

---

## 1) Professional Role & Environment

### Current Position
| Attribute | Details |
|-----------|---------|
| **Title** | Computer Support Analyst 2 |
| **Organization** | State of Arkansas Public Defender Commission |
| **Team Size** | 2-person IT team (Dylan + coworker/supervisor/vCISO) |
| **Operational Philosophy** | "Operate small-team simple, architect enterprise scalable" |

### Infrastructure Environment
| Component | Status | Details |
|-----------|--------|---------|
| **Domain** | Windows Active Directory forest | On-premises domain controllers |
| **Azure Access** | Limited/None | No full Azure environment access |
| **Server Infrastructure** | Windows Server 2019/2022 | Self-hosted services within AD environment |
| **User Base** | 80 Users + 2 IT staff | Public sector enterprise constraints |

---

## 2) Core IT Competencies & Operational Practices

### Windows Systems Administration

**Demonstrated Skills:**
- Windows endpoint troubleshooting and support
- Domain-joined workstation management
- Network profile configuration (Public ↔ Private transitions)
- PowerShell automation for repeatable, safe operations
- Enterprise constraint awareness (security policies, compliance requirements)

**PowerShell Automation Focus:**
- Prefers PowerShell over CMD/Batch by default
- Building reusable scripts with logging and error handling
- Wants reproducible, documented automation
- Currently expanding from basic scripts → advanced automation

### Office 365 / Microsoft 365 Integration

**Current Approach:**
- Prefers Power Automate and Power Query for modern automation -- unconfident on better practices
- **Explicitly avoids VBA** for security and modernization reasons in work environment and projects
- Familiar with M365 apps: Outlook, Excel, Teams, SharePoint
- Understands M365 integration points with on-premises AD
- Building workflows that respect enterprise security posture

---

## 3) Active IT Projects & Responsibilities

### 1) Git Repository Infrastructure `[ACTIVE]` (Highest Priority)

**Objective:** Self-hosted Git repository system for internal code and documentation

**Environment:**
- Windows Server 2022 (on-prem Domain Controller/available)
- Must integrate with Active Directory authentication
- Small team now, must scale to enterprise patterns

**Focus Areas:**
- Repository governance and contribution standards
- Enterprise-grade repo structure patterns
- `CONTRIBUTING.md` and documentation discipline
- Branch strategies and code review workflows
- Building "source of truth" culture within organization

**Operational Constraint:**
Supervisor recommends starting with simple file share permissions testing before scaling to full Git platforms.

**Status:** Planning phase; researching enterprise Git patterns and AD integration approaches

### 2) Minimizing Troubleshoot Time with Users `[ACTIVE]`

**Objective:** Reduce time spent on common user issues through automation and documentation

**Approach:**
- Identify frequent support requests and time spent
- Build PowerShell scripts to automate diagnostics and fixes
- Create user-friendly documentation for self-service

**Goals:**
- Free up time for higher-value IT tasks
- Empower users with knowledge and tools
- Standardize troubleshooting processes

**Status:** Ongoing identification and scripting; documentation in progress

**Operational Constraints:**
- Must align with public sector compliance and security policies
- Avoid solutions that increase attack surface
- Prioritize asking for help more and documenting solutions
- Balance quick fixes with long-term sustainability

### 3) Building Internal Repository for Standardized Scripts `[ACTIVE]`

**Objective:**
- Create a centralized location for reusable PowerShell scripts and templates
- Facilitate documentation, versioning, and usage guidelines & automation best practices

**Approach:**
- Establish folder structure and naming conventions
- Document usage examples and parameters
- Test scripts in controlled environment before deployment

**Goal:** Establish baseline for team collaboration and code management

**Status:** Working on folder structure (gathering example resources), documentation drafted; testing in progress

### Automation & Scripting Projects

**General Automation Philosophy:**
- Build systems, not one-off scripts
- Logging and traceability requirements
- Folder conventions and standardized skeletons
- Documentation as integral part of delivery

---

## 4) Completed Projects for Reference

**TR-1 Travel Reimbursement System:** `[COMPLETE]`
- Excel lookup table for common routes
- Python fallback using OSRM API for route calculation
- Power Query / Power Automate integration
- **Explicitly avoiding VBA** for security/modernization
- **Goal:** Reduce manual data entry and calculation errors
- **Status:** Working prototype deployed, considered complete for current needs (may need future refinement)

---

## 5) Systems Administration Knowledge Areas

### Strong Understanding
- Windows troubleshooting and diagnostics
- PowerShell scripting fundamentals
- Domain user and computer management
- Network profile and connectivity troubleshooting
- Enterprise software deployment awareness

### Developing Skills
- Advanced PowerShell automation (modules, error handling, logging)
- Git repository administration at scale
- Windows Server hardening and security baselines
- Monitoring and alerting systems
- Backup and disaster recovery planning

### TARGET SKILLS (Areas to Expand)
- WSUS/Intune/SCCM patch management strategies
- Windows Event Forwarding and central logging
- Group Policy advanced configuration and troubleshooting
- Certificate management and PKI infrastructure
- Automation orchestration (Ansible, DSC)

---

## 6) IT Infrastructure Standards & Preferences

### Development Folder Structure (Cross-Platform Standard)

**Linux:** `~/dev`
**Windows:** `C:\Dev`

**Directory Layout:**

```
dev/
├── src/
│   ├── python/
│   ├── powershell/
│   ├── cpp/
│   ├── rust/
│   ├── java/
│   └── sandbox/
├── templates/
├── libs/
│   ├── python/
│   ├── powershell/
│   ├── cpp/
│   └── rust/
├── scripts/
│   ├── bash/
│   ├── powershell/
│   └── windows-cmd/
├── tools/
│   ├── bin/          # Add to PATH
│   └── configs/
├── docs/
├── data/
└── archive/
```

**Important:** Add `dev/tools/bin` to PATH on all systems for consistent tooling access.

**Note:** This structure is subject to refinement based on ongoing Git repository enterprise pattern research.

### Documentation Standards

Dylan values:
- README files in every project
- Clear installation/setup instructions
- Contribution guidelines for team projects
- Explicit dependency lists
- Troubleshooting sections

---

## 7) Security & Compliance Mindset

### Core Security Principles

**Non-Negotiable Rules:**
1. Never suggest solutions that increase attack surface
2. Prefer secure-by-default configurations
3. Official hardening guidance over convenience
4. Principle of least privilege
5. Explicit documentation of security tradeoffs

**Examples of Security-First Decisions:**
- Refusing to enable VBScript for Excel automation (prefers Power Query/Python)
- Evaluating automation approaches through security lens first
- Planning for credential management and secrets handling
- Understanding enterprise compliance requirements

### Public Sector Context Awareness
- Budget constraints and approval processes
- Compliance and audit requirements
- Long-term supportability over cutting-edge features
- Change management procedures

---

## 8) Learning Goals & Growth Areas

### Immediate Learning Focus
- DNS fundamentals and advanced concepts (explicitly wants "slow and methodical" deep dive) — see Network context doc
- Git administration and repository governance at scale
- PowerShell advanced scripting and module development
- Infrastructure as Code concepts (Terraform, DSC)

### Medium-Term Goals
- Central logging and monitoring (SIEM concepts)
- Backup and disaster recovery architecture
- Certificate management and PKI
- Windows Server hardening to CIS/NIST standards

---

## 9) Communication & Collaboration Preferences

### When Working on IT Issues

**Dylan prefers:**
- Structured, step-by-step troubleshooting
- Root cause analysis over quick fixes
- Documentation of solutions for future reference
- Understanding the "why" behind configurations

**Dylan avoids:**
- "Try this random thing" troubleshooting
- Solutions that create technical debt
- Shortcuts that compromise security
- Undocumented changes

### Team Dynamics
- Works closely with supervisor/coworker on major decisions
- Building practices that can onboard future team members
- Creating documentation that serves as training material
- Balancing immediate needs with long-term sustainability

---

## Notes for LLMs Using This Context

- **Default to PowerShell** for Windows automation unless Dylan requests otherwise
- **Security-first approach** always: never suggest risky workarounds
- **Enterprise mindset** even for small team: build for scale
- **Official documentation** preferred over community shortcuts
- **Verify assumptions** about environment (AD integration, permissions, compliance)
- **Cross-references:** See `10-cs-engineering-competency.md` for technical skill levels, `13-home-network-context.md` for homelab infrastructure and cybersecurity learning goals

---

## Change Log

**Format:** `YYYY-MM-DD HH:MM UTC - Description of changes`

- 2026-01-31 18:32 UTC - Standardized date formats, cross-references, and status tags; added Status Tag Reference
- *(Future changes will be logged here)*

---