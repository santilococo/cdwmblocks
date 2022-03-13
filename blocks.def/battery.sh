#!/bin/sh

battery=/sys/class/power_supply/BAT0
status=$(cat "$battery/status" 2>&1)

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

chargeNow=$(cat "$battery/charge_now" 2>&1)
chargeFull=$(cat "$battery/charge_full" 2>&1)
capacity=$(echo "$chargeNow/$chargeFull*100" | bc -l)

printf "%s %.0f%%" "$statusIcon" "$capacity"
