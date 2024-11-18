#!/usr/bin/bash
# Arch Linux Installer
WIFI_NAME=
WIFI_PASSWORD=
GIT_EMAIL=
GIT_NAME=
ARCH_MODULES=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
COMMON_MODULES="${ARCH_MODULES}/../common"
echo "Arch modules dir: $ARCH_MODULES"
echo "Common modules dir: ${COMMON_MODULES}"

echo "Executing setup.sh in 5 seconds..."
sleep 5

nmcli device wifi connect ${WIFI_NAME} password ${WIFI_PASSWORD}
sleep 5

# update sys
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Syu --noconfirm \
  git \
  curl \
  wget \
  base-devel \
  rustup \
  go \
  ruby \
  gcc \
  g++ \
  make \
  cmake \
  noto-fonts \
  noto-fonts-cjk \
  openssh \
  bluez \
  bluez-utils \
  zsh \
  tree \
  neofetch \
  htop \
  vim \
  neovim \
  lazygit \
  fzf \
  jq \
  yq \
  man-db \
  tldr \
  github-cli \
  tmux \
  cronie \
  unzip \
  xclip \
  docker \
  docker-compose \
  ripgrep \
  linux-firmware \
  amd-ucode \
  libva-utils \
  ffmpeg \
  imagemagick \
  mpv \
  sddm \
  chromium \
  nwg-look \
  gimp \
  yazi \
  sqlitebrowser

# configure git
git config --global init.defaultBranch main
git config --global user.email ${GIT_EMAIL}
git config --global user.name ${GIT_NAME}

# download dotfiles
git clone https://github.com/jimcaine/dotfiles.git ~/.dotfiles

# generate keys
./$COMMON_MODULES/_gen_key_ssh.sh
./$COMMON_MODULES/_gen_key_gpg.sh

# zsh / reboot
./$COMMON_MODULES/_zsh.sh
chsh -s /usr/bin/zsh
reboot

echo 'source $HOME/.config/zsh/arch.zshrc' >> $HOME/.zshrc
./$ARCH_MODULES/_rust.sh
./$ARCH_MODULES/_python.sh
./$ARCH_MODULES/_uv.sh
./$ARCH_MODULES/_javascript.sh
./$ARCH_MODULES/_tpm.sh
./$ARCH_MODULES/_docker.sh
./$ARCH_MODULES/_gcloud.sh
./$ARCH_MODULES/_aur.sh

yay -Syu --noconfirm \
  kitty \
  oh-my-posh \
  sonar-scanner \
  python-requests \
  hyprland \
  nwg-dock-hyprland \
  hyprshot \
  hyprlock \
  hyprshade \
  xdg-desktop-portal-hyprland \
  rofi \
  waybar \
  swaybg \
  swaylock-effects \
  wlogout \
  mako \
  thunar \
  ttf-meslo-nerd-font-powerlevel10k \
  ttf-jetbrains-mono-nerd noto-fonts-emoji \
  polkit-gnome \
  swappy \
  grim \
  slurp \
  pamixer \
  brightnessctl \
  gvfs \
  xfce4-settings \
  dracula-gtk-theme \
  dracula-icons-git \
  python-pywal \
  brave-bin \
  spotify \
  webull-desktop

./$ARCH_MODULES/_dotfiles.sh


reboot
exec Hyprland

git remote -v
git remote set-url git@github.com:jimcaine/dotfiles
git remote -v
