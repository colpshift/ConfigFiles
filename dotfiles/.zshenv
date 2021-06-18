#!/bin/sh
#
# Path: ~/.zshenv
# Tags: zsh shell
# Description: zsh env config
# Last update: 25/03/2021 00:40
# Author: Colpshift
#

### path
########
typeset -U path
path=($HOME/.local/bin $HOME/go/bin /usr/local/go/bin $HOME/.scripts $HOME/.rbenv/bin $HOME/.cargo/bin $HOME/.cargo/env $GEM_HOME/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin $path[@])

### fzf
######
# using fd
export FZF_DEFAULT_COMMAND="fdfind --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# preview
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# forgit
########
export FORGIT_FZF_DEFAULT_OPTS="
--exact
--border
--reverse
--height '80%'
"
#
export FORGIT_LOG_FZF_OPTS='
--bind="ctrl-e:execute(echo {} |grep -Eo [a-f0-9]+ |head -1 |xargs git show |vim -)"
'
export FORGIT_LOG_GRAPH_ENABLE="false"

# default e-mail
################
export DEFAULT_RECIPIENT="marcos.colpani@gmail.com"

### cheat
#########
export CHEAT_CONFIG_PATH="$HOME/.config/cheat/conf.yml"
export CHEAT_USE_FZF=true

### perl
########
PATH="/home/colps/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/colps/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/colps/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/colps/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/colps/perl5"; export PERL_MM_OPT;

