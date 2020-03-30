#!/usr/bin/env zsh
#
# File: .zshenv
# Path: $HOME
# Tags: zsh shell
# Description: zsh env config
# Last update: 11/12/2019 20:22
# Author: Colpshift
#

### path
typeset -U path
path=(~/.local/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin ~/.scripts $path[@])

### systemd user
export XDG_RUNTIME_DIR="/run/user/1000"

### default applications
export BROWSE="/bin/firefox"
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

### config applications
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"

### fuzzy search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# preview the content of the file under the cursor
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#
