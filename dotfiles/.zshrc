# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

### Set alias
alias exa='exa --header --long --group --git'
alias ll='ls'
alias ls='lsd -lh --group-dirs first'
alias la='ls -a'  # show hidden files and folders
alias lx='ls -X'  # sort by extension
alias lz='ls -rS' # sort by size
alias lt='ls -rt' # sort by date
alias dir='dir --color'
alias grep='rg'
alias dmesg='dmesg --color'
alias df='dust'
alias du='duf'
alias ps='procs'
alias su='sudo -i'
alias nvim='lvim'
alias vi='lvim'
alias vim='lvim'
alias gvim='lvim'
alias bat='bat --theme OneHalfDark'
alias cat='bat'
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
alias parui='~/.scripts/fzf_paru_install.sh'
alias parur='~/.scripts/fzf_paru_remove.sh'
alias parup='~/.scripts/paru_update.sh'
alias grub_update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias systemctl_error='sudo systemctl --failed'
alias journal_error='sudo journalctl -p 3 -xb'

### zsh plugins
source /usr/share/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

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

### forgit
source /home/colps/Src/forgit/forgit.plugin.zsh
source /home/colps/Src/emoji-cli/fuzzy-emoji-zle.zsh

### gpg agent
GPG_TTY=$(tty)
export GPG_TTY

### fasd
eval "$(fasd --init auto)"

### wezterm
source $HOME/.config/wezterm/wezterm_integration.sh

### zsh_functions
fpath+=${ZDOTDIR:-~}/.zsh_functions

### fzf completion
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

### perl
PATH="/home/colps/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/colps/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/colps/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/colps/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/colps/perl5"; export PERL_MM_OPT;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#
fpath=( ~/.zsh_functions "${fpath[@]}" )

