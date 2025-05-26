#!/bin/bash

HOSTNAME_PERSONAL=suflair
HOSTNAME_WORK=sim2996

setMonitorResolution() {
	MONITOR=$1
	RESOLUTION=$2
	REFRESH=$3
	EXTRA=$4

	if [[ $MONITOR != "" ]]; then
		log "Executing xrandr."
		XRANDR_COMMAND="xrandr --output $MONITOR --mode $RESOLUTION --refresh $REFRESH $EXTRA"
		log "$XRANDR_COMMAND"
		eval $XRANDR_COMMAND
	fi
}

log "Copying .Xresources to home folder."

if [[ $(hostname) == "$HOSTNAME_PERSONAL" ]]; then
	log "Setting resolution for home computer '$HOSTNAME_PERSONAL'."
	cp ~/.dotfiles/config/.Xresources-personal ~/.Xresources
	PRIMARY_MONITOR="DP-1"
	setMonitorResolution "$PRIMARY_MONITOR" "3840x2160" "239.99" "--primary"
	setMonitorResolution "HDMI-1" "1980x1080" "60" "--below $PRIMARY_MONITOR"

elif [[ $(hostname) == "$HOSTNAME_WORK" ]]; then
	log "Setting resolution for work computer '$HOSTNAME_WORK'."
	cp ~/.dotfiles/config/.Xresources-work ~/.Xresources
	PRIMARY_MONITOR="DP-2"
	setMonitorResolution "eDP-1" "2880x1800" "60" "--right-of $PRIMARY_MONITOR --scale 1x1"
	setMonitorResolution "$PRIMARY_MONITOR" "3840x2160" "60" "--primary --left-of eDP-1 --scale 1x1"
fi

xrdb -merge ~/.Xresources

# dpi
# 4k 32" - 137
# 4k 27" - 162
# 2k 14" - 242

# resolutions
# 3840x2160
# 2880x1800
# 1980x1080
