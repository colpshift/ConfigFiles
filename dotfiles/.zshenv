#
# Path: ~/.zshenv
# Tags: zsh shell
# Description: zsh env config
# Author: colpshift
# Last update: 2023-05-27T14:51:57
#

### path
typeset -U path
path=($HOME/.local/bin $HOME/bin $HOME/.scripts $HOME/.rbenv/bin $HOME/.cargo/bin $HOME/go/bin /usr/local/go/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin $path[@])

### default e-mail
export DEFAULT_RECIPIENT="marcos.colpani@gmail.com"

### Default apps
export TERMINAL=wezterm
export TERM="xterm-256color"
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export BROWSER=brave.desktop

### gpg agent
export GPG_TTY=$(tty)

### ssh agent
eval "$(ssh-agent -s)" > /dev/null

