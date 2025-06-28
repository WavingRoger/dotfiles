#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Pick a random image
IMAGE=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

# Set wallpaper with feh
feh --bg-fill "$IMAGE"

# Reload i3 to apply new colors or configuration
i3-msg reload

# Optionally: reload i3blocks
pkill -RTMIN+1 i3blocks

