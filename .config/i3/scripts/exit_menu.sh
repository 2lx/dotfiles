#!/bin/bash

while [ "$select" != "NOTHING" -a "$select" != "LOGOUT" \
        -a "$select" != "SHUTDOWN" -a "$select" != "REBOOT" \
        -a "$select" != "LOCK" ]; do
    select=$(echo -e 'NOTHING\nLOCK\n\nLOGOUT\nSHUTDOWN\nREBOOT' | \
        dmenu -nb '#2f2f2f' -nf '#f3f4f5' -sb '#27ae60' -sf '#f3f4f5' -fn \
        'System San Francisco Display:bold:pixelsize=24' -i \
        -p "What do you want to do?")
    [ -z "$select" ] && exit 0
done

if [ "$select" = "NOTHING" ]; then
    exit 0;
fi
if [ "$select" = "LOCK" ]; then
    $HOME/.config/i3/scripts/lock.sh;
    exit 0;
fi

killall -HUP cmus;
killall -HUP chromium;
killall -HUP Telegram;
killall -HUP vim;
sleep 2;

[ "$select" = "LOGOUT" ] && i3-msg exit;
[ "$select" = "SHUTDOWN" ] && shutdown now;
[ "$select" = "REBOOT" ] && shutdown -r now;
