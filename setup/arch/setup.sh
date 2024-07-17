# Arch Linux Installer
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Executing setup.sh from $SCRIPT_DIR in 5 seconds..."
sleep 5

# update sys
sudo pacman-key init
sudo pacman-key --populate archlinux

# install packages/apps
bash $SCRIPT_DIR/_pacman.sh
bash $SCRIPT_DIR/_go.sh
bash $SCRIPT_DIR/_javascript.sh
bash $SCRIPT_DIR/_python.sh
bash $SCRIPT_DIR/_rust.sh
bash $SCRIPT_DIR/_aur.sh
bash $SCRIPT_DIR/_tpm.sh
bash $SCRIPT_DIR/_oh-my-zsh.sh
bash $SCRIPT_DIR/_tailwindcss.sh

# symlink dot files
bash $SCRIPT_DIR/_dotfiles.sh

# update system to use zsh on reboot
chsh -s $(which zsh)

# reboot
echo "Rebooting in 5 seconds..."
sleep 5
sudo reboot
