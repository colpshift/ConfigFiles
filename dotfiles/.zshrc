#!/usr/bin/env zsh
#
# File: .zshrc
# Path: $HOME
# Tags: zsh shell
# Description: zsh config
# Last update: 29/12/2019 14:16
# Author: Colpshift
#

### Set/unset ZSH options
#########################
# setopt NOHUP
# setopt NOTIFY
# setopt NO_FLOW_CONTROL
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
setopt AUTO_LIST
setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME
unsetopt BG_NICE
setopt CORRECT
setopt EXTENDED_HISTORY
setopt HASH_CMDS
setopt MENUCOMPLETE
setopt COMPLETE_ALIASES
setopt ALL_EXPORT

### Set/unset  shell options
############################
setopt   notify globdots correct pushdtohome cdablevars autolist numericglobsort
setopt   correctall autocd recexact rcexpandparam nocheckjobs nobeep
setopt   autopushd autoresume histignoredups pushdsilent pushdignoredups
setopt   pushdminus extendedglob nocaseglob rcquotes mailwarning
unsetopt bgnice autoparamslash

### Autoload zsh modules when they are referenced
#################################################
autoload -Uz compinit && compinit
autoload -U history-search-end
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload zsh/complist
#zmodload -ap zsh/mapfile mapfile
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

### Set variables
#################
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
WORDCHARS=${WORDCHARS//\/[&.;]}
HOSTNAME="`hostname`"
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

### Load colors
###############
autoload -U colors && colors
colors

### Color man pages
###################
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-rs

### Set prompt
##############
autoload -Uz compinit zcalc promptinit
compinit -d
promptinit
setopt prompt_subst

### Prompt
##########
#
# Prompt spaceship
# https://github.com/denysdovhan/spaceship-prompt
# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
#
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=true
SPACESHIP_HOST_SHOW=true
SPACESHIP_JOBS_SHOW=false
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_VI_MODE_SHOW=false
prompt spaceship

### help
########
autoload -Uz run-help
alias help='run-help'
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

### Set alias
#############
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
alias vi='/bin/nvim'
alias vim='/bin/nvim'
alias gpg='gpg2'
alias cat='bat --theme TwoDark'
alias gitu='git add . && git commit && git push'
alias cls='clear'
alias myip='curl http://ipecho.net/plain; echo'
alias neofetch="neofetch --color_blocks ff --ascii_distro Anarchy"
alias sxiv='sxiv -qt'
alias rofi='rofi -show drun'
alias urxvt="/home/colps/.scripts/urxvts.sh"
alias clerk="/bin/clerk -f"
alias ncmpcpp="ncmpcpp -s media_library"
alias st-apply-patch="patch -i"
alias systemctl_error='sudo systemctl --failed'
alias journal_error='sudo journalctl -p 3 -xb'
alias grub_update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub_install='grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck'
alias yayu='yay -Syu'
alias yayi='sh $HOME/.scripts/fzf_pkg_aur.sh'
alias pacman='sudo pacman --color=always'
alias pacu='pacman -Syu'
alias paci='sh $HOME/.scripts/fzf_pkg_pac.sh'
alias pacman-key_update='sudo pacman-key --refresh-keys && sudo pacman -Syu'
alias pacman-mirror_update='sudo reflector --country "United States" --country Brazil --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

### Completion Styles
#####################
#
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
# insert all expansions for expand completer
zstyle ':completion:*:_expand:*' tag-order all-expansions
# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}e'
# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'
# add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
# NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}')
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

### Persistent rehash
#####################
zstyle ':completion:*' rehash true
# On-demand rehash
zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook
rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

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
# command not found
source /usr/share/doc/pkgfile/command-not-found.zsh
# interactive cd
source /usr/share/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
# zsh user completions
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Terminal st
#############
#function zle-line-init () { echoti smkx }
#function zle-line-finish () { echoti rmkx }
#zle -N zle-line-init
#zle -N zle-line-finish

### fzf completion
##################
#export FZF_COMPLETION_TRIGGER='~~'
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/fzf-extras.zsh
#
