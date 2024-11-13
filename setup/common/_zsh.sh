#!/usr/bin/bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
echo 'export EDITOR=nvim' >> $HOME/.zshrc
echo 'export XDG_CONFIG_HOME=~/.config' >> $HOME/.zshrc
echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/.zshrc
echo '' >> $HOME/.zshrc
echo 'source $HOME/.dotfiles/dotfiles/zsh/oh-my-zsh.zshrc' >> $HOME/.zshrc
