for usb automount: gvfs
for NTFS write support: ntfs-3g
for FAT32 format support: dosfstools
for Tor Browser video:  all codecs (simply pacman -vlc)
for reboot, shutdown without pass: sudo vim /etc/sudoers, add %admin ALL=NOPASSWD: /sbin/reboot, /sbin/sh..
for add wifi profile - copy wifiHiddenProfile to /etc/netctl/ and exec sudo netctl start profilename
for add backlight support - copy 10-backlight to /etc/X11/xorg.conf.d/     + pacman -S xf86-video-intel

for find mediakeys > xmodmap -pke | grep -i backli

for start docker daemon: add user to docker group; >> systemctl start docker
delete all docker containers: docker rm $(docker ps -a | grep -v "_data" | awk 'NR>1 {print $1}')
