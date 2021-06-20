#
# path: ~/.zshrc
# author: colpshift
# tag: zsh dotfiles
# description: zsh env config
# last modified: 20/06/2021 18:16
#
### X11 config
xset r rate 210 40              # Faster key repeat and delay
~/.scripts/xbanish_start.sh  # hides the mouse cursor when you start typing.

### Use powerline
USE_POWERLINE="true"

### Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

### ruby
eval "$(rbenv init -)"

### fasd
eval "$(fasd --init auto)"

### forgit
source ~/Projects/src/forgit/forgit.plugin.zsh

