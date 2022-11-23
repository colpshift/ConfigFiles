#!/bin/sh

# dkms
sudo apt install dkms

# evdi-dkms
sudo apt install evdi-dkms

# mokutil
sudo apt install mokutil
sudo mokutil --disable-validation

# 20-displaylink.conf
sudo nvim /usr/share/X11/xorg.conf.d/20-displaylink.conf
1 │ Section "Device"
2 │ Identifier "DisplayLink"
3 │ Driver "modesetting"
4 │ Option "PageFlip" "false"
5 │ EndSection

# install driver wavlink WL-UG3501H
sudo ./displaylink-driver-5.4.1-55.174.run

# service
displaylink-driver.service
