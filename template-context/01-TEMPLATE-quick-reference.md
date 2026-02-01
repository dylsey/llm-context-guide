# [YOUR_NAME] — Quick Reference

**Last Updated:** YYYY-MM-DD HH:MM UTC
**Purpose:** Instant context for new LLM conversations

---

## Who I Am
[YOUR_NAME] — [YOUR_ROLE] at [YOUR_ORGANIZATION]. I work across [primary domain 1], [primary domain 2], [primary domain 3], and [other focus areas].

---

## My Computing Machines

- **[Work_Machine_Name]:** [Make/Model], [OS] ([primary use case]; [virtualization platform if applicable]), [additional OS/environments]
  - **[Work_Machine_Name]_VMs:** [VM 1], [VM 2], [VM 3], etc.

- **[Home_Primary_Machine]:** [CPU], [OS] ([primary use case]; [virtualization platform if applicable]), [GPU if relevant], [RAM], [additional OS/environments]
  - **[Home_Primary_Machine]_VMs:** [VM 1], [VM 2], [VM 3], etc.

- **[Portable_Machine]:** [Make/Model], [OS] ([primary use case]), [additional OS/environments]
  - **[Portable_Machine]_VMs:** [List if any, or "None"]

- **[Additional_Machine]:** [Description] ([primary use case])

- **[Specialty_Device]:** [Description] ([primary use case, e.g., portable Linux handheld, development board, etc.])

---

## Status Tag Reference

All context files use standardized status tags for consistency:

| Tag | Meaning | Use Case |
|-----|---------|----------|
| `[BRAINSTORMING]` | Conceptual only | Early ideation, no concrete plans |
| `[PLANNED]` | Scheduled/approved future work | Budgeted projects, scheduled upgrades |
| `[RESEARCH]` | Investigating/proof-of-concept | Learning phase, evaluating options |
| `[ACTIVE]` | Currently working on this | Projects in progress, equipment in use |
| `[REFINEMENT]` | Improving/expanding | Improvements & changes to existing items |
| `[ON_HOLD]` | Paused, may resume | Waiting on dependencies, budget |
| `[COMPLETE]` | Finished, may need maintenance | Deployed systems, finished projects |
| `[DEPLOYED]` | In production use | Live systems, actively used resources |
| `[AVAILABLE]` | Ready for use but not deployed | Spare equipment, unused resources |
| `[DEPRECATED]` | No longer relevant | Retired equipment, abandoned projects |
| `[RETIRED]` | Replaced by newer solution | Legacy systems kept for reference or repurpose |

## Active Projects (Priority Order)

1. **[Project Name 1]** ([domain: work/creative/personal]) `[STATUS_TAG]`
   - **Goal:** [Brief goal description]
   - **Next:** [Next immediate action or milestone]

2. **[Project Name 2]** ([domain: work/creative/personal]) `[STATUS_TAG]`
   - **Goal:** [Brief goal description]
   - **Next:** [Next immediate action or milestone]

3. **[Project Name 3]** ([domain: work/creative/personal]) `[STATUS_TAG]`
   - **Goal:** [Brief goal description]
   - **Next:** [Next immediate action or milestone]

4. **[Project Name 4]** ([domain: work/creative/personal]) `[STATUS_TAG]`
   - **Goal:** [Brief goal description]
   - **Next:** [Next immediate action or milestone]

---

## Communication Style (Critical)

- [Preferred tone - e.g., Expert mentor tone, Conversational, Professional]
- **Most correct + modern answer first**
- Explain **what / why / verify** (especially for new tools, flags, or workflows)
- Official docs / primary sources first; avoid "near alternatives"
- No fluff, no vague advice, no unexplained abbreviations (unless standard: API, URL, etc.)
- Prefer structured outputs: **Context → Steps/Commands → Verification → Notes/Risks**

---

## Security Posture (Non-Negotiable)

Never suggest solutions that increase attack surface. Prefer official hardening guidance over convenience. Example: refuse enabling legacy scripting like VBScript when avoidable.

---

## Code Style (Required)

- Full descriptive naming (`distance_miles` not `dist`, `MappingManager` not `mmgr`), unless I change or suggest otherwise.
- **Minimal diffs unless requested**; readability over cleverness
- When giving commands: default to **[Your_Preferred_Shell - e.g., PowerShell, Bash]** (unless I explicitly ask for alternative)

---

## Platform Defaults

- **[Primary_OS_1]:** [Preferred shell/tool]
- **[Primary_OS_2]:** [Preferred distro/environment], [Desktop environment if applicable]
- **Docs:** Official sources first; no "near alternatives"

---

## [Primary Creative/Professional Role] (Context)

[Role description - e.g., Producer/composer, Software engineer, Designer, etc.]
Primary tools: **[Tool 1]** + **[Tool 2]**.
[Key workflow note - e.g., Primary interface/routing, Preferred IDE, Main design system, etc.]

---

## Fast Guardrails (Do / Don't)

**Do**
- Lead with the best-practice solution and include verification steps
- Keep it reproducible (logs/hashes/explicit paths where relevant)
- Make assumptions explicit and align to my named machines/topology

**Don't**
- Suggest insecure shortcuts "just to make it work"
- Change my code/architecture unless I ask (minimal diffs only)
- Recommend unofficial workarounds when official guidance exists

---

**For deeper context, load relevant modular files:**
10-[skill-domain]-context.md | 11-[work-domain]-context.md | 12-[creative-domain]-context.md | 13-[specific-domain]-context.md | 14-active-projects-context.md | 20-miscellaneous-context.md

---

## Change Log

**Format:** `YYYY-MM-DD HH:MM UTC - Description of changes`

- YYYY-MM-DD HH:MM UTC - Initial creation from template
- *(Future changes will be logged here)*

---
