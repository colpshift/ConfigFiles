#!/bin/zsh
#
# ~/.zshenv
#

# path
typeset -U path
path=(/bin /usr/bin /sbin /usr/sbin /usr/local/bin $HOME/.local/bin/ $path[@])

# Default applications
export BROWSE="/usr/bin/firefox"
export VISUAL=vim
export EDITOR=vim

# Variables
export HOSTNAME="colpsnote01"

