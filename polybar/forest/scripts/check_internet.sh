#!/bin/sh
#
# File: check_internet.sh
# Tags: script
# Description: check internet connection
# Author: Colpshift
# Last Modified:
#
if ping -W 5 -c 1 google.com >/dev/null; then
	echo " "
else
	echo " "
fi
