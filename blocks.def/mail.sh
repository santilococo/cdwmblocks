#!/bin/sh

ICON="📧"

getMails() {
    #mw -Y > /dev/null &
    #setsid -f mw -Y > /dev/null
    #setsid -f $TERMINAL -e "mw" "-Y"
    #mailsync > /dev/null
    /.$HOME/mailCheck > /dev/null
}

#getMails
unreadMails="$(find "${XDG_DATA_HOME:-$HOME/.local/share}"/mail/*/[Ii][Nn][Bb][Oo][Xx]/new/* -type f 2>/dev/null | wc -l 2>/dev/null)"

printf "$ICON %s" "$unreadMails"
