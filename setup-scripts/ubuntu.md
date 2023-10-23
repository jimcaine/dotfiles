# Setup: Ubuntu

## update package manager
```bash
sudo apt update
sudo apt upgrade
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

# nerd fonts
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

# gnome extensions
```bash
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/
```

# workspace keyboard bindings
```bash
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Control>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Control>Down']"
```
