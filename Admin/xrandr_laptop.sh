#!/bin/sh

xrandr --output eDP1 --mode 1920x1080 --rate 60 --output HDMI2 --off
feh --bg-fill ~/wall.jpg
polybar-msg cmd restart
