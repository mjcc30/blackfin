# Configuration automatique pour Exegol et Podman
# Ce fichier sera chargé au login de l'utilisateur

# 1. Définir le DOCKER_HOST pour que les outils comme Exegol croient parler à Docker
export DOCKER_HOST="unix:///run/user/$(id -u)/podman/podman.sock"

# 2. Alias utiles pour la cybersécurité
alias start-blackarch="distrobox enter blackarch"
alias msf="distrobox enter blackarch -- msfconsole"
