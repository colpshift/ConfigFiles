#!/bin/bash
#
# File: key-handler / sxiv_key-handler.sh
# Author: Colps
# Github: https://github.com/colpshift
# Description: sxiv configuration file
# Last Modified: January 24, 2019
#
# https://wiki.archlinux.org/index.php/sxiv
#
# Dependences: feh

readonly KEY="$1";
readonly TAGFILE="$HOME/.config/sxiv/tags"
readonly TMPFILE="/tmp/sxiv.$$"

rotate() {
	degree="$1"
	tr '\n' '\0' | xargs -0 realpath | sort | uniq | while read file; do
		case "$(file -b -i "$file")" in
		image/jpeg*) jpegtran -rotate "$degree" -copy all -outfile "$file" "$file" ;;
		*)           mogrify  -rotate "$degree" "$file" ;;
		esac
	done
}

tag_add() {
	>>"$TAGFILE"
	tags=$(dmenu <"$TAGFILE" | tr '\n' ',')
	[ -z "$tags" ] && return
	iptckwed -i -a "$tags"
	echo -n "$tags" | tr ',' '\n' | sort - "$TAGFILE" | uniq >"$TAGFILE.new"
	mv -f "$TAGFILE"{.new,}
}

tag_del() {
	cat >"$TMPFILE"
	tags=$(iptckwed -iql <"$TMPFILE" | cut -f 2 | tr ',' '\n' | sort | uniq | dmenu | tr '\n' ',')
	[ -z "$tags" ] && return
	iptckwed -i -r "$tags" <"$TMPFILE"
	rm -f "$TMPFILE"
}

case "$KEY" in
"w")		while read file; do feh --bg-scale "$file" && notify-send -i "sxiv
	changed wallpaper" "Wallpaper changed by sxiv"; done ;;
"y")        tr '\n' ' ' | xclip -i ;;
"C-c")      while read file; do xclip -selection clipboard -target image/png "$file"; done ;;
"C-e")      while read file; do termite -bg "#444" -fg "#eee" -sl 0 -title "$file" -e sh -c "exiv2 pr -q -pa '$file' | less" & done ;;
"C-g")      tr '\n' '\0' | xargs -0 gimp & ;;
"C-comma")  rotate 270 ;;
"C-period") rotate  90 ;;
"C-slash")  rotate 180 ;;
"C-t")      tag_add ;;
"M-T")      tag_del ;;
esac

