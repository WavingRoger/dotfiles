#!/bin/sh

# Show power icon
echo "⏻ "

# Handle click events
case $BLOCK_BUTTON in
    1)
        CHOICE=$(echo -e "Shutdown\nReboot\nLogout\nSuspend" | dmenu -p "Power")
        case "$CHOICE" in
            Shutdown) systemctl poweroff ;;
            Reboot) systemctl reboot ;;
            Logout) i3-msg exit ;;
            Suspend) systemctl suspend ;;
        esac
        ;;
esac

