#
# Path: ~/.zshrc
# Tags: zsh shell
# Description: zsh env config
# Author: colpshift
# Last update: 16/10/2021 15:39:48
#

### Set variables
WORDCHARS=${WORDCHARS//\/[&.;]}

### Set/unset ZSH options
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
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
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'

### History
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

### Load colors
autoload -U colors && colors
colors

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
alias exa='exa --header --long --group --git'
alias ll='ls'
alias ls='lsd -lh --color=auto --group-dirs=first'
alias la='ls -a'  # show hidden files and folders
alias lx='ls -X'  # sort by extension
alias lz='ls -rS' # sort by size
alias lt='ls -rt' # sort by date
alias dir='dir --color'
alias grep='rg'
alias dmesg='dmesg --color'
alias cat='batcat'
alias bat='batcat'
alias batcat='batcat --theme TwoDark'
alias df='dust'
alias du='duf'
alias ps='procs'
alias su='sudo -i'
alias vi='lvim'
alias vim='lvim'
alias gvim='lvim'
alias nvim='lvim'
alias gitu='git add . && git commit -S && git push'
alias gitb='git add . && git commit -S -m 'backup' && git push'
alias gitl='git log --graph'
alias cls='clear'
alias cmatrix='cmatrix -fs'
alias myip='curl http://ipecho.net/plain; echo'
alias neofetch='clear && neofetch --color_blocks off'
alias pkg_install="sh ~/.scripts/fzf_pkg_pop_install.sh"
alias pkg_remove="sh ~/.scripts/fzf_pkg_pop_remove.sh"
alias systemctl_error='sudo systemctl --failed'
alias journal_error='sudo journalctl -p 3 -xb'

### Theming section
autoload -U compinit colors zcalc
compinit -d
colors

### man using fzf, fd and bat.
unset MANPATH
fman() {
  man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat --theme Nord -l man -p --color always' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}
export MANPAGER="sh -c 'col -bx | batcat --theme Nord -l man -p --paging always'"
export MANWIDTH=999

### Zsh fzf-tab
source /home/colps/Src/fzf-tab/fzf-tab.plugin.zsh
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

### Completion
source /home/colps/.config/cheat/cheat.zsh

### Zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/emoji-cli/emoji-cli.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# command is not found
#source /usr/share/doc/pkgfile/command-not-found.zsh

### Set prompt
autoload -Uz compinit promptinit
compinit -d
promptinit
#
# Prompt starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

### gpg agent
GPG_TTY=$(tty)
export GPG_TTY

### rust
source $HOME/.cargo/env

### ruby
eval "$(rbenv init -)"

### fasd
eval "$(fasd --init auto)"

### forgit
source $HOME/Src/forgit/forgit.plugin.zsh

### zsh_functions
source /usr/share/doc/fzf/examples/key-bindings.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### wezterm
sh $HOME/.config/wezterm/wezterm_integration.sh

