#!/usr/bin/env bash
#===============================================================================
#
#           FILE: errors_antergos.txt
#         AUTHOR: Marcos Roberto Colpani
#    DESCRIPTION: errors and fixes   
#
#        CREATED: 25/10/2018 19:48  
#  LAST MODIFIED: 
#       REVISION:  1.0
#
#===============================================================================

#------------------------------------------------------------------------------
# /sbin/vboxconfig does not work 
#------------------------------------------------------------------------------
sudo sh -x /sbin/rcvboxdrv setup 2> /tmp/rcvboxdrv.log 

#-------------------------------------------------------------------------------
#  Possibly missing firmware for module: aic94xx
#-------------------------------------------------------------------------------
git clone https://aur.archlinux.org/aic94xx-firmware.git
cd aic94xx-firmware && makepkg -sri
sudo mkinitcpio -p linux again

#-------------------------------------------------------------------------------
# Possibly missing firmware for module: wd719x
#-------------------------------------------------------------------------------
git clone https://aur.archlinux.org/wd719x-firmware.git
cd wd719x-firmware && makepkg -sri
sudo mkinitcpio -p linux again

#-------------------------------------------------------------------------------
# Printer did not add
#-------------------------------------------------------------------------------
sudo pacman -Sy cups
sudo pacman -S hplip
sudo hp-setup -i

#-------------------------------------------------------------------------------
# pam_tally.so error
#-------------------------------------------------------------------------------
# change the name pam_tally.so to pam_tally2.so
sudo vim /etc/pm.d/system-login

#-------------------------------------------------------------------------------
# Faltando função package() em /tmp/pamac-build-colps/vim-pythonhelper/PKGBUILD
#-------------------------------------------------------------------------------
pacman -S base-devel

#-------------------------------------------------------------------------------
#  kwin_core: Compositing is not possible
#-------------------------------------------------------------------------------
# set false to string below on .config/kwinrc
OpenGLIsUnsafe=false

#-------------------------------------------------------------------------------
# Failed to find module 'vfs_monitor'
#------------------------------------------------------------------------------
sudo pacman -Syu linux-headers

#------------------------------------------------------------------------------
# Error WARNING: Failed to connect to lvmetad. Falling back to device scanning.
#------------------------------------------------------------------------------
exit
mkdir /mnt/hostlvm
mount --bind /run/lvm /mnt/hostlvm
arch-chroot /mnt
ln -s /hostlvm /run/lvm

# Try disable lvm
use_lvmetad = 0 must be set in /etc/lvm/lvm.conf.

#------------------------------------------------------------------------------
# Gtk-WARNING **: Theme parsing error: gtk.css:3601:22: 'none' is not a 
# valid color name 
#------------------------------------------------------------------------------
sed -i 's/border-color: none/border-color: transparent/g' "/usr/share/themes/deepin-dark/gtk-3.0/gtk.css"

#------------------------------------------------------------------------------
# ImageMagick security policy 'PDF' blocking conversion 
#------------------------------------------------------------------------------
# comment the line below on 
# /etc/ImageMagick-7/policy.xml
<policy domain="coder" rights="none" pattern="{PS,PS2,PS3,EPS,PDF,XPS}" />

#------------------------------------------------------------------------------
# Backlight keys do not work.
#------------------------------------------------------------------------------
# deleted all kernel parameters from GRUB_CMDLINE_LINUX_DEFAULT from 
# /etc/default/grub leaving only quiet. After that I 
# added pcie_aspm=force and acpi_osi= to GRUB_CMDLINE_LINUX_DEFAULT line.

GRUB_CMDLINE_LINUX_DEFAULT="quiet pcie_aspm=force acpi_osi="

$ sudo grub-mkconfig -o /boot/grub/grub.cfg
	
#------------------------------------------------------------------------------
# gpg issues with ipv6
#------------------------------------------------------------------------------
IPv6 issues

It is known issue that if your host does not have IPv6 enabled 
(often happening in docker containers) some key servers might fail to connect. 
You can forbid gpg internal dirmngr from using IPv6 by add the 
following line to ~/.gnupg/dirmngr.conf:

disable-ipv6

Make sure no existing dirmngr processes are still running 
(and kill them if they are), and then try gpg --recv-keys command again as 
specified originally, and it should work.

#------------------------------------------------------------------------------
# error: failed to prepare transaction (could not satisfy dependencies)
# :: installing pacman (5.2.0-2) breaks dependency 'pacman<=5.1.3' 
# required by yay
#------------------------------------------------------------------------------
yay -G yay #clones new yay from git
yay -R yay #removes old yay
sudo pacman -Syu
cd yay/
makepkg -si #install the yay you cloned
yay #do your yay system upgrade you were trying to do in the first place

