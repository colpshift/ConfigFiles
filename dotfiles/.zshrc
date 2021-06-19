#
# Path: ~/.zshrc
# Tags: zsh shell
# Description: zsh env config
# Last update: 18/06/2021 23:23
# Author: Colpshift
#

# X11 config
xset r rate 210 40              # Faster key repeat and delay
sh ~/.scripts/xbanish_start.sh  # hides the mouse cursor when you start typing.

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

# ruby
eval "$(rbenv init -)"

# fasd
eval "$(fasd --init auto)"

# forgit
source ~/Projects/src/forgit/forgit.plugin.zsh

