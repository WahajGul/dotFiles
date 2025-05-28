#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
THUMBNAIL_DIR="$HOME/Scripts/thumbnails"

# Create the thumbnails directory if it doesn't exist
mkdir -p "$THUMBNAIL_DIR"

# Generate thumbnails for each wallpaper
for wallpaper in "$WALLPAPER_DIR"/*.jpg "$WALLPAPER_DIR"/*.png; do
  [ -f "$wallpaper" ] || continue   # Skip if no wallpapers are found

  # Extract the filename without extension
  filename=$(basename "$wallpaper")
  thumbnail="$THUMBNAIL_DIR/${filename%.*}_thumb.jpg"

  # Generate the thumbnail (100x100 resolution)
  convert "$wallpaper" -resize 100x100 "$thumbnail"
done

echo "Thumbnails generated in $THUMBNAIL_DIR"
