#!/bin/bash

# run this script as: swww-wallpaper.sh <path-to-images> <interval-between-transitions>

# you can also set a wallpaper directly with swww:
# swww img ~/Pictures/Wallpapers/mountain.jpg --transition-type center --transition-fps 240

while true; do
	find "$1" -maxdepth 1 -type f \
	| while read -r img; do
		echo "$(</dev/urandom tr -dc a-zA-Z0-9 | head -c 8):$img"
	done \
	| sort -n | cut -d':' -f2- \
	| while read -r img; do
		echo "$img"
		swww img --resize=crop --transition-fps 240 "$img"
		sleep "$2"
	done
done
