#!/usr/bin/zsh
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
path=($HOME/.local/bin $HOME/.scripts $HOME/.rbenv/bin $HOME/.cargo/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin $path[@])

### fzf
# using fd
export FZF_DEFAULT_COMMAND="fdfind --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# preview
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

### cheat
export CHEAT_CONFIG_PATH="$HOME/.config/cheat/conf.yml"
export CHEAT_USE_FZF=true

### defaults apps
export EDITOR='/bin/nvim'
export BROWSER='/bin/brave-browser'
export MANPAGER='nvim +Man!'
export MANWIDTH=999

### rust env
source "$HOME/.cargo/env"

