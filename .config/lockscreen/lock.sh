#!/bin/bash

IMG=~/Pictures/wallpapers/wallhaven-1q83qg_1920x1080.png

# Take screenshot and blur it
scrot "$IMG"
magick convert "$IMG" -blur 0x6 "$IMG"
# Launch i3lock-color with styling
i3lock -i "$IMG" \
  --blur 5 \
  --clock \
  --indicator \
  --show-failed-attempts \
  --ring-color=88c0d0 \
  --inside-color=2e3440 \
  --line-color=00000000 \
  --separator-color=00000000 \
  --keyhl-color=81a1c1 \
  --bshl-color=bf616a \
  --ring-width=4 \
  --radius=120 \
  --time-str="%H:%M:%S" \
  --date-str="%A, %d %B" \
  --time-color=ffffffcc \
  --date-color=ccccccaa

