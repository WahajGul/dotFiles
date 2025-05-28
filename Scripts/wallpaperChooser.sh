#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/"

# Check if the directory exists
if [[ ! -d "$WALLPAPER_DIR" ]]; then
    echo "Wallpaper directory $WALLPAPER_DIR does not exist."
    exit 1
fi

# List wallpapers in the directory and show them in rofi
selected_wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | wofi --show=dmenu -i -p "Select a wallpaper")

# If no wallpaper is selected, exit
if [[ -z "$selected_wallpaper" ]]; then
    echo "No wallpaper selected. Exiting..."
    exit 0
fi

# Set the selected wallpaper using swaybg
swaybg -i "$selected_wallpaper" -m fill &

echo "Wallpaper set to $selected_wallpaper"
