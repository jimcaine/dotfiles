#!/usr/bin/env bash
set -e

echo "Updating pacman and initializing keyring..."
sudo pacman -Syu --noconfirm
sudo pacman-key --init
sudo pacman-key --populate archlinux
