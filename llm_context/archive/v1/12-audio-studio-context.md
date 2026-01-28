# Dylan — Audio Studio & Music Production Context

**Last Updated:** 2026-01-27 10:49 UTC
**Purpose:** Complete studio inventory, routing templates, DAW workflows, and creative practices

---

## 1) Creative Roles & Workflow Types

### Professional Capabilities
| Role | Description | Tools Used |
|------|-------------|------------|
| Producer/Composer | Ambient synth-driven music, film scoring | Ableton Live 12, hardware synths |
| Audio Engineer | Recording, editing, mixing, mastering | Pro Tools, Ableton Live 12 |
| Sound Designer | Film audio post, foley, sound effects | DaVinci Resolve, Pro Tools |
| Film Audio Post | Deliverables, stems, AAF/OMF collaboration | Cross-DAW and Cross-OS workflows |

### Collaboration Workflows
- **Logic Pro users:** Import MIDI/stems → finish in Ableton/Pro Tools
- **Premiere editors:** AAF exchange for audio post
- **Cross-platform delivery:** Ensures PC to Mac/Linux Cross-compatibility (ZIP format, file compatibility)

---

## 2) DAW & Software Environment

### Primary DAWs
| Software | Role | Version/Notes |
|----------|------|---------------|
| **Ableton Live 12** | Primary production DAW | Main creative environment |
| **Pro Tools 2025.12** | Audio post, mixing | Industry collaboration standard |
| **DaVinci Resolve** | Video editing, audio post | Film projects |

### Software Instruments & Plugins
| Plugin | Category | Usage |
|--------|----------|-------|
| Omnisphere 3 | Software synthesizer | Pads, textures, complex sounds |
| Pigments 6 | Hybrid synthesizer | Pads, textures, modulation |
| Arturia V Collection 11 | Vintage synth emulations | Classic sounds, specific character |
| u-He Zebra 3 | Modular synthesizer(still in Beta) | Sound design, evolving textures |
| Native Instruments | Absynth 6 | Semi-modular synth | Ambient sounds, evolving pads |
| Serum 2 | Wavetable synthesizer | Sound design, bass, leads |
| iZotope RX11 Advanced | Audio repair & restoration | Dialogue cleanup, spectral editing, noise reduction |
| iZotope Ozone 12 Advanced | Mastering suite | Loudness management, stereo imaging, mastering chain |
| ongoing list being developed in this file (Markdown/plugins.md) | | |

### DAW-Specific Workflows

**Ableton Live 12:**
- MIDI import consolidation to avoid unwanted clip multiplication
- Avoiding automatic time warping on MIDI/audio imports
- Session organization for stems and raw audio deliverables

**Pro Tools:**
- Industry-standard deliverable formats
- AAF/OMF session exchange
- Collaboration with editors and other post facilities

**FFmpeg Workflows:**
- Remuxing audio/video (preserving video quality while replacing audio)
- Format conversion for cross-platform compatibility

---

## 3) Audio Interfaces & Mixing Consoles

### Current Primary Interface
| Device | Status | Sample Rate | Notes |
|--------|--------|-------------|-------|
| **Allen & Heath QU-5D** | Working and Implemented | Main digital mixer & interface |  USB audio + DAW control  implemented and working on learning full functionality |
| **Zoom LiveTrak L-12** | retired to live use (transitioning) | 48 kHz | Cycled to use for live projects and not used since QU-5D fully configured |

---

## 4) QU-5D Canonical Routing Template (Multi-DAW + Discord Streaming)

**Design Goal:** Discord streaming + multi-DAW routing **without Voicemeeter**

**Note:** Dylan has a legal Voicemeeter license but is not using it due to the QU-5D's native routing capabilities.

### Layer Configuration
| Layer | Purpose | Channels |
|-------|---------|----------|
| **Layer A** | MIDI instruments | Channels 1–16(MIDI) |
| **Layer B** | MIDI instruments (extended) | Channels 17–32 (MIDI) |
| **Layer C** | mostly empty  |  random local + USB inputs  |
| **Layer D** | Mix buses, FX, Stream |  USB apps + key instruments | Ableton, Discord, Omnisphere, Pro Tools, Vocals, hardware & soft synths,  Mix1/2, Mix3, Mix4, FX sends/returns, Stream (Mix12), Main LR |

### Input Routing (Layer D - USB & Local Sources)
| Input Channels | Source | Signal Type |
|----------------|--------|-------------|
| 1/2 | Unassigned | null |
| 3/4 | Ableton Live | USB 3/4 |
| 5/6 | Omnisphere & standalone Soft Synths (standalone or in DAW) | USB 5/6 |
| 7/8 | Discord | USB 7/8 |
| 9 | Vocals | Local inputs 9 |
| 10 | Ip10 | Local inputs 10 |
| 11/12 | Pro Tools | USB 11/12 |
| 13 | PolyBrute 12 | Local input 3 |
| 14 | Unassigned | null |
| 15 | Prophet 10 | Local input 8 |
| 16 | ip16 | Local input 16 |
| 17/18 | Unassigned | null |
| 19-21 | Unassigned | null |
| 22 | rev2 | local 2 |
| 23-32 | Unassigned | null |

### USB Output Routing (to Computer)
| USB Outputs | Destination | Purpose |
|-------------|-------------|---------|
| 1–2 | Stream Mix (Mix12) | Discord/streaming output |
| 3–4 | Ableton Direct Out | Ableton return path |
| 5–6 | Omnisphere Direct Out | Omnisphere return path |
| 7–8 | Discord Direct Out | Discord mic/input return |
| 9–10 | Vocals | Vocal monitoring return |
| 11–12 | Pro Tools | Pro Tools return path |
| 13 | PolyBrute 12 | Direct hardware monitoring |
| 15 | Prophet 10 | Direct hardware monitoring |
| 16–32 | Direct outs | Individual channel routing |

### QU-5D ↔ Ableton DAW Control (Mackie Control Protocol)

**Configuration Requirements:**
- Use **Allen & Heath MIDI Control** application
- Protocol: **Mackie Control**
- QU-5D Utility → MIDI Settings: MIDI Channel = **16**
- Ableton: Use "**DAW Control MIDI 1/2**" virtual ports
- **Do not use** raw "Qu-5D MIDI" ports (disable Track/Remote to avoid conflicts)

**Startup Sequence (Critical):**
1. Launch Allen & Heath MIDI Control app **first**
2. **Then** launch Ableton Live
3. Virtual ports must exist before DAW starts

**Windows USB Stability Hardening:**
- Disable USB selective suspend in Power Options
- Disable USB Root Hub power saving in Device Manager
- Use **direct motherboard USB ports** (avoid hubs for stability)
- Prefer USB 3.0/3.1 ports for bandwidth

### QU-5D ↔ Pro Tools DAW Control (HUI Protocol)

**Configuration Requirements:**
- Use **Allen & Heath MIDI Control** application
- Protocol: **HUI**
- QU-5D Utility → MIDI Settings: MIDI Channel = **16**
- Ableton: Use "**DAW Control MIDI 1/2**" virtual ports
- **Do not use** raw "Qu-5D MIDI" ports (disable Track/Remote to avoid conflicts)

**Startup Sequence (Critical):**
1. Launch Allen & Heath MIDI Control app **first**
2. **Then** launch Ableton Live
3. Virtual ports must exist before DAW starts

**Windows USB Stability Hardening:**
- Disable USB selective suspend in Power Options
- Disable USB Root Hub power saving in Device Manager
- Use **direct motherboard USB ports** (avoid hubs for stability)
- Prefer USB 3.0/3.1 ports for bandwidth

---

## 5) Hardware Synthesizers & Sound Sources

### Desktop Synthesizers
| Instrument | Type | Key Features |
|------------|------|--------------|
| **Prophet 12 Desktop** | Hybrid analog/digital | Curtis filters, extensive modulation |
| **Hydrasynth Desktop** | Wavetable | Polyphonic aftertouch, mutant modulation |
| **Novation Peak Desktop** | Hybrid analog | Multi-timbral, rich modulation |
| **Arturia PolyBrute 12** | Analog poly | Morphée controller, FullTouch keyboard |
| **Prophet 10** | Analog poly | Classic Sequential sound, 10-voice |
| **Dave Smith Instruments Rev2** | Analog poly | Dual filters, extensive modulation |
| **Korg Minilogue XD** | Hybrid analog/digital | Multi-engine, sequencer |
| Arturia MicroFreak | Hybrid digital/analog | Unique oscillator types, touch keyboard |


### Grooveboxes & Samplers
| Device | Category | Primary Use |
|--------|----------|-------------|
| **Polyend Tracker+** | Tracker/groovebox | Sample manipulation, sequencing |
| **Synthstrom Deluge** | All-in-one groovebox | Standalone composition, performance |
| **Elektron Digitakt 2** | Sampler/drum machine | Rhythmic elements, sampling |
| **Elektron Digitone 2** | FM synthesizer | FM-based melodic and percussive sounds |
| **Dirtywave M8** | Tracker/synth | Chiptune, retro synthesis, robust tracker |


### Hardware Sequencers & Controllers
| Device | Function | Integration |
|--------|----------|-------------|
| **Squarp Hapax** | Advanced MIDI sequencer | Multi-track MIDI composition |
| **Oxi One** | MIDI sequencer/controller | Performance control, pattern generation |
| **Novation Launchpad X** | Grid controller | Clip launching, DAW control |
| **Ableton Push 2** | DAW controller | Deep Ableton Live integration |
| **Akai MPC One** | Standalone sampler/sequencer | Beat making, sampling, sequencing |

---

## 6) MIDI Infrastructure & Signal Routing

### MIDI Utilities
| Device | Function | Purpose |
|--------|----------|---------|
| **MOTU Midi Express XT** | 8-in/8-out MIDI interface | Central MIDI routing hub currently implemented in Clockwork software |
| **MIDI Merge-4** | 4-to-1 MIDI merge | Combine multiple MIDI sources |
| **MIDI Quadra Thru** | 1-to-4 MIDI thru | Distribute MIDI to multiple devices |
| **MIDI Thru-12** | 1-to-12 MIDI thru | Large-scale MIDI distribution |


### Patch Bay & Physical Routing
| Device | Type | Status |
|--------|------|--------|
| **Samson S-Patch Plus** | 48-point balanced patchbay | Installed, normalization map = **UNKNOWN** |

**Note:** Full patchbay normalization wiring details not yet documented. Ever changing, but in an excel sheet.

---

## 7) Monitoring & Listening Chain

### Headphones & Amplification
| Component | Model | Purpose |
|-----------|-------|---------|
| **Headphones** | Sennheiser HD650 | Reference listening, mixing |
| **Headphone Amp** | JDS Labs Atom Amp 2 | Clean amplification for HD650 but used for 2nd Headphone channel if necessary |

### Studio Monitors
| Component | Model | Purpose |
|-----------|-------|---------|
| **Adam Audio A7X** | Studio Monitor | Accurate reference monitoring |

- Foam isolation pads under monitors for decoupling
- Foam wall panels installed to reduce early reflections in listening position

---

## 8) Common Production Challenges & Solutions

### Ableton Live Workflow Issues
- **MIDI import creating multiple tracks/clips:** Use consolidation workflows to merge
- **Unwanted time warping on import:** Disable auto-warp in preferences before import
- **Clip organization for stems:** Pre-plan track naming and color coding

### Cross-DAW Collaboration
- **Logic Pro → Ableton:** Export MIDI + stems, import into Ableton for mixing
- **Pro Tools → Premiere (AAF):** Session preparation for editor delivery
- **Mac compatibility:** Always test ZIP archives and file formats

### FFmpeg Audio/Video Workflows
- **Goal:** Replace audio track while preserving video quality (no re-encode)
- **Method:** Remux workflows to swap audio streams without transcoding video
- **Use case:** Film deliverables, quick audio revisions

---

## 9) Active Music Projects

### Doomscroller (Film Audio Post Pipeline)
**Focus Areas:**
- Sound design editing and library management
- Mixing and mastering for film deliverables
- Stems and AAF collaboration with editors
- FFmpeg remux workflows for audio replacement

**Workflow Requirements:**
- High-quality audio processing
- Format flexibility for editor compatibility
- Organized session structure for revisions

---

## 10) Studio Expansion & Development Goals

### Short-Term Priorities
- Finalize QU-5D routing and DAW control integration
- Optimize MIDI infrastructure and patchbay documentation
- Optimize qu-5d mix busses for common use cases
- Document patchbay normalization scheme
- Optimize Ableton Live 12 template for typical workflows
- Optimize Pro Tools template for film audio post workflows

### Medium-Term Goals
- Expand MIDI infrastructure routing (Hapax + Oxi One integration)
- Implement mix reference workflow and monitoring calibration

### Long-Term Vision
- Sample library management and backup strategy
- Session organization conventions (naming, stems, deliverables)
- Room acoustic treatment and monitoring optimization

---

## 11) UNKNOWN Items (Gaps in Documentation)

The following studio details are **not yet documented**:

### Physical Routing & Connections
- [ ] Complete patchbay normalization map (top/bottom row wiring)
- [ ] Full QU-5D channel assignments for every hardware device
- [ ] Audio cable inventory and routing map

### Monitoring & Acoustics
- [ ] Monitoring controller or volume management system

### Outboard Gear & Processing
- [ ] Outboard FX units (None: none currently owned)
- [ ] Hardware compressors/EQs (None: none currently owned)
- [ ] DI boxes and preamps beyond mixer (None: none currently owned)

### Software & Plugin Ecosystem
- [ ] Complete plugin inventory beyond core instruments
- [ ] Plugin folder organization standards
- [ ] Preset management workflow

---

## Notes for LLMs Using This Context

- **QU-5D routing is canonical:** Treat this template as the reference design
- **Ableton Live 12 is primary DAW for Creative Uses:** Default to Ableton-specific advice unless Pro Tools is mentioned
 - **Pro Tools is primary DAW for Audio Post and NLE:** Default to Pro Tools-specific advice for film projects and NLE workflows
- **Hardware-centric workflow:** Dylan uses extensive hardware synths, not just software
- **Cross-DAW collaboration is common:** Provide format compatibility guidance when relevant
- **Security of stability:** USB power settings and direct motherboard connections matter for reliability
