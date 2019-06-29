#!/bin/zsh
#
# $HOME.zprofile
#

# Check external monitor
intern=eDP-1
extern=HDMI-1
if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
    #notify-send "No External Monitor Detected" "Only Internal Monitor is Active"
else
    xrandr --output eDP-1 --auto --output HDMI-1 --auto --left-of eDP-1
    notify-send "External Monitor Detected" "External Monitor is Active"
fi

# Enable/Disable touchpad
lista=$(xinput list | grep -i 'mouse')
if [ ${#lista} -eq 0 ]; then
    xinput enable ETPS/2\ Elantech\ Touchpad
    notify-send "No USB Mouse Detected" "Your Touchpad is Active"
else
    xinput disable ETPS/2\ Elantech\ Touchpad
    #notify-send "USB Mouse Detected" "Your Touchpad is Disabled"
fi

# keyboard layout
setxkbmap br

