#
# Path: ~/.zshrc
# Tags: zsh shell
# Description: zsh env config
# Last update: 11/06/2021 07:47
# Author: Colpshift
#

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

