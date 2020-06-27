#!/usr/bin/env zsh
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
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
WORDCHARS=${WORDCHARS//\/[&.;]}
HOSTNAME="`hostname`"

### Set/unset ZSH options
#########################
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt AUTO_LIST
setopt HASH_CMDS
setopt MENUCOMPLETE
setopt COMPLETE_ALIASES
setopt ALL_EXPORT
setopt ALWAYS_TO_END
setopt ALWAYS_LAST_PROMPT

### Set/unset  shell options
############################
setopt   notify globdots pushdtohome cdablevars autolist numericglobsort
setopt   autocd recexact rcexpandparam nocheckjobs nobeep
setopt   autopushd autoresume histignoredups pushdsilent pushdignoredups
setopt   pushdminus extendedglob nocaseglob rcquotes

### Autoload zsh modules when they are referenced
#################################################
autoload -U history-search-end
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload zsh/complist

### Command completion
######################
autoload -Uz compinit
compinit
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

### Completion Styles
#####################
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*:_expand:*' tag-order all-expansions
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}e'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}')
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

# history
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

### Bind keys
#############
typeset -g -A key
#
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
# Setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-beginning-search

### Set prompt
##############
autoload -Uz compinit zcalc promptinit
compinit -d
promptinit
setopt prompt_subst

# Prompt spaceship
#
# https://github.com/denysdovhan/spaceship-prompt
#
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
#
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

### Load colors
###############
autoload -U colors && colors
colors

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-rs

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
alias gitu='git add . && git commit'
alias gitp='git add . && git commit && git push'
alias gitl='git log --oneline'
alias cls='clear'
alias myip='curl http://ipecho.net/plain; echo'
alias neofetch="neofetch --color_blocks ff --ascii_distro Anarchy"
alias sxiv='devour.sh sxiv -qt'
alias mpv='devour.sh mpv'
alias zathura='devour.sh zathura'
alias rofi='rofi -show drun'
alias urxvt="/home/colps/.scripts/urxvts.sh"
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
alias tor='sh -c '"/home/colps/Apps/tor-browser_en-US/Browser/start-tor-browser" 

# Persistent rehash
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

# fzf completion
################
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/fzf-extras.zsh
source /usr/share/fzf/forgit
#
