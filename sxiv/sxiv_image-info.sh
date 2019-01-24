#!/usr/bin/env bash
#
# File: image-info / sxiv_image-info.sh
# Author: Colps
# Github: https://github.com/colpshift
# Description: sxiv configuration file
# Last Modified: January 24, 2019

# Dependences: exiv2

# Called by sxiv(1) whenever an image gets loaded,
# with the name of the image file as its first argument.
# The output is displayed in sxiv's status bar.

s=" | " # field separator

filename=$(basename "$1")
filesize=$(du -Hh "$1" | cut -f 1)

# The '[0]' stands for the first frame of a multi-frame file, e.g. gif.
geometry=$(identify -format '%wx%h' "$1[0]")

tags=$(exiv2 -q pr -pi "$1" | awk '$1~"Keywords" { printf("%s,", $4); }')
tags=${tags%,}

echo "${filesize}${s}${geometry}${tags:+$s}${tags}${s}${filename}"
