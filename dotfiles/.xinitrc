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
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#
# start apps
dunst_start.sh
flameshot_start.sh
autocutsel_start.sh
xscreensaver_start.sh
picom_start.sh
mpd_start.sh
devices_start.sh
~/.fehbg &
#
# conky bar andw dwm
(conky | while read LINE; do xsetroot -name "$LINE"; done) &

#
# start dwm
exec dwm

