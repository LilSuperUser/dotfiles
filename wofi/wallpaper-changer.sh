#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon &
    sleep 0.5
fi

WALLPAPERS=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | sort)

SELECTED=$(echo "$WALLPAPERS" | wofi --dmenu --prompt "Choose wallpaper:")

[[ -z "$SELECTED" ]] && exit 0

swww img "$SELECTED" --transition-type outer --transition-duration 1
