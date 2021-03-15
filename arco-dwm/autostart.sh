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
sxhkd -c ~/.config/arco-dwm/sxhkd/sxhkdrc &
sh ~/.scripts/picom_start.sh
sh ~/.scripts/xbanish_start.sh
~/.fehbg &
run "numlockx on"
run "xset s off"      # Stop screen from going blank
run "xset -dpms"      # Stop screen from going blank
run "xset s noblank"  # Stop screen from going blank
xset r rate 210 40    # Faster key repeat and delay
# apps
run "qtpad"
run "alacritty"
run "surf https://web.whatsapp.com"
run "surf https://messages.android.com"
# conky bar
sh ~/.scripts/conky_start.sh

