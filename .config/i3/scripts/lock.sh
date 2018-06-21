#!/bin/bash

# Approximate timeout rate in milliseconds (checked every 5 seconds).
timeout="30000"

# Take a screenshot
scrot /tmp/screen.png

[[ -f ~/.config/i3/lock.png ]] &&
convert /tmp/screen.png -paint 4 ~/.config/i3/lock.png -gravity center -composite -matte /tmp/screen.png

# Pause music (mocp and mpd):
# mocp -P
# mpc pause

# Lock it up!
i3lock -e -f -c 000000 -i /tmp/screen.png

# If still locked after $timeout milliseconds, turn off screen.
while [[ $(pgrep -x i3lock) ]]; do
  [[ $timeout -lt $(xssstate -i) ]] && xset dpms force off
  sleep 5
done
