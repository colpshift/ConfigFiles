
## Requirements
#
sudo pacman -Sy
    base-devel \
    git \
    neovim \
    xorg-server \
    xorg-xinit \
    libx11 \
    libxinerama \
    libxft \
    webkit2gtk\

## Setup xinitrc
nvim ~/.xinitrc
  exec dwm

## Compile st, dmenu, surf
sudo make clean install

## Compile dwm
nvim config.h
  change /bin/sh to /usr/local/bin/st
sudo make clean install

## Configure .bash_profile
nvim .bash_profile
  add starx # in the end of file.

##  Install and Configure conky bar
sudo pacman -Sy conky
cp .conkyrc ~/.conkyrc
nvim  ~/.xinitrc
  (conky | while read LINE; do xsetroot -name "$LINE"; done) &


