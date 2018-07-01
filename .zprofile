if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then # check disaplay and virtual terminal
  exec startx # start Xorg display server
fi

# To quit X run
# > pkill -15 Xorg
# To kill window manager
# > pkill -15 -t tty"$XDG_VTNR" Xorg
