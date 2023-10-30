# Setup: Ubuntu

### update package manager
```bash
sudo apt update
sudo apt upgrade
```

### utils
```bash
sudo apt-get install -y curl wget make
sudo apt-get install -y gcc cmake
sudo apt-get install -y htop neofetch
```

### git
```bash
sudo apt-get install -y git
git config --global user.email ""
git config --global user.name $(whoami)
```

## Package Managers
### install snap package manager
```bash
sudo apt install snapd
```

## Shell
### zshell
```bash
sudo apt-get install -y zsh
chsh -s $(which zsh)

reboot
```

### oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Dev
### ruby
Less for rails, more for zsh
```bash
sudo apt-get install -y ruby
```

### rust
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup override set stable
rustup update stable
```

### java
```bash
sudo apt-get install default-jdk -y
```

### pyenv
```bash
sudo apt-get -y install make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.11.5
pyenv global 3.11.5
```

### nvm / npm / node
```bash
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.zshrc
nvm install node
```

### docker
Reference: https://docs.docker.com/engine/install/ubuntu/
```bash
# add docker official gpg key
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# add repo to apt sources
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# install docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# create docker group and add current user
sudo groupadd docker
sudo usermod -aG docker $USER
```

## Shell
### dotfiles
```bash
git clone https://www.github.com/jimcaine/dotfiles ~/.dotfiles
```

### neovim
Installing from snap store to get more up to date version than apt
```bash
sudo snap install nvim --classic

mkdir -p ~/.config
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
cp -r ~/.dotfiles/nvim ~/.config/nvim
```

### tmux
```bash
sudo apt get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.config
rm -rf ~/.config/tmux
cp -r ~/.dotfiles/tmux ~/.config/tmux
```

### alacritty
First, make sure that you installed Rust above!
```bash
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release

# (check if we need to run this)
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

cp -r ~/.dotfiles/alacritty ~/.config/alacritty
```

### nerd fonts
```bash
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
sudo fc-cache -fv
cd
```

## Gnome Desktop
### gnome tweaks
```bash
sudo add-apt-repository universe
sudo apt install -y gnome-tweaks
```

### gnome keyboard remappings
```bash
# mouse speed
gsettings set org.gnome.desktop.peripherals.mouse speed 1.0

# keyboard delay / speed
gsettings set org.gnome.desktop.peripherals.keyboard delay 226
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20

# window title bar
gsettings set org.gnome.desktop.wm.preferences button-layout "['appmenu:minmize,maximize,close']"

# swap ctrl and super keys
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swap_lwin_lctl']"

# ctrl t to swap applications
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Primary>Tab']"
gsettings set org.gnome.desktop.wm.keybindings cycle-group "['<Primary>grave']"

# workspace shuffle
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Left']"

# spotlight
gsettings set org.gnome.shell.keybindings toggle-application-view "['<Primary>space']"
```

### gnome extensions
```bash
sudo apt install -y gnome-extensions-app

pip3 install --upgrade gnome-extensions-cli

gext install 307 # https://extensions.gnome.org/extension/307/dash-to-dock/
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
gsettings set org.gnome.shell.extensions.dash-to-dock background-color "rgb(119,118,123)"
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode "FIXED"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.35

gext install 517 # https://extensions.gnome.org/extension/517/caffeine/
gsettings set org.gnome.shell.extensions.caffeine show-indicator "always"

gext install 615 # https://extensions.gnome.org/extension/615/appindicator-support/
gext install 1460 # https://extensions.gnome.org/extension/1460/vitals/
gext install 19 # https://extensions.gnome.org/extension/19/user-themes/
gext install 3193 # https://extensions.gnome.org/extension/3193/blur-my-shell/
gext install 4481 # https://extensions.gnome.org/extension/4481/forge/
gext install 3843 # https://extensions.gnome.org/extension/3843/just-perfection/
gext install 3396 # https://extensions.gnome.org/extension/3396/color-picker/
gext install 4158 # https://extensions.gnome.org/extension/4158/gnome-40-ui-improvements/

# gnome 44
# gext install 750 # https://extensions.gnome.org/extension/750/openweather/
# gext install 5721 # https://extensions.gnome.org/extension/5721/clipboard-indicator/
# gext install 5278 # https://extensions.gnome.org/extension/5278/pano/

# related flatpaks
flatpak install flathub io.github.realmazharhussain.GdmSettings # https://flathub.org/apps/io.github.realmazharhussain.GdmSettings

reboot
```

### hyprland
```bash
sudo apt-get install -y meson wget build-essential \
    ninja-build cmake-extras cmake gettext gettext-base \
    fontconfig libfontconfig-dev libffi-dev libxml2-dev \
    libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev \
    libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev \
    seatd libxcb-dri3-dev libvulkan-dev libvulkan-volk-dev \
    vulkan-validationlayers-dev libvkfft-dev libgulkan-dev \
    libegl-dev libgles2 libegl1-mesa-dev glslang-tools \
    libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev \
    libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev \
    libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev \
    libxcb-res0-dev libxcb-xinput-dev xdg-desktop-portal-wlr

sudo apt-get install -y meson wget build-essential ninja-build \
    cmake-extras cmake gettext gettext-base fontconfig \
    libfontconfig-dev libffi-dev libxml2-dev libdrm-dev \
    libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev \
    libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev \
    libvulkan-dev libvulkan-volk-dev  vulkan-validationlayers-dev \
    libvkfft-dev libgulkan-dev libegl-dev libgles2 libegl1-mesa-dev \
    glslang-tools libinput-bin libinput-dev libxcb-composite0-dev \
    libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 \
    libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev \
    libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev \
    xdg-desktop-portal-wlr hwdata-dev

mkdir -p ~/hyprland
cd ~/hyprland

wget https://github.com/hyprwm/Hyprland/releases/download/v0.24.1/source-v0.24.1.tar.gz
tar -xvf source-v0.24.1.tar.gz

wget https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.31/downloads/wayland-protocols-1.31.tar.xz
tar -xvJf wayland-protocols-1.31.tar.xz

wget https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz
tar -xzvJf wayland-1.22.0.tar.xz

wget https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.1.1/downloads/libdisplay-info-0.1.1.tar.xz
tar -xvJf libdisplay-info-0.1.1.tar.xz
```

## Networking
### openssh
Download and run Open SSH server: https://ubuntu.com/server/docs/service-openssh
```bash
sudo apt install -y openssh-client openssh-server
sudo systemctl restart sshd.service
```

### firewall - ufw
Update docker configuration to ensure iptables are not overwritten: https://stackoverflow.com/questions/30383845/what-is-the-best-practice-of-docker-ufw-under-ubuntu
Update file: /etc/docker/daemon.json
```json
{
    "iptables": false
}
```

Install and setup ufw: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-20-04
```bash
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow from <whitelist-ip>
```

## Applications
### thinkorswim
Make sure that (the correct) version of Java is installed.
Reference: https://www.howtoforge.com/how-to-install-thinkorswim-on-ubuntu/
```bash
cd ~/Downloads
curl https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.sh --output thinkorswim_installer.sh
bash thinkorswim_installer.sh
```

### WeBull
Reference: https://www.webull.com/introduce/desktop-native
```bash
cd ~/Downloads
wget -O webull.deb https://u1sfile.webullfintech.com/api/app/channel/download?url=https%3A%2F%2Fu1sweb.webullfintech.com%2Fus%2FWebull%20Desktop_6.12.5_global_x64signed.deb
sudo dpkg -i webull.deb
```

### Etcher
Reference: https://raspberrytips.com/install-balena-etcher-ubuntu/
```bash
curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' | sudo -E bash
sudo apt update
sudo apt install balena-etcher-electron
```

# aliases
```bash
alias watch-dconf='dconf watch /'
alias restart-gnome='killall -3 gnome-shell'
```
