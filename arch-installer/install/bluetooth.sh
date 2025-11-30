#!/usr/bin/env bash
set -e
echo "Installing bluetooth."

sudo pacman -Syu --noconfirm --disable-download-timeout \
  blueberry bluez bluez-utils
