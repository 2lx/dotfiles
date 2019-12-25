#!/bin/sh
# this script executed by startx and xinit
# also /etc/X11/xinit/xinitrc
# and  /etc/X11/xinit/xinitrc.d/*

[[ -f ~/.Xresources ]] && xrdb -merge $HOME/.Xresources

xset -b                                 # disable bell
xset s off                              # disable screensaver
xset dpms 600                           # enable power save

# export PATH=$PATH:
# export MANPATH="/usr/loval/man:$MANPATH"
# export GNUPGHOME=$HOME/.gnupg
export LANG=en_US.UTF-8
export TERMINAL=/usr/bin/urxvt
export VISUAL=/usr/local/bin/vim
export EDITOR=/usr/local/bin/vim
export PAGER=less
export LC_ALL=en_US.UTF-8
export GDK_CORE_DEVICE_EVENTS=1

# exec i3 -l # start i3 windows manager
exec i3 -V >> /tmp/i3log-$(date +'%F-%k-%M-%S') 2>&1

# setup keyboard layouts
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll,ctrl:nocaps"

# if there is no display manager:
systemctl --user import-environment DISPLAY
