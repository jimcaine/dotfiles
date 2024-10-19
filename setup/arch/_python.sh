#!/usr/bin/bash
sudo curl https://pyenv.run | bash
curl -LsSf https://astral.sh/uv/install.sh | sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
