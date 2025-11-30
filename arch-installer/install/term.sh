#!/usr/bin/env bash
set -e
echo "Installing terminal utilities."

sudo pacman -Syu --noconfirm --disable-download-timeout \
  bat btop cmatrix curl fzf github-cli htop man-db neovim ripgrep \
  tldr tmux tree vim wget yazi zoxide zsh

yay -Syu --noconfirm \
  google-cloud-cli google-cloud-cli-gsutil \
  kitty lazygit neofetch oh-my-posh tmuxinator
