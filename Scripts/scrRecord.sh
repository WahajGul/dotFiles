#!/bin/bash

# Prompt the user to choose the recording format
echo "Select the recording format:"
echo "1) MKV"
echo "2) MP4"
read -p "Enter your choice (1 or 2): " choice

# Get the current date and time in the desired format
timestamp=$(date +"%d-%m-%y %H:%M")

# Execute the appropriate ffmpeg command based on user choice
case $choice in
1)
    # Record in MKV format
    ffmpeg -s 1366x768 -f x11grab -i :0 "${timestamp}.mkv"
    ;;
2)
    # Record in MP4 format with H.264 encoding
    ffmpeg -s 1366x768 -f x11grab -i :0 \
        -c:v libx264 -preset ultrafast -crf 23 -pix_fmt yuv420p \
        "${timestamp}.mp4"
    ;;
*)
    echo "Invalid choice. Please run the script again and select 1 or 2."
    ;;
esac
