#!/bin/bash
yay -Sy --noconfirm sddm-theme-sugar-candy-git sddm-theme-greenleaf
sudo cp ~/.dotfiles/dotfiles/sddm/sddm.conf /etc/sddm.conf
sudo cp ~/.local/share/wallpapers/WinterBison.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds/WinterBison.jpg
sudo sed -i 's|Backgrounds/Mountain.jpg|Backgrounds/WinterBison.jpg|g' /usr/share/sddm/themes/Sugar-Candy/theme.conf
