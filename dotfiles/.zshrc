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
setopt inc_append_history                                       # save commands are added to the history, otherwise only when shell exits.

### zsh style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

### zsh history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL='ignoredups'

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
alias exa='exa --header --long --group --git'
alias ll='ls'
alias ls='lsd -lh --color=auto --group-dirs'
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
alias mpv='devour mpv'
alias sxiv='devour sxiv'
alias zathura='devour zathura'
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

### Zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down
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

### nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

### ruby
eval "$(rbenv init -)"

### fasd
eval "$(fasd --init auto)"

### forgit
source $HOME/Src/forgit/forgit.plugin.zsh

### wezterm
source $HOME/.config/wezterm/wezterm_integration.sh

### zsh_functions
source /usr/share/doc/fzf/examples/key-bindings.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
