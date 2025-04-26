#!/bin/bash

# Define an array of widget names
widgets=("systray_all" "smol_calendar" "time_side")

# Iterate over each widget
for widget in "${widgets[@]}"; do
    eww close "${widget}"
done
