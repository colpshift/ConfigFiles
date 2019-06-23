#!/bin/zsh
#
# ~/.zshenv
#

### path
typeset -U path
path=(~/.local/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin $path[@])

### default applications
export BROWSE="/usr/bin/firefox"
export VISUAL=vim
export EDITOR=vim

### directories
export HOSTNAME="colpsnote01"
export BAKDIR="/home/colps/BAK/backup"

### fuzzy search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# preview the content of the file under the cursor
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

