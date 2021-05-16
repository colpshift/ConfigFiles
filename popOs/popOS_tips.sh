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
# system extension
Alt Tab: Raise First Window
Always Show Workspaces
Pop Shell
Pop Shop Details
System76 Power
# community
Dash to Dock by michele_g
Applications Overview Tooltip by RaphaelR
Auto Move Windows by fmuellner
CPU Power Manager by martin31821
Desktop Icons NG (DING) by rastersoft
KStatusNotifierItem/AppIndicator Support by 3v1n0
Lock Keys by kazimieras.vaina
Multi Monitors Add-On by spin83
Sound Input & Output Device Chooser by kgshank
Ubuntu AppIndicators by didrocks
User Themes by fmuellner
WindowOverlay Icons by sustmi
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

