#!/usr/bin/env bash
set -e

echo "Installing yay AUR helper..."
if ! command -v yay &> /dev/null; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd -
  rm -rf /tmp/yay
fi
yay -Syu --noconfirm
