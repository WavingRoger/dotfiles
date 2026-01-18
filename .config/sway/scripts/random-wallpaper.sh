#!/bin/sh

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Pick a random wallpaper
WALLPAPER="$(find "$WALLPAPER_DIR" -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) \
  | shuf -n 1)"

# Safety check
[ -z "$WALLPAPER" ] && exit 1

# Kill existing swaybg (important on reload)
pkill swaybg 2>/dev/null

# Set wallpaper
exec swaybg -i "$WALLPAPER" -m fill
