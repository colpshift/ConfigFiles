#!/usr/bin/env sh
set -euo pipefail
#
# File: uefi_directly.sh
# Author: Colps
# Github: https://github.com/colpshift
# Description: create options to boot
# Last Modified: June 22, 2019
#

efibootmgr --disk /dev/sda --part 1 --create --label "Arch linux" --loader /efi/EFI/arch/vmlinuz-linux --unicode 'root=PARTUUID=16ac66ce-37f6-4947-9a7b-fe298fb12136 rw initrd=\efi\EFI\arch\intel-ucode.img initrd=efi\EFI\arch\initramfs-linux.img' --verbose
