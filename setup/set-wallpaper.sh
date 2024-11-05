#!/bin/bash

set -e

if [[ $1 == 2 ]]; then
	feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers\ 2
else
	feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers
fi
