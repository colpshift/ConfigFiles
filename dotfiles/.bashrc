#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# variables
export HDC="/home/colps"

# path
export PATH="/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:$HDC/.local/bin"

# command not found
source /usr/share/doc/pkgfile/command-not-found.bash

# completion features
source /usr/share/bash-completion/bash_completion


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
