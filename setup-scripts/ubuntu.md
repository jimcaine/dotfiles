# Setup: Ubuntu

## update package manager
```bash
sudo apt update
sudo apt upgrade
```

## install snap package manager
```bash
sudo apt install snapd
```

## zshell
```bash
sudo apt-get install -y zsh
chsh -s $(which zsh)
```

### LOGOUT ###


## git
```bash
sudo apt-get install -y git
git config --global user.email ""
git config --global user.name $(whoami)
```

## utils
```bash
sudo apt-get install -y curl wget make
sudo apt-get install -y gcc cmake
sudo apt-get install -y neofetch
```

## ruby
Less for rails, more for zsh
```bash
sudo apt-get install -y ruby
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
sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
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


## oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## nerd fonts
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

## gnome tweaks
```bash
sudo add-apt-repository universe
sudo apt install -y gnome-tweak-tool
```

## gnome keyboard remappings
```bash
gsettings set org.gnome.desktop.input-sources xkb-options = ['ctrl:swap_lwin_lctl']
```

## gnome extensions
Try this way:
```bash
sudo snap install -y gnome-extension-manager
```

Current way:
```bash
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/
```

## workspace keyboard bindings
```bash
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Control>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Control>Down']"
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

# aliases
```bash
alias watch_dconf='dconf watch /'
```
