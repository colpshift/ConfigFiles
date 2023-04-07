#
# path
set -x PATH $PATH $HOME/.local/bin $HOME/bin $HOME/.scripts $HOME/.rbenv/bin $HOME/.cargo/bin $HOME/go/bin /usr/local/go/bin /bin /usr/bin /sbin /usr/sbin /usr/local/bin

#
# interactive session
# if status is-interactive
    # Commands to run in interactive sessions can go here
# end

#
# alias
alias ll="lsd -lh --group-dirs first"
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias dir="dir --color"
alias grep="rg"
alias dmesg="dmesg --color"
alias df="dust"
alias du="duf"
alias ps="procs"
alias su="sudo -i"
alias vi="nvim"
alias vim="nvim"
alias gvim="nvim"
alias cat="bat --theme OneHalfDark"
alias gitu="git add . && git commit -S && git push"
alias gitb="git add . && git commit -S -m "backup" && git push"
alias gitl="git log --graph"
alias cls="clear"
alias myip="curl http://ipecho.net/plain; echo"
alias ports="netstat -tulanp"
alias neofetch="clear && neofetch --color_blocks off"
alias systemctl_error="sudo systemctl --failed"
alias journal_error="sudo journalctl -p 3 -xb"

#
# gpg agent
set -x GPG_TTY $(tty)

#
# starship prompt
# starship init fish | source

