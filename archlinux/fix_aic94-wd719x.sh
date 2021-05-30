#!/bin/sh
#
# File: fix_aic94-wd719x.sh
# Author: Colps
# Github: https://github.com/colpshift
# Description: fix aic94 e wd719 errors
# Last Modified: June 14, 2019
#

clear
echo "=== fix aic94xx error ==="
cd "$HOME/Downloads" || exit 
git clone https://aur.archlinux.org/aic94xx-firmware.git
cd aic94xx-firmware && makepkg -sri
sudo mkinitcpio -p linux again
echo "=== fix wd719x error ==="
git clone https://aur.archlinux.org/wd719x-firmware.git
cd wd719x-firmware &&  makepkg -sri 
sudo mkinitcpio -p linux again
rm -rf aic94xx*
echo "=== fix xhci_pci error ==="
yay -S upd72020x-fw
echo "=== fixed aci94xx / wd719x / xhci_pci errors ==="

