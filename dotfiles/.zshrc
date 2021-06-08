#!/bin/sh
#
# File: .zshrc
# Path: ~/
# Tags: zsh shell
# Description: zsh config
# Last update: 07/04/2021 10:26
# Author: Colpshift
#

# ### Set variables
# #################
# WORDCHARS=${WORDCHARS//\/[&.;]}
#
# ### Set/unset ZSH options
# #########################
# setopt INC_APPEND_HISTORY SHARE_HISTORY
# setopt EXTENDED_HISTORY
# setopt APPEND_HISTORY
# setopt AUTO_LIST
# setopt MENUCOMPLETE
# setopt COMPLETE_ALIASES
# setopt ALL_EXPORT
#
# ### Set/unset shell options
# ############################
# setopt   notify globdots pushdtohome cdablevars autolist numericglobsort
# setopt   autocd recexact rcexpandparam nocheckjobs nobeep
# setopt   autopushd autoresume histignoredups pushdsilent pushdignoredups
# setopt   pushdminus extendedglob nocaseglob rcquotes
#
# ### Completion Styles
# #####################
# autoload -Uz compinit
# compinit
# zstyle ':completion::complete:*' use-cache on
# zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
# zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
#
# ### History
# ###########
# HISTFILE=$HOME/.zhistory
# HISTSIZE=1000
# SAVEHIST=1000
# autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
#
# ### Load colors
# ###############
# autoload -U colors && colors
# colors
#
# ### Source plugins
# ##################
# # Use syntax highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# # Use history substring search
# source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# # auto sugestions
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=9'
# #ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)
# #ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# # interactive cd
# #source /usr/share/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

### Manjaro config
##################
source /usr/share/zsh/manjaro-zsh-config

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
alias bat='bat --theme TwoDark'
alias find='fd'
alias gitu='git add . && git commit'
alias gitp='git add . && git commit && git push'
alias gitl='git log --oneline'
alias mpv='$HOME/.scripts/devour.sh umpv.py'
alias umpv='$HOME/.scripts/devour.sh umpv.py'
alias sxiv='$HOME/.scripts/devour.sh sxiv'
alias zathura='$HOME/.scripts/devour.sh zathura'
alias cls='clear'
alias newsnotify='notify-send --icon=rssguard'
alias myip='curl http://ipecho.net/plain; echo'
alias neofetch="neofetch --color_blocks off "
alias systemctl_error='sudo systemctl --failed'
alias journal_error='sudo journalctl -p 3 -xb'
alias grub_update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub_install='grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck'
alias pacman='sudo pacman --color=always'
#alias parui='$HOME/.scripts/fzf_pkg_install.sh'
#alias parur='$HOME/.scripts/fzf_pkg_remove.sh'

### Set prompt
##############
autoload -Uz compinit promptinit
compinit -d
promptinit
#
# Prompt starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
#
# Prompt Manjaro
#source /usr/share/zsh/zsh-maia-prompt

### kitty terminal
##################
kitty + complete setup zsh | source /dev/stdin

### ruby
########
eval "$(rbenv init -)"

### fasd
########
eval "$(fasd --init auto)"

# fzf completion
################
fpath+=${ZDOTDIR:-~}/.zsh_functions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

