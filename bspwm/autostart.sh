#!/bin/bash

function run {
	if ! pgrep "$1"; then
		"$@" &
	fi
}

### monitors
#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal

### polybar
"$HOME/.config/polybar/launch.sh" &

### keyboard
#keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')	## layout
run sxhkd -c "$HOME/.config/bspwm/sxhkd/sxhkdrc" & # keybinds
xset r rate 210 40                                 # faster key repeat and delay
numlockx on &                                      # active numlock
run xbanish &

### wallpaper
#feh --bg-scale ~/.config/bspwm/wall.png &
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#feh --randomize --bg-fill ~/Képek/*
#feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*
"$HOME/.fehbg"

### cursor
xsetroot -cursor_name left_ptr &

### tray apps
# run caffeine &
run rambox
blueberry-tray &
run nm-applet &

### apps
run copyq
run flameshot
run joplin-desktop
run kitty
picom --config "$HOME/.config/bspwm/picom.conf" &

### daemons
run xfce4-power-manager &
"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" &
"/usr/lib/xfce4/notifyd/xfce4-notifyd" &
"$HOME/.scripts/mpd_start.sh"
