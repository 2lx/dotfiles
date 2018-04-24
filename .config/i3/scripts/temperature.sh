#!/bin/sh

STRT=$(sensors | grep Core | tr -s ' ' | cut -d' ' -f3 | tr '\n' ' ')
TEMP1=$(echo $STRT | cut -d' ' -f1 | cut -d'.' -f1)
TEMP1=${TEMP1:1:9}
TEMP2=$(echo $STRT | cut -d' ' -f2 | cut -d'.' -f1)
TEMP2=${TEMP2:1:9}
TEMP=$(( $TEMP1 > $TEMP2 ? $TEMP1 : $TEMP2 ))

FGCOLOR=#b2b2b2
if (( $TEMP > 55 )); then
    FGCOLOR=#e74c3c
elif (( $TEMP > 40 )); then
    FGCOLOR=#f1c40f
fi

OUTPUTLINE="<span foreground='$FGCOLOR'>+$TEMP°C</span>"
echo "$OUTPUTLINE"

