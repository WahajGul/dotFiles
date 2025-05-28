#!/bin/bash

# Directory containing wallpapers and thumbnails
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
THUMBNAIL_DIR="$HOME/Scripts/thumbnails"

# Check if thumbnails exist
if [ ! -d "$THUMBNAIL_DIR" ]; then
  echo "Thumbnails not found. Run generate_thumbnails.sh first."
  exit 1
fi

# Generate a list of wallpapers with thumbnails
options=""
for thumbnail in "$THUMBNAIL_DIR"/*.jpg; do
  [ -f "$thumbnail" ] || continue
  wallpaper="$(basename "$thumbnail" | sed 's/_thumb//')"
  options+="$thumbnail|$WALLPAPER_DIR/$wallpaper\n"
done

# Display Rofi menu with thumbnails
selected=$(echo -e "$options" | rofi -theme-str 'listview { enabled: true; lines: 10; }' -dmenu -p "Choose Wallpaper" -format 'i')

# Extract the selected wallpaper path
wallpaper_path=$(echo "$options" | awk -v selected="$selected" 'NR == selected { split($0, arr, "|"); print arr[2] }')

# Apply the selected wallpaper
if [ -n "$wallpaper_path" ]; then
  feh --bg-scale "$wallpaper_path"
  echo "Wallpaper switched to $wallpaper_path"
else
  echo "No wallpaper selected."
fi
