#!/bin/sh
#
# ~/.xinitrc
#
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
#
# merge in defaults and keymaps
if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"
fi
#
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
#
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
#
systemctl --user import-environment DISPLAY
#
# bar with conky
(conky | while read LINE; do xsetroot -name "$LINE"; done) &
#
# Autostart section
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
xbindkeys &
flameshot &
xscreensaver -nosplash &
~/.fehbg &
sh ~/.scripts/devices_start.sh
sh ~/.scripts/picom_start.sh
#
# start dwm
exec dwm
#
