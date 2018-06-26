#!/bin/sh -

CURDIR="$( cd "$( dirname "${BASH_SOURCE[-1]}" )" && pwd )"
source $CURDIR/yadisk_conf.sh
# YANDEXUSER="..."
# YANDEXPASS="..."
# GPGPASS="..."

YANDEXSERVER="https://webdav.yandex.com:443/"
YANDEXPATH="$HOME/YaDisk/"
mkdir -p $YANDEXPATH

echo -e $YANDEXUSER"\n"$YANDEXPASS | sudo mount -t davfs $YANDEXSERVER $YANDEXPATH
printf "\n======== "$YANDEXPATH" ========\n"
ls -laH $YANDEXPATH
# sleep 2

# umount $HOME/YaDisk/
# cp -R -u -p .. ..   # copy only new files
