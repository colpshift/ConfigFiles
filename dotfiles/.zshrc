#
# Path: ~/.zshrc
# Tags: zsh shell
# Description: zsh env config
# Author: colpshift
# Last update: 03/07/2021 13:14 
#

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.

### zsh style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

### zsh history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

### Editor
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


### Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     	# End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

### Set alias
#############
alias exa='exa --header --long --group --git'
alias ll='ls'
alias ls='ls -lh --color=auto --group-directories-first'
alias la='ls -ah'  # show hidden files and folders
alias lx='ls -BXh' # sort by extension
alias lz='ls -rSh' # sort by size
alias lt='ls -rth' # sort by date
alias dir='dir --color'
alias grep='grep --color'
alias dmesg='dmesg --color'
alias df='df -h'
alias du='du -h'
alias su='sudo -i'
alias vi='/home/colps/.local/bin/nvim'
alias vim='/home/colps/.local/bin/nvim'
alias gvim='/home/colps/.local/bin/nvim'
alias bat='bat --theme Nord'
alias gitu='git add . && git commit && git push'
alias gitb='git add . && git commit -m 'backup' && git push'
alias gitl='git log --oneline'
alias surf='surf -DI'
alias mpv='devour mpv'
alias sxiv='devour sxiv'
alias zathura='devour zathura'
alias cls='clear'
alias cmatrix='cmatrix -fs'
alias myip='curl http://ipecho.net/plain; echo'
alias neofetch='clear && neofetch --color_blocks off'
alias parui='~/.scripts/fzf_paru_install.sh'
alias parur='~/.scripts/fzf_paru_remove.sh'
alias parup='~/.scripts/paru_update.sh'
alias grub_update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias systemctl_error='sudo systemctl --failed'
alias journal_error='sudo journalctl -p 3 -xb'

### Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

### Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

### Zsh Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down
# command is not found
source /usr/share/doc/pkgfile/command-not-found.zsh

### Set prompt
##############
autoload -Uz compinit promptinit
compinit -d
promptinit
#
# Prompt starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

### ruby
########
eval "$(rbenv init -)"

### fasd
########
eval "$(fasd --init auto)"

### forgit
##########
source $HOME/Src/forgit/forgit.plugin.zsh

### zsh_functions
#################
fpath+=${ZDOTDIR:-~}/.zsh_functions

# fzf completion
################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

