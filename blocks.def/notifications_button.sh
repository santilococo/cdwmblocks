#!/bin/sh

toggleNotifications() {
    dunstctl set-paused toggle 
}

refreshNotificationsBlock() {
    sigdwmblocks 6
}

case "$1" in
    #1) toggleNotifications ;;
    2) toggleNotifications ;;
    #3) pactl set-sink-mute @DEFAULT_SINK@ toggle;;
esac

refreshNotificationsBlock
