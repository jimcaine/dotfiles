#!/usr/bin/bash
curl https://pyenv.run | bash
echo 'source $HOME/.dotfiles/dotfiles/zsh/pyenv.zshrc' >> $HOME/.zshrc
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 3.12
pyenv global 3.12
