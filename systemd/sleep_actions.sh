#!/usr/bin/env sh
#
# /usr/lib/systemd/system-sleep/sleep_actions.sh
#
case $1/$2 in
  pre/*)
    /bin/sleep 2
    ;;
  post/*)
    source /home/colps/.zshrc
    source /home/colps/.zshenv
    sh /home/colps/.scripts/devices_start.sh
    ;;
esac

