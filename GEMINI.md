# Blackfin Project Context

## Project Overview
**Blackfin** is a next-generation, immutable cybersecurity workstation distribution. It is built on the principles of **Cloud Native Linux**, leveraging **Fedora Silverblue** and **Bluefin** as its indestructible base. The core philosophy is "The Host is Sacred, The Tools are Disposable," meaning the host OS remains clean and stable while security tools run in isolated containers.

## Key Technologies & Architecture
*   **Base OS:** [Bluefin-dx](https://projectbluefin.io/) (Fedora Silverblue).
*   **Build System:** [BlueBuild](https://blue-build.org) (Generates OCI images via GitHub Actions).
*   **Containerization:**
    *   **Podman:** Primary container engine.
    *   **Distrobox:** Used to integrate **BlackArch** and its 3000+ tools seamlessly.
    *   **Exegol:** A wrapper for Docker/Podman to run fully featured hacking environments.
*   **Custom Tooling:**
    *   **Sensei:** An AI-powered CLI mentor script (`sensei`) using the Google Gemini API.
    *   **Ghost Shell:** A stealthy shell environment with IP spoofing capabilities.
    *   **Justfile:** A command runner for common tasks (`just update`, `just stealth-mode-on`).

## Key Files & Structure
*   `recipe.yml`: The declarative configuration file defining the OS image (packages, fonts, scripts). **This is the primary file for modification.**
*   `files/`: Contains custom files overlayed onto the system image (e.g., scripts, configuration).
    *   `files/usr/bin/sensei`: The AI Mentor script.
    *   `files/usr/bin/ghost-shell`: The IP spoofing script.
    *   `files/usr/share/ublue-os/just/*.just`: Custom `just` commands.
*   `scripts/`: Custom install scripts (e.g., `install-catppuccin.sh`).
*   `.github/workflows/`: CI/CD pipelines for building the image, generating ISOs, and cleanup.
*   `TODO.md`: The project roadmap and status.
*   `LICENSE`: GNU GPLv3.

## Building and Installation
**Building:**
The project uses GitHub Actions for building. Pushing changes to the repository triggers the build pipeline defined in `.github/workflows/build.yml`.

**Installation (Rebase Method):**
To switch an existing Bluefin/Fedora Silverblue system to Blackfin:
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mjcc30/blackfin:latest
systemctl reboot
```

**ISO Generation:**
A bootable ISO can be generated via the "Generate ISO" GitHub Action workflow.

## Development Conventions
*   **Immutability:** Avoid modifying `/usr` directly on a running system. Make changes via `recipe.yml` or `rpm-ostree`.
*   **Container-First:** Prefer installing tools in containers (Distrobox, Exegol) rather than layering them onto the host.
*   **Justfile:** Use `just` for common administrative and operational tasks to abstract complexity.
*   **Style:** The project uses the **Catppuccin Mocha** theme and **Nerd Fonts** for a consistent, hacker-centric aesthetic.

## Current Status & Roadmap
*   **Version:** v1.0 (Stable Base)
*   **Pending Tasks:**
    *   Smoke testing on bare metal.
    *   Verifying USB passthrough for hardware hacking.
    *   Browser hardening and Metasploit DB automation.
