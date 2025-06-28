#!/bin/sh

VOLUME_MUTE="🔇"
VOLUME_LOW="🔈"
VOLUME_MID="🔉"
VOLUME_HIGH="🔊"

# Get default sink
SINK=$(pactl get-default-sink)

# Get volume and strip %
VOLUME=$(pactl get-sink-volume "$SINK" | awk -F'/' '/Volume:/ { gsub(/ /, "", $2); print $2; exit }' | sed 's/%//')

# Cap volume at 100
if [ "$VOLUME" -gt 100 ]; then
    VOLUME=100
fi

# Check if muted
MUTED=$(pactl get-sink-mute "$SINK" | awk '{print $2}')

# Set icon
if [ "$MUTED" = "yes" ]; then
    ICON="$VOLUME_MUTE"
else
    if [ "$VOLUME" -lt 34 ]; then
        ICON="$VOLUME_LOW"
    elif [ "$VOLUME" -lt 67 ]; then
        ICON="$VOLUME_MID"
    else
        ICON="$VOLUME_HIGH"
    fi
fi

# Output the icon and volume
echo "$ICON: ${VOLUME}%"

# Handle click events
case $BLOCK_BUTTON in
    1) pavucontrol & ;;  # Left click only
esac

