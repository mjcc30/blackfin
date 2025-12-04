# Outils de Reporting et CTF
# SysReptor, HackTheBox helpers

ctf-help:
    @echo "🚩 CTF & Reporting Commands:"
    @echo "  just install-sysreptor  - Deploy SysReptor (Pentest Reporting) via Podman"
    @echo "  just start-sysreptor    - Start SysReptor services"
    @echo "  just stop-sysreptor     - Stop SysReptor services"
    @echo "  just htb-vpn <file>     - Connect to HackTheBox VPN"
    @echo "  just thm-vpn <file>     - Connect to TryHackMe VPN"

# Déploiement de SysReptor (Version Docker/Podman)
install-sysreptor:
    @echo "📝 Installing SysReptor to ~/SysReptor..."
    mkdir -p ~/SysReptor
    cd ~/SysReptor && \
    curl -sO https://raw.githubusercontent.com/SysReptor/sysreptor/main/deploy/docker-compose.yml && \
    echo "✅ Configuration downloaded."
    @echo "🚀 Starting SysReptor (This may take a while to pull images)..."
    cd ~/SysReptor && podman-compose up -d
    @echo "✅ SysReptor is running!"
    @echo "   -> Access it at: http://localhost:8000"
    @echo "   -> Default User: sysreptor / sysreptor"

start-sysreptor:
    cd ~/SysReptor && podman-compose up -d
    @echo "✅ SysReptor started at http://localhost:8000"

stop-sysreptor:
    cd ~/SysReptor && podman-compose down
    @echo "🛑 SysReptor stopped."

# Helper HackTheBox VPN
htb-vpn file:
    @echo "🔌 Connecting to HackTheBox VPN..."
    @sudo openvpn --config {{file}} --daemon
    @echo "✅ VPN started in background."
    @echo "Waiting for IP..."
    @sleep 5
    @ip addr show tun0 | grep "inet " | awk '{print "   -> VPN IP: " $2}'

# Helper TryHackMe VPN
thm-vpn file:
    @echo "🔌 Connecting to TryHackMe VPN..."
    @sudo openvpn --config {{file}} --daemon
    @echo "✅ VPN started in background."
    @echo "Waiting for IP..."
    @sleep 5
    @ip addr show tun0 | grep "inet " | awk '{print "   -> VPN IP: " $2}'
