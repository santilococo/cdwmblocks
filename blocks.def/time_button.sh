#!/bin/sh

manageCalcurse() {
    if pgrep "calcurse" > /dev/null; then
	pkill "calcurse"
    else
	"$TERMINAL" -e "calcurse"
    fi
}

manageNotifications() {
    #"$TERMINAL" -e "dunstctl" "history-pop"
    dunstctl history-pop
}

case "$1" in
    1) manageCalcurse ;;
    3) manageNotifications ;;

    # Agregar appointments o algo de ese estilo
    # Time tracker tmb puede ser
esac
