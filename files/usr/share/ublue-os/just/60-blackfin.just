# Commandes spécifiques à Blackfin
# Ces commandes s'ajoutent à celles de Bluefin via 'just'

# Affiche l'aide de Blackfin
blackfin-help:
    @echo "🦈 Blackfin Custom Commands:"
    @echo "  just ask <query>        - Ask Sensei (AI Mentor) a question"
    @echo "  just cheat              - Show the Blackfin Cheatsheet (Commands & Tips)"
    @echo "  just blackfin-update    - Update System, Exegol and BlackArch"
    @echo "  just stealth-mode-on    - Randomize MAC, disable Logs & Bluetooth"
    @echo "  just stealth-mode-off   - Restore normal networking"
    @echo "  just install-seclists   - Download SecLists to ~/Wordlists"

# Afficher la Cheatsheet
cheat:
    @bat /usr/share/doc/blackfin/CHEATSHEET.md || cat /usr/share/doc/blackfin/CHEATSHEET.md

# Demander à l'IA (Sensei)
ask +query:
    @sensei {{query}}

# Mise à jour complète (Système + Outils)
blackfin-update:
    @echo "🔄 Updating Host System..."
    rpm-ostree upgrade
    @echo "🔄 Updating Flatpaks..."
    flatpak update -y
    @echo "🔄 Updating Exegol..."
    pipx upgrade exegol || echo "Exegol not installed via pipx"
    exegol update || echo "Exegol images update skipped"
    @echo "🔄 Updating BlackArch..."
    distrobox upgrade blackarch || echo "BlackArch container not found"

# Mode Furtif (Stealth)
stealth-mode-on:
    @echo "🥷 Engaging Stealth Mode..."
    # Randomize MAC address on all interfaces
    @sudo macchanger -r $(ip -o link show | awk -F': ' '{print $2}' | grep -v lo) || echo "Macchanger failed or interface not found"
    # Block Bluetooth
    @sudo rfkill block bluetooth
    @echo "✅ Stealth Mode Active: MAC Randomized, Bluetooth Blocked."

stealth-mode-off:
    @echo "👋 Disengaging Stealth Mode..."
    @sudo macchanger -p $(ip -o link show | awk -F': ' '{print $2}' | grep -v lo)
    @sudo rfkill unblock bluetooth
    @echo "✅ Normal Mode Restored."

# Installation de SecLists (Wordlists)
install-seclists:
    @echo "📚 Installing SecLists..."
    mkdir -p ~/Wordlists
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git ~/Wordlists/SecLists
    @echo "✅ SecLists installed in ~/Wordlists/SecLists"
