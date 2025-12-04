# 🦈 Blackfin Development Roadmap

## ✅ Completed (v1.0)
### Core Architecture
- [x] **Base Image:** Forked from `bluefin-dx` (Fedora Silverblue based).
- [x] **Container Engine:** Enabled `podman.socket` by default for Exegol compatibility.
- [x] **Tool Integration:**
    - **Exegol:** Wrapper installed via pipx + configuration Podman.
    - **BlackArch:** Integrated via `distrobox.ini` auto-setup.
    - **SysReptor:** Automatic deployment script via `podman-compose`.

### Security & Privacy
- [x] **Ghost Shell:** Integrated THC's ghostip script for IP spoofing.
- [x] **Stealth Mode:** Created `just stealth-mode-on` to randomize MAC and block logs.
- [x] **Cleanup:** Automated GitHub Action to clean old container images.

### UX & Branding
- [x] **Theme:** Catppuccin Mocha Dark Blue applied by default.
- [x] **Fonts:** JetBrains Mono Nerd Fonts integrated.
- [x] **Wallpaper:** Custom Cyber-Shark HD wallpaper set as default.
- [x] **CLI Helpers:** Comprehensive `Justfile` with shortcuts (`just update`, `just cheat`).
- [x] **Cheatsheet:** Local documentation available via `just cheat`.

### CI/CD
- [x] **Build Pipeline:** Automated via BlueBuild.
- [x] **ISO Generation:** Workflow to generate bootable ISOs on demand.
- [x] **Signing:** Cosign key signing implemented.

---

## 🚧 Roadmap / To Do (v1.x & v2.0)
### Testing & QA
- [ ] **Smoke Test:** Install ISO on bare metal and verify Hardware support (Wifi, GPU).
- [ ] **USB Passthrough:** Verify `usbip` works correctly inside Exegol containers.
- [ ] **VPN Test:** Validate `just htb-vpn` connects correctly to HackTheBox.

### Features
- [ ] **Wordlists:** Add a script to efficiently manage/update SecLists (`/usr/share/wordlists`).
- [ ] **Browser Hardening:** Pre-configure Firefox with security extensions (Ublock, FoxyProxy).
- [ ] **Metasploit DB:** Automate PostgreSQL setup for `msfconsole` inside Distrobox.
- [ ] **Rewaita:** Explore clean integration for easier theme management.

### Documentation
- [ ] **Wiki:** Start a GitHub Wiki for advanced usage guides.
- [ ] **Video:** Create a demo video showing Ghost Shell and Exegol usage.

### Community
- [ ] **Discord/Matrix:** Set up a community channel.
- [ ] **Contributing Guide:** Write a `CONTRIBUTING.md` for new developers.
