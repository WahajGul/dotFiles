#!/bin/bash
BATTERY=$(upower -e | grep battery)
CHARGE=$(upower -i "$BATTERY" | grep "percentage" | awk '{print $2}')
STATUS=$(upower -i "$BATTERY" | grep "state" | awk '{print $2}')

echo "$STATUS $CHARGE"
