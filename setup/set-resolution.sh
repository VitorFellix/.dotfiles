#!/bin/env bash

# variables :)
HOSTNAME_PERSONAL=fedora
HOSTNAME_WORK=sim996

PRIMARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 1)
SECONDARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 2 | tail -n 1)

# run xrandr
if [[ $(hostname) == "$HOSTNAME_PERSONAL" ]]; then
	echo "personal computer :)"
	echo "Xft.dpi: 120" > ~/.Xresources
	
	if [[ $PRIMARY_MONITOR == "DP-0" ]]; then
		echo "${PRIMARY_MONITOR} is DP-0"
		xrandr --output DP-0 --scale 1 --filter nearest --mode 2560x1440 --refresh 164.85 
	fi
	
	if [[ $SECONDARY_MONITOR == "HDMI-1" ]]; then
		echo "${SECONDARY_MONITOR} is HDMI-1"
		xrandr --output HDMI-1 --scale 1 --filter nearest --mode 1980x1080 --refresh 60;
	fi
else
	echo "work computer"
	echo "Xft.dpi: 192" > ~/.Xresources
	
	if [[ $PRIMARY_MONITOR == "eDP" ]]; then
		echo "${PRIMARY_MONITOR} is eDP"
		xrandr --output eDP --scale 1 --filter nearest --mode 2880x1800 --refresh 90 
	fi
	
	if [[ $SECONDARY_MONITOR == "DisplayPort-1" ]]; then
		echo "${SECONDARY_MONITOR} is DisplayPort-1"
		xrandr --output DisplayPort-1 --scale 1 --filter nearest --mode 3840x2160 --refresh 60;
	fi
fi

# merge?
xrdb -merge ~/.Xresources
