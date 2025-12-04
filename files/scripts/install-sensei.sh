#!/bin/bash

set -ouex pipefail

# Installation de Sensei (AI Mentor)
# Source: https://github.com/mjcc30/sensei

INSTALL_DIR="/usr/share/sensei"
BIN_DIR="/usr/bin"

echo "🥋 Installing Sensei..."

# 1. Cloner le projet (récupérer les tags)
git clone https://github.com/mjcc30/sensei.git "$INSTALL_DIR"
cd "$INSTALL_DIR"

# 2. Checkout de la dernière version stable (Tag)
# git rev-list renvoie les hash, git describe trouve le tag
LATEST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
echo "📌 Checkout version: $LATEST_TAG"
git checkout "$LATEST_TAG"

# 3. Installer les dépendances avec UV (dans un venv isolé)
cd "$INSTALL_DIR"
uv sync --frozen

# 4. Créer le wrapper executable
# Ce script sera exécuté par l'utilisateur final.
cat <<EOF > "$BIN_DIR/sensei"
#!/bin/bash

# 1. Check for user-updated version (Self-Update mechanism)
USER_BIN="\$HOME/.local/bin/sensei"
if [ -f "\$USER_BIN" ]; then
    exec "\$USER_BIN" "\$@"
fi

# 2. System Version fallback
# Load API Key from config if not exported
export GEMINI_API_KEY="\${GEMINI_API_KEY:-\$(cat \$HOME/.config/blackfin/sensei_key 2>/dev/null)}"

# Change directory to ensure python imports work
cd "$INSTALL_DIR"

# Execute Sensei as a module
exec uv run -m app.main "\$@"
EOF

chmod +x "$BIN_DIR/sensei"

echo "✅ Sensei installed successfully!"