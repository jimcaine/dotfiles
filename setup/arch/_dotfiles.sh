#!/usr/bin/bash
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
