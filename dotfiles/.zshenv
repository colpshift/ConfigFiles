#
# Path: ~/.zshenv
# Tags: zsh shell
# Description: zsh env config
# Author: colpshift
# Last update: 03/07/2021 13:27
#

### path
typeset -U path
path=($HOME/.local/bin $HOME/.scripts $HOME/.local/share/gem/ruby/3.0.0/bin $HOME/.rbenv/bin $HOME/.cargo/bin $HOME/go/bin /bin /usr/bin /sbin /usr/sbin /usr/local/go/bin /usr/local/bin $HOME/.node_modules $path[@])

### default e-mail
export DEFAULT_RECIPIENT="marcos.colpani@gmail.com"

### fzf
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
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

### go
export GOPATH="$HOME/go"

### ruby
eval "$(rbenv init -)"

