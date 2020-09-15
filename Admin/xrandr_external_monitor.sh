#!/bin/sh

xrandr --output eDP1 --off --output HDMI2 --mode 2560x1440 --rate 60
feh --bg-fill ~/wall2.jpg
polybar-msg cmd restart
