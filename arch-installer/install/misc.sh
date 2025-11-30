#!/usr/bin/env bash
set -e

echo "Installing base packages from official repositories..."
sudo pacman -Syu --noconfirm --disable-download-timeout \
  7zip \
  age \
  alsa-utils \
  chromium \
  cronie \
  docker \
  docker-compose \
  ffmpeg \
  firefox \
  gimp \
  gst-plugins-good \
  gst-plugins-bad \
  gst-plugins-ugly \
  gst-plugins-base \
  hunspell-en_us \
  imagemagick \
  libva-utils \
  mesa \
  mesa-utils \
  mpv \
  networkmanager \
  network-manager-applet \
  nm-connection-editor \
  nwg-look \
  obsidian \
  openssh \
  pamixer \
  reflector \
  rustup \
  sddm \
  sops \
  sqlitebrowser \
  thunderbird \
  wl-clipboard \
  xclip \
  zip \
  zsh

yay -Syu --noconfirm \
  chromium-widevine \
  grim \
  mongodb-compass-bin \
  sddm-theme-sugar-candy-git \
  spotify
