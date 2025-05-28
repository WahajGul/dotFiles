#!/bin/bash

# Display the list of processes using `ps -aux` in rofi (dmenu mode)
selected_process=$(ps -aux | awk '{print $2, $11}' | rofi -dmenu -i -p "Select process to kill")

# If no selection is made, exit
if [[ -z "$selected_process" ]]; then
    echo "No process selected. Exiting..."
    exit 0
fi

# Extract the PID from the selected process
pid=$(echo "$selected_process" | awk '{print $1}')

# Confirm killing the process
confirmation=$(echo -e "Yes\nNo" | rofi -dmenu -i -p "Kill process PID: $pid?")
if [[ "$confirmation" == "Yes" ]]; then
    kill "$pid" && echo "Process $pid killed successfully." || echo "Failed to kill process $pid."
else
    echo "Operation cancelled. Exiting..."
fi
