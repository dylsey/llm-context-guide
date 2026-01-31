# Dylan — Active Projects Context

**Last Updated:** 2026-01-31 18:32 UTC
**Purpose:** Current projects, initiatives, and work-in-progress across IT, software development, creative, and homelab domains

---

## 1) Work IT Projects (State of Arkansas Public Defender Commission)

### Git Repository Implementation `[ACTIVE]`

**Objective:** Establish self-hosted Git repository infrastructure for internal code and documentation

**Environment:**
- Windows Server 2019 (current testing environment)
- Windows Server 2022 (available for deployment)
- Active Directory forest integration required
- On-premises domain controllers

**Current Phase:** Research and proof-of-concept

**Key Requirements:**
- AD authentication integration
- Repository governance framework
- Contribution standards (`CONTRIBUTING.md` templates)
- Branch strategies for small team
- Code review workflows
- Scalable architecture (2-person team now, enterprise patterns for future growth)

**Supervisor Guidance:**
- Start with simple file share permissions testing
- Validate access patterns before full platform deployment
- Ensure AD integration works reliably

**Decision Points:**
- Git platform choice (GitLab self-hosted, Gitea, Gogs, or simple Git over SSH)
- Backup and disaster recovery strategy
- Web interface vs CLI-only workflows
- CI/CD integration (future consideration)

**Success Criteria:**
- Reliable AD authentication
- Clear contribution workflow documented
- Repeatable repository creation process
- Team member onboarding documentation
- Backup/restore procedures verified

---

## 2) Creative Projects

### Louis Art Installation: Social Communication, Dissonance, and Human Connection `[RESEARCH]`

**Collaborator:** Louis (art and sound projects partner in Gar Studios)

**Conceptual Themes:**
- **Data privacy and surveillance capitalism** - Making invisible data collection visible
- **Social communication and dissonance** - Exploring tension between connection and isolation
- **Distance and closeness** - Physical proximity vs emotional/digital distance in human relationships
- **Consent and awareness** - Participants consciously engage with data collection they usually ignore

**Core Experience:**
1. Participants connect to dedicated WiFi VLAN
2. Sign EULA granting consent for data collection (educational/artistic context)
3. Installation collects and displays their data in real-time
4. Audio and visual components react to participant data/presence/interaction
5. Participants experience what data brokers collect, but in tangible, visceral form

**Technical Implementation (Multi-Phase Build):**

**Phase 1: Network Infrastructure & Data Collection**
- Dedicated WiFi VLAN for installation (isolated, controlled environment)
- Captive portal for EULA presentation and consent mechanism
- Locally-hosted network configured with penetration and scraping tools
- **Data mining focus:** Consensually scrape participant data to supply installation
  - WiFi metadata (signal strength, connection patterns, MAC addresses, proximity)
  - Device fingerprinting (with explicit consent)
  - Browser data (cache, user agent, timing patterns, browsing history if permitted)
  - Social media integration (Instagram API within ToS, if feasible)
  - Location/presence detection (spatial positioning within installation space)

**Phase 2: Audio Synthesis & Processing**
- **Learning goal:** Build and configure software/hardware synthesizers
- Audio generation reactive to collected data streams
- Synthesizer parameters driven by:
  - WiFi/cellular signal strength
  - Presence detection and participant count
  - Spatial positioning of participants
  - Social graph data (connections, interactions)
  - Temporal patterns (duration, frequency of visits)
- Integration options:
  - Hardware modular synths (Dylan's existing equipment)
  - Software synthesis (Pure Data, SuperCollider, Max/MSP, custom C++)
  - Hybrid approach (hardware + software processing chain)

**Phase 3: Visual Reactivity (TouchDesigner)**
- Video visuals reactive to generated audio
- TouchDesigner as primary visual engine
- Audio analysis → visual parameter mapping:
  - Amplitude → brightness/scale
  - Frequency content → color/texture
  - Spatial audio → visual positioning
  - Rhythm/beats → animation triggers
- Real-time data visualization overlays (dashboards, graphs, "surveillance view")

**Phase 4: Packaging & Deployment**
- **Portable installation system** for gallery/venue deployment
- Custom PC build options:
  - Compact form factor (ITX/mATX case)
  - Sufficient GPU for TouchDesigner real-time processing
  - Network interfaces for WiFi AP and data capture
  - Audio interface for multi-channel output
- Alternative: Deployable system (pre-configured, reproducible setup)
- Transportation/setup considerations (rugged case, quick assembly, calibration)

**Legal/Ethical Framework:**
- Clear, informed consent mechanism (EULA as art experience, not just legal form)
- Data retention and deletion policy (immediate post-session deletion option)
- Participant opt-out capability at any time
- Educational framing: "Experience what you consent to daily, but never see"
- Transparency: All collected data shown to participants in real-time

**Technical Stack Decisions (Open):**
| Component | Options Under Consideration | Status |
|-----------|----------------------------|--------|
| **Compute Platform** | Custom PC build, Raspberry Pi cluster, x86 mini-PC | Evaluating |
| **Network OS** | pfSense, OpenWrt, custom Linux | Researching |
| **Captive Portal** | pfSense built-in, custom web app, NoCatSplash | TBD |
| **Data Processing** | Python (scrapy, scapy), Node.js, custom C++ | TBD |
| **Audio Engine** | Pure Data, SuperCollider, Max/MSP, hardware modular | Learning phase |
| **Visual Engine** | TouchDesigner (primary), Processing (backup) | TouchDesigner likely |
| **Storage/Database** | Redis (real-time), SQLite (logging), in-memory only | TBD |

**Learning & Skill Development Goals:**
1. **Synthesizer programming:** Software and hardware synthesis from first principles
2. **Audio processing:** Real-time parameter mapping, generative composition
3. **Network security tools:** Ethical use of penetration/scraping tools in controlled environment
4. **TouchDesigner proficiency:** Audio-reactive visuals, real-time performance
5. **System integration:** Connecting network data → audio → video in stable, reproducible pipeline


### Technical Requirements `[RESEARCH]`

**Core Functionality:**
1. **Captive Portal WiFi VLAN**
   - Users connect to dedicated VLAN WiFi SSID
   - Captive portal landing page explaining data collection
   - End User License Agreement (EULA) for data collection consent
   - Legal compliance framework for data collection

2. **Data Collection Architecture**
   - WiFi/network metadata (signal strength, connection patterns)
   - Browser fingerprinting (if legally permissible with consent)
   - Social media integration (Instagram API, within ToS limits)
   - Simulate data broker collection methods
   - Pull legal data from any scrapable sources on people's devices that opt-in to the experience over WiFi

3. **Data Visualization Dashboard**
   - Real-time display of collected data
   - Demonstrate what "surveillance capitalism" captures
   - Local display for participants to see their data

4. **Interactive Audio Component**
   - WiFi/cellular signal → audio parameter mapping
   - Presence detection triggering sound
   - Synthesizer engine controlled by user data
   - Spatial interaction based on device signals

### Technical Stack Considerations
- **Platform:** TBD (evaluating Linux/Windows options)
- **Captive Portal Software:** TBD
- **Data Processing:** TBD
- **Audio Engine:** TBD (evaluating JUCE, Max/MSP, Pure Data)
- **Visualization:** TBD (considering React/D3.js, TouchDesigner)

### Open Questions
- Legal framework for consent-based data collection in art context
- How to clearly communicate "you are being surveilled" to participants
- Technical feasibility of social media integration within platform ToS
- Infrastructure requirements (dedicated router, VLAN setup, hardware)
- Audio synthesis mapping strategies based on collected data
- User experience flow from connection to data visualization and audio interaction
- How to begin architecting the captive portal and data collection backend
- How to anonymize data while still demonstrating surveillance concepts
- Want to avoid PII collection entirely, focus on metadata and behavioral patterns like marketing and ad tech companies do

**Current Phase:** Conceptual design, technical research, skill-building (synthesizer programming, TouchDesigner learning)

**Immediate Next Steps:**
1. Legal research: Consent-based data collection in art installations
2. Technical architecture design document (network topology, data flow, processing pipeline)
3. Proof-of-concept: Captive portal with dummy data collection
4. Audio synthesis learning: Build basic data-to-sound mappings
5. TouchDesigner tutorials: Audio-reactive visual prototypes
6. Hardware requirements specification: PC build or deployable system comparison

### Ambient Synth Album (Lowest Priority - Active Production) `[ACTIVE]`

**Project Type:** Original music production and release

**Scope:**
- Full-length ambient synth album
- Sound design and composition in Ableton Live 12
- Extensive use of modular hardware synths
- Distribution planning (streaming platforms, Bandcamp, physical media)

**Creative Direction:**
- Ambient synth-driven compositions
- Exploration of texture, space, and atmosphere
- Long-form pieces (potentially 5-15 minute tracks)
- Cohesive sonic palette across album

**Technical Workflow:**

**Hardware Synthesis:**
- Prophet 12 Desktop, Hydrasynth Desktop, Novation Peak Desktop
- PolyBrute 12, Prophet Rev2 8 Voice, Prophet 10
- Elektron Digitakt 2, Digitone 2
- Polyend Tracker+, Synthstrom Deluge
- Sequencing via Squarp Hapax and Oxi One

**DAW & Processing:**
- Primary: Ableton Live 12, Protools 2025.12
- Audio routing via Allen & Heath QU-5D
- Effects processing (reverb, delay, modulation)
- Mixing and mastering workflow

**Sound Design Focus:**
- Layered textures and evolving pads
- Granular synthesis and sampling techniques
- Modulation and parameter automation
- Spatial effects and stereo field manipulation

**Distribution Planning:**
- Streaming platforms (Bandcamp)
- Bandcamp for direct sales and FLAC/WAV downloads
- Physical media consideration (vinyl, cassette, CD)
- Album artwork and visual identity

**Current Status:**
- Active composition and recording phase
- Developing cohesive sonic identity
- Refining production techniques

**Next Steps:**
- Complete track composition and arrangement
- Mixing and mastering process
- Distribution platform setup
- Album artwork commissioning or creation
- Release date planning

---

### Doomscroller (Film Audio Post Pipeline) `[COMPLETE]`

**Project Type:** Film audio post-production workflow and deliverable management

**Status:** Mostly complete, now serving as advanced learning platform

**Scope:**
- Sound design editing and library curation
- Mixing and mastering for film delivery
- Stems and AAF collaboration with video editors
- FFmpeg remux workflows for audio replacement

**Advanced Learning Focus:**

**iZotope RX11 Advanced:**
- Advanced spectral editing and repair
- Dialogue cleanup and restoration
- De-noise, de-reverb, de-click techniques
- Music rebalancing and source separation
- Forensic audio recovery methods

**iZotope Ozone 12 Advanced:**
- Mastering chain optimization
- Intelligent EQ and dynamics processing
- Stereo imaging and width enhancement
- Loudness standards compliance (LUFS, true peak)
- Master Assistant AI-guided workflows

**Mixing & Mastering Techniques:**
- Film-specific loudness standards (dialogue normalization)
- Stem balancing for final mix
- Reference track comparison and analysis
- Dynamic range management for theatrical vs streaming
- Export formats for different delivery requirements

**Technical Challenges:**

**Audio/Video Remuxing:**
- Replace audio track without re-encoding video (preserve quality)
- FFmpeg command optimization
- Format compatibility for editor handoff

**Cross-DAW Workflows:**
- Ableton Live → Pro Tools → Premiere
- AAF/OMF session exchange
- Maintaining edit sync across platforms

**Deliverable Management:**
- Stem organization and naming conventions
- Archive-quality audio preservation
- Editor-friendly file formats

**Current Focus:**
- Using completed project as testbed for RX11/Ozone 12 techniques
- Building advanced audio repair workflows
- Mastering chain experimentation
- Documenting best practices for future film projects

---

## 3) Learning & Personal Development Projects

### Homelab Cybersecurity Learning Environment `[ACTIVE]`

**Goal:** Build hands-on cybersecurity lab for structured learning and certification preparation

**Current Infrastructure:**
- Hyper-V VMs on Workbox and Dungeon_Master
- AlmaLinux 9, Kali Purple, Parrot OS environments
- Isolated testing networks

**Learning Focus Areas:**

**Network Security:**
- VLAN segmentation implementation
- Firewall rule design and testing
- IDS/IPS deployment (Snort, Security Onion)
- VPN configuration and security
- Network traffic analysis (Wireshark, tcpdump)

**Defensive Security (Blue Team):**
- Log analysis and SIEM concepts
- Incident response procedures
- Host-based security (EDR concepts)
- Threat hunting methodologies
- Security monitoring and alerting

**Offensive Security (Red Team/Purple):**
- Vulnerability assessment
- Penetration testing methodologies
- Exploitation techniques in controlled environment
- Social engineering awareness
- Attack/defense scenario development

**Foundational Topics (Current Priority):**
- **DNS deep dive:** Architecture, record types, security (DNSSEC), attacks (DNS poisoning)
- **DHCP:** Lease management, security, rogue DHCP detection
- **Network fundamentals:** TCP/IP, routing, switching

**Planned Lab Scenarios:**
- Vulnerable VM environments (HackTheBox-style)
- Attack/defend exercises
- Malware analysis in isolated sandbox
- Network forensics challenges

**Next Steps:**
- Complete UniFi network deployment for proper segmentation
- Set up dedicated security monitoring VM
- Document lab network architecture
- Build attack/defense scenario library

---

### MIDI Parameter Mapping Automation Tool `[PLANNED]`

**Problem Statement:**
Manual MIDI CC mapping between controllers and instruments/VSTs is time-consuming and error-prone

**Concept:**
Tool that reads MIDI parameters from hardware controllers and software instruments, stores mappings, and assists with automated mapping or mapping templates

**Technical Approach:**
- MIDI parameter discovery and enumeration
- Mapping database/storage system
- Template system for common configurations
- Cross-platform compatibility (Windows, Linux, macOS)
- Integration with common DAWs

**Architecture Considerations:**
- Logging and traceability
- Clear data structures
- Maintainable codebase
- Professional naming conventions

**Current Status:** Conceptual planning, architectural thinking

**Next Steps:**
- Research MIDI specification for parameter discovery
- Evaluate MIDI libraries (RtMidi, others)
- Design data model for mappings
- Prototype basic MIDI parameter listening

---

## 4) Past Projects (Context for Learning Style & Competency)

### Contra NES SDL2 Game (Programming 2- Coursework Project) `[COMPLETE]`

**Significance:** Major learning project demonstrating CS fundamentals and architectural thinking

**Key Achievements:**
- Entity management with proper ownership semantics
- Factory pattern implementation (BulletFactory)
- SDL2 ecosystem integration (SDL_mixer for audio)
- Smart pointer usage and lifecycle management
- Modern C++ practices (initializer lists, Rule of Five)

**Lessons Applied to Current Work:**
- Importance of ownership boundaries
- Factory patterns for lifecycle management
- Architecture matters more than "it compiles"
- Readable, maintainable code over clever shortcuts

**Current Relevance:**
- Demonstrates intermediate C++ competency
- Shows architectural thinking ability
- Evidence of design pattern understanding
- Foundation for future game/interactive projects

---

## 5) Project Management & Organization Approach

### Documentation Philosophy
- README files mandatory for every project
- Clear installation and setup instructions
- Dependency documentation
- Troubleshooting sections for common issues
- Decision logs for architectural choices

### Development Folder Structure
**Standard across all machines:**
- Linux: `~/dev`
- Windows: `C:\Dev`

**Organization:**
- Suggested Structure `[BRAINSTORMING]`:

```
dev/
├── src/{python,powershell,cpp,rust,java,sandbox}
├── templates/
├── libs/
├── scripts/
├── tools/bin (added to PATH)
├── docs/
└── data/
```

### Project Lifecycle Approach
1. **Planning:** Architecture thinking before coding
2. **Documentation:** Write README and setup docs early
3. **Development:** Iterative with clear milestones
4. **Testing:** Manual testing at minimum, automated testing for complex projects
5. **Deployment:** Documented deployment procedures
6. **Maintenance:** Change logs, version control discipline

---

## 6) Project Prioritization Matrix

### High Priority (Active Work)
| Project | Domain | Status | Urgency |
|---------|--------|--------|---------|
| Git Repository Implementation | Work IT | `[RESEARCH]` | High |
| Louis Gar Studios Art Installation | Creative | `[RESEARCH]` | High |


### Medium Priority (Ongoing/Iterative)
| Project | Domain | Status | Urgency |
|---------|--------|--------|---------|
| UniFi Network Completion | Homelab | Planning | Medium |
| Cybersecurity Homelab | Learning | Iterative | Medium |
| QU-5D Studio Integration | Creative | Testing | Medium |
| Ambient Synth Album | Creative | Active Production | Medium |

### Low Priority (Long-Term/Conceptual)
| Project | Domain | Status | Urgency |
|---------|--------|--------|---------|
| Doomscroller Pipeline | Creative | Complete (Learning Platform) | Low |
| MIDI Mapping Tool | Software Dev | Conceptual | Low |

### Completed/On Hold
| Project | Domain | Status | Notes |
|---------|--------|--------|-------|
| TR-1 Reimbursement Automation | Work IT | Completed| Awaiting organizational requirements clarification |

---

## 7) Time & Resource Constraints

### Balancing Work & Personal Projects
- **Work IT projects:** Primary weekday focus
- **Creative projects:** Evening/weekend time
- **Learning projects:** Opportunistic, integrated with other work

### Decision Framework for New Projects
1. Does this solve a real problem?
2. Does this teach valuable skills?
3. Is this achievable with available time/resources?
4. Does this align with career/learning goals?
5. Can this be broken into incremental milestones?

---

## 8) Success Metrics & Goals

### Work Projects
- **Git Repository:** Deployed and in use by team with documented workflows

### Creative Projects
- **Louis Installation:** Functional prototype with consent-based data collection and reactive audio/visuals
- **Ambient Synth Album:** Completed album ready for release with cohesive sound design
- **Doomscroller:** Consistent, repeatable workflow for film deliverables
- **Studio Routing:** Stable, documented routing template operational

### Learning Projects
- **Homelab:** Can confidently explain and demonstrate network segmentation
- **Cybersecurity:** Complete structured learning path (TryHackMe, certifications)

---

## Notes for LLMs Using This Context

- **Active projects change frequently:** This file should be updated as priorities shift
- **Work projects are highest priority:** Professional obligations take precedence
- **Learning is integrated:** Homelab projects inform work skills and vice versa
- **Creative projects provide balance:** Music/audio work is important for well-being
- **Security-first mindset applies to all projects:** Never compromise security for convenience
- **Cross-references:** See `10-cs-engineering-competency.md` for skill development context, `11-it-sysadmin-context.md` for work project details, `12-audio-studio-context.md` for creative workflow tools, `13-home-network-context.md` for homelab infrastructure
---

## Change Log

**Format:** `YYYY-MM-DD HH:MM UTC - Description of changes`

- 2026-01-31 18:32 UTC - Standardized date formats, cross-references, and status tags; added Status Tag Reference
- *(Future changes will be logged here)*

---
