#!/usr/bin/env bash
set -e
echo "Installing fonts."

sudo pacman -Syu --noconfirm --disable-download-timeout \
  noto-fonts noto-fonts-cjk ttf-meslo-nerd

yay -Syu --noconfirm \
  noto-fonts-emoji ttf-jetbrains-mono-nerd \
  ttf-meslo-nerd-font-powerlevel10k
