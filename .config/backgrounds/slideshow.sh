#!/bin/bash
#
#
#
while true; do 
  for f in ~/Pictures/wallpapers/*; 
  do
    feh -z --bg-scale --no-fehbg "$f"
    sleep 2
  done
done
