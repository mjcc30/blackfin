# 🦈 Blackfin Roadmap & Project Board

## 📅 Status: Q4 2025 - v1.0 Released / Preparing v2.0

This file tracks the project's history and future direction.

---

## ✅ Completed (v1.0 - The Foundation)
**Released:** December 2025

### Core Architecture
- [x] **Base Image:** Forked from `bluefin-dx` (Fedora Silverblue based).
- [x] **Container Engine:** Enabled `podman.socket` by default for Exegol compatibility.
- [x] **Tool Integration:**
    - **Exegol:** Wrapper installed via pipx + configuration Podman.
    - **BlackArch:** Integrated via `distrobox.ini` auto-setup.
    - **SysReptor:** Automatic deployment script via `podman-compose`.
    - **VPN:** Helpers for HackTheBox (`just htb-vpn`) and TryHackMe.

### Security & Privacy
- [x] **Ghost Shell:** Integrated THC's ghostip script for IP spoofing.
- [x] **Stealth Mode:** Created `just stealth-mode-on` to randomize MAC and block logs.
- [x] **Cleanup:** Automated GitHub Action to clean old container images.

### UX & Branding
- [x] **Theme:** Catppuccin Mocha Dark Blue applied by default via dconf.
- [x] **Fonts:** JetBrains Mono Nerd Fonts integrated.
- [x] **Wallpaper:** Custom Cyber-Shark HD (1920x1080) wallpaper set as default.
- [x] **CLI Helpers:** Comprehensive `Justfile` with shortcuts (`just update`, `just cheat`).
- [x] **Cheatsheet:** Local documentation available via `just cheat`.
- [x] **Sensei:** AI Mentor CLI tool installed (`sensei` / `just ask`).

### CI/CD & Legal
- [x] **Build Pipeline:** Automated via BlueBuild.
- [x] **ISO Generation:** Workflow to generate bootable ISOs on demand.
- [x] **Signing:** Cosign key signing implemented.
- [x] **License:** GPLv3 applied.

---

## 🎯 v2.0 Milestones (The "Cyberpunk" Update)

### 🛡️ Epic 1: Advanced Privacy & OpSec
> Focus on plausible deniability and emergency cleaning.

- [ ] **Feature: Panic Button (`just nuke`)**
    - *Description:* A script to instantly wipe RAM, clear bash history, delete ssh keys in memory, and unmount all encrypted volumes.
    - *Priority:* High
- [ ] **Feature: Secure Vault Helper**
    - *Description:* A `just vault-create` command to easily generate a LUKS encrypted container file for storing sensitive client data (reports, evidences).
    - *Priority:* Medium
- [ ] **Integration: Tor Mode**
    - *Description:* Script to route specific container traffic via Tor transparently.

### 🖥️ Epic 2: Immersive UX (The "Dashboard")
> Make the terminal feel like a cockpit.

- [ ] **UX: Zellij Integration**
    - *Description:* Replace standard terminal session with a pre-configured Zellij layout (Shell + Resource Monitor + Network Log).
    - *Priority:* High
- [ ] **UX: Active Recon Widget**
    - *Description:* Display current public IP and VPN status directly in the top bar or terminal header.

### 🔧 Epic 3: Hardware & Radio
> Bridging the gap between container and metal.

- [ ] **Fix: USBIP Automation**
    - *Description:* Script to auto-detect and attach USB Wifi adapters to Exegol containers without manual commands.
- [ ] **Feature: SDR Support**
    - *Description:* Add `gqrx` and `rtl-sdr` drivers to the base image for Radio Hacking capabilities.

---

## 🔬 R&D / Future Vision (v3.0 - The Swarm)
> Implementation of Multi-Agent Systems (MAS) inspired by [Gemini Flow](https://github.com/clduab11/gemini-flow).

- [ ] **Architecture: Agent Swarm**
    - Transition Sensei from a Single Agent to an Orchestrator.
    - Create specialized sub-agents: `ReconAgent`, `ExploitAgent`, `ReportAgent`.
- [ ] **Protocol: MCP (Model Context Protocol)**
    - Implement MCP to allow agents to share context (e.g., Scan results) seamlessly.
- [ ] **Protocol: A2A (Agent-to-Agent)**
    - Enable direct communication between Exegol containers and Sensei agents.
- [ ] **Goal:** Fully autonomous CTF solving capabilities.

---

## 🐛 Backlog / Maintenance
- [ ] **Bug:** Verify HackTheBox VPN connection stability (OpenVPN vs Wireguard).
- [ ] **Doc:** Video tutorial for "Ghost Shell" usage.
- [ ] **CI/CD:** Add automated tests for the ISO generation.
