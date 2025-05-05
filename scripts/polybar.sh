#!/bin/bash

killall -q polybar

# Wait for process to shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
  MONITOR=$(polybar --list-monitors | cut -d":" -f1) polybar -r primary &
else
  MONITOR_PRIMARY=$(xrandr --query | grep primary | cut -d" " -f1)

  for m in $screens; do
    if [[ $MONITOR_PRIMARY == $m ]]; then
        MONITOR=$m DPI=162 polybar -r primary &
    fi
  done
fi
