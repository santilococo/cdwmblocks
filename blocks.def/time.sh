#!/bin/sh

ICON="🕓"

chooseEmoji() {
    clock=$(date '+%I')

    case "$clock" in
	"00") ICON="🕛" ;;
	"01") ICON="🕐" ;;
	"02") ICON="🕑" ;;
	"03") ICON="🕒" ;;
	"04") ICON="🕓" ;;
	"05") ICON="🕔" ;;
	"06") ICON="🕕" ;;
	"07") ICON="🕖" ;;
	"08") ICON="🕗" ;;
	"09") ICON="🕘" ;;
	"10") ICON="🕙" ;;
	"11") ICON="🕚" ;;
	"12") ICON="🕛" ;;
    esac
}

waitForMinute() {
    while true
    do
	if [ `date "+%S"` -eq 0 ]; then
	    break
	fi

	sleep 1
    done
}

chooseEmoji

printf "$ICON %s" "$(date '+%R %b %d (%a)')"
