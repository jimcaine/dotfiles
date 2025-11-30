#!/usr/bin/env bash
set -e
echo "Installing base dependencies."

sudo pacman -Syu --noconfirm --disable-download-timeout \
  base-devel cmake gcc git go make jq ruby \
  unzip yq

yay -Syu --noconfirm \
  python-build python-pip python-requests python-setuptools \
  python-wheel
