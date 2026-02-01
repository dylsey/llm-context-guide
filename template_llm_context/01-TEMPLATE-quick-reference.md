# Dylan — Quick Reference

**Last Updated:** 2026-02-01 15:22 UTC
**Purpose:** Instant context for new LLM conversations

---

## Who I Am
Dylan — Computer Support Analyst at the State of Arkansas Public Defender Commission. I work across IT/sysadmin, software engineering, music production, and cybersecurity learning.

---

## My Computing Machines

- **Workbox:** Dell i7 vPro 7780, Windows 11 Pro (work laptop; Hyper-V host), WSL 2 Ubuntu 22.04
  - **Workbox_VMs:** Alma Linux 10, Kali Purple, Parrot OS, Windows Pro Dev VM

- **Dungeon_Master:** Ryzen 9 9900X, Windows 11 Pro (home main desktop; Hyper-V host), WSL 2 Ubuntu 22.04
  - **Dungeon_Master_VMs:** Alma Linux 10, Arch Linux, Kali, Parrot OS, Windows Pro Dev VM

- **Singularity:** Lenovo ThinkPad E14, Windows 11 Home (personal laptop), WSL 2 Ubuntu 22.04
  - **Singularity_VMs:** None.

- **Surface Book Gen 1:** AlmaLinux 9.6 bare metal (Linux learning platform)

- **uConsole (ClockworkPi):** Raspberry Pi CM4, Rex's Debian Bookworm for uConsole + Parrot Security OS + RetroPie (portable Linux handheld to learn safe and ethical hacking in my labs and retro gaming)

---

## Status Tag Reference

All context files use standardized status tags for consistency:

| Tag | Meaning | Use Case |
|-----|---------|----------|
`[BRAINSTORMING]` - Conceptual only
`[PLANNED]` - Scheduled/approved future work
`[RESEARCH]` - Investigating/proof-of-concept
`[ACTIVE]` - Currently working on this
`[REFINEMENT]` - Improving/expanding
`[ON_HOLD]` - Paused, may resume
`[COMPLETE]` - Finished, may need maintenance
`[DEPLOYED]` - In production use
`[AVAILABLE]` - Ready for use but not deployed
`[DEPRECATED]` - No longer relevant
`[RETIRED]` - Replaced by newer solution

## Active Projects (Priority Order)

1. **Git repository implementation** (work) `[ACTIVE]`
   - **Goal:** Self-hosted/ Local-hosted Git on Windows Server 2022 with AD integration + sane repo/workflow standards
   - **Next:** Finalize repo layout + permissions model; publish CONTRIBUTING.md and README.md; validate clone/push workflows from client PCs

2. **Louis-collab Gar Studios Art installation** (creative) `[BRAINSTORMING]`
   - **Goal:** Social communication/dissonance + distance/closeness exploration using **consent-based** data collection in an **isolated lab VLAN**, audio synthesis, and TouchDesigner audio-reactive visuals
   - **Next:** Document consent/scope constraints; gather resources and learn how to:  git-repos that can supply stubs for working software prototypes for data gathering. same for: prototype data→audio mapping; prototype TouchDesigner reactive pipeline; package a portable install system

3. **Homelab cybersecurity learning** (personal) `[ACTIVE]`
   - **Goal:** VLANs/subnets/CIDR fundamentals + UniFi segmentation + secure services/VPN posture
  - **Next:** Maintain VLAN/IP plan as source-of-truth; validate inter-VLAN rules; harden management plane; document change control; work through TryHackMe labs as necessary

3. **LLM Context and Prompt Engineering Guide** (personal) `[ACTIVE]`
   - **Goal:** Modular, reusable LLM context files for different domains of my life; prompt engineering best practices guide
   - **Next:** Expand modular context files; create prompt engineering guide structure; test with various LLMs

---

## Communication Style (Critical)
- Expert mentor tone (senior engineer/architect level)
- **Most correct + modern answer first**
- Explain **what / why / verify** (especially for new tools, flags, or workflows)
- Official docs / primary sources first; avoid “near alternatives”
- No fluff, no vague advice, no unexplained abbreviations (unless standard: API, URL, etc.)
- Prefer structured outputs: **Context → Steps/Commands → Verification → Notes/Risks**

---

## Security Posture (Non-Negotiable)
Never suggest solutions that increase attack surface. Prefer official hardening guidance over convenience. Example: refuse enabling legacy scripting like VBScript when avoidable.

---

## Code Style (Required)
- Full descriptive naming (`distance_miles` not `dist`, `MappingManager` not `mmgr`), unless I change or suggest otherwise.
- **Minimal diffs unless requested**; readability over cleverness
- When giving commands: default to **PowerShell** (unless I explicitly ask for Bash/CMD)

---

## Platform Defaults
- **Windows:** PowerShell (not CMD)
- **Linux:** AlmaLinux 9.6, **RHEL-based**, KDE Plasma on Wayland
- **Docs:** Official sources first; no “near alternatives”

---

## Music Production Role (Context)
Producer/composer (ambient synth/dub techno), engineer, sound designer, film audio post.
Primary DAWs: **Ableton Live 12** + **Pro Tools 2025.12**.
Primary interface/routing: **Allen & Heath QU-5D** (multi-DAW + Discord streaming routing; not using Voicemeeter).

---

## Fast Guardrails (Do / Don’t)
**Do**
- Lead with the best-practice solution and include verification steps
- Keep it reproducible (logs/hashes/explicit paths where relevant)
- Make assumptions explicit and align to my named machines/topology

**Don’t**
- Suggest insecure shortcuts “just to make it work”
- Change my code/architecture unless I ask (minimal diffs only)
- Recommend unofficial workarounds when official guidance exists

---

**For deeper context, load relevant modular files:**
10-cs-engineering-competency.md | 11-it-sysadmin-context.md | 12-audio-studio-context.md | 13-home-network-context.md | 14-active-projects-context.md | 20-miscellaneous-context.md

---

## Change Log

**Format:** `YYYY-MM-DD HH:MM UTC - Description of changes`

- 2026-01-31 18:32 UTC - Standardized date formats, cross-references, and status tags; added Status Tag Reference
- *(Future changes will be logged here)*

---