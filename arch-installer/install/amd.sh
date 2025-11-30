#!/usr/bin/env bash
set -e
echo "Installing AMD packages."

sudo pacman -Syu --noconfirm --disable-download-timeout \
  vulkan-radeon \
  libva-mesa-driver \
  mesa-vdpau \
  libvdpau-va-gl
