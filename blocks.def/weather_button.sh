#!/bin/sh

case "$1" in
    1) "$TERMINAL" -e "htop" ;;
    2) "$TERMINAL" -e "bashmount" ;;
    3) psensor ;;
esac
