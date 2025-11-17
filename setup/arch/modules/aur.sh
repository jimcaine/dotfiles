#!/usr/bin/env bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd -
rm -rf yay
yay -Syu --noconfirm
