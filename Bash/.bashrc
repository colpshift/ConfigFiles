#!/usr/bin/env bash
#
# File: .bashrc
# Author: Colps
# Github: https://github.com/colpshift
# Description: local bash configuration
# Last Modified: dezembro 24, 2018

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# check language
if [[ $LANG = '' ]]; then
	export LANG=en_US.UTF-8
fi

# Add bash aliases
if [ -f $HOME/.bashrc.aliases ]; then
    source $HOME/.bashrc.aliases
fi

# Enable programmable completion features.
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# Default applications
export BROWSE=chromium
export VISUAL=vim
export EDITOR=vim
set editing-mode vi		# turn on vim on shell 

# Exclude root from variables
if [ "$(id -u)" != "0" ]; then
	# Local variables
	export PATH="$PATH:$HOME/.local/bin/"
	export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3.7"
	export WORKON_HOME="$HOME/Envs"
	export WORKON_HOME="$HOME/.virtualenvs"
	export PROJECT_HOME="$HOME/Projects/"
	export PYTHONBREAKPOINT=pudb.set_trace
	source "/home/colps/.local/bin/virtualenvwrapper.sh"
fi
