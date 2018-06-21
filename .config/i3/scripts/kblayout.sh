#!/bin/sh

# VARKL="$(xkblayout-state print %s | tr [a-z] [A-Z])"
VARKL="$(xkb-switch -p | tr [a-z] [A-Z])"

case "$VARKL" in
    "US" ) echo "<span foreground='#b2b2b2'><b>=US=</b></span>";;
    "RU" ) echo "<span foreground='#e74c3c'><b>=RU=</b></span>";;
esac

