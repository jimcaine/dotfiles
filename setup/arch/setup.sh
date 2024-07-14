# Arch Linux Installer
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Executing setup.sh from $SCRIPT_DIR in 5 seconds..."
sleep 5

# update sys
sudo pacman-key init
sudo pacman-key --populate archlinux

# install base packages
sudo pacman -Syu --noconfirm \
  git \
  base-devel \
  curl \
  wget \
  make \
  gcc \
  cmake \
  htop \
  ruby \
  unzip \
  neofetch \
  neovim \
  tldr

# install yay
bash $SCRIPT_DIR/_aur.sh

# install zsh
bash $SCRIPT_DIR/_zsh.sh

# install tmux plugins
bash $SCRIPT_DIR/_tmux.sh

# install dotfiles
bash $SCRIPT_DIR/_dotfiles.sh

# reboot
echo "Rebooting in 5 seconds..."
sleep 5
sudo reboot
