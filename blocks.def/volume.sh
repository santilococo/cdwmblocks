#!/bin/sh

ICONlow="🔈"
ICONmid="🔉"
ICONhigh="🔊"
ICONmute="🔇"
ICONspeakermute="🔕"
ICONspeaker="🔔"
ICONheadphone="🎧"
#ICONspeaker="📢"

#pactl set-card-profile 126 output:hdmi-stereo-extra1
SINKHDMI=alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1
#SINKHDMI=alsa_output.pci-0000_01_00.1.hdmi-stereo
SINKANALOG=alsa_output.pci-0000_00_1b.0.analog-stereo

checkDefaultSink() {
    if [ -v LAPTOP ]; then
	SINK=$SINKANALOG
	return
    fi

    PACTLOUTPUT=`pactl info`

    if echo $PACTLOUTPUT | grep -q "$SINKANALOG"; then
	SINK=$SINKANALOG
    elif echo $PACTLOUTPUT | grep -q "$SINKHDMI"; then
	SINK=$SINKHDMI
    fi
}

#VOLUME=`pulsemixer --get-volume | awk '{printf $1}'`
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{printf $5}' | sed s/%//)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{printf $2}')

checkDefaultSink

getIcon() {
    if [ "$MUTE" = "yes" ]; then
	ICON=$ICONmute
    else
	if [ "$VOLUME" -gt "50" ]; then
	    ICON=$ICONhigh
	elif [ "$VOLUME" -gt "20" ]; then
	    ICON=$ICONmid
	else
	    ICON=$ICONlow
	fi
    fi

    if [ -v LAPTOP ]; then
	printf "$ICON %s" "$VOLUME%"
	return
    fi

    if [ "$SINK" = "$SINKHDMI" ]; then
	printf "$ICON %s" "$VOLUME%"
    elif [ "$SINK" = "$SINKANALOG" ]; then
	printf "$ICON %s" "$VOLUME% $ICONheadphone"
    fi
}

getIcon
