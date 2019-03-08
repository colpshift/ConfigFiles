#!/usr/bin/env bash
#
# File: .profile
# Author: Colps
# Github: https://github.com/colpshift
# Description: local profile configuration
# Last Modified: 14/02/2019 19:37

# Enable/Disable touchpad
lista=$(xinput list | grep -i 'mouse')
if [ ${#lista} -eq 0 ]; then
    xinput enable ETPS/2\ Elantech\ Touchpad
    notify-send "No USB Mouse Detected" "Your Touchpad is Active"
else
    xinput disable ETPS/2\ Elantech\ Touchpad
    notify-send "USB Mouse Detected" "Your Touchpad is Disabled"
fi

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# Udiskie daemon start
udiskie -s &

# i3 Screen lock start
xss-lock -- i3lock -n -i /home/colps/Pictures/wallpapers/lock_cave.png -t &
