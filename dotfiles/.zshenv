#
# Path: ~/.zshenv
# Tags: zsh shell
# Description: zsh env config
# Author: colpshift
# Last update: 2022/11/14 12:22
#

### path
typeset -U path
path=($HOME/.local/bin $HOME/.scripts $HOME/.rbenv/bin $HOME/.cargo/bin /usr/local/go/bin /bin /usr/bin /sbin /usr/sbin /usr/local/go/bin /usr/local/bin $path[@])

# default e-mail
export DEFAULT_RECIPIENT="marcos.colpani@gmail.com"

### fzf
export FZF_DEFAULT_COMMAND="fdfind --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# preview
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || tree -C {}) 2> /dev/null | head -200'"

### forgit
export FORGIT_LOG_GRAPH_ENABLE="true"
export FORGIT_LOG_FZF_OPTS='
--bind="ctrl-e:execute(echo {} |grep -Eo [a-f0-9]+ |head -1 |xargs git show |vim -)"
'
export FORGIT_FZF_DEFAULT_OPTS="
--exact
--border
--reverse
--height '80%'
"
export FORGIT_COPY_CMD='xclip -selection clipboard'

### cheat
export CHEAT_USE_FZF=true

### ruby
eval "$(rbenv init -)"

### rust
source $HOME/.cargo/env
. "$HOME/.cargo/env"

# ### perl
# PATH="/home/colps/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/colps/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/colps/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/colps/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/colps/perl5"; export PERL_MM_OPT;

