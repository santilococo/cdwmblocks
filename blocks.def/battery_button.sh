#!/bin/sh

case "$1" in
    1) 	SUDO_ASKPASS=$HOME/.local/bin/dpass sudo -A "$TERMINAL" -e "powertop" ;;
    2) 	SUDO_ASKPASS=$HOME/.local/bin/dpass sudo -A powertop --html=$HOME/.cache/powerreport.html && xdg-open $HOME/.cache/powerreport.html ;;
esac
