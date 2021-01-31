#!/usr/bin/zsh
#
# File: .zshrc
# Path: $HOME
# Tags: zsh shell
# Description: zsh config
# Last update: 29/12/2019 14:16
# Author: Colpshift
#

### Set variables
#################
WORDCHARS=${WORDCHARS//\/[&.;]}
HOSTNAME="`hostname`"

### Set/unset ZSH options
#########################
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt AUTO_LIST
setopt MENUCOMPLETE
setopt COMPLETE_ALIASES
setopt ALL_EXPORT

### Set/unset shell options
############################
setopt   notify globdots pushdtohome cdablevars autolist numericglobsort
setopt   autocd recexact rcexpandparam nocheckjobs nobeep
setopt   autopushd autoresume histignoredups pushdsilent pushdignoredups
setopt   pushdminus extendedglob nocaseglob rcquotes

### Completion Styles
#####################
autoload -Uz compinit
compinit
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'

### History
###########
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

### Load colors
###############
autoload -U colors && colors
colors

### Source plugins
##################
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# auto sugestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=9'
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# interactive cd
source /usr/share/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

### Set alias
#############
alias ps='procs'
alias ll='exa --header --long --group --git'
alias ls='ls -lh --color=auto --group-directories-first'
alias la='ls -ah'  # show hidden files and folders
alias lx='ls -BXh' # sort by extension
alias lz='ls -rSh' # sort by size
alias lt='ls -rth' # sort by date
alias dir='dir --color'
alias grep='grep --color'
alias dmesg='dmesg --color'
alias df='df -h'
alias du='dust'
alias su='sudo -i'
alias vi='/bin/nvim'
alias vim='/bin/nvim'
alias gvim='/bin/nvim'
alias grep='rg'
alias cat='bat'
alias bat='batcat --theme TwoDark'
alias find='fdfind'
alias fd='fdfind'
alias gitu='git add . && git commit'
alias gitp='git add . && git commit && git push'
alias gitl='git log --oneline'
alias cls='clear'
alias timeshift='sudo timeshift-gtk'
alias myip='curl http://ipecho.net/plain; echo'
alias neofetch="neofetch --color_blocks off "
alias systemctl_error='sudo systemctl --failed'
alias journal_error='sudo journalctl -p 3 -xb'
alias apt_install='/home/colps/.scripts/fzf_pkg_pop_install.sh'
alias apt_remove='/home/colps/.scripts/fzf_pkg_pop_remove.sh'
alias apt_update='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y'
alias apt_clean='sudo apt autoclean && sudo apt clean && sudo apt autoremove'

### Set prompt
##############
autoload -Uz compinit promptinit
compinit -d
promptinit
#
# Prompt spaceship
# https://github.com/denysdovhan/spaceship-prompt
# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
# ZSH_THEME="spaceship"
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_TIME_12HR=false
# SPACESHIP_USER_SHOW=true
# SPACESHIP_HOST_SHOW=true
# SPACESHIP_JOBS_SHOW=false
# SPACESHIP_EXIT_CODE_SHOW=true
# SPACESHIP_VI_MODE_SHOW=false
# source /usr/local/lib/node_modules/spaceship-prompt/spaceship.zsh
#
# Prompt starship
eval "$(starship init zsh)"

# ruby
################
eval "$(rbenv init -)"

# Kitty completion
##################
kitty + complete setup zsh | source /dev/stdin

# fzf completion
################
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/plugins/forgit/forgit.plugin.zsh

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath=($fpath "$HOME/.zfunctions")

