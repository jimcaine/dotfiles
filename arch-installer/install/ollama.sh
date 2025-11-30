#!/usr/bin/env bash
set -e

echo "Installing ollama."

# pull package from pacman
pacman -Syu ollama

# pull lightweight model
ollama pull deepseek-r1:1.5b

# pull open-webui docker image
docker pull ghcr.io/open-webui/open-webui:main
