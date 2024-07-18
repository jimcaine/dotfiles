#!/usr/bin/bash
# Arch Linux Installer

ARCH_MODULES=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
COMMON_MODULES="${ARCH_MODULES}/../common"
echo "Arch modules dir: $ARCH_MODULES"
echo "Common modules dir: ${COMMON_MODULES}"

echo "Executing setup.sh in 5 seconds..."
sleep 5

# update sys
sudo pacman-key init
sudo pacman-key --populate archlinux

# install packages/apps
bash $ARCH_MODULES/_pacman.sh
bash $ARCH_MODULES/_go.sh
bash $ARCH_MODULES/_javascript.sh
bash $ARCH_MODULES/_python.sh
bash $COMMON_MODULES/_rust.sh
bash $ARCH_MODULES/_aur.sh
bash $ARCH_MODULES/_tpm.sh
bash $ARCH_MODULES/_oh-my-zsh.sh
bash $ARCH_MODULES/_tailwindcss.sh

# symlink dot files
bash $ARCH_MODULES/_dotfiles.sh

# update system to use zsh on reboot
chsh -s $(which zsh)

# reboot
echo "Rebooting in 5 seconds..."
sleep 5
sudo reboot
