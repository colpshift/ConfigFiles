#!/usr/bin/env sh
set -euo pipefail
#
# File: arch_maintenance.sh
# Author: Colps
# Github: https://github.com/colpshift
# Description: maintenance
# Last Modified: June 15, 2019
#
# Improve performance
# https://wiki.archlinux.org/index.php/Improving_performance/Boot_process
#
# System maintenance
# https://wiki.archlinux.org/index.php/System_maintenance#Check_for_errors
#

#------------------------------------------------------------------------------
# Data breach 

# Check the data breach
https://monitor.firefox.com/scan

#------------------------------------------------------------------------------
# Check errors

cat /proc/sys/kernel/watchdog   # kernel
sudo systemctl --failed         # System services
sudo journalctl -p 3 -xbi       # Logfiles

#------------------------------------------------------------------------------
# Update repo mirror list

reflector -f 10 --save /etc/pacman.d/mirrorlist

# update pacman keys
sudo pacman-key --refresh-keys && sudo pacman -Syyu

#------------------------------------------------------------------------------
# Clean system

# clean pkg cache	
du -sh /var/cache/packman/pkg 		# check the size
find /var/cache/pacman/pkg/ | less	# list files
BleachBit 							# gui to cleaning cache

# delete orphan packages
sudo pacman -Qtdq				# show packages
sudo pacman -R $(pacman -Qtdq)	# delete packages
cleanorphan.hook                # clean orphan
cleanpkg.hook                   # clean packages

# clean cache in your /home
du -sh ~/.cache	 	# check the size
rm ~/.cache/*		# delete files

# check and remove old configuration files
du -sh ~/.config/	 	# check the size
ls -l ~/.config/		# list files
du -sh ~/.local/share/	# check the size
ls -l ~/.local/share/	# list files

# find e remove duplicate, empty files and directories and broken symlinks
rmlint /directory	# search files and directories in directory
sh rmlint.sh 		# to delete files and directories.

# Find the largest files and directories
ncdu		# console show the largest filesand directories

# Disk cleaning programs
BleachBit	# gui to cleaning programs

#------------------------------------------------------------------------------
# HD

sudo hdparm -W /dev/sda
# /dev/sda:
# write-caching =  1 (on)

#------------------------------------------------------------------------------
# TRIM for SSD
sudo systemctl enable fstrim.timer

#------------------------------------------------------------------------------
# Script on shutdown
#------------------------------------------------------------------------------
# put your script in /usr/lib/systemd/system-shutdown/, which is handled by 
# systemd-halt.service. Of course, if you need to manage dependencies in a 
# particular order (e.g., you can't post a tweet if the network stack is down
# then you can write a systemd service unit file. For example:
[Unit]
Description=Run mycommand at shutdown
Requires=network.target
DefaultDependencies=no
Before=shutdown.target reboot.target

[Service]
Type=oneshot
RemainAfterExit=true
ExecStart=/bin/true
ExecStop=mycommand

[Install]
WantedBy=multi-user.target

#------------------------------------------------------------------------------
#  Performance Tunning
#------------------------------------------------------------------------------

### Kernel parameters
sudo vim /etc/sysctl.d/100-arch.conf  	# to create configuration file
# Swapp
vm.swappiness=1
# Staggered spin-up
libahci.ignore_sss=1
# Increasing the size of the receive queue.
net.core.netdev_max_backlog = 100000
net.core.netdev_budget = 50000
net.core.netdev_budget_usecs = 5000
# Increase the maximum connections
net.core.somaxconn = 1024
# Increase the memory dedicated to the network interfaces
net.core.rmem_default = 1048576
net.core.rmem_max = 16777216
net.core.wmem_default = 1048576
net.core.wmem_max = 16777216
net.core.optmem_max = 65536
net.ipv4.tcp_rmem = 4096 1048576 2097152
net.ipv4.tcp_wmem = 4096 65536 16777216
# increase the UDP limits
net.ipv4.udp_rmem_min = 8192
net.ipv4.udp_wmem_min = 8192
#  Enable TCP Fast Open
net.ipv4.tcp_fastopen = 3
# Vitual memory
vm.dirty_ratio = 10
vm.dirty_background_ratio = 5
# Decrease VFS cache
vm.vfs_cache_pressure = 50

### initrams parameters
pacman -S hwdetect
#
vim /etc/mkinitcpio.conf
# MODULES
MODULES="ext4 vfat " # filesystem
MODULES+="ahci libahci libata xhci-hcd ehci-hcd " # hostcontroller
MODULES+="radeon " # ati-kms
MODULES+="i915 " # intel-kms
MODULES+="nouveau " # nvidia-kms
#
MODULES+="agpgart intel-gtt " # AGP
MODULES+="ac battery " # ACPI
MODULES+="scsi_mod sd_mod sr_mod ahci libahci libata uvcvideo ehci-hcd ehci-pci xhci-hcd xhci-pci " # Block
MODULES+="ath3k btbcm btintel btrtl btusb bluetooth " # Bluetooth
MODULES+="cdrom " # Cdrom
MODULES+="acpi-cpufreq pcc-cpufreq " # cpufreq
MODULES+="aesni-intel aes-x86_64 crc32c-intel crc32-pclmul crct10dif-pclmul ghash-clmulni-intel glue_helper cryptd crypto_simd ecc ecdh_generic libarc4 " # crypto
MODULES+="drm_kms_helper drm " # DRM
MODULES+="coretemp " # hwmon
MODULES+="i2c-algo-bit i2c-i801 " # i2c
MODULES+="evdev input-leds joydev atkbd mousedev psmouse i8042 libps2 serio serio_raw sparse-keymap hid-generic hid hid-multitouch usbhid " # Input
MODULES+="kvm-intel kvm " # kvm
MODULES+="videobuf2-common videobuf2-memops videobuf2-v4l2 videobuf2-vmalloc media videodev " # media
MODULES+="r8169 fjes libphy ath9k_common ath9k_hw ath9k ath mac80211 rfkill cfg80211 " # net
MODULES+="pcspkr snd-hwdep snd snd-pcm snd-timer snd-hda-core snd-hda-codec-generic snd-hda-codec-hdmi snd-hda-codec snd-hda-codec-realtek snd-hda-intel soundcore " # sound
MODULES+="iTCO_vendor_support iTCO_wdt " # watchdog
MODULES+="intel-cstate intel-rapl-perf intel-uncore ledtrig-audio mac_hid memstick rtsx_usb_ms lpc_ich rtsx_usb mei_hdcp mei mmc_core rtsx_usb_sdmmc mtd intel-spi intel-spi-platform spi-nor asus-nb-wmi asus-wireless asus-wmi wmi intel_rapl acpi_thermal_rel int3400_thermal int3402_thermal int340x_thermal_zone processor_thermal_device intel_pch_thermal intel_powerclamp intel_soc_dts_iosf x86_pkg_temp_thermal fb_sys_fops syscopyarea sysfillrect sysimgblt crc16 irqbypass " # others
MODULES+=""  # miscellaneous
# BINARIES
BINARIES=(fsck fsck.ext4 fsck.vfat)
# FILES
FILES=()
# HOOKS
HOOKS=(base) 

### systemd 
systemctl stop lvm2-monitor.service

### Firefox/Profile on RAM
yay -S firefox-sync
configure .zlogin and .zlogout
# preferences
# about:config
browser.tabs.remote.autostart=false
image.mem.animated.discardable=false
browser.cache.disk.capacity=(-50% default value)
brower.cache.disk.enable=false
browser.cache.memory.enable=true
# create a new integer
browser.cache.memory.capacity=-1
# about:memory
minimize memory usage
# connections and proxies
Enable DNS over HTTPS
# about support
refresh firefox

#------------------------------------------------------------------------------
#  Kernel/Arch Build System
#------------------------------------------------------------------------------
cd /SRC && mkdir kernelcustom
asp update linux
asp checkout linux
vim /SRC/kernelcustom/Trunk/PKGBUILD
    #
    # moving to a tmpfs bring improvements 
    BUILDDIR=/tmp/makepkg makepkg
    #
    # rename kernel named
    pkgbase=linux-custom
    #
    # comment old config tool
    #make olddefconfig
    #
    # choose config tool
    make nconfig        # new CLI menu for configuration
    make menuconfig     # CLI menu for configuration
    make xconfig        # X-based configuration
#
# Generate new checksums
updpkgsums
#
# compile kernel
makepkg -s
#
# consider the systemd requirements /usr/share/doc/systemd/README
#
# install kernel
pacman -U kernel-headers_package kernel_package
#
# check the vmlinuz-custom-image
#
# create entry on boot options
sudo sh /boot/uefi_custom_boot_entries.sh
#
# check boot entries
efibootmgr
#
# reboot
shutdown -r now

