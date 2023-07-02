#!/bin/sh
#
## Fedora
#

### Pin
#
calendar
contacts
notion
todoist

### Collaboration
#
discord
telegram
zoom
skype

### office
#
evince
drawio
okular

### internet
#
brave
firefox
chrome
brave
edge

### Audio
#
Harmonoid
Tidal Hi-Fi

### Video
#
VLC Media Player
MPV
Blender
Cheese
Stremio

### Image
#
gimp
darktable
inkscape
document scanner
fonts
ristretto

### code
#
gedit
github desktop
neovim
astronvim
vscode
nodejs
python
rust
go

### Security
#
bitwarden
seaworse
https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup64.rpm

### utilities
#
bleachbit
timeshift

### terminal
#
shell-genie
namebench
  wezterm
  starship
  lsd
  ripgrep
lazygit
go DiskUsage
bottom
node
  dust
  duf
  procs
  fd
  bat
fasd
broot
  fzf
  fzf-tab
  forgit
  emoji-cli
  highlight

### gnome extensions
#
"AppIndicator and KStatusNotifierItem Support"  by 3v1n0
"Bing Wallpaper" by neffo
"Caffeine" by eon
"Compact Top Bar" by wete
"Dash to Dock" by michele_g
"Lock Keys" by kazimieras.vaina
"OpenWeather by" skrewball
"Pano - Clipboard Manager" by alperenelhan
"Vitals" by corecoding

### Things to do After Installing
#
# 0. Check de best dns servers
namebench.py
#
# 1. Configure DNF for Faster Downloads of Packages
sudo nvim /etc/dnf/dnf.conf
max_parallel_downloads=10
fastestmirror=true
deltarpm=true
# 
# 2. Update the System
sudo dnf update
#
# 3. Enable RPM Fusion Repository
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#
# 4. Adding the Flathub Repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#
# 5. Install Multimedia Plugins
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
# 
# 6. Change Hostname After Installation
sudo hostnamectl set-hostname "New_Custom_Name"
# 
# 7. Install Gnome Tweaks and Extensions App
sudo dnf install gnome-tweaks gnome-extensions-app
#
# 8. Enable Minimize Button
#
# 9. Tweak Privacy Settings
#
# 10. Screen Lock and Power Settings
#
# 11. Use Night Light Settings
#
# 12. Sort Folder before files in Nautilus File Manager
#
# 13. Automatically Delete Trash Content
#
# 14. Set the Power Profiles
#
# 15. Enable Disable the Animation effect for a faster response
#

