#!/bin/sh

# More info : https://github.com/jaagr/polybar/wiki

# Install the following applications for polybar and icons in polybar if you are on ArcoLinuxD
# awesome-terminal-fonts
# Tip : There are other interesting fonts that provide icons like nerd-fonts-complete
# --log=error
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)

case $desktop in

    # main polybar at eDP1
    bspwm|/usr/share/xsessions/bspwm)

    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep "eDP1 connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-bspwm -c ~/.config/polybar/config &
      done
    else
      polybar --reload mainbar-bspwm -c ~/.config/polybar/config &
    fi

    # extra polybar at HDMI1
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep "HDMI1 connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload HDMI1-bspwm -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-bspwm -c ~/.config/polybar/config &
    fi

    ;;
esac

