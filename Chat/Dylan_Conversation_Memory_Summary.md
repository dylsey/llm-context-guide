# Dylan — Complete Memory Summary (From Our Conversations)

> **Scope & intent:** This is a consolidated, “single source of truth” snapshot of what I remember from our conversations about your **computer science / software engineering growth**, **IT & systems administration progression**, **cybersecurity learning path**, **music creation & studio ecosystem**, **home network topology (“YelNet”)**, and your **hardware / OS footprint**.  
> Where details were **not explicitly provided**, I mark them as **Unknown / Not specified yet** (and I include a “Missing / Next Topics” section at the end).

---

## 1) Who you are (high-level profile)

- **Preferred name:** Dylan  
- **Core roles / focus areas:**
  - IT + cybersecurity (professional role and continuous learning)
  - Software engineering / CS (C++, Java, Python; strong fundamentals)
  - Music creation + audio production + film scoring + audio post
  - Homelab/network engineering (VLANs, routing, security segmentation, VPN, monitoring)
- **Personal style preferences (important for how I assist you):**
  - You want **expert-level framing** and **up-to-date best practices first**.
  - You strongly prefer **clarity, maintainability, readability** over cleverness.
  - You prefer **full, descriptive naming** (no unnecessary abbreviations).
  - You want **step-by-step explanations** when learning new concepts.
  - You prefer **PowerShell by default** for Windows workflows (unless you request otherwise).
  - You want guidance to follow **official documentation/READMEs** (not “near alternatives”).
  - You prefer minimal diffs when refactoring code (don’t change your code unless explicitly requested).

---

## 2) Computer science competency & progression

### 2.1 Foundation (C++ / OOP / fundamentals)
You’ve developed strong competency through coursework + projects:

- **Programming foundation:**
  - Data types, memory behavior (stack vs heap), object lifetime
  - OOP design (classes, ownership, composition)
  - Algorithms & performance awareness (Big-O reasoning)
- **Modern C++ practices you adopted/asked for:**
  - Initializer lists (`{}`) for member initialization
  - Better constructor semantics (avoid unnecessary `std::move` on primitives)
  - Proper Rule of Five discussions and implementation awareness
  - Smart pointers and ownership semantics (especially in game projects)

### 2.2 Major CS project arc — “Contra NES” (SDL2-based)
This became a long-running and very detailed project track.

**Your progress highlights:**
- You moved from “getting it to compile” → “architecting ownership + factories + audio.”
- You learned and implemented advanced concepts in a practical system.

**Key technical topics you worked through:**
- **Entity management & ownership**
  - Player creates bullets via `BulletFactory`
  - Engine owns bullets and other game objects with `std::shared_ptr` in a container
  - GUI renders but does not own game objects
- **Factories + game architecture**
  - Bullet factories
  - Plans to implement factory strategies for audio (SFX/music)
- **SDL ecosystem integration**
  - SDL2 libraries and DLL distribution across multiple machines
  - SDL_mixer integration planning (music on startup from `Spooky.wav`)

**Important implementation preferences:**
- You prefer avoiding modulo (`%`) in game logic when possible and using alternative logic.

### 2.3 Additional dev direction — MIDI mapping & automation
You began a longer-term “real workflow” automation idea:

- A tool that reads MIDI parameters from controllers,
  stores them, then reads parameters from instruments/VSTs,
  and helps auto-map or simplify mapping complexity.
- Strong emphasis on:
  - structure
  - logging
  - clarity
  - maintainability
  - clean folder skeletons and professional naming conventions

### 2.4 Your coding style (persistent preference set)
Your preferred conventions (I apply these by default):

- Full names:
  - `distance_miles` instead of `dist`
  - `index` instead of `idx`
  - `MappingManager`, `MidiListener` (clear class intent)
- Clean directory organization and reproducibility
- “Teach me what it is / what it does / check installed first” for installs
- Work like an engineer: understand the why, not just the how

---

## 3) IT & Systems Administration competency & progression

### 3.1 Your professional IT identity
- You work as a **Computer Support Analyst** for the **State of Arkansas Public Defender Commission**.
- You handle real operations and want workflows that scale and remain secure.

### 3.2 Core IT competencies (as demonstrated through tasks you requested)
You routinely operate at a systems-level mindset:

- Windows endpoint and environment troubleshooting
- Domain/networked user support workflows
- PowerShell automation for:
  - network profile changes (Public ↔ Private)
  - diagnostics
  - scripting that’s repeatable and safe
- Office/M365-friendly automation approaches (avoid VBA; prefer Power Automate and/or Power Query)
- DNS understanding goals: you explicitly want to go slow and deep

### 3.3 Git/version-control administration (enterprise mindset)
You began building a real internal capability:

- You started self-hosting Git on **Windows Server 2019**
- You evaluated enterprise repo structure patterns
- You asked for:
  - contribution rules (`CONTRIBUTING.md`)
  - repo skeletons you can templatize for your org
  - scalable patterns for a **2-person IT team** that behaves like an enterprise
- You are explicitly trying to build “source of truth” discipline.

### 3.4 Your current operating principle in IT
> **Operate small-team simple, but architect in a way that can scale.**  
This is a recurring theme in your repo planning, networking, and automation.

---

## 4) Cybersecurity & security engineering progression

You are **newer to cybersecurity** compared to CS/IT, but you’re learning in a disciplined way.

### 4.1 Topics you’ve explored
- How malicious infrastructure is orchestrated (e.g., “one IP hosting huge numbers of domains”)
- Network fundamentals: DHCP → DNS progression
- Security tooling exposure / interest:
  - DFIR mindset
  - IDS/IPS (example: Snort/Security Onion mentioned)
  - OSINT/lab segmentation
- Safe posture:
  - You explicitly reject “enable insecure features” if it expands your attack surface  
    (example: VBScript concerns)

### 4.2 Homelab as a cybersecurity classroom
You use your homelab as a safe learning surface:
- VLANs / segmentation
- VPN planning
- monitoring
- sandboxing

---

## 5) Music creation competency & progression

### 5.1 Music roles you operate in
You function across multiple “real-world roles”:

- Producer / composer (ambient synth-driven music, scoring)
- Audio engineer (recording/editing/mixing)
- Film sound / audio post (sound design editing, mixing, mastering)
- Hybrid DAW + hardware workflow designer

### 5.2 DAWs and creative toolchain
You use:
- **Ableton Live 12**
- **Pro Tools** (you’ve referenced 2025-era workflows)
- **DaVinci Resolve** (video)
- Collaboration scenarios include:
  - Logic Pro (teammate) → exports MIDI/stems → you finish in Ableton/Pro Tools
  - Premiere / AAF handoffs and re-deliverable stems back to editor

### 5.3 Real production problems you solved
- MIDI imports producing multiple tracks/clips → consolidation workflows
- Avoiding unwanted time warping when importing MIDI/audio into Ableton
- Remuxing audio/video with FFmpeg (preserving video quality)
- Multi-software audio asset handoff planning (zip format compatibility for Mac collaborators)

---

## 6) Full music equipment inventory (as remembered)

> This section is **fully enumerated** from our stored memory.  
> If you’ve bought/changed something since we last discussed, it won’t be listed yet.

### 6.1 Studio audio interfaces / mixers
- **Zoom LiveTrak L-12** (current primary interface **until** QU-5D arrives; running at **48 kHz**)
- **Allen & Heath Qu‑5D** (on order; intended to replace/augment L‑12 as main interface)

### 6.2 Monitoring & listening chain
- **Sennheiser HD650** headphones
- **JDS Labs Atom Amp 2** headphone amplifier

### 6.3 Hardware instruments & grooveboxes
You’ve explicitly listed these across conversations:

- Polyend Tracker+
- Synthstrom Deluge
- Squarp Hapax
- Oxi One MIDI controller
- Prophet 12 Desktop
- Hydrasynth Desktop
- Novation Peak Desktop
- Arturia PolyBrute 12
- Prophet 10
- Elektron Digitakt 2
- Elektron Digitone 1

### 6.4 MIDI routing / utility devices
- MIDI Merge‑4
- MIDI Quadra Thru
- MIDI Thru‑12

### 6.5 Patch/IO infrastructure
- **Samson S‑Patch Plus** 48-point balanced patch bay

### 6.6 Software instruments / plugins (explicitly referenced)
- Serum 2
- Pigments 6
- Arturia V Collection X series VST synth suite

### 6.7 “Not integrated yet” devices (as of last notes)
- Squarp Hapax and Oxi One were owned but not fully integrated into workflow yet  
  (at the time you said this)

---

## 7) Your QU‑5D routing + Discord streaming template (remembered baseline)

> This is your **canonical baseline** template for Discord streaming with the QU‑5D, without Voicemeeter.

### 7.1 Layer layout
- **Layer A:** MIDI 1–16  
- **Layer B:** MIDI 17–24 (rest empty)  
- **Layer C:** USB/Ableton/Discord/Pro Tools/Vox/Mic/Omnisphere/PolyBrute 12/Prophet 10/IP17–IP20 (rest empty)  
- **Layer D:** Mix1/2, Mix3, Mix4, FX send 1–4, FX return 1–4, Stream (Mix12), Main LR, Subs, LR  

### 7.2 Config
- Input stereo: Ch 1–12 stereo pairs; Ch 13–32 mono  
- Mix stereo: Mix1–2 stereo; Mix3–11 mono; Mix12 stereo; MTX1–2 stereo; MTX3–4 stereo  

### 7.3 I/O Routing (Inputs)
- 3/4: Ableton USB 3/4  
- 5/6: Omnisphere USB 5/6  
- 7/8: Discord USB 7/8  
- 9/10: Vocals Local 9/10  
- 11/12: Pro Tools USB 11/12  
- 13: PolyBrute 12 Local 3  
- 15: Prophet 10 Local 8  
- Others unassigned as specified  

### 7.4 USB Outputs
- 1–2: Stream (Mix12) L/R  
- 3–4: Ableton Direct Out L/R  
- 5–6: Omnisphere Direct Out L/R  
- 7–8: Discord Direct Out L/R  
- 9–10: Vox L/R  
- 11–12: Pro Tools L/R  
- 13: PolyBrute 12  
- 15: Prophet 10  
- 16–32: Direct outs  

### 7.5 QU‑5D ↔ Ableton DAW control playbook (saved)
- Use **Allen & Heath MIDI Control** with Protocol = **Mackie Control**
- QU‑5D Utility → MIDI: **MIDI Channel = 16** (so DAW channel = 1)
- Use a dedicated fader layer for MIDI 1–16 (1:1)
- Ableton Control Surfaces:
  - MackieControl on “DAW Control MIDI 1”
  - MackieControlXT on “DAW Control MIDI 2”
- Do **not** use raw “Qu‑5D MIDI” ports (disable Track/Remote on those)
- Always start A&H MIDI Control **before** launching Ableton (virtual ports must exist)
- If ports go red: stabilize A&H app first → reopen Ableton
- Windows stability practices:
  - disable USB selective suspend
  - disable Root Hub power saving
  - prefer direct motherboard USB (avoid hubs)

---

## 8) Home network topology & environment (“YelNet”)

### 8.1 Known physical topology (current state)
- ISP modem/router: **AT&T Nokia BGW320-505** (upstairs office)
- Main desktop (Dungeon_Master) is hardwired to BGW320
- Second Cat5 run to a wall port → downstairs → **Archer AX6000**
- Archer AX6000:
  - separate SSID from BGW320
  - wired to TV, two gaming devices, AV receiver

### 8.2 Security camera + IoT inventory
- Reolink RLK8-1200B4-A camera system
- Reolink RLN8-410 NVR (2TB HDD)
- Reolink PoE doorbell
- Router: Archer AX6000 (also used as downstream router/AP)

### 8.3 UniFi expansion path (known intent)
You planned to modernize topology into a more segmented/security-first design:

- You considered a UniFi Cloud Gateway device behind BGW320
- You mentioned UniFi gateway + PoE switch plans to support cameras and improve security  
  (example: Cloud Gateway Ultra and PoE switch plans)

### 8.4 Additional network plan notes (in progress)
- You intended to put Reolink NVR downstairs under the house for easier long camera wiring runs.
- You want a private network behind the AT&T gateway with:
  - better security
  - VPN capability
  - camera segmentation
  - occasional media streaming/hosting

---

## 9) Computers, operating systems, and machine roles

### 9.1 Your main named machines
- **Workbox**: Windows 11 Pro laptop (Dell i7 vPro 7780)
- **Dungeon_Master**: Windows 11 Pro desktop (home)
- **Surface Book**: Gen 1 Surface Book running AlmaLinux 9.6 (bare metal)

### 9.2 VM infrastructure (Hyper‑V)
You run AlmaLinux 9.6 VMs on both:
- Workbox (Windows 11 Pro host)
- Dungeon_Master (Windows 11 Pro host)

Workbox VM set includes:
- AlmaLinux 9
- Kali Purple
- Parrot OS
- Two Windows test VMs

Dungeon_Master VM set includes:
- AlmaLinux 9
- One Windows test VM

### 9.3 Linux distribution preferences
- You run **AlmaLinux 9.6**
- You prefer **KDE Plasma on Wayland** for your AlmaLinux desktop

### 9.4 Your "uConsole" track
- Raspberry Pi CM4 ClockworkPi uConsole
- Issues/work explored:
  - Wi-Fi connection troubleshooting
  - time sync issues
  - NTP support problems

---

## 10) Your PC build (explicit finalized build snapshot)

> This is the last “finalized” build you gave.

- **CPU**: AMD Ryzen 9 9900X 4.4 GHz 12-Core
- **CPU Cooler**: Noctua NH-D15 chromax.black
- **Motherboard**: MSI MAG X870 TOMAHAWK WIFI (AM5)
- **Memory**: TEAMGROUP T-Create Expert 128 GB (4×32) DDR5-6000 CL34
- **Storage**:
  - Samsung 850 Evo 500 GB 2.5" SSD (×2)
  - Crucial P3 4 TB M.2 NVMe SSD
  - WD_BLACK SN850X 4 TB M.2 NVMe SSD
- **Video Card**: MSI VENTUS 3X OC GeForce RTX 3060 Ti LHR 8 GB
- **Case**: Corsair 4000D Airflow
- **PSU**: Corsair RM850x (2021) 850W 80+ Gold
- **Monitors**: Gigabyte M27Q-P 27" 1440p 170 Hz (×2)
- You planned future GPU upgrade.

---

## 11) Major creative/technical projects beyond “Contra”
### 11.1 “Doomscroller” film pipeline
You actively work on:
- sound design editing
- mixing/mastering
- deliverable management (stems, AAF/OMF collaboration)
- FFmpeg remuxing workflows and audio replacement while preserving video quality

### 11.2 Excel TR‑1 reimbursement automation (Python + OSRM)
You started a modern workflow idea:
- Excel table lookup (shortest distances table)
- fallback to Python-powered API lookup (OSRM)
- integrate via Power Query / automation
- avoid VBA (security + modernization)

---

## 12) Your canonical dev folder skeleton preference
You established a cross-platform layout:

- Linux root: `~/dev`
- Windows root: `C:\Dev`
- Structure:
  - `src/{python,powershell,cpp,rust,java,sandbox}`
  - `templates/`
  - `libs/{python,powershell,cpp,rust}`
  - `scripts/{bash,powershell,windows-cmd}`
  - `tools/{bin,configs}`
  - `docs/`
  - `data/`
  - `archive/`
  - `themes-vault/{konsole,windows-terminal,vscode}`
- Add `dev/tools/bin` to PATH across machines

---

## 13) Missing / not explicitly stated yet (knowledge gaps to fill in)

These are areas you *asked* to be included “in entirety,” but we don’t have complete explicit data for yet:

### 13.1 Music equipment & routing: what’s incomplete
We have an excellent QU‑5D routing baseline, but missing:
- exact physical cabling map (which devices go into which QU‑5D inputs)
- patch bay normalization choices and wiring scheme
- monitor controller (if any), speaker system, room routing
- any outboard FX, pedals, preamps, DI boxes

### 13.2 Network topology: what’s incomplete
We have the BGW320 + Archer AX6000 topology and your Reolink system, but missing:
- your full VLAN/subnet table for YelNet (names, CIDRs, gateways)
- firewall rule philosophy (east-west traffic, guest isolation)
- switch port mapping (which port feeds what device)
- VPN provider choice and endpoint design (WireGuard vs other, remote access)

### 13.3 Compute environment: what’s incomplete
We know major machines, but missing:
- your full inventory of secondary machines (older laptops/desktops)
- NAS/backup targets (if any) beyond what was discussed
- your “main workstation” storage utilization and redundancy plan (3-2-1 details)

### 13.4 Cybersecurity learning roadmap: what’s incomplete
We know your interests and lab structure, but missing:
- your preferred certifications roadmap (if any)
- your “core playbooks” (IR triage, host isolation, evidence workflow)

---

## 14) Topics you *haven’t* mentioned much (recommended additions)
Not because you’re lacking—just because we haven’t explicitly covered them yet:

### 14.1 CS / engineering
- Testing strategy (unit/integration) for your projects
- CI/CD basics for internal tools (even small-team)
- Architecture documentation patterns (ADR, decision logs)

### 14.2 IT operations
- Patch management strategy (WSUS/Intune/SCCM-style patterns)
- Central logging / monitoring (Windows Event Forwarding, Sysmon, SIEM)

### 14.3 Security engineering
- Threat modeling for home lab + work environments
- Baseline hardening checklists (CIS/NIST mapping)

### 14.4 Music + audio engineering
- Mix reference workflow and calibration
- Session organization conventions (naming, stems, deliverables)
- Long-term sample library management & backup strategy

---

## 15) Your “current state” distilled (one-paragraph snapshot)
You’re an IT professional operating in a real enterprise-style environment while building strong CS/software engineering depth through major projects (notably your SDL2 Contra game), and you’re simultaneously engineering a serious home studio + homelab ecosystem. Your workflow style is systems-minded: you care about reproducibility, official docs, security constraints, and building scalable foundations—even as a two-person team. Creatively, you work across production and audio-post pipelines with hardware synths, modern DAWs, and a growing routing/streaming infrastructure centered around the QU‑5D template.

---

## 16) Optional “Next” upgrades to this document
If you want, we can turn this into an **actual living inventory + diagram pack** by adding:

- **Patchbay wiring chart** (48-point map)
- **QU‑5D channel list** with every device assigned
- **YelNet VLAN/subnet table** with gateway + firewall intent
- **Switch port map** (what’s plugged into what)
- **Machine inventory** (hostname, OS, purpose, storage, backups)
- **Project index** (Contra, Doomscroller, MIDI tool, TR-1 automation)

