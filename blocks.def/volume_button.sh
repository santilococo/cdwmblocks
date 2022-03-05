#!/bin/sh

#SINKHDMI=alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1
SINKHDMI=alsa_output.pci-0000_01_00.1.hdmi-stereo
SINKANALOG=alsa_output.pci-0000_00_1b.0.analog-stereo

checkDefaultSink() {
    PACTLOUTPUT=`pactl info`

    if echo $PACTLOUTPUT | grep -q "$SINKANALOG"; then
	SINK=$SINKANALOG
    elif echo $PACTLOUTPUT | grep -q "$SINKHDMI"; then
	SINK=$SINKHDMI
    fi
}

changeDefaultSink() {
    [ -v LAPTOP ] && return

    if [ "$SINK" = "$SINKANALOG" ]; then
	pactl set-default-sink $SINKHDMI
    elif [ "$SINK" = "$SINKHDMI" ]; then
	pactl set-default-sink $SINKANALOG
    fi
}

managePulsemixer() {
    if pgrep "pulsemixer" > /dev/null; then
	pkill "pulsemixer"
    else
	"$TERMINAL" -e "pulsemixer"
    fi
}

manageAlsamixer() {
    if pgrep "alsamixer" > /dev/null; then
	pkill "alsamixer"
    else
	"$TERMINAL" -e "alsamixer"
    fi
}

refreshVolumeBlock() {
    sigdwmblocks 2
}

checkDefaultSink

case "$1" in
    1) manageAlsamixer ;;
    2) changeDefaultSink;;
    3) pactl set-sink-mute @DEFAULT_SINK@ toggle;;
esac

refreshVolumeBlock
