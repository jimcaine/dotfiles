sudo dnf update -y yum
sudo dnf update -y dnf

# dev
sudo dnf install -y git curl wget make

# c
sudo dnf install -y gcc gcc-c++ cmake

# ruby
sudo dnf install -y ruby

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable

# flatpak

# gnome utils
sudo dnf install -y util-linux-user

# nerd fonts
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/SourceCodePro.zip
mkdir ~/.local/share/fonts
unzip SourceCodePro.zip -d ~/.local/share/fonts/
fc-cache ~/.local/share/fonts
rm SourceCodePro.zip

# shell
sudo dnf install -y nvim tmux
gem install tmuxinator
sudo dnf install -y zsh
chsh -s $(which sh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# alacritty
dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc

# gnome
mkdir -p ~/.themes
mkdir -p ~/.icons
mkdir -p ~/.wallpapers
sudo dnf install -y gnome-tweaks
