# Arch Linux Installer
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Executing setup.sh from $SCRIPT_DIR"

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
  zsh \
  neofetch \
  neovim \
  tldr

# install yay
bash $SCRIPT_DIR/_aur.sh

# install tmux plugins
bash $SCRIPT_DIR/_tmux.sh

# install dotfiles
bash $SCRIPT_DIR/_dotfiles.sh
