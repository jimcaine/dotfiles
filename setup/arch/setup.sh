#!/usr/bin/env bash
set -euo pipefail

# Arch Linux Installer

# Check if running as root (should not be)
if [[ $EUID -eq 0 ]]; then
   echo "This script must NOT be run as root" 
   exit 1
fi

# User configuration
echo "=== Arch Linux Setup Configuration ==="
echo ""

while [[ -z "${GIT_EMAIL:-}" ]]; do
  read -rp "Enter your Git email: " GIT_EMAIL
  if [[ ! "$GIT_EMAIL" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Invalid email format. Please try again."
    GIT_EMAIL=""
  fi
done

while [[ -z "${GIT_NAME:-}" ]]; do
  read -rp "Enter your Git username: " GIT_NAME
done

# Confirm configuration with user
echo ""
echo "=== Configuration Summary ==="
echo "Git Email: $GIT_EMAIL"
echo "Git Name: $GIT_NAME"
echo ""
read -rp "Is this correct? (y/n): " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo "Setup cancelled. Please run the script again."
  exit 0
fi

echo ""
echo "Starting setup in 5 seconds... (Ctrl+C to cancel)"
sleep 5

# Log file for debugging
LOGFILE="$HOME/arch-setup-$(date +%Y%m%d-%H%M%S).log"
echo "Logging to: $LOGFILE"
exec > >(tee -a "$LOGFILE") 2>&1

echo "=== Starting Arch Linux Setup ==="

# Initialize file system structure
echo "Creating directory structure..."
mkdir -p "$HOME"/.local/share/wallpapers
mkdir -p "$HOME"/.cargo/bin
mkdir -p "$HOME"/.tmux/plugins
mkdir -p "$HOME"/.age
mkdir -p "$HOME"/.sops
mkdir -p "$HOME"/.cache/wal
touch "$HOME"/.cache/wal/colors-waybar.css

# Update & configure pacman package manager
echo "Updating pacman and initializing keyring..."
sudo pacman -Syu --noconfirm
sudo pacman-key --init
sudo pacman-key --populate archlinux

# Install pacman packages
echo "Installing base packages from official repositories..."
sudo pacman -Syu --noconfirm \
  age \
  alsa-utils \
  base-devel \
  bat \
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
  network-manager-applet \
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
  reflector \
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
  zip \
  zsh

# Configure git
echo "Configuring git..."
git config --global init.defaultBranch main
git config --global user.name "${GIT_NAME}"
git config --global user.email "${GIT_EMAIL}"
git config --global color.ui auto

# Setup rust
echo "Setting up Rust..."
rustup default stable

# Install pyenv / python
echo "Installing pyenv and Python 3.12..."
if ! command -v pyenv &> /dev/null; then
  curl https://pyenv.run | bash
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

if ! pyenv versions | grep -q "3.12"; then
  pyenv install 3.12
fi
pyenv global 3.12
pip install --upgrade pip
pip install build cython pytoml pyyaml setuptools virtualenv wheel
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install nvm / npm / node
echo "Installing nvm, Node.js, and npm..."
if [[ ! -d "$HOME/.nvm" ]]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install --lts
nvm use --lts
npm install -g npm
npm install -g yarn

# Install tpm (tmux plugin manager)
echo "Installing tmux plugin manager..."
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Install yay package manager
echo "Installing yay AUR helper..."
if ! command -v yay &> /dev/null; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd -
  rm -rf /tmp/yay
fi
yay -Syu --noconfirm

# Download yay packages
echo "Installing AUR packages..."
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
  polkit-gnome \
  python-build \
  python-pip \
  python-pywal \
  python-requests \
  python-setuptools \
  python-wheel \
  rofi \
  sddm-theme-sugar-candy-git \
  slurp \
  spotify \
  swappy \
  swaybg \
  swaylock-effects \
  thunar \
  tmuxinator \
  ttf-jetbrains-mono-nerd \
  ttf-meslo-nerd-font-powerlevel10k \
  waybar \
  xdg-desktop-portal-hyprland \
  xfce4-settings

# Pull dotfiles
echo "Cloning and configuring dotfiles..."
if [[ ! -d "$HOME/.dotfiles" ]]; then
  git clone https://github.com/jimcaine/dotfiles.git "$HOME/.dotfiles"
fi

# Copy configuration files
cp -r "$HOME/.dotfiles/dotfiles/hypr" "$HOME/.config/"
cp -r "$HOME/.dotfiles/dotfiles/kitty" "$HOME/.config/"
cp -r "$HOME/.dotfiles/dotfiles/nvim" "$HOME/.config/"
cp -r "$HOME/.dotfiles/dotfiles/nwg-dock-hyprland" "$HOME/.config/"
cp -r "$HOME/.dotfiles/dotfiles/oh-my-posh" "$HOME/.config/"
cp -r "$HOME/.dotfiles/dotfiles/rofi" "$HOME/.config/"
cp -r "$HOME/.dotfiles/dotfiles/sddm" "$HOME/.config/"
cp -r "$HOME/.dotfiles/dotfiles/waybar" "$HOME/.config/"
cp -r "$HOME/.dotfiles/dotfiles/zsh" "$HOME/.config/"
cp "$HOME/.dotfiles/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"
cp "$HOME/.dotfiles/dotfiles/desktopapp/*.desktop" "$HOME/.local/share/applications/"
cp "$HOME/.dotfiles/dotfiles/wallpaper/"* "$HOME/.local/share/wallpapers/"
cp "$HOME/.dotfiles/assets/icons/"* "$HOME/.local/share/icons/"
cp "$HOME/.dotfiles/dotfiles/zsh/.zshrc" "$HOME/.zshrc"

# Copy SDDM configuration (requires sudo)
sudo cp "$HOME/.dotfiles/dotfiles/sddm/sddm.conf" /etc/sddm.conf
if [[ -f "$HOME/.dotfiles/dotfiles/sddm/themes/sugar-candy.conf" ]]; then
  sudo cp "$HOME/.dotfiles/dotfiles/sddm/themes/sugar-candy.conf" /usr/share/sddm/themes/Sugar-Candy/theme.conf
fi
if [[ -f "$HOME/.dotfiles/dotfiles/wallpaper/winter-bison.jpg" ]]; then
  sudo cp "$HOME/.dotfiles/dotfiles/wallpaper/winter-bison.jpg" /usr/share/sddm/themes/Sugar-Candy/Backgrounds/WinterBison.jpg
fi

# Enable services
echo "Enabling system services..."
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now docker
sudo systemctl enable --now cronie
sudo systemctl enable sddm

# PipeWire (replaces PulseAudio)
systemctl --user enable --now pipewire.service
systemctl --user enable --now pipewire-pulse.service
systemctl --user enable --now wireplumber.service

# Set up docker group
echo "Adding user to docker group..."
sudo usermod -aG docker "$USER"
echo "NOTE: You'll need to log out and back in for docker group to take effect"

# Set default browser
echo "Setting default browser..."
xdg-settings set default-web-browser firefox.desktop

# Rebuild font cache
echo "Rebuilding font cache..."
fc-cache -fv

# Change default shell to zsh
echo "Setting default shell to zsh..."
if command -v zsh &> /dev/null; then
  chsh -s "$(which zsh)"
  echo "Default shell changed to zsh. Will take effect after reboot/re-login."
else
  echo "WARNING: zsh not found, skipping shell change"
fi

# Optional: Generate SSH and GPG keys
echo ""
read -rp "Generate SSH key? (y/n): " gen_ssh
if [[ "$gen_ssh" =~ ^[Yy]$ ]]; then
  if [[ ! -f "$HOME/.ssh/id_ed25519" ]]; then
    ssh-keygen -t ed25519 -C "${GIT_EMAIL}"
    echo "SSH key generated. Add to GitHub/GitLab:"
    cat "$HOME/.ssh/id_ed25519.pub"
  else
    echo "SSH key already exists, skipping..."
  fi
fi

echo ""
read -rp "Generate GPG key? (y/n): " gen_gpg
if [[ "$gen_gpg" =~ ^[Yy]$ ]]; then
  if ! gpg --list-secret-keys | grep -q "$GIT_EMAIL"; then
    gpg --full-generate-key
  else
    echo "GPG key for $GIT_EMAIL already exists, skipping..."
  fi
fi

# Optional: GitHub Copilot CLI
echo ""
read -rp "Install GitHub Copilot CLI extension? (requires gh auth) (y/n): " install_copilot
if [[ "$install_copilot" =~ ^[Yy]$ ]]; then
  gh extension install github/gh-copilot || echo "Failed to install gh-copilot. You may need to run 'gh auth login' first."
fi


echo ""
echo "=== Setup Complete ==="
echo "Log file saved to: $LOGFILE"
echo ""
echo "IMPORTANT NEXT STEPS:"
echo "1. Log out and back in for docker group to take effect"
echo "2. If you generated an SSH key, add it to GitHub/GitLab"
echo "3. Run 'gh auth login' if you want to use GitHub CLI"
echo ""
read -rp "Reboot now? (y/n): " do_reboot
if [[ "$do_reboot" =~ ^[Yy]$ ]]; then
  echo "Rebooting in 5 seconds..."
  sleep 5
  reboot
else
  echo "Setup complete! Reboot when ready."
fi
