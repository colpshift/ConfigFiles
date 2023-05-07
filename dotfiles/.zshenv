#
# Path: ~/.zshenv
# Tags: zsh shell
# Description: zsh env config
# Author: colpshift
# Last update: 2022/11/14 12:22
#

### path
typeset -U path
path=($HOME/.local/bin $HOME/bin $HOME/.scripts $HOME/.rbenv/bin $HOME/.cargo/bin $HOME/go/bin /usr/local/go/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin $path[@])

# default e-mail
export DEFAULT_RECIPIENT="marcos.colpani@gmail.com"

### fzf
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# preview
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || tree -C {}) 2> /dev/null | head -200'"

