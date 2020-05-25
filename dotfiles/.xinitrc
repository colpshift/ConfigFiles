# default session
# session=${1:-i3}
#
# case $session in
#     i3|i3wm           ) exec i3;;
#     dwm               ) exec dwm;;
#     bspwm             ) exec bspwm;;
#     *                 ) exec $1;;
# esac
#
systemctl --user import-environment DISPLAY
