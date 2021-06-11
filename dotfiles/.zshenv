#
# Path: ~/zshenv
# Tags: zsh shell
# Description: zsh env config
# Last update: 11/06/2021 07:48
# Author: Colpshift
#

### path
typeset -U path
path=($HOME/.local/bin $HOME/.local/share/gem/ruby/3.0.0/bin $HOME/go/bin $HOME/.scripts $GEM_HOME/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin $HOME/.cargo/bin $HOME/.rbenv/shims/ $path[@])


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

# Perl
PATH="/home/colps/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/colps/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/colps/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/colps/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/colps/perl5"; export PERL_MM_OPT;


