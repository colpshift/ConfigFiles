# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
export DEFAULT_USER='colps'

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 3

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  command-not-found
  zsh-completions
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
  zsh-interactive-cd
  zsh-vi-mode
  fzf
  fzf-tab
  forgit
)
#
source $ZSH/oh-my-zsh.sh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
source "$ZSH/oh-my-zsh.sh"

### fzf
eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source "$HOME/.fzf.zsh"
export FZF_BASE="$HOME/.fzf/"

### fzf search
#
# https://vitormv.github.io/fzf-themes/
#
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#6f6f6f,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'
#
export FZF_CTRL_T_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
#
# fzf Search file - Ctrl-T
export FZF_CTRL_T_OPTS="
  --preview 'bat --color=always --theme OneHalfDark {}' --preview-window '~3'
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

### alias
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
alias fd='fd-find'
alias cat='bat --theme Nord'
alias bat='bat --theme Nord'
alias gitu='git add . && git commit -S && git push && gh pr create -w'
alias gitb='git add . && git commit -S -m 'backup' && git push && gh pr create -w'
alias giti="clear && onefetch --no-color-palette"
alias apt="sudo apt"
alias aptu="apt update && apt full-upgrade && apt autoremove"
alias nala="sudo nala"
alias nalau="nala update && nala full-upgrade && nala autoremove"
alias cls='clear'
alias myip='curl http://ipecho.net/plain; echo'
alias ports='sudo ss -tulanp'
alias ubui="clear && fastfetch"
alias cmatrix='$HOME/.scripts/cmatrix_run.sh'
alias systemctl_error='sudo systemctl --failed'
alias journal_error='sudo journalctl -p 3 -xb'

### Default apps
export TERMINAL="kitty"
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export BROWSER="brave-browser"

