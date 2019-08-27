#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# line wrap on windows resize.
[[ $DISPLAY ]] && shopt -s checkwinsize

# prompt
PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else
	echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

# Enable programmable completion features.
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion && source /usr/share/bash-completion/completions/*

# enable the "Command not found" hook
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash

# Default applications
export BROWSE="/bin/firefox"
export VISUAL="/usr/local/bin/vim"
export EDITOR="/usr/local/bin/vim"
set -o vi # turn on vim on shell

# keep environment pollution down, EPA loves us.
unset safe_term match_lhs

# sanitize TERM
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""
PS2="> "
PS3="> "
PS4="+ "

# color man
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

# aliases
alias ls='ls -l --color=auto --group-directories-first'
alias ll='ls -lh'
alias la='ls -ah'  # show hidden files and folders
alias lx='ls -BXh' # sort by extension
alias lz='ls -rSh' # sort by size
alias lt='ls -rth' # sort by date
alias dir='dir --color'
alias grep='grep --color'
alias dmesg='dmesg --color'
alias ccat='highlight --out-format=ansia'
alias vi='vim'
alias journalctl='sudo journalctl'
alias systemctl='sudo systemctl'
alias pacman='sudo pacman --color=always'
alias pacu='pacman -Syu && pkgfile -u'
alias yayu='yay -Syu && pkgfile -u'
alias gpg='gpg2'
alias urxvt='sh $HDC/.scripts/urxvts.sh'
alias pkgfile='sudo pkgfile'

