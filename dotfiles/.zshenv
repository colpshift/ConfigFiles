#!/bin/sh
#
# File: .zshenv
# Path: ~/
# Tags: zsh shell
# Description: zsh env config
# Last update: 30/05/2021 10:21
# Author: Colpshift
#

### path
typeset -U path
path=($HOME/.local/bin $HOME/.local/share/gem/ruby/3.0.0/bin $HOME/go/bin $HOME/.scripts $GEM_HOME/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin $HOME/.cargo/bin $path[@])

### fzf
# using fd
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# preview
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# default e-mail
export DEFAULT_RECIPIENT="marcos.colpani@gmail.com"

### cheat
export CHEAT_CONFIG_PATH="$HOME/.config/cheat/conf.yml"
export CHEAT_USE_FZF=true

