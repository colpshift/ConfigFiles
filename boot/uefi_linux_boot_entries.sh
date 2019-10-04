#!/usr/bin/env sh
set -euo pipefail
#
# File: uefi_linux_boot_entry.sh
# Author: Colps
# Github: https://github.com/colpshift
# Description: create options to boot
# Last Modified: June 22, 2019
#

## efibootmgr -d /dev/sdX -p Y -c -L "Arch Linux" -l /vmlinuz-linux -u "root=/dev/sdBZ rw initrd=/initramfs-linux.img"
# Where /dev/sdX and Y are the disk and partition where the ESP is located. 
# Change the root= parameter to reflect your Linux root (disk UUIDs can also be used). 
# Note that the -u argument in double quotes is just the list of kernel parameters, 
# so you may need to add additional parameters e.g. for suspend to disk or microcode.

efibootmgr -d /dev/sda -p 1 -c -L "Arch linux" -l /efi/EFI/arch/vmlinuz-linux -u 'root=PARTUUID=16ac66ce-37f6-4947-9a7b-fe298fb12136 apparmor=1 security=apparmor resume=/dev/sda3 rw initrd=\efi\EFI\arch\intel-ucode.img initrd=efi\EFI\arch\initramfs-linux.img' -v

