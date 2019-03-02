#!/usr/bin/env bash
#
# File: .bashrc
# Author: Colps
# Github: https://github.com/colpshift
# Description: local bash configuration
# Last Modified: 14/01/2019 23:34

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
	source /usr/share/bash-completion/completions/pass
fi

# pkg "command not found" hook 
source /usr/share/doc/pkgfile/command-not-found.bash

# line wrap on windows resize.
shopt -s checkwinsize

# Fixing tilix error
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi


# Configure pinentry to use the correct TTY
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# Default applications
export BROWSE=/usr/bin/firefox
export VISUAL=vim
export EDITOR=vim
set -o vi  # turn on vim on shell 

# Exclude root from variables
if [ "$(id -u)" != "0" ]; then
	# Local variables
	export BACK="$HOME/Documents/$HOSTNAME"
	export GITHUB="$HOME/Github/config_files"
	export XDG_DATA_HOME="$HOME/.config"
	export PATH="$PATH:$HOME/.local/bin/"
	export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3.7"
	export WORKON_HOME="$HOME/Envs"
	export WORKON_HOME="$HOME/.virtualenvs"
	export PROJECT_HOME="$HOME/Projects/"
	export PYTHONBREAKPOINT=pudb.set_trace
	export XDG_RUNTIME_DIR="/run/user/1000"
	source "/home/colps/.local/bin/virtualenvwrapper.sh"
fi
