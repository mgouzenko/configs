#!/usr/bin/env bash

options="Lock\nLogout\nReboot\nShutdown"

chosen=$(
zenity --question \
  --switch \
  --title="" \
  --text="Select an exit option. ESC to abort." \
  --extra-button="Log Out" \
  --extra-button="Suspend" \
  --extra-button="Reboot" \
  --extra-button="Shutdown")

case "$chosen" in
    "Log Out")
        i3-msg exit
        ;;
    "Suspend")
        i3lock -i ~/configs/config/wallpapers/wallpaper.png & systemctl suspend
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
esac
