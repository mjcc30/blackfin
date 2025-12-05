#!/bin/bash

set -ouex pipefail

# Sensei Core V3 Installation
VERSION="v0.1.1"
URL="https://github.com/mjcc30/sensei-core/releases/download/${VERSION}/sensei-core-linux-x86_64.tar.gz"
INSTALL_DIR="/usr/libexec/sensei"
CONFIG_DIR="/etc/sensei"
BIN_DIR="/usr/bin"
SYSTEMD_DIR="/usr/lib/systemd/system"

echo "🥋 Installing Sensei Core ${VERSION} (Rust Edition)..."

# 1. Prepare Directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$CONFIG_DIR"
mkdir -p "$SYSTEMD_DIR"
mkdir -p /var/lib/sensei # Working dir for DB

# 2. Download & Extract
tmp_dir=$(mktemp -d)
curl -L -o "$tmp_dir/sensei.tar.gz" "$URL"
tar -xzf "$tmp_dir/sensei.tar.gz" -C "$tmp_dir"

# The archive contains a root folder like 'sensei-core-v0.1.1'
# We use find to locate it regardless of exact name
SRC_DIR=$(find "$tmp_dir" -maxdepth 1 -type d -name "sensei-core*")

echo "📂 Extracted to: $SRC_DIR"

# 3. Install Binaries
cp "$SRC_DIR/sensei-server" "$INSTALL_DIR/"
cp "$SRC_DIR/sensei-client" "$INSTALL_DIR/"

# 4. Install Configs
# Default prompts (example renamed to prompts.yaml in release)
if [ ! -f "$CONFIG_DIR/prompts.yaml" ]; then
    cp "$SRC_DIR/prompts.yaml" "$CONFIG_DIR/"
fi
# Env template (renamed to env)
if [ ! -f "$CONFIG_DIR/env" ]; then
    cp "$SRC_DIR/.env.example" "$CONFIG_DIR/env"
fi

# 5. Install Systemd Service
# Patch path to match our install location
sed -i "s|ExecStart=/usr/local/bin/sensei-server|ExecStart=$INSTALL_DIR/sensei-server|g" "$SRC_DIR/dist/sensei.service"
cp "$SRC_DIR/dist/sensei.service" "$SYSTEMD_DIR/"

# 6. Create Wrapper for CLI
cat <<EOF > "$BIN_DIR/sensei"
#!/bin/bash
# Sensei V3 Wrapper

# 1. User Override
if [ -f "\$HOME/.local/bin/sensei" ]; then
    exec "\$HOME/.local/bin/sensei" "\$@"
fi

# 2. System Client with Auto-Ask
# If the first argument is not a known subcommand, assume it's a query for 'ask'.
case "\$1" in
    ask|add|help|--help|-h|--version|-V|"")
        exec $INSTALL_DIR/sensei-client "\$@"
        ;;
    *)
        # Default to 'ask' command if no subcommand provided
        exec $INSTALL_DIR/sensei-client ask "\$@"
        ;;
esac
EOF

chmod +x "$BIN_DIR/sensei"

# 7. Permissions & Cleanup
chmod 755 "$INSTALL_DIR/sensei-server"
chmod 755 "$INSTALL_DIR/sensei-client"
chmod 600 "$CONFIG_DIR/env"
chmod 600 "$CONFIG_DIR/prompts.yaml"

rm -rf "$tmp_dir"

# Enable service (for next boot)
systemctl enable sensei.service

echo "✅ Sensei Core installed. Service enabled."
