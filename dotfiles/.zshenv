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
path=(~/.local/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin ~/.scripts ~/.gem/ruby/2.7.0/bin ~/.cargo/bin ~/.node_modules/bin ~/.zsh/functions $path[@])

### locale
export LANG="en_US.UTF-8"
export LC_COLLATE="C"

### pass extensions
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"

### fuzzy 
# search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# preview
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

### cheat
export CHEAT_USE_FZF="true"

### surf
export NO_AT_BRIDGE=1

### npm
export npm_config_prefix="~/.node_modules"

