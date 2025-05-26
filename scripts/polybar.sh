#!/bin/bash

killall -q polybar

# Wait for process to shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR_1=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l)
if [[ $MONITOR_1 == 1 ]]; then
	log "there is only one monitor $MONITOR_1"
	MONITOR=$(polybar --list-monitors | cut -d":" -f1) polybar -r primary &
else
	log "there is more than one monitor"

	MONITOR_PRIMARY=$(xrandr --query | grep primary | cut -d" " -f1)
	SCREENS=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

	log "primary monitor $MONITOR_PRIMARY $SCREENS"
	for M in ${SCREENS[@]}; do
		log ${M}
		MONITOR=${M} DPI=162 polybar -r primary &
	done
fi
