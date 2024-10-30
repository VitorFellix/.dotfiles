#!/bin/env bash

# variables :)
HOSTNAME_PERSONAL=fedora
HOSTNAME_WORK=sim996

PRIMARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 1)
SECONDARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 2 | tail -n 1)

# run xrandr
if [[ $(hostname) == "$HOSTNAME_PERSONAL" ]]; then
	echo "Detected=[Personal-Computer]"
	echo "Xft.dpi: 120" > ~/.Xresources
	
	xrandr --output $PRIMARY_MONITOR --auto --above $SECONDARY_MONITOR --output $SECONDARY_MONITOR --auto
else
	echo "Detected=[Work-Computer]"
	echo "Xft.dpi: 192" > ~/.Xresources
	
	xrandr --output $PRIMARY_MONITOR --auto --left-of $SECONDARY_MONITOR --output $SECONDARY_MONITOR --auto
	
	# if [[ $PRIMARY_MONITOR == "eDP" ]]; then
	# 	echo "Monitor=[${PRIMARY_MONITOR}]"
	# 	xrandr --output eDP --scale 1 --filter nearest --mode 2880x1800 --refresh 90 
	# fi
	#
	# if [[ $SECONDARY_MONITOR == "DisplayPort-1" ]]; then
	# 	echo "Monitor=[${SECONDARY_MONITOR}]"
	# 	xrandr --output DisplayPort-1 --scale 1 --filter nearest --mode 3840x2160 --refresh 60;
	# fi
fi

# merge?
xrdb -merge ~/.Xresources
