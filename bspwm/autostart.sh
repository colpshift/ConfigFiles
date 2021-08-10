#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# monitor
xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI1 --mode 1440x900 --pos 1366x0 --rotate normal --output VIRTUAL1 --off
# polybar
$HOME/.config/polybar/launch.sh &
# wallpaper
$HOME/.fehbg
# cursor
xsetroot -cursor_name left_ptr &
# keyboard
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
xset r rate 210 40  # Faster key repeat and delay
numlockx on &
# apps
run nextcloud
run copyq
run flameshot
run rambox
run dunst
run /home/colps/.scripts/mpd_start.sh
#
run xbanish &
run nm-applet &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/notification-daemon-1.0/notification-daemon &

