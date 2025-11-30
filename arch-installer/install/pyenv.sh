#!/usr/bin/env bash
set -e

echo "Installing pyenv and Python 3.12..."
if ! command -v pyenv &> /dev/null; then
  curl https://pyenv.run | bash
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

if ! pyenv versions | grep -q "3.12"; then
  pyenv install 3.12
fi
pyenv global 3.12
pip install --upgrade pip
pip install build cython pytoml pyyaml setuptools virtualenv wheel
curl -LsSf https://astral.sh/uv/install.sh | sh
