#!/usr/bin/env bash
# ==============================================================
# Thinkorswim Installer for Arch Linux / Wayland / Hyprland
# Author: jimcaine dev + GPT-5
# Updated: 2025-11
# ==============================================================
# This script installs Zulu OpenJDK 21 (required), Thinkorswim,
# and creates a launcher entry.
# ==============================================================

set -e

INSTALL_DIR="$HOME/thinkorswim"
DESKTOP_FILE="$HOME/.local/share/applications/thinkorswim.desktop"
TOS_URL="https://download.thinkorswim.com/installer/thinkorswim_installer.sh"
TMP_INSTALLER="$HOME/Downloads/thinkorswim_installer.sh"

# --- Colors ---
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${GREEN}>>> Updating system and installing dependencies...${RESET}"
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm libxext libxrender libxtst gtk3 wget xdg-utils base-devel git

# --- Remove old Java if installed ---
if pacman -Q jre8-openjdk &>/dev/null; then
  echo -e "${YELLOW}>>> Removing old Java 8 runtime...${RESET}"
  sudo pacman -Rns --noconfirm jre8-openjdk
fi

# --- Install Zulu OpenJDK 21 ---
echo -e "${GREEN}>>> Installing Zulu OpenJDK 21 (required by Thinkorswim)...${RESET}"

if ! command -v yay &>/dev/null; then
  echo -e "${YELLOW}>>> 'yay' not found. Installing it temporarily...${RESET}"
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd -
fi

yay -S --noconfirm zulu-21-bin

# --- Verify and set Java version ---
echo -e "${GREEN}>>> Verifying Java installation...${RESET}"
java -version || { echo -e "${RED}Java 21 installation failed.${RESET}"; exit 1; }

sudo archlinux-java set zulu-21 || true

# --- Download Thinkorswim installer ---
echo -e "${GREEN}>>> Downloading Thinkorswim installer...${RESET}"
wget -O "$TMP_INSTALLER" "$TOS_URL"
chmod +x "$TMP_INSTALLER"

# --- Run the Thinkorswim installer ---
echo -e "${GREEN}>>> Running Thinkorswim installer...${RESET}"
sh "$TMP_INSTALLER"

# --- Verify install directory ---
if [ ! -d "$INSTALL_DIR" ]; then
  echo -e "${RED}!!! Thinkorswim install directory not found at $INSTALL_DIR${RESET}"
  echo "Please check the installer and rerun."
  exit 1
fi

# --- Create desktop entry ---
echo -e "${GREEN}>>> Creating launcher at $DESKTOP_FILE...${RESET}"
mkdir -p "$(dirname "$DESKTOP_FILE")"

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=Thinkorswim
Exec=env GDK_BACKEND=x11 $INSTALL_DIR/thinkorswim
Icon=$INSTALL_DIR/icon.png
Type=Application
Categories=Finance;
StartupNotify=true
EOF

update-desktop-database ~/.local/share/applications || true

echo -e "${GREEN}>>> Installation complete!${RESET}"
echo -e "You can now launch Thinkorswim from your app launcher or run:"
echo -e "${YELLOW}$INSTALL_DIR/thinkorswim${RESET}"

# --- Optional: prompt to run now ---
read -rp "Would you like to launch Thinkorswim now? (y/N): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
  echo -e "${GREEN}>>> Launching Thinkorswim...${RESET}"
  env GDK_BACKEND=x11 "$INSTALL_DIR/thinkorswim" &
else
  echo -e "${YELLOW}You can launch it later using:$RESET $INSTALL_DIR/thinkorswim"
fi
