#!/bin/zsh
#
# ~/.zshrc
#

### colors
autoload -U colors && colors

### completion features
autoload -Uz compinit promptinit
compinit
promptinit
### Improve appearance
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
### Auto correction
setopt correctall
### Auto commands
setopt autocd
setopt extendedglob
### autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select
### autosugestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=9'
### autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES
### Fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
### zsh history substring source
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
### command not found
source /usr/share/doc/pkgfile/command-not-found.zsh
### Persistent rehash
zstyle ':completion:*' rehash true
### On-demand rehash
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

### history searches
HISTFILE="$HOME/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

### Keymapping
typeset -g -A key
### Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

### make sure the terminal is in application mode
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start {
		echoti smkx
	}
	function zle_application_mode_stop {
		echoti rmkx
	}
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

### Use lf to switch directories
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

### help
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

### fzf completion
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

### color man
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

### aliases
alias ls='ls -l --color=auto --group-directories-first'
alias ll='ls -lh'
alias la='ls -ah'  # show hidden files and folders
alias lx='ls -BXh' # sort by extension
alias lz='ls -rSh' # sort by size
alias lt='ls -rth' # sort by date
alias dir='dir --color'
alias grep='grep --color'
alias dmesg='dmesg --color'
alias df='df -h'
alias du='du -h'
alias vi='vim'
alias pacman='sudo pacman --color=always'
alias pacu='pacman -Syu'
alias paci='sh $HOME/.scripts/fzf_pkg.sh'
alias yayu='yay -Syu'
alias gpg='gpg2'
alias urxvt='sh $HOME/.scripts/urxvts.sh'
alias pkgfile='sudo pkgfile'
alias cat="bat --theme TwoDark"
alias notmuch-vim='vim -c NotMuch'
alias ncmpcpp='ncmpcpp -s media_library -S visualizer'    
alias dmenu_run='dmenu_run -fn "Iosevka-11'

### prompt
prompt bart

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
