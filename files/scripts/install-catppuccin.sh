#!/bin/bash

set -ouex pipefail

# Définition des variables
THEME_NAME="Catppuccin-Mocha-Standard-Blue-Dark"
THEME_URL="https://github.com/catppuccin/gtk/releases/download/v1.0.3/Catppuccin-Mocha-Standard-Blue-Dark.zip"
DEST_DIR="/usr/share/themes"

echo "Downloading Catppuccin Theme..."
curl -L -o /tmp/theme.zip "$THEME_URL"

echo "Installing Theme..."
unzip -o /tmp/theme.zip -d "$DEST_DIR"
rm /tmp/theme.zip

# Correction des permissions
chmod -R 755 "$DEST_DIR/$THEME_NAME"

echo "Catppuccin Theme Installed Successfully!"
