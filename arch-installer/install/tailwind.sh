#!/usr/bin/env bash
set -e

echo "Installing tailwind."
mkdir -p ~/.local/bin
curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
chmod +x tailwindcss-linux-x64
mv tailwindcss-linux-x64 ~/.local/bin/tailwindcss
