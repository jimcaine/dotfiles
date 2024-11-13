#!/usr/bin/bash
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
echo 'source $HOME/.config/zsh/nvm.zshrc' >> $HOME/.zshrc
. ~/.config/.nvm/nvm.sh
nvm install 22
nvm use 22
