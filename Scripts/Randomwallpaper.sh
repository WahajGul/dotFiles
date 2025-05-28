#!/bin/bash

# Path to your wallpaper directory
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Select a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

pkill swaybg
# Apply the selected wallpaper using swaybg
swaybg -i "$WALLPAPER" -m fill &
