#!/usr/bin/env bash
set -e

echo "Creating directory structure..."
mkdir -p "$HOME"/.local/share/wallpapers
mkdir -p "$HOME"/.cargo/bin
mkdir -p "$HOME"/.tmux/plugins
mkdir -p "$HOME"/.age
mkdir -p "$HOME"/.sops
mkdir -p "$HOME"/.cache/wal
touch "$HOME"/.cache/wal/colors-waybar.css
