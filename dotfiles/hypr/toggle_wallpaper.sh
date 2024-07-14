#!/bin/bash
wal -i ~/.local/wallpaper
wallpaper_path=$(cat ~/.cache/wal/wal)
swaybg -i $wallpaper_path -m fill &
sh ~/.config/waybar/reload.sh
