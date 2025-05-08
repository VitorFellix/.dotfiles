#!/bin/bash

if [ "$1" == "" ]; then
	echo "no image provided, setting random image."
	feh --no-fehbg --bg-fill --randomize "${WALLPAPER_FOLDER:-~/Pictures/Wallpapers}"
else
	echo "image provided: $1"
	feh --no-fehbg --bg-fill --randomize "$1"
fi
