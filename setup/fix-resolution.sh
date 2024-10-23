# override the file with correct config
echo "Xft.dpi: 192" > ~/.Xresources

# merge?
xrdb -merge ~/.Xresources

# run xrandr
xrandr --dpi 192 --fb 6720x3960 \
	--output eDP --scale 1 --filter nearest --mode 2880x1800 --refresh 90 \
	--output DisplayPort-1 --scale 1 --filter nearest --mode 3840x2160 --refresh 60
