# Dylan — CS Engineering Competency Profile

**Last Updated:** 2026-01-31 18:32 UTC
**Purpose:** Define skill levels so LLMs can calibrate teaching depth appropriately

---

## 1) Demonstrated Competencies (What I've Proven I Understand)

### Language Proficiency Matrix
| Language | Proficiency | Evidence | Primary Use Cases |
|----------|-------------|----------|-------------------|
| C++ | Intermediate | SDL2 Contra NES game with ownership patterns, factories, smart pointers, modern C++17 practices | Game development, systems programming |
| Java | Intermediate | Coursework projects demonstrating OOP fundamentals, strong foundation | Academic projects, enterprise patterns |
| PowerShell | Intermediate | Active automation work for IT role, prefers over CMD, building scripting depth | Windows automation, IT operations |
| Python | Functional | TR-1 automation project, OSRM API integration, practical scripting | Automation, API integration, data processing |
| Bash | Basic | Limited use in WSL environments, basic scripting knowledge | Linux command line tasks |

### CS Fundamentals (Confirmed Understanding)
| Concept | Proficiency | Evidence |
|---------|-------------|----------|
| Memory Management | Intermediate | Understands stack vs heap, object lifetime, RAII principles |
| OOP Design | Strong | Composition over inheritance, encapsulation, polymorphism |
| Ownership Semantics | Intermediate | Smart pointers (`std::shared_ptr`), factory patterns for lifecycle management |
| Design Patterns | Intermediate | Factory pattern (BulletFactory), dependency injection awareness |
| Modern C++ | Intermediate | Initializer lists, Rule of Five awareness, avoiding unnecessary moves |
| Algorithms | Basic | Big-O reasoning, performance awareness, prefers clarity over cleverness |
| Data Structures | Basic | Basic structures (arrays, vectors, maps), STL usage |
| Software Architecture | Basic | Repository patterns, separation of concerns, scalability considerations |
| Version Control | Intermediate | Git workflows, branching strategies, repository governance |
| x86 Assembly Language | Basic | Very little understanding of low-level assembly language |

### Development Practices (Proven Preferences)

**Code Style Requirements:**
- Full descriptive variable/function/class names (`distance_miles` not `dist`, `MappingManager` not `mmgr`)
- Readable, maintainable structure prioritized over cleverness
- Minimal diffs when refactoring unless explicitly requested
- Modern best practices first, official documentation over "near alternatives"

**Debugging Methodology:**
- Methodical, root-cause focused
- Wants to understand *why* something works, not just *that* it works
- Prefers official docs and READMEs

**Learning Style Patterns:**
- Requires three-part explanations: (1) What is this? (2) What does it do? (3) How to verify it's installed/working?
- Builds understanding from first principles, avoids cargo-cult commands
- Learns best through practical projects with real architecture decisions
- Values expert-level framing with explicit reasoning

**Project Architecture Mindset:**
- Strong emphasis on ownership boundaries
- Prefers factories and clear responsibility separation
- Plans for scalability even on small projects
- Documentation-driven (README, CONTRIBUTING, folder conventions)

---

## 2) Knowledge Gaps & Growth Areas (What I Want/Need to Learn)

### HIGH PRIORITY TARGET SKILLS (Immediate Learning Focus)

**CI/CD & DevOps:**
- GitHub Actions / GitLab CI pipelines
- Automated build systems
- Artifact management
- Continuous deployment strategies

**OSINT & Ethical Hacking:**
- Reconnaissance techniques
- Common vulnerabilities and exposures (CVEs)
- Penetration testing methodologies
- Tools: Nmap, Wireshark, Metasploit basics
- Parrot Security OS and Kali fundamentals

**Data Collection & Privacy:**
- Ethical data gathering techniques
- Consent frameworks and guidelines
- Anonymization and data protection best practices
- Isolated lab environment setup for safe data experiments

**Real-Time CLI, Clang, and C++ Synthesizer Toolchains:**
- Setting up toolchains on Windows, Linux, macOS for C++ audio development
- Using Clang/LLVM for C++ compilation and optimization
- Command line synthesizer frameworks (e.g., JUCE, VST SDK)
- Building and deploying C++ audio plugins
- Audio DSP fundamentals in C++
- Real-time audio processing concepts
- TouchDesigner integration for audio-visual projects

**Data Collection to Audio Synthesis and Dashboard Display Pipelines:**
- Data ingestion techniques (APIs, web scraping)
- Data-to-audio mapping strategies
- Audio synthesis libraries and frameworks
- Visualization tools (TouchDesigner, Processing)
- Dashboard creation and data visualization best practices
- Real-time data processing pipelines
- Where to start with audio synthesis from data inputs
- Where to start with Dashboard or old iPhones as displays from data inputs

### MEDIUM PRIORITY TARGET SKILLS (6-12 Month Horizon)

**Testing & Quality:**
- Unit testing frameworks (no experience yet)
- Integration testing strategies
- Test-driven development (TDD) practices
- Code coverage tools and metrics

**Advanced C++ Concepts:**
- Template metaprogramming
- CRTP (Curiously Recurring Template Pattern)
- C++20 concepts and constraints
- Move semantics mastery
- Perfect forwarding
- Lambdas and functional programming aspects
- Smart pointer custom deleters and advanced usage

**Build Systems & Dependencies:**
- CMake advanced usage
- vcpkg package management
- Cross-platform build strategies
- Dependency vendoring vs package managers

### LONG-TERM TARGET SKILLS (12+ Months)

**Concurrency & Parallelism:**
- Multithreading fundamentals
- Mutexes, locks, condition variables
- Thread-safe design patterns
- Async/await patterns (if applicable to C++)
- Race condition debugging

**Performance Optimization:**
- Profiling tools (Valgrind, gprof, Visual Studio Profiler)
- Cache optimization strategies
- Memory allocation optimization
- SIMD/vectorization awareness

### DEVELOPING SKILLS (Active Learning / Recent Interest)

**Software Architecture:**
- Enterprise repository patterns and governance
- Microservices vs monolithic design tradeoffs
- API design principles
- Documentation as code (Architecture Decision Records)

**Version Control at Scale:**
- Git repository governance for teams
- Branch strategies (Git Flow, trunk-based development)
- Code review best practices
- Contribution workflows (CONTRIBUTING.md standards)

---

## 3) Active Projects & Learning Context (Current Focus)

**Immediate-Term Focus:**

### 1) Git Repository Infrastructure `[ACTIVE]` (Highest Priority)

- Git enterprise architecture and self-hosted repository setup (Windows Server 2022) — see `11-it-sysadmin-context.md`
- Building scalable patterns for 2-person IT team with enterprise mindset
- PowerShell automation depth for IT operations

### 2) Homelab cybersecurity learning environment `[ACTIVE]` (High Priority)

- Building homelab with VLANs and segmented services for cybersecurity learning — see `13-home-network-context.md`
- Segregating an ethical hacking lab on baremetal, virtualized, and containerized platforms
- OSINT and ethical hacking fundamentals using Parrot OS and Kali
- Penetration testing basics and tools using isolated lab VLANs at my home adjacent to **YelNet**

### 3) Gar Studios Art installation `[RESEARCH]` (Creative Exploration)

- Art installation exploring social communication/dissonance + distance/closeness using consent-based data collection in isolated lab VLAN, audio synthesis, and TouchDesigner audio-reactive visuals - see `12-audio-studio-context.md`, `13-home-network-context.md`, and `14-active-projects-context.md`
- Gathering resources for Louis art installation (Consent Guidelines/Examples, data collection over lab VLAN, audio synthesis implementation, TouchDesigner)
- Deepening understanding of OSINT and ethical hacking practices
- Deepening understanding of Data Collection (i.e. shopping metrics, social media data, typical weak phone security flaws to showcase for education, etc.) best practices in isolated environments

**Medium-Term Goals:**
- Understanding CI/CD pipelines for small teams
- Implementing unit/integration testing in Git projects

**Trajectory & Direction:**
- Moving from "coursework projects" → "production-grade practices"
- Building enterprise-ready solutions within small-team constraints
- Security-first mindset: never suggest solutions that increase attack surface
- Wants scalable, maintainable architectures that can grow

### Learning Methodology Preferences

When introducing new concepts, Dylan expects:
1. **Context first:** What problem does this solve?
2. **Official sources:** Link to authoritative documentation
3. **Verification steps:** How do I confirm it's working correctly?
4. **Minimal diffs:** Don't refactor existing code without explicit permission

### Important Constraints

**Non-Negotiables:**
- Security posture: minimize attack surface by default
- Code readability: full descriptive names, clear intent
- Official documentation: no "near alternatives" unless explicitly requested
- PowerShell-first on Windows unless otherwise specified

---

## Notes for LLMs Using This Context

- **For proven skills:** Engage at expert level, assume foundational understanding
- **For target skills:** Provide structured teaching with clear explanations
- **For developing skills:** Check assumptions, offer depth when relevant
- **For all interactions:** Follow Dylan's communication preferences (explicit reasoning, official docs, verification steps)
- **Cross-references:** See `11-it-sysadmin-context.md` for professional environment details, `13-home-network-context.md` for homelab infrastructure, `12-audio-studio-context.md` for synthesis and DSP applications

---

## Change Log

**Format:** `YYYY-MM-DD HH:MM UTC - Description of changes`

- 2026-01-31 18:32 UTC - Standardized date formats, cross-references, and status tags; added Status Tag Reference
- *(Future changes will be logged here)*

---
