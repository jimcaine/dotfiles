#/usr/bin/env bash
set -e

echo "Running Jimbros installer."
./install/fs-init.sh
./install/pacman-init.sh
./install/pacman-install-pkgs.sh
./install/git-init.sh
./install/rust-init.sh
./install/pyenv-init.sh
./install/nvm-init.sh
./install/yay-install.sh
./install/yay-install-pkgs.sh
./install/tmux-tpm-install.sh
./install/video-demo-files-download.sh
./install/tailwind-install.sh
./install/ollama-install.sh
./install/oh-my-zsh-install.sh
./install/thinkorswim.sh
