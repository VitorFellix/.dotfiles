#!/bin/bash

HOSTNAME_PERSONAL=fedora
HOSTNAME_WORK=sim2996

PRIMARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 1)
SECONDARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 2 | tail -n 1)

setMonitorResolution() {
	MONITOR=$1
	RESOLUTION=$2
	REFRESH=$3
	EXTRA=$4

	if [[ $MONITOR != "" ]]; then
		echo "Executing xrandr."
		XRANDR_COMMAND="xrandr --output $MONITOR --mode $RESOLUTION --refresh $REFRESH $EXTRA"
		echo $XRANDR_COMMAND
		eval $XRANDR_COMMAND
	fi
}

if [[ $(hostname) == "$HOSTNAME_PERSONAL" ]]; then
	echo "Setting resolution for home computer '$HOSTNAME_PERSONAL'."

	echo "Copying .Xresources to home folder."
	cp ~/.dotfiles/config/.Xresources-personal ~/.Xresources
	xrdb -merge ~/.Xresources
	cat ~/.Xresources

	setMonitorResolution "$PRIMARY_MONITOR" "3840x2160" "239.99" "--primary"

elif [[ $(hostname) == "$HOSTNAME_WORK" ]]; then
	echo "Setting resolution for work computer '$HOSTNAME_WORK'."

	echo "Copying .Xresources to home folder."
	cp ~/.dotfiles/config/.Xresources-work ~/.Xresources
	xrdb -merge ~/.Xresources
	cat ~/.Xresources
	
	setMonitorResolution "$PRIMARY_MONITOR" "2880x1800" "60" "--right-of $SECONDARY_MONITOR"
	setMonitorResolution "$SECONDARY_MONITOR" "3840x2160" "60" "--primary --left-of $PRIMARY_MONITOR"
fi

# dpi
# 4k 32" - 137
# 4k 27" - 162
# 2k 14" - 242
