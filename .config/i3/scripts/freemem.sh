#!/bin/sh

VARFR="$(free -h | awk 'NR == 2 {print $4}')"
VARFRM="$(free -m | awk 'NR == 2 {print $4}')"

VARCOLOR="#b2b2b2"
if (( $VARFRM < 4000 )); then
    VARCOLOR="#e74c3c"
elif (( $VARFRM < 8000 )); then
    VARCOLOR="#f1c40f"
fi

echo "<span foreground='"$VARCOLOR"'>FREE: "$VARFR"</span>"

