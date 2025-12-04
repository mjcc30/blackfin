# Blackfin Project Context

## Project Overview
**Blackfin** is a next-generation, immutable cybersecurity workstation distribution. It is built on the principles of **Cloud Native Linux**, leveraging **Fedora Silverblue** (via **Bluefin-dx**) as its indestructible base.
**Philosophy:** "The Host is Sacred, The Tools are Disposable."

## Key Technologies & Architecture
*   **Base OS:** [Bluefin-dx](https://projectbluefin.io/) (Fedora Silverblue).
*   **Build System:** [BlueBuild](https://blue-build.org) (Generates OCI images via GitHub Actions).
*   **Containerization:**
    *   **Podman:** Primary container engine (Socket enabled for Exegol).
    *   **Distrobox:** Used to integrate **BlackArch** seamlessly.
    *   **Exegol:** A wrapper for Docker/Podman (installed via pipx).

## Key Files & Structure
*   `recipe.yml`: The declarative configuration file. **Located in `recipes/`** (Crucial fix).
*   `files/`: Custom files overlay.
    *   `files/scripts/`: Install scripts (e.g., `install-sensei.sh`). **Must be referenced relatively** in `recipe.yml` (e.g., `install-sensei.sh`, NOT `/tmp/...`).
    *   `files/usr/share/ublue-os/just/*.just`: Custom `just` commands.
*   `.github/workflows/`:
    *   `build.yml`: Builds the OCI image.
    *   `generate-iso.yml`: Generates the bootable ISO (Requires Package to be Public).

## Known Issues & Fixes (Lessons Learned)
1.  **RPM Fusion Conflict:** Removed `rpmfusion` repos from `recipe.yml` because Fedora Rawhide (43) repos are unstable or missing.
2.  **Docker vs Podman:** Removed `podman-docker` because `bluefin-dx` already includes `docker-ce`. Installing both causes a transaction error.
3.  **Script Paths:** BlueBuild mounts `files/` to `/tmp/files/`. Scripts in `recipe.yml` must be referenced by filename only if they are in `files/scripts/`.
4.  **Missing Packages:** `glow` and `pop-shell` were removed because they are not in standard Fedora repos.

## Components & Tools
*   **Sensei:** Installed via `install-sensei.sh` which fetches the latest **Binary Release** from GitHub.
*   **Ghost Shell:** IP Spoofing script (THC) integrated as `just ghost-shell`.
*   **SysReptor:** Reporting tool installed via `just install-sysreptor` (Podman Compose).
*   **Theme:** Catppuccin Mocha (Configured via dconf, install script disabled for stability).

## Roadmap
*   **v1.0 (Megalodon):** Stable release.
*   **v1.x:** USBIP automation, Browser hardening.
*   **v2.0:** Deep integration with Sensei Swarm via MCP.
