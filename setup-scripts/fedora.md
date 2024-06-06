# Setup: Fedora (v39)

## update package manager
```bash
sudo dnf update
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

## zshell
```bash
sudo dnf install -y zsh
chsh -s $(which zsh)
```

### LOGOUT ###

## essentials
```bash
sudo dnf install -y curl wget make gcc cmake neofetch htop \
    ruby gcc-c++ tldr
```

## nerd fonts
```bash
sudo mkdir -p /usr/share/fonts/meslo-lgs-nf
cd ~/Downloads
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
mv Meslo* ~/Downloads /usr/share/fonts/meslo-lgs-nf/
cd
sudo fc-cache -fv
```

## oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## powerlevel10k
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed '/ZSH_THEME=/d' ~/.zshrc
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
```

## git
```bash
sudo apt-get install -y git
git config --global user.email ""
git config --global user.name $(whoami)
```

## rust
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup override set stable
rustup update stable
```

## pyenv
```bash
sudo dnf install -y "@Development Tools" gcc make patch zlib-devel \
	bzip2 bzip2-devel readline-devel sqlite sqlite-devel \
	openssl-devel xz xz-devel libffi-devel findutils tk-devel

sudo apt-get update; sudo apt-get install build-essential zlib1g-dev \
    libbz2-dev llvm \
    libncursesw5-dev tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.11.5
pyenv global 3.11.5
```

## nvm / npm / node
```bash
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.zshrc
nvm install node
```

## dotfiles
```bash
git clone https://www.github.com/jimcaine/dotfiles ~/.dotfiles
```

## neovim
Installing from snap store to get more up to date version than apt
```bash
sudo snap install -y neovim

mkdir -p ~/.config
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
cp -r ~/.dotfiles/nvim ~/.config/nvim
```

## tmux
```bash
sudo apt get install -y tmux
```

## tmuxinator
```bash
sudo gem install tmuxinator
```

## alacritty
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

## docker
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

## openssh
Download and run Open SSH server: https://ubuntu.com/server/docs/service-openssh
```bash
sudo apt install -y openssh-client openssh-server
sudo systemctl restart sshd.service
```

## firewall - ufw
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

## gnome tweaks
```bash
sudo dnf install -y gnome-tweaks
```

## gnome keyboard remappings
```bash
# tilebar (maximize/minimize buttons, left placement)


# swap ctrl and super keys
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swap_lwin_lctl']"

# ctrl t to swap applications
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Primary>Tab']"

# workspace shuffle
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Left']"

# spotlight
gsettings set org.gnome.shell.keybindings toggle-application-view "['<Primary>space']"
```

## gnome extensions
```bash
sudo dnf install -y gnome-extensions-app

pip3 install --upgrade gnome-extensions-cli

gext install 517 # https://extensions.gnome.org/extension/517/caffeine/
gext intall 615 # https://extensions.gnome.org/extension/615/appindicator-support/
gext install 1460 # https://extensions.gnome.org/extension/1460/vitals/
gext install 19 # https://extensions.gnome.org/extension/19/user-themes/
gext install 3193 # https://extensions.gnome.org/extension/3193/blur-my-shell/
gext install 307 # https://extensions.gnome.org/extension/307/dash-to-dock/
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

```bash
# dash to dock settings : dock size limit
# dash to dock settings : icon size limit
# dash to dock settings : opacity

```

## themes
```bash
mkdir -p ~/.themes
cd ~/.themes
# wget https://www.pling.com/s/Gnome/p/1267246.tar.gz
tar -xvzf Nordic.tar.xz

gsettings set org.gnome.desktop.interface gtk-theme Nordic
gsettings set org.gnome.desktop.wm.preferences theme Nordic

git clone https://github.com/EliverLara/firefox-nordic-theme && cd firefox-nordic-theme
./scripts/install.sh
cd ..
rm -rf ./scripts/install.sh
# https://github.com/EliverLara/firefox-nordic-theme
```

# apps
## thinkorswim
```bash
sudo dnf install -y https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
sudo dnf install zulu11-jdk
sudo alternatives --config java

```

# aliases
```bash
alias watch_dconf='dconf watch /'
```
