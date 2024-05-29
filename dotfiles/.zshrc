#
# Tags: zsh shell
# Description: zsh env config
# Author: colpshift
# Last update: 2024-04-14 20:00:00
#

### Set variables
WORDCHARS=${WORDCHARS//\/[&.;]}

### Set/unset ZSH options
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt AUTO_LIST
setopt MENUCOMPLETE
setopt COMPLETE_ALIASES
setopt ALL_EXPORT

### Set/unset shell options
setopt   notify globdots pushdtohome cdablevars autolist numericglobsort
setopt   autocd recexact rcexpandparam nocheckjobs nobeep
setopt   autopushd autoresume histignoredups pushdsilent pushdignoredups
setopt   pushdminus extendedglob nocaseglob rcquotes

### Completion Styles
autoload -Uz compinit
compinit
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$HOME/.zsh/cache/$HOST"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'

### History
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=999
export SAVEHIST=1000
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

### Load colors
autoload -U colors && colors
colors

### Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                   # Home key
bindkey '^[[H' beginning-of-line                    # Home key
# if [[ "${terminfo[khome]}" != "" ]]; then
#   bindkey "${terminfo[khome]}" beginning-of-line    # [Home] - Go to beginning of line
# fi
bindkey '^[[8~' end-of-line                         # End key
bindkey '^[[F' end-of-line                          # End key
# if [[ "${terminfo[kend]}" != "" ]]; then
#   bindkey "${terminfo[kend]}" end-of-line           # [End] - Go to end of line
# fi
bindkey '^[[2~' overwrite-mode                      # Insert key
bindkey '^[[3~' delete-char                         # Delete key
bindkey '^[[C'  forward-char                        # Right key
bindkey '^[[D'  backward-char                       # Left key
bindkey '^[[5~' history-beginning-search-backward   # Page up key
bindkey '^[[6~' history-beginning-search-forward    # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     
bindkey '^[Od' backward-word                                   
bindkey '^[[1;5D' backward-word                              
bindkey '^[[1;5C' forward-word                                
bindkey '^H' backward-kill-word
bindkey '^[[Z' undo

### Set alias
alias ll='lsd -lh --group-dirs first'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias dir='dir --color'
alias grep='rg'
alias dmesg='dmesg --color'
alias df='dust'
alias du='duf'
alias ps='procs'
alias su='sudo -i'
alias vi='nvim'
alias vim='nvim'
alias gvim='nvim'
alias cat='bat --theme Nord'
alias bat='bat --theme Nord'
# alias gitu='git add . && git commit -S && git push'
# alias gitb='git add . && git commit -S -m 'backup' && git push'
alias gitb="git commit -S -m 'backup' && git push"
alias gitinfo='onefetch --no-color-palette'
# alias gitl='git log --graph'
alias cls='clear'
alias myip='curl http://ipecho.net/plain; echo'
alias ports='netstat -tulanp'
alias fastfetch='clear && fastfetch -c neofetch.jsonc'
alias systemctl_error='sudo systemctl --failed'
alias journal_error='sudo journalctl -p 3 -xb'

### Theming section
autoload -U compinit colors zcalc
compinit -d
colors

### fzf
eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source "$HOME/.fzf.zsh"

### fzf search
#
# https://vitormv.github.io/fzf-themes/
#
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"
  --info="right"'
#
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
#
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#
# fzf Search file - Ctrl-T
export FZF_CTRL_T_OPTS="
  --preview 'bat --color=always {}' --preview-window '~3'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# 
# fzf Search history - Ctrl-R
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
#
# fzf Search file tree structure - Alt-C
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

### fzf search man - 'Ctrl-H'
fzf-man-widget() {
  batman="man {1} | col -bx | bat --language=man --plain --color always --theme=\"Monokai Extended\""
   man -k . | sort \
   | awk -v cyan="$(tput setaf 6)" -v blue="$(tput setaf 4)" -v res="$(tput sgr0)" -v bld="$(tput bold)" '{ $1=cyan bld $1; $2=res blue;} 1' \
   | fzf  \
      -q "$1" \
      --ansi \
      --tiebreak=begin \
      --prompt=' Man > '  \
      --preview-window '50%,rounded,<50(up,85%,border-bottom)' \
      --preview "${batman}" \
      --bind "enter:execute(man {1})" \
      --bind "alt-c:+change-preview(cht.sh {1})+change-prompt(ﯽ Cheat > )" \
      --bind "alt-m:+change-preview(${batman})+change-prompt( Man > )" \
      --bind "alt-t:+change-preview(tldr {1})+change-prompt(ﳁ TLDR > )"
  zle reset-prompt
}
# `Ctrl-H` keybinding to launch the widget (this widget works only on zsh, don't know how to do it on bash and fish 
# (additionaly pressing`ctrl-backspace` will trigger the widget to be executed too because both share the same keycode)
bindkey '^h' fzf-man-widget
zle -N fzf-man-widget

### fzf-tab -'Tab'
source "$HOME/.src/fzf-tab/fzf-tab.plugin.zsh"
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview "exa -1 --color=always"
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

### fzf forgit - 'ga','glo','gi','gd'
source "$HOME/.src/emoji-cli/fuzzy-emoji-zle.zsh"
source "$HOME/.src/forgit/forgit.plugin.zsh"
# forgit aliases
#
# forgit_log=glo
# forgit_diff=gd
# forgit_add=ga
# forgit_reset_head=grh
# forgit_ignore=gi
# forgit_checkout_file=gcf
# forgit_checkout_branch=gcb
# forgit_branch_delete=gbd
# forgit_checkout_tag=gct
# forgit_checkout_commit=gco
# forgit_revert_commit=grc
# forgit_clean=gclean
# forgit_stash_show=gss
# forgit_stash_push=gsp
# forgit_cherry_pick=gcp
# forgit_rebase=grb
# forgit_blame=gbl
# forgit_fixup=gfu

### Zsh plugins
source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" 
source "/usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### Set prompt
autoload -Uz compinit promptinit
compinit -d
promptinit
#
# Prompt starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

### Default apps
export TERMINAL=kitty
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export BROWSER="flatpak run com.microsoft.Edge"

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source "$function"
done
