#!/bin/sh

ICONmute="🔕"
ICONnotmute="🔔"

checkIfNotificationsArePaused() {
    ISPAUSED=$(dunstctl is-paused)

    if echo $ISPAUSED | grep -q "true"; then
	ICON=$ICONmute
    else
	ICON=$ICONnotmute
    fi
}

checkIfNotificationsArePaused

getIcon() {
    printf "$ICON"
}

getIcon
