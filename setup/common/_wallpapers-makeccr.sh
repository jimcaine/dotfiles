#!/usr/bin/env bash
mkdir -p ~/.local/wallpaper/makeccr
git clone https://github.com/makccr/wallpapers.git
mv wallpapers/wallpapers/* ~/.local/wallpaper/makeccr/
rm -rf wallpapers

echo "Linking wallpapers..."
for file in ~/.local/wallpaper/makeccr/*/*; do
  ln -s $file ~/.local/wallpaper/$(basename $file)
done

# delete linked wallpapers:
# find ~/.local/wallpaper/ -type l -delete
