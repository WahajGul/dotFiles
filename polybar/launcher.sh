#!/bin/bash
# Kill already running instances
killall -q polybar

# Launch polybar
polybar &

# Start nm-applet
nm-applet &
