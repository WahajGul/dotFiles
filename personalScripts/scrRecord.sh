#!/bin/bash

#notification send
notify-send -i /usr/share/icons/Adwaita/symbolic/devices/camera-photo-symbolic.svg "recording started"

#recording script
ffmpeg -s 1366x768 -f x11grab -i :0 "$HOME/Videos/$(date '+%d-%m-%y_%H-%M').mkv"
