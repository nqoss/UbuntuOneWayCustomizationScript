#!/bin/bash

# ----------------------------------------
# One-Way Ubuntu Customization Script
# Credits: nqss_ on Discord
# Discord: https://discord.gg/Wed58dnxT
# ----------------------------------------

set -e

echo "Starting one-way Ubuntu customization..."

# -----------------------------
# 1. SYSTEM UPDATE
# -----------------------------
sudo apt update && sudo apt upgrade -y

# -----------------------------
# 2. INSTALL CORE TOOLS
# -----------------------------
sudo apt install -y \
  gnome-tweaks \
  gnome-shell-extensions \
  chrome-gnome-shell \
  curl \
  git \
  wget \
  unzip \
  fonts-firacode \
  zsh \
  neofetch

# -----------------------------
# 3. ZSH + OH-MY-ZSH
# -----------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  chsh -s $(which zsh)
  RUNZSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# -----------------------------
# 4. TERMINAL BEAUTIFICATION
# -----------------------------
git clone https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k || true

sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# -----------------------------
# 5. THEMES & ICONS
# -----------------------------
mkdir -p ~/.themes ~/.icons

# Orchis GTK Theme
git clone https://github.com/vinceliuice/Orchis-theme.git /tmp/orchis
/tmp/orchis/install.sh -d ~/.themes

# Papirus Icons
sudo add-apt-repository ppa:papirus/papirus -y
sudo apt update
sudo apt install papirus-icon-theme -y

# -----------------------------
# 6. GNOME SETTINGS
# -----------------------------
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface font-name "Fira Code 11"
gsettings set org.gnome.desktop.interface monospace-font-name "Fira Code 12"
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface enable-animations true

# Dock tweaks
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 36

# -----------------------------
# 7. WALLPAPER
# -----------------------------
mkdir -p ~/Pictures/Wallpapers
wget -O ~/Pictures/Wallpapers/neo.jpg \
  https://images.unsplash.com/photo-1526401485004-2aa6b5cfc7c5

gsettings set org.gnome.desktop.background picture-uri \
  "file://$HOME/Pictures/Wallpapers/neo.jpg"

# -----------------------------
# 8. CLEANUP
# -----------------------------
sudo apt autoremove -y
sudo apt autoclean -y

# -----------------------------
# DONE
# -----------------------------
echo "Customization complete."
echo "Log out and log back in to see all changes."
echo "Run 'p10k configure' in terminal after login for prompt setup."
