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

### default e-mail
export DEFAULT_RECIPIENT="marcos.colpani@gmail.com"

### fzf search
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#
# Search file - Ctrl-t
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# 
# Search history - Ctrl-r
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
#
# Search file tree structure - Alt-c
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

