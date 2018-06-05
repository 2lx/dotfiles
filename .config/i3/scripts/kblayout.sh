#!/bin/sh

# VARKL="$(xkblayout-state print %s | tr [a-z] [A-Z])"
VARKL="$(xkb-switch -p | tr [a-z] [A-Z])"

case "$VARKL" in
    "US" ) echo "<span foreground='#2ecc71'><b>=US=</b></span>";;
    "RU" ) echo "<span foreground='#3498db'><b>=RU=</b></span>";;
esac

