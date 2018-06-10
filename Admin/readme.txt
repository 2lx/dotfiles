for usb automount: gvfs
for NTFS write support: ntfs-3g
for FAT32 format support: dosfstools
for Tor Browser video:  all codecs (simply pacman -vlc)
for reboot, shutdown without pass: sudo vim /etc/sudoers, add %admin ALL=NOPASSWD: /sbin/reboot, /sbin/sh..
for add wifi profile - copy wifiHiddenProfile to /etc/netctl/ and exec sudo netctl start profilename
for add backlight support - copy 10-backlight to /etc/X11/xorg.conf.d/     + pacman -S xf86-video-intel
for install ftp server: pacman -S vsftpd && systemctl enable vsftpd && /etc/vsftpd.conf
for minimize swap usage copy: cp 99-sysctl.conf /etc/sysctl.d/

for disable interrupt on undock laptop: cp disable_inter... /etc/systemd/system/ && systemctl enable

for find mediakeys > xmodmap -pke | grep -i backli

for start docker daemon: add user to docker group; >> systemctl start docker
delete all docker containers: docker rm $(docker ps -a | grep -v "_data" | awk 'NR>1 {print $1}')

fan control: thinkfan package -- not installed

battery support lenovo: sudo pacman -S tlp
> sudo tlp stat | less  :: read the recomendations
> systemctl enable tlp.service
> systemctl enable tlp-sleep.service
> systemctl mask systemd-rfkill.service
> pacman -S tpacpi-bat !!! not tp_smapi , after reboot check the systemctl failed (manual: arch wiki systedm)
> rkfill list :: list all un\blocked wireless devices

SSD support and optimization:
> pacman -S hdparm
> vim /etc/fstab add "discard" for ext4 and SWAP fs

packages sysstat for mpstat


