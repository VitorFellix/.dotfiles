#!/bin/bash

HOSTNAME_PERSONAL=fedora
HOSTNAME_WORK=sim2996

PRIMARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 1)
SECONDARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 2 | tail -n 1)

DPI1=120
DPI2=162

if [[ $(hostname) == "$HOSTNAME_PERSONAL" ]]; then
	echo "Detected=[Personal-Computer]"

	cp ~/.dotfiles/config/.Xresources ~/.Xresources
	xrdb -merge ~/.Xresources
	cat ~/.Xresources

	CMD_MONITOR="xrandr --output $PRIMARY_MONITOR --mode 3840x2160 --refresh 239.99 --dpi 137 --primary"
	
	echo $CMD_MONITOR

	eval $CMD_MONITOR

elif [[ $(hostname) == "$HOSTNAME_WORK" ]]; then
	echo "Detected=[Work-Computer]"

	cat ~/.Xresources
	xrdb -merge ~/.Xresources
	
	if [[ $PRIMARY_MONITOR == "eDP" ]]; then
		echo "Monitor=[${PRIMARY_MONITOR}]"
		xrandr --output $PRIMARY_MONITOR --auto --dpi $DPI2 --primary
	fi
	
	if [[ $SECONDARY_MONITOR == "DisplayPort-1" ]]; then
		echo "Monitor=[${SECONDARY_MONITOR}]"
		xrandr --output $SECONDARY_MONITOR --auto --left-of $PRIMARY_MONITOR --dpi $DPI2
	fi
fi
