#!/bin/bash
wal -i ~/.local/share/wallpapers
wallpaper_path=$(cat ~/.cache/wal/wal)
swaybg -i $wallpaper_path -m fill &
sh ~/.config/waybar/reload.sh
