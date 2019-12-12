#!/usr/bin/env bash
#
# File: .bashrc
# Path: $HOME
# Tags: bash shell
# Description: bash shell config
# Last update: 11/12/2019 20:28
# Author: Colpshift
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
