#!/bin/sh

case "$1" in
    1) "$TERMINAL" -e "neomutt" ;;
    #3) mw -Y ;;
    # 3) "$TERMINAL" -e "neomutt" ;;
esac

sigdwmblocks 3
/.$HOME/mailCheck > /dev/null
sigdwmblocks 3
