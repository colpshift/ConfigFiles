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
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char
# Shortcut to exit shell on partial command line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh
# Check terminal is in application mode
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

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

### Dev Env
# Rust
source ~/.cargo/env

# fzf completion
################
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/forgit.plugin.zsh

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
alias su='sudo -i'
alias vi='/bin/nvim'
alias vim='/bin/nvim'
alias gvim='/bin/nvim'
alias gpg='gpg2'
alias bat='bat --theme TwoDark'
alias gitu='git add . && git commit'
alias gitp='git add . && git commit && git push'
alias gitl='git log --oneline'
alias sxiv='devour.sh sxiv'
alias zathura='devour.sh zathura'
alias mpv='devour.sh mpv'
alias surf='devour.sh surf -DB'
alias gparted='sudo devour.sh gparted'
alias cls='clear'
alias myip='curl http://ipecho.net/plain; echo'
alias neofetch="neofetch --color_blocks off "
alias rofi='rofi -show drun'
alias ncmpcpp="ncmpcpp -s media_library"
alias systemctl_error='sudo systemctl --failed'
alias journal_error='sudo journalctl -p 3 -xb'
alias grub_update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub_install='grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck'
alias yayu='yaourtix -Syu'
alias yayi='sh $HOME/.scripts/fzf_pkg_aur.sh'
alias pacman='sudo pacman --color=always'
alias pacu='pacman -Syu'
alias paci='sh $HOME/.scripts/fzf_pkg_pac.sh'
alias pacman-key_update='sudo pacman-key --refresh-keys && sudo pacman -Syu'
alias pacman-arch_mirror_update='sudo reflector --country "United States" --country Brazil --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist-arch'

### Set prompt
##############
autoload -Uz compinit zcalc promptinit
compinit -d
promptinit
# Prompt spaceship
# https://github.com/denysdovhan/spaceship-prompt
# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=true
SPACESHIP_HOST_SHOW=true
SPACESHIP_JOBS_SHOW=false
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_VI_MODE_SHOW=false
prompt spaceship
#
