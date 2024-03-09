#!/bin/sh

#
# ------------------------------------------------------- fedora
#
# https://github.com/displaylink-rpm/displaylink-rpm/releases/tag/v5.3.1-1
#

#fedora-33-displaylink-1.7.2-1.x86_64

#
# ------------------------------------------------------- ubuntu 
#

# dkms
sudo apt install dkms

# evdi-dkms
sudo apt install evdi-dkms

# mokutil
sudo apt install mokutil
sudo mokutil --disable-validation

# 20-displaylink.conf
sudo nvim /usr/share/X11/xorg.conf.d/20-displaylink.conf
1 │ Section "Device"
2 │ Identifier "DisplayLink"
3 │ Driver "modesetting"
4 │ Option "PageFlip" "false"
5 │ EndSection

# install driver wavlink WL-UG3501H
sudo ./displaylink-driver-5.4.1-55.174.run

# service
displaylink-driver.service

#
# ------------------------------------------------------- popOs 
#

# https://www.displaylink.org/forum/showpost.php?p=92453&postcount=3

# 1. Make sure you uninstall the current EVDI driver. 
# Do this by calling the currently installed DisplayLink installer file 
# with a "uninstall" argument. For example: 
sudo ./displaylink-driver-5.4.0-55.153.run uninstall

# 2. Extract the content of the installer file. For example:
./displaylink-driver-5.4.0-55.153.run --noexec --keep

# 3. A folder will now exist in the same path as your installer file. 
# CD into it like so: (replace x.x.xx with the real numbers)
cd ./displaylink-driver-5.4.0-55.153

# 4. Replace the evdi.tar.gz file that exists there. 
# I just downloaded a tarball from the latest dev branch from their Github like so: 
curl -L https://github.com/DisplayLink/evdi/archive/refs/heads/devel.tar.gz -o evdi.tar.gz

# 5. Because the structure of the tar.gz file from Github has an extra folder in its root level,
# you also need to modify the install_evdi() function in the displaylink-installer.sh file. 
# Look for this:
#
# if ! tar xf "$TARGZ" -C "$EVDI"; then
#
# and replace with:
#
# if ! tar xf "$TARGZ" -C "$EVDI" --strip-components=1; then

# 6. Run the installer script as root:
sudo ./displaylink-installer.sh 
# and it should install and compile the very latest EVDI driver which is compatible with 
#linux kernels up til and including 5.14. 


#
# ------------------------------------------------------- Fedora
#

# https://kcore.org/2023/01/01/installing-evdi-fedora37/

Install RPMFusion
Install RPMSphere (for evdi)
$ sudo dnf install evdi
$ git clone https://github.com/DisplayLink/evdi
$ cd evdi
$ sudo cp evdi/module/* /usr/src/evdi-1.12.0
$ sudo dkms build -m evdi -v 1.12.0 --force
$ sudo dkms install -m evdi -v 1.12.0

