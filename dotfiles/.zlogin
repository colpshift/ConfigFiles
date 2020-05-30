#!/usr/bin/env zsh
#
# File: .zlogin
# Path: $HOME
# Tags: zsh shell
# Description: zsh login commands
# Last update: 11/12/2019 20:25
# Author: Colpshift
#
/bin/firefox-sync
xbindkeys &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
flameshot &
xscreensaver -nosplash &
~/.fehbg &
sh ~/.scripts/picom_start.sh
sh ~/.scripts/devices_start.sh
#
