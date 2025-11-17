#!/usr/bin/env bash
set -euo pipefail

# Arch Linux Installer

# user config
while [[ -z "$GIT_EMAIL" ]]; do
  read -rp "Enter your Git email: " GIT_EMAIL
done

while [[ -z "$GIT_NAME" ]]; do
  read -rp "Enter your Git username: " GIT_NAME
done

# confirm to user that setup is starting
echo "Git Email: $GIT_EMAIL"
echo "Git Name: $GIT_NAME"
echo "Executing setup.sh in 5 seconds..."
sleep 5

# initialize file system structure
mkdir -p $HOME/.local/share/wallpapers
mkdir -p $HOME/.cargo/bin
mkdir -p $HOME/.tmux/plugins
mkdir -p $HOME/.age
mkdir -p $HOME/.sops
mkdir -p $HOME/.cache/wal
touch $HOME/.cache/wal/colors-waybar.css

# update & configure pacman package manager
sudo pacman -Syu
sudo pacman-key --init
sudo pacman-key --populate archlinux

# install pacman packages
sudo pacman -Syu --noconfirm \
  age \
  alsa-utils \
  base-devel \
  blueman \
  bluez \
  bluez-utils \
  btop \
  chromium \
  cmake \
  cmatrix \
  cronie \
  curl \
  docker \
  docker-compose \
  ffmpeg \
  firefox \
  fzf \
  gcc \
  gimp \
  git \
  github-cli \
  go \
  gst-plugins-good \
  gst-plugins-bad \
  gst-plugins-ugly \
  gst-plugins-base \
  htop \
  hunspell-en_us \
  imagemagick \
  jq \
  libva-mesa-driver \
  libva-utils \
  libvdpau-va-gl \
  make \
  man-db \
  mesa \
  mesa-vdpau \
  mesa-utils \
  mpv \
  neovim \
  networkmanager \
  networkmanager-applet \
  nm-connection-editor \
  noto-fonts \
  noto-fonts-cjk \
  nwg-look \
  obsidian \
  ollama \
  openssh \
  pamixer \
  pavucontrol \
  pipewire \
  pipewire-alsa \
  pipewire-pulse \
  ripgrep \
  ruby \
  rustup \
  sddm \
  sops \
  sqlitebrowser \
  thunderbird \
  tldr \
  tmux \
  tree \
  ttf-meslo-nerd \
  unzip \
  vdpauinfo \
  vim \
  vulkan-radeon \
  wget \
  wireplumber \
  wl-clipboard \
  xclip \
  yazi \
  yq \
  zsh

# configure git
git config --global init.defaultBranch main
git config --global user.name ${GIT_NAME}
git config --global user.email ${GIT_EMAIL}
git config --global color.ui auto

# setup rust
rustup default stable

# install pyenv / python
curl https://pyenv.run | bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
pyenv install 3.12
pyenv global 3.12
pip install --upgrade pip
pip install build cython pytoml pyyaml setuptools virtualenv wheel
curl -LsSf https://astral.sh/uv/install.sh | sh

# install nvm / npm / node
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install --lts
nvm use --lts
npm install -g npm
npm install -g yarn

# install tpm (tmux plugin manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install yay package manager
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd -
rm -rf yay
yay -Syu --noconfirm

# download yay packages
yay -Syu --noconfirm \
  brightnessctl \
  chromium-widevine \
  dracula-gtk-theme \
  dracula-icons-git \
  google-cloud-cli \
  google-cloud-cli-gsutil \
  grim \
  hyprland \
  hyprlock \
  hyprshade \
  hyprshot \
  kclock \
  kitty \
  kweather \
  lazygit \
  mako \
  mongodb-compass-bin \
  neofetch \
  noto-fonts-emoji \
  nwg-dock-hyprland \
  oh-my-posh \
  pamixer \
  polkit-gnome \
  python-build \
  python-pip \
  python-pywal \
  python-requests \
  python-setuptools \
  python-wheel \
  rofi \
  sddm-theme-sugar-candy-git \
  sddm-theme-greenleaf \
  slurp \
  spotify \
  swappy \
  swaybg \
  swaylock-effects \
  thunar \
  ttf-jetbrains-mono-nerd \
  ttf-meslo-nerd-font-powerlevel10k \
  waybar \
  webull-desktop \
  xdg-desktop-portal-hyprland \
  xfce4-settings

# pull dotfiles
git clone https://github.com/jimcaine/dotfiles.git ~/.dotfiles
cp -r ~/.dotfiles/dotfiles/hypr $HOME/.config/hypr
cp -r ~/.dotfiles/dotfiles/kitty $HOME/.config/kitty
cp -r ~/.dotfiles/dotfiles/nvim $HOME/.config/nvim
cp -r ~/.dotfiles/dotfiles/nwg-dock-hyprland $HOME/.config/nwg-dock-hyprland
cp -r ~/.dotfiles/dotfiles/oh-my-posh $HOME/.config/oh-my-posh
cp -r ~/.dotfiles/dotfiles/rofi $HOME/.config/rofi
cp -r ~/.dotfiles/dotfiles/sddm $HOME/.config/sddm
cp -r ~/.dotfiles/dotfiles/waybar $HOME/.config/waybar
cp -r ~/.dotfiles/dotfiles/zsh $HOME/.config/zsh
cp ~/.dotfiles/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
cp ~/.dotfiles/dotfiles/wallpaper/* $HOME/.local/share/wallpapers/
sudo cp ~/.dotfiles/dotfiles/sddm/sddm.conf /etc/sddm.conf
sudo cp ~/.dotfiles/dotfiles/sddm/themes/sugar-candy.conf /usr/share/sddm/themes/Sugar-Candy/theme.conf
sudo cp ~/.dotfiles/dotfiles/wallpaper/winter-bison.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds/WinterBison.jpg

# enable services
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now docker
sudo systemctl enable --now cronie
sudo systemctl enable sddm
sudo systemctl enable containerd.service
systemctl --user enable pulseaudio.service
systemctl --user enable pulseaudio.socket
systemctl --user start pulseaudio.service
systemctl --user start pulseaudio.socket

# set up docker
sudo usermod -aG docker $USER

# set up gh copilot extension
gh extension install github/co-pilot

# set default browser
xdg-settings set default-web-browser firefox.desktop

# rebuild font cache
fc-cache -fv

# generate keys
ssh-keygen -t ed25519 -C "${GIT_EMAIL}"
gpg --full-generate-key

# configure zsh
cp -r ~/.dotfiles/dotfiles/zsh/.zshrc $HOME/.zshrc

# reboot system
reboot
