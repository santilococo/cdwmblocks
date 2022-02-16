#!/bin/sh

battery=/sys/class/power_supply/BAT0
status=$(cat "$battery/status")
maxCapacity=85

#case "$(cat "$battery/status" 2>&1)" in
case "$(cat "$battery/status" 2>&1)" in
    "Full") statusIcon="⚡" ;;
    "Discharging") statusIcon="🔋" ;;
    "Charging") statusIcon="🔌" ;;
    "Not charging") statusIcon="🛑" ;;
    "Unknown") statusIcon="♻️" ;;
    *) exit 1 ;;
esac

if [ "$status" = "Full" ]; then
    printf "%s 100%%" "$statusIcon"
    exit 0
fi

capacity="$(cat "$battery/capacity" 2>&1)"
capacity=$(echo "$capacity/$maxCapacity*100" | bc -l)

printf "%s %.0f%%" "$statusIcon" "$capacity"
