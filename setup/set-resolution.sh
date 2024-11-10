#!/bin/bash
set -e

HOSTNAME_PERSONAL=fedora
HOSTNAME_WORK=sim2996

PRIMARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 1)
SECONDARY_MONITOR=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 2 | tail -n 1)

DPI1=120
DPI2=162

if [[ $(hostname) == "$HOSTNAME_PERSONAL" ]]; then
	echo "Detected=[Personal-Computer]"
	echo "Xft.dpi: $DPI1" > ~/.Xresources
	xrdb -merge ~/.Xresources
	cat ~/.Xresources
	
	if [[ $PRIMARY_MONITOR == "DP-1" ]]; then
		echo "Monitor=[${PRIMARY_MONITOR}]"
		xrandr --output $PRIMARY_MONITOR --auto --dpi $DPI1 --primary
	fi
	
	# maybe the dpi is 92 too, must test
	if [[ $SECONDARY_MONITOR == "HDMI-2" ]]; then
		echo "Monitor=[${SECONDARY_MONITOR}]"
		xrandr --output $SECONDARY_MONITOR --auto --below $PRIMARY_MONITOR --dpi $DPI1
	fi
	echo "$PRIMARY_MONITOR $SECONDARY_MONITOR" > ~/.test
elif [[ $(hostname) == "$HOSTNAME_WORK" ]]; then
	echo "Detected=[Work-Computer]"
	echo "Xft.dpi: $DPI2" > ~/.Xresources
	cat ~/.Xresources
	xrdb -merge ~/.Xresources
	
	if [[ $PRIMARY_MONITOR == "eDP" ]]; then
		echo "Monitor=[${PRIMARY_MONITOR}]"
		xrandr --output $PRIMARY_MONITOR --auto --dpi $DPI2 --primary
	fi
	
	if [[ $SECONDARY_MONITOR == "DisplayPort-1" ]]; then
		echo "Monitor[${SECONDARY_MONITOR}]"
		xrandr --output $SECONDARY_MONITOR --auto --right-of $PRIMARY_MONITOR --dpi $DPI2
	fi
fi
