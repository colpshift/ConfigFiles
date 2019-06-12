#!/bin/zsh
#
# $HOME.zprofile
#

# Enable/Disable touchpad
lista=$(xinput list | grep -i 'mouse')
if [ ${#lista} -eq 0 ]; then
    xinput enable ETPS/2\ Elantech\ Touchpad
    notify-send "No USB Mouse Detected" "Your Touchpad is Active"
else
    xinput disable ETPS/2\ Elantech\ Touchpad
    notify-send "USB Mouse Detected" "Your Touchpad is Disabled"
fi

# keyboard layout
setxkbmap br

# autocutsel
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# udiskie
udiskie -Ans &

# MPD daemon start
[ ! -s ~/.config/mpd/pid ] && mpd

# urxvt daemon
urxvtd -q -o -f 

