#!/usr/bin/bash
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
cp ~/.dotfiles/dotfiles/tmux/tmux.conf ~/.tmux.conf
