# python / conda / ml
brew install --cask miniconda
bash ~/miniconda.sh -b -p $HOME/miniconda
source ~/miniconda/bin/activate
conda install -c apple tensorflow-deps
python -m pip install tensorflow-macos
python -m pip install tensorflow-metal
