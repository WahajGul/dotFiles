#!/bin/bash

# Get the active window's ID
active_window=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | awk '{print $5}')

# Get the name of the active window (title)
window_name=$(xprop -id "$active_window" | grep "WM_NAME" | cut -d'=' -f2- | sed 's/^[[:space:]]*"\(.*\)"/\1/')

# If the window name is found, output only the application name
# This assumes that the application name is the part before the first " - " or any spaces.
if [ -n "$window_name" ]; then
    # Strip the document name after " - " or cut at the first space
    app_name=$(echo "$window_name" | sed 's/ - .*//')
    echo "$app_name"
else
    echo "No window"
fi
