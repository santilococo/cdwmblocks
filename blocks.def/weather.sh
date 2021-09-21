#!/bin/sh

#TEMP=$(curl -s "wttr.in/Argentina?format=%c%t\n" | sed 's/+//')
#TEMP=$(curl -s "wttr.in/Argentina?format=%c%t\n")
TEMP=$(curl -s "wttr.in/BuenosAires?format=%c+%t\n")
# Corto algunos caracteres pues se imprime un caracter inválido entre medio.
# Es algún tema de los unicode. En terminal se imprime bien...
#TEMP_ICON=$(echo -n $TEMP | cut -b 1-3)
#TEMP_ICON=$(echo -n $TEMP | cut -b 1-4)
TEMP_ICON=$(echo -n $TEMP | cut -d+ -f1)
#TEMP=$(echo -n $TEMP | cut -b 8-)
TEMP_TEMP=$(echo -n $TEMP | cut -d+ -f2)

ICON_LEN=$(printf $TEMP_ICON | wc -c)
ICON_VAR=$(($ICON_LEN-3))
if [ $ICON_LEN -gt 4 ]; then
    TEMP_ICON=$(echo -n $TEMP | cut -b 1-$ICON_VAR)
    printf "%s %s" "$TEMP_ICON" "$TEMP_TEMP"
    #printf "%s %s •" "$TEMP_ICON" "$TEMP_TEMP"
else
    printf "%s%s" "$TEMP_ICON" "$TEMP_TEMP"
fi

#perl -CO -E "say "\N{$TEMP_ICON}""

# Otra forma de bypassear el feof y que se imprima bien es haciendo un grep:
#printf $TEMP_ICON | grep -P "[\x{fe0f}]"
