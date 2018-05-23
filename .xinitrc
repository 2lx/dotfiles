[[ -f ~/.Xresources ]] && xrdb -merge $HOME/.Xresources

xset -b                                 # disable bell
xset s off                              # disable screensaver
xset dpms 600                           # enable power save

export TERMINAL=/usr/bin/urxvt
export EDITOR=/usr/local/bin/vim
export PAGER=less
export LC_ALL=en_US.UTF-8

exec i3 -l
# exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1

# setup keyboard layouts
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll,ctrl:nocaps"

systemctl --user import-environment DISPLAY
