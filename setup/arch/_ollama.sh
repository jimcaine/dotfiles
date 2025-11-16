#!/usr/bin/env bash
sudo pacman -Syu --noconfirm ollama
ollama pull deepseek-r1:1.5b
docker pull ghcr.io/open-webui/open-webui:main
