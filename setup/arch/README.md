# Arch Installation & Setup
## Create Bootable USB
### Download The Iso
* Download iso from mirrors page: `https://archlinux.org/download/#download-mirrors`.
* Download `b2sums.txt` and signature files.
    * `b2sum -c b2sums.txt`

### Identify the drive
```bash
lsblk

# alternative
fdisk -l
```

### Unmount The Drive
```bash
export USB_PATH=/dev/sdX
umount ${USB_PATH}
```

### Create Bootable USB
```bash
export ISO_PATH=/path/to/archlinux.iso
export USB_PATH=/dev/sdX
sudo dd bs=4M if=${ISO_PATH} of=${USB_PATH} status=progress && sync
```

## Install
### Restart Into boot loader
```bash
sudo systemctl reboot --firmware-setup
```

### Connect to wifi
```bash
iwctl

# list devices
> device list
export DEVICE=wlan0

# scan for networks
> station $DEVICE scan

# list networks
> station $DEVICE get-networks
export DEVICE='<name-of-wifi-network>'

# connect to network - SSID will be the name of the network
> station $DEVICE connect $SSID

# exit
> exit
```

### Update `/etc/pacman.conf`
* Uncomment ParallelDownloads = 5.
* Uncomment Color
* Add ILoveCandy under the Misc options (`[options]`).


### Run `archinstall`
```bash
archinstall
```
* Choose local mirrors.
* Configure disk - use `btrfs` by default.
* Configure bootloader - use `Grub` by default.
* Update hostname.
* Set password.
* Create user.
* Do not select audio server for desktop - can try for laptop.
* Addition packages: `networkmanager vim`
* Network configuration: `NetworkManager`
* Update timezone
* Install
* Chroot and perform post-installation steps.



## Post Installation
### Connect to wifi
```bash
export WIFI_NAME=...
export WIFI_PASSWORD=...
nmcli device wifi connect ${WIFI_NAME} password ${WIFI_PASSWORD}
```


### Update system & install pacman packages
```bash
sudo pacman -Syu
```
* `-S` tells pacman to sync packages.
* `-y` refreshes the package database before updating.
* `-u` upgrades all packages to their latest versions.

```bash
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Syu --noconfirm git curl wget base-devel rustup go ruby \
  gcc g++ make cmake zsh unzip neofetch htop vim neovim man-db tldr \
  ripgrep tmux github-cli fzf docker xclip amd-ucode jq yq lazygit \
  cronie ffmpeg imagemagick mpv linux-firmware libva-utils openssh
```

##### AMD Ryzen
1. Install Hardware Video Decoding for AMD GPUs
You can improve video playback performance by enabling hardware acceleration for video decoding. For your AMD GPU, you can use the mesa and vdpau packages.

* Install mesa (for Vulkan and OpenGL).
* Install vdpau for video decoding.
* Install ffmpeg with hardware acceleration support.

2. Install the libva and vdpau Drivers for VAAPI (Video Acceleration API)
For AMD GPUs, you may want to ensure that VAAPI is supported, as it allows video playback applications to leverage hardware acceleration.

```bash
sudo pacman -Syu --noconfirm mesa vdpauinfo libva-mesa-driver
sudo pacman -Syu libva-mesa-driver
```

Check if hardware acceleration is working:
```bash
vainfo
```


```bash
chsh -s /usr/bin/zsh
reboot
```


### Bluetooth
```bash
# install packages
sudo pacman -S bluez bluez-utils

# enable and start bluetooth service
sudo systemctl enable --now bluetooth

# check bluetooth status
systemctl status bluetooth

# connect
bluetoothctl
> power on
> scan on
> pair <MAC_ADDRESS>
> trust <MAC_ADDRESS>
> connect <MAC_ADDRESS>
> exit
```


### Create keys
```bash
# ssh
ssh-keygen

# gpg
gpg --full-generate-key
```


### Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
rm ~/.zshrc
echo 'export EDITOR=nvim' >> $HOME/.zshrc
echo 'export XDG_CONFIG_HOME=~/.config' >> $HOME/.zshrc
echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/.zshrc
echo '\n' >> $HOME/.zshrc
echo 'source $HOME/.dotfiles/dotfiles/zsh/.zshrc-modules/.zshrc.oh-my-zsh' >> $HOME/.zshrc
```


### Configure git
```bash
git config --global init.defaultBranch main
git config --global user.email "jimcaine.dev@gmail.com"
git config --global user.name "Jim Caine"
```


### Download dotfiles
```bash
git clone https://github.com/jimcaine/dotfiles.git ~/.dotfiles
```


### Configure rust
```bash
rustup default stable

echo 'source $HOME/.dotfiles/dotfiles/zsh/.zshrc-modules/.zshrc.rust' >> $HOME/.zshrc
source $HOME/.zshrc
```


### Install python / pyenv
Pyenv:
```bash
curl https://pyenv.run | bash
echo 'source $HOME/.dotfiles/dotfiles/zsh/.zshrc-modules/.zshrc.pyenv' >> $HOME/.zshrc
source $HOME/.zshrc

pyenv install 3.12
pyenv global 3.12
```

Uv package manager:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```


### Install javascript / nvm
```bash
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
echo 'source $HOME/.dotfiles/dotfiles/zsh/.zshrc-modules/.zshrc.nvm' >> $HOME/.zshrc
source $HOME/.zshrc

nvm install 22
nvm use 22
```


### Install / Configure tpm
```bash
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
cp ~/.dotfiles/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

To download the plugins, enter a tmux session and press `<prefix>` + `I`.

### Configure Docker
```bash
sudo usermod -aG docker $USER
sudo systemctl start docker.service
sudo systemctl enable docker.service

# load changes
newgrp docker
```


### Download the AUR
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd -
rm -rf yay
yay -Syu --noconfirm
```


### Download Yay Dependencies
```bash
yay -Syu --noconfirm \
  kitty oh-my-posh hyprland waybar swaybg swaylock-effects rofi wlogout mako \
  thunar ttf-meslo-nerd-font-powerlevel10k ttf-jetbrains-mono-nerd noto-fonts-emoji \
  python-requests polkit-gnome swappy grim slurp pamixer brightnessctl gvfs \
  lxappearance xfce4-settings dracula-gtk-theme dracula-icons-git \
  xdg-desktop-portal-hyprland python-pywal hyprshade kclock kweather \
  brave-bin spotify webull-desktop
```


### Configure Dotfiles
```bash
mkdir -p $HOME/.config

rm -f $HOME/.tmux.conf || true
cp $HOME/.dotfiles/dotfiles/tmux/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.config/nvim || true
cp -r $HOME/.dotfiles/dotfiles/nvim $HOME/.config/nvim

rm -rf $HOME/.config/oh-my-posh || true
cp -r $HOME/.dotfiles/dotfiles/oh-my-posh $HOME/.config/oh-my-posh

rm -rf $HOME/.config/hypr || true
cp -r $HOME/.dotfiles/dotfiles/hypr $HOME/.config/hypr

rm -rf $HOME/.config/kitty || true
cp -r $HOME/.dotfiles/dotfiles/kitty $HOME/.config/kitty

rm -rf $HOME/.config/waybar || true
cp -r $HOME/.dotfiles/dotfiles/waybar $HOME/.config/waybar

rm -rf $HOME/.config/rofi || true
cp -r $HOME/.dotfiles/dotfiles/rofi $HOME/.config/rofi

rm -rf $HOME/.config/wlogout || true
cp -r $HOME/.dotfiles/dotfiles/wlogout $HOME/.config/wlogout
```


### Star Hyprland
```bash
reboot
exec Hyprland
```


### Configure Github
* Sign into github.com & add public key to ssh keys.
* Update remote in dotfiles to use ssh.
```bash
git remote -v
git remote set-url git@github.com:jimcaine/dotfiles
git remote -v
```
Install copilot:
```bash
gh auth login
gh extension install github/gh-copilot
```


### Google Cloud
Install:
```bash
mkdir -p $HOME/.local/bin
cd $HOME/.local/bin
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
rm google-cloud-cli-linux-x86_64.tar.gz
cd -
```

```bash
gcloud auth login
gcloud config set project <PROJECT_ID>
```


### Download Wallpapers
```bash
mkdir -p ~/.local/share
gsutil cp -r gs://elnoche/sys/.wallpapers ~/.local/share
mv ~/.local/share/.wallpapers ~/.local/share/wallpapers
```


### Configure SDDM
```bash
sudo pacman -S sddm qt5‑graphicaleffects qt5‑quickcontrols2 qt5‑svg
sudo systemctl enable sddm.service
sudo systemctl enable sddm.service --now # enable and logout

# themes
wget ... # download from site
sudo tar -xzvf sugar-candy.tar.gz
sudo cp -r sugar-candy /usr/share/sddm/themes
```
