#!/bin/sh

TEMP_EXTREME=80
TEMP_HIGH=70
TEMP_MIDHIGH=60
TEMP_MID=50
TEMP_MIDLOW=40
TEMP_LOWHIGH=35
TEMP_LOW=30

# https://askubuntu.com/questions/1262643/terminal-command-to-show-a-summary-of-memory-used-temperature-and-gpu-use-in-a
# https://gist.github.com/Ropid/077816cec9e5a826ad417fc6ce5ac41a

#TEMP_CPU=$(sensors -A | awk 'NR == v+1 {print $4}' v="$(sensors -A | awk '{ if ($1 == "coretemp-isa-0000") {print NR}}')" | sed 's/+//' | sed 's/..°C//')
TEMP_CPU=$(sensors -A | awk '/Package/ {print $4}' | sed 's/+//' | sed 's/..°C//')
[ -v LAPTOP ] || TEMP_GPU=`nvidia-smi | awk '{if (NR == 10) {print $3}}' | sed 's/C//'`

#ICON="💻"

if [ "$TEMP_CPU" -ge "$TEMP_EXTREME" ]; then
    ICON="🥵"
elif [ "$TEMP_CPU" -ge "$TEMP_HIGH" ]; then
    ICON="😡"
elif [ "$TEMP_CPU" -ge "$TEMP_MIDHIGH" ]; then
    ICON="😤"
elif [ "$TEMP_CPU" -ge "$TEMP_MID" ]; then
    ICON="😰"
elif [ "$TEMP_CPU" -ge "$TEMP_MIDLOW" ]; then
    ICON="😨"
elif [ "$TEMP_CPU" -ge "$TEMP_LOWHIGH" ]; then
    ICON="😬"
elif [ "$TEMP_CPU" -ge "$TEMP_LOW" ]; then
    ICON="😃"
else
    ICON="🥶"
fi

if [ -v LAPTOP ]; then
    printf "$ICON %s°C" "$TEMP_CPU"
else
    printf "$ICON %s°C : %s°C" "$TEMP_CPU" "$TEMP_GPU"
fi
