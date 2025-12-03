# Blackfin 🏴‍☠️
### The Immutable Cybersecurity Workstation

![Blackfin Badge](https://img.shields.io/badge/Based_on-Bluefin-blue) ![Status](https://img.shields.io/github/actions/workflow/status/mjcc30/blackfin/build.yml)

**Blackfin** is a next-generation penetration testing distribution built on the principles of **Cloud Native Linux**. 

Based on [Bluefin](https://projectbluefin.io/), it provides an atomic, indestructible host system where security tools live in isolated, disposable containers.

> **Philosophy:** "The Host is Sacred, The Tools are Disposable."

## 🚀 Why Blackfin?

Traditional security distributions (Kali, BlackArch, Parrot) are often unstable because they mix thousands of bleeding-edge tools with system packages. One `apt upgrade` can break your desktop environment.

**Blackfin solves this.**

- **🛡️ Indestructible Host:** The base system is an immutable Fedora Silverblue image. It never breaks.
- **📦 Containerized Arsenal:**
    - **[Exegol](https://exegol.com):** Native support (Podman socket enabled by default).
    - **[BlackArch](https://blackarch.org):** Integrated via Distrobox. Access 3000+ tools seamlessly.
- **💻 Developer Experience:** Includes VS Code, Docker, Podman, and Zsh out of the box.
- **🎮 Hardware Ready:** Nvidia drivers and surface kernel included (thanks to Bluefin).

## ⚡ Quick Start

### 1. Installation
Download the ISO from the [Releases Page](../../releases) and install it like any Fedora system.

### 2. Launching BlackArch
Blackfin comes with a pre-configured integration for BlackArch.
```bash
# Initialize the BlackArch container (one time setup)
distrobox assemble create

# Enter the container
start-blackarch

# Run tools directly from your host
msfconsole
```

### 3. Using Exegol
No configuration needed.
```bash
pipx install exegol
exegol install light
exegol start
```

## 🛠️ Included Tools (Host)
While most tools should be run in containers, we include the essentials for network connectivity and hardware hacking on the host:
- **Network:** Wireshark, Nmap, Aircrack-ng, Tcpdump
- **Hardware:** PCIutils, USButils, Ethtool, Macchanger
- **System:** Zsh, Tmux, Htop, Bat

## 🏗️ Build It Yourself
Blackfin is built using [BlueBuild](https://blue-build.org).
Fork this repository and modify `recipe.yml` to create your own flavor.

---
*Built on the shoulders of giants: [Universal Blue](https://ublue.it), [Exegol](https://github.com/ThePorgs/Exegol), and [BlackArch Linux](https://blackarch.org).*