for usb automount: gvfs
for NTFS write support: ntfs-3g
for FAT32 format support: dosfstools
for Tor Browser video:  all codecs (simply pacman -vlc)
for reboot, shutdown without pass: sudo vim /etc/sudoers, add %admin ALL=NOPASSWD: /sbin/reboot, /sbin/sh..
for add wifi profile - copy wifiHiddenProfile to /etc/netctl/ and exec sudo netctl start profilename
for add backlight support - copy 10-backlight to /etc/X11/xorg.conf.d/     + pacman -S xf86-video-intel
for install ftp server: pacman -S vsftpd && systemctl enable vsftpd && /etc/vsftpd.conf
for minimize swap usage copy: cp 99-sysctl.conf /etc/sysctl.d/
for add application in app list copy *.desktop file to .local/share/applications

for make sudo vim load user cfg:
> sudo ln -s /home/User/.vimrc /root/.vimrc
> sudo ln -s /home/User/.vim/ /root/.vim

for setup ethernet: ip link show dev enp0s31f6
sudo ip link set enp0s31f6 up

for setup lightdm - install lightdm lightdm-gtk-greeter
copy lightdm.conf /etc/lighdm/

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

power management Arch wiki:
copy audio_powersave.conf to /etc/modprobe.d/
copy webcamera_disable.conf to /etc/modprobe.d/
copy 50-bluetooth.rules 51-usb.rules 70-.rules to /etc/udev/rules.d/
