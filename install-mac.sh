##############################################################################
# install-mac.sh
# -----------
# Script to install all the things I need on a new mac
##############################################################################

# download brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# install brew packages
brew install neovim
brew install nvm
brew install docker


# install brew cask packages
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask hammerspoon
brew install --cask miniconda
brew install --cask visual-studio-code
brew install --cask robo-3t


# clone dotfiles
mkdir -p ~/.config
git clone https://www.github.com/jimcaine/dotfiles.git ~/.dotfiles


# karabiner
mkdir -p ~/.config/karabiner
ln -s ~/.dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json


# hammerspoon
mkdir -p ~/.hammerspoon
ln -s ~/.dotfiles/hammerspoon ~/.hammerspoon


# iterm2


# neovim setup
mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/nvim ~/.config/nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


# docker


# python


# javasvript
mkdir ~/.nvm
