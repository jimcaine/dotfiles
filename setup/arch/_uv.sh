#!/usr/bin/bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
curl -LsSf https://astral.sh/uv/install.sh | sh
