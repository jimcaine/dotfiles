#!/usr/bin/env bash
set -e

echo "Installing AUR packages..."
yay -Syu --noconfirm \
yay -Syu --noconfirm \
  brightnessctl \
  dracula-gtk-theme \
  dracula-icons-git \
  hyprland \
  hyprlock \
  hyprshade \
  hyprshot \
  kclock \
  oh-my-posh \
  kweather \
  mako \
  nwg-dock-hyprland \
  polkit-gnome \
  python-pywal \
  rofi \
  slurp \
  swappy \
  swaybg \
  swaylock-effects \
  thunar \
  waybar \
  xdg-desktop-portal-hyprland \
  xfce4-settings
