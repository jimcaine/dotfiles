#!/usr/bin/env bash
mkdir -p $HOME/.config
git clone https://www.github.com/jimcaine/dotfiles.git $HOME/.config/dotfiles

rm -rf $HOME/.config/karabiner
mkdir -p $HOME/.config/karabiner
ln -s $HOME/dotfiles/karabiner/karabiner.json $HOME/.config/karabiner/karabiner.json

rm -rf $HOME/.hammerspoon
mkdir -p $HOME/.hammerspoon
ln -s $HOME/dotfiles/hammerspoon $HOME/.hammerspoon

rm -f $HOME/.tmux.conf
ln -s $HOME/dotfiles/dotfiles/tmux/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim
ln -s $HOME/dotfiles/dotfiles/nvim $HOME/.config/nvim

rm -rf $HOME/.config/kitty
mkdir -p $HOME/.config/kitty
ln -s $HOME/dotfiles/dotfiles/kitty $HOME/.config/kitty

rm -rf $HOME/.zshrc-modules
mdir $HOME/.zshrc-modules
ln -s $HOME/dotfiles/dotfiles/zshrc/.zshrc-modules $HOME/.zshrc-modules
rm $HOME/.zshrc
ln -s $HOME/dotfiles/dotfiles/zshrc/.zshrc $HOME/.zshrc
