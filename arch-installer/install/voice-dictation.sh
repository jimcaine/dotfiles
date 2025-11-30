#!/usr/bin/env bash
###############################################################################
# Voice Dictation Setup
# https://github.com/ideasman42/nerd-dictation
# Wayland setup: https://github.com/ideasman42/nerd-dictation/blob/main/readme-ydotool.rst
###############################################################################

set -e
echo "Installing voice dictation."

MODEL_URL = https://alphacephei.com/vosk/models/vosk-model-en-us-0.22.zip
MODEL_DIR = $HOME/.config/nerd-dictation/model

# install packages
sudo pacman -Syu ydotool
yay -Syu nerd-dictation-git
pip install vosk

# give root permission to ydotool
sudo usermod -aG input $USER

echo '## Give ydotoold access to the uinput device
## Solution by https://github.com/ReimuNotMoe/ydotool/issues/25#issuecomment-535842993
KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
' | sudo tee /etc/udev/rules.d/80-uinput.rules > /dev/null

# start ydotool service
systemctl --user enable ydotool.service
systemctl --user start ydotool.service

# download model
mkdir -p $MODEL_DIR
cd $MODEL_DIR
curl $MODEL_URL
unzip *
cd --
