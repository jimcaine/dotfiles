# download brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew packages
brew install (
  neovim,
  nvm,
  docker,
)

# brew casks
brew install --cask (
  iterm2,
  hammerspoon,
  miniconda,
  visual-studio-code,
  robo-3t,
  -- karabiner-elements,
)

# copy dotfiles
git clone https://www.github.com/jimcaine/dotfiles.git ~/.config/dotfiles
mv ~/.dotfiles/hammerspoon ~/.hammerspoon
mv ~/.dotfiles/nvim ~/.config/nvim
