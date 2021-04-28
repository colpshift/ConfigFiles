#!/bin/bash
#
function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}
# services and config
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
sh ~/.screenlayout/edp1-hdmi1.sh
run "numlockx on"     # turn on numlock
run "xset s off"      # Stop screen from going blank
run "xset -dpms"      # Stop screen from going blank
run "xset s noblank"  # Stop screen from going blank
xset r rate 210 40    # Faster key repeat and delay
sh ~/.scripts/sxhkd_start.sh
sh ~/.scripts/picom_start.sh 
sh ~/.scripts/xbanish_start.sh
sh ~/.scripts/autocutsel_start.sh
sh ~/.scripts/mpd_start.sh
~/.fehbg &
# apps
run "qtpad" \
  && run "rambox" \
  && run "joplin-desktop" \
  && run "alacritty" \
# conky bar
sh ~/.scripts/conky_start.sh

