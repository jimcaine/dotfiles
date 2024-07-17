#!/usr/bin/bash
mkdir -p $HOME/.config
git clone https://github.com/jimcaine/dotfiles.git $HOME/.dotfiles

rm -f $HOME/.tmux.conf
ln -s $HOME/.dotfiles/dotfiles/tmux/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.config/nvim
ln -s $HOME/.dotfiles/dotfiles/nvim $HOME/.config/nvim

rm -rf $HOME/.config/oh-my-posh
ln -s $HOME/.dotfiles/dotfiles/oh-my-posh $HOME/.config/oh-my-posh

rm -rf $HOME/.config/hypr
ln -s $HOME/.dotfiles/dotfiles/hypr $HOME/.config/hypr

rm -rf $HOME/.config/kitty
ln -s $HOME/.dotfiles/dotfiles/kitty $HOME/.config/kitty

rm -rf $HOME/.config/waybar
ln -s $HOME/.dotfiles/dotfiles/waybar $HOME/.config/waybar

rm -rf $HOME/.config/rofi
ln -s $HOME/.dotfiles/dotfiles/rofi $HOME/.config/rofi

rm -rf $HOME/.config/wlogout
ln -s $HOME/.dotfiles/dotfiles/wlogout $HOME/.config/wlogout

rm -rf $HOME/.zshrc-modules
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/dotfiles/zshrc/.zshrc-modules $HOME/.zshrc-modules
ln -s $HOME/.dotfiles/dotfiles/zshrc/.zshrc $HOME/.zshrc
