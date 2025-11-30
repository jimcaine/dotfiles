#!/usr/bin/env bash
set -e
echo "Installing audio."

sudo pacman -Syu --noconfirm --disable-download-timeout \
  pipewire pipewire-alsa pipewire-pulse pavucontrol \
  wireplumber
