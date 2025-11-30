#!/usr/bin/env bash
set -e
echo "Installing Nvidia packages."

sudo pacman -Syu --noconfirm --disable-download-timeout \
  nvidia nvidia-utils nvidia-settings libglvnd \
  vulkan-icd-loader libva-nvidia-driver
