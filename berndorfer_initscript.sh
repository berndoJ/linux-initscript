#!/bin/bash

# Create temp folder for this installation script
mkdir -p /tmp/berndorferinit

# Add comment to .bashrc
echo "# Berndorfer Install Script" >> ~/.bashrc

# Install software-properties-common for add-apt-repository
sudo apt install -y software-properties-common

# --- APT REPOSITORIES AND KEYS ---
# KiCad
sudo add-apt-repository --yes ppa:kicad/kicad-5.1-releases
# WineHQ
#wget -nc https://dl.winehq.org/wine-builds/winehq.key -P /tmp/berndorferinit
#sudo apt-key add /tmp/berndorferinit/winehq.key
#sudo add-apt-repository --yes 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
# Google Drive Ocamlfuse
sudo add-apt-repository --yes ppa:alessandro-strada/ppa
# KeePass 2
sudo add-apt-repsoitory --yes ppa:jtaylor/keepass

# --- APT PACKAGES ---
sudo apt update
# VIM
sudo apt install -y vim
# Snap Package Manager
sudo apt install -y snapd
echo "export PATH="$'\x24'"PATH':/snap/bin'" >> ~/.bashrc
# GIT
sudo apt install -y git
# Net-Tools
sudo apt install -y net-tools
# KiCad
sudo apt install --install-recommends -y kicad
# WineHQ
#sudo apt install --install-recommends -y winehq-stable
# Google Drive Ocamlfuse
sudo apt install -y google-drive-ocamlfuse
echo "Please enter google drive account information. Script will proceed after recieveing auth token."
google-drive-ocamlfuse
mkdir ~/Google-Drive
google-drive-ocamlfuse ~/Google-Drive
# KeePass 2
sudo apt install -y keepass2

# --- SNAP PACKAGES ---
# VS-Code
sudo snap install code --classic
# VLC Media Player
sudo snap install vlc
# GNU Image Manipulation Program
sudo snap install gimp
# Inkscape
sudo snap install inkscape
# Okular
sudo snap install okular
# FreeCAD
sudo snap install freecad
# LibreOffice
sudo snap install libreoffice
# Spotify
sudo snap install spotify
# Mailspring
sudo snap install mailspring

# --- .DEB PACKAGES ---
# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/berndorferinit/
sudo apt install -y -f /tmp/berndorferinit/google-chrome-stable_current_amd64.deb

# Apply .bashrc
source ~/.bashrc

# Remove temp folder
rm -rf /tmp/berndorferinit
