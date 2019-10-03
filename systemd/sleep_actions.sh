#!/usr/bin/env sh
#
# /usr/lib/systemd/system-sleep/sleep_actions.sh
#
case $1/$2 in
  pre/*)
    /usr/bin/sleep 2
    ;;
  post/*)
    source '/home/colps/.zprofile'
    ;;
esac

