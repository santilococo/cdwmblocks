#!/bin/sh

battery=/sys/class/power_supply/BAT0

case "$(cat "$battery/status" 2>&1)" in
    "Full") status="⚡" ;;
    "Discharging") status="🔋" ;;
    "Charging") status="🔌" ;;
    "Not charging") status="🛑" ;;
    "Unknown") status="♻️" ;;
    *) exit 1 ;;
esac

capacity="$(cat "$battery/capacity" 2>&1)"
capacity=$(echo "$capacity/88*100" | bc -l)

printf "%s %.0f%%" "$status" "$capacity"
