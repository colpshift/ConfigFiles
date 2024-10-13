#!/bin/sh
#
### popOS Tips
#
# alltomp3
#
sudo apt install python3-pip
sudo pip install pathlib
curl -s https://packagecloud.io/install/repositories/AllToMP3/alltomp3/script.deb.sh | sudo bash
sudo apt-get install alltomp3
#
## Install restricted packages
#
sudo apt install ubuntu-restricted-extras ubuntu-restricted-addons
#
## reduce swappiness
#
cat /proc/sys/vm/swappiness
swappiness = 10
#
## boot splash
#
sudo apt install plymouth-theme-pop-logo
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u
#
## gnome shell extensions
#
Applications Overview Tooltip by RaphaelR
Caffeine by eon
Lock Keys by kazimieras.vaina
Sound Input & Output Device Chooser by kgshank
WindowOverlay Icons by sustmi
Multi Monitors Add-On by spin83
#
System extension
Cosmic Dock
Desktop Icons NG (DING) by rastersoft
Pop COSMIC
Pop Shell
System76 Power
System76 Power Management
Ubuntu AppIndicators by didrocks
#
#  icons
#
parpirus-dark
flatery-dark
#
# cursor
#
bibata ice
#
# default terminal
#
sudo update-alternatives --config x-terminal-emulator
#
# grub dual boot
#
sudo apt update
sudo apt upgrade
sudo apt install os-prober
sudo apt install grub2-common
sudo update-grub

