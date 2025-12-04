#!/bin/bash

set -ouex pipefail

# Installation de Sensei (AI Mentor)
# Source: https://github.com/mjcc30/sensei

INSTALL_DIR="/usr/share/sensei"
BIN_DIR="/usr/bin"

echo "🥋 Installing Sensei..."

# 1. Cloner le projet
git clone https://github.com/mjcc30/sensei.git "$INSTALL_DIR"

# 2. Installer les dépendances avec UV (dans un venv isolé)
# On suppose que 'uv' est déjà installé dans l'image (via recipe.yml)
cd "$INSTALL_DIR"
uv sync --frozen

# 3. Créer le wrapper executable
# Ce script lance Sensei en utilisant son propre environnement virtuel
cat <<EOF > "$BIN_DIR/sensei"
#!/bin/bash
export GEMINI_API_KEY="\${GEMINI_API_KEY:-\$(cat \$HOME/.config/blackfin/sensei_key 2>/dev/null)}"

if [ -z "\$GEMINI_API_KEY" ]; then
    echo "⚠️  Sensei needs an API Key."
    echo "Get one at: https://aistudio.google.com/app/apikey"
    read -p "Paste it here: " KEY
    mkdir -p \$HOME/.config/blackfin
    echo "\$KEY" > \$HOME/.config/blackfin/sensei_key
    chmod 600 \$HOME/.config/blackfin/sensei_key
    export GEMINI_API_KEY="\$KEY"
fi

cd $INSTALL_DIR
# Lance main.py avec l'argument 'ask' si des arguments sont fournis, sinon 'chat'
if [ \$# -eq 0 ]; then
    uv run main.py chat
else
    uv run main.py ask "\$*"
fi
EOF

chmod +x "$BIN_DIR/sensei"

echo "✅ Sensei installed successfully!"
