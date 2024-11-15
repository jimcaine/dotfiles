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
sudo pacman -Syu --noconfirm git curl wget base-devel rustup go ruby \
  gcc g++ make cmake zsh unzip neofetch htop vim neovim man-db tldr \
  ripgrep tmux github-cli fzf docker xclip amd-ucode jq yq lazygit \
  cronie ffmpeg imagemagick mpv linux-firmware libva-utils openssh \
  bluez bluez-utils sddm noto-fonts noto-fonts-cjk chromium nwg-look \
  gimp yazi sqlitebrowser

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

# ...
./$ARCH_MODULES/_rust.sh
./$ARCH_MODULES/_python.sh
./$ARCH_MODULES/_uv.sh
./$ARCH_MODULES/_javascript.sh
./$ARCH_MODULES/_tpm.sh
./$ARCH_MODULES/_docker.sh
./$ARCH_MODULES/_gcloud.sh
./$ARCH_MODULES/_aur.sh

yay -Syu --noconfirm \
  kitty oh-my-posh hyprland waybar swaybg swaylock-effects rofi wlogout mako \
  thunar ttf-meslo-nerd-font-powerlevel10k ttf-jetbrains-mono-nerd noto-fonts-emoji \
  python-requests polkit-gnome swappy grim slurp pamixer brightnessctl gvfs \
  xfce4-settings dracula-gtk-theme dracula-icons-git \
  xdg-desktop-portal-hyprland python-pywal hyprshade kclock kweather \
  brave-bin spotify webull-desktop nwg-dock-hyprland hyprshot hyprlock

./$ARCH_MODULES/_dotfiles.sh


reboot
exec Hyprland

git remote -v
git remote set-url git@github.com:jimcaine/dotfiles
git remote -v
