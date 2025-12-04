# Changelog

All notable changes to this project will be documented in this file.

## [v1.0.4] - 2025-12-04
### Fixes
- **Sensei Installation:** Resolved critical build failure where `install-sensei.sh` attempted to execute the Sensei CLI during the Docker build process (due to unescaped variables in EOF block).
- **Wrapper Logic:** Corrected `install-sensei.sh` to properly execute Sensei as a python module (`uv run -m app.main`) to fix import errors.

## [v1.0.3] - 2025-12-04
### Improvements
- **ISO Upload:** Switched from `softprops/action-gh-release` (JS action) to `gh release upload` (CLI) in CI/CD to bypass the 2GB file size limit for ISO uploads.

## [v1.0.2] - 2025-12-04
### New Features
- **User-Level Updates:** The system wrapper `/usr/bin/sensei` now checks for a user-installed binary in `~/.local/bin/sensei` before launching the system version, allowing users to update Sensei without waiting for an OS update.

## [v1.0.1] - 2025-12-04
### Fixes
- **Build System:** Fixed script paths referencing `/tmp/files/scripts/` in `recipe.yml`.
- **Dependencies:** Removed `rpmfusion` and `podman-docker` to resolve conflicts with Fedora 43 / Rawhide base.
- **Fastfetch:** Added custom configuration and branding.

## [v1.0.0] - 2025-12-04
### Initial Release
- **Base:** Fedora Silverblue (Bluefin-dx).
- **Tools:** Exegol, BlackArch (Distrobox), Ghost Shell pre-installed.
- **Integration:** Deep integration with Sensei AI Mentor.
