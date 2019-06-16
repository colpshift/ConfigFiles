#!/bin/zsh
#
# ~/.zshenv
#

# path
typeset -U path
path=(~/.local/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin $path[@])

# Default applications
export BROWSE="/usr/bin/firefox"
export VISUAL=vim
export EDITOR=vim

# Variables
export HOSTNAME="colpsnote01"
export BAKDIR="/home/colps/BAK/backup"

