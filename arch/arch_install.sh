#------------------------------------------------------------------------------
# Pre-installation
#------------------------------------------------------------------------------

## set the keyboard layout
loadkeys br-abnt2

## verify the boot mode, check the efi directory
ls /sys/firmware/

## test teh internet
ping -c 3 archlinux.org

## update the system clock
timedatectl set-ntp true

## create partitions EFI with GPT - rename PARTLABEL
/mnt/boot       /dev/sda1	ef00	EFI System Partition    /boot/efi	# 500 GB
/mnt            /dev/sda2	8304 	arch_root               /		    # 70 GB
swap	        /dev/sda3	8200	arch_swap	                        # 4GB
/mnt/home       /dev/sda4	8302	arch_home               /home	    # remainder

## format partition
mkfs.fat -F32	    /dev/sda1 # efi
mkfs.ext4           /dev/sda2 # root
mkswap			    /dev/sda3 # swap
swapon			    /dev/sda3 # swap
mkfs.ext4		    /dev/sda4 # home

## mount partition
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot/efi
mount /dev/sda4 /mnt/home

#------------------------------------------------------------------------------
# installation
#------------------------------------------------------------------------------

# install arch linux
pacstrap /mnt base linux linux-firmware linux-headers intel-ucode amd-ucode vi git

#------------------------------------------------------------------------------
# configuration
#------------------------------------------------------------------------------

# generate the fstab file
genfstab -U /mnt >> /mnt/etc/fstab
# Clear file
vi /mnt/etc/fstab
#
# using systemd /etc/systemd/system
#
# Configure systemd mount
boot.mount

# change root in the new system
arch-chroot /mnt

# setup the timezone
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc --utc

# setup locale an keyboard
vim /etc/locale.gen
uncomment the local
locale-gen

# set locale
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# set keyboard map
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf

# network configuration
echo colpsnotear > /etc/hostname
#
vi /etc/hosts
127.0.0.1	    localhost
::1		        localhost
127.0.1.1       colpsnote01   colpsnote01   colpsnote01

# install de network manager
yay -S networkmanager dhcpcd
    systemctl enable NetworkManager
    systemctl enable dhcpcd

# change the root password
passwd

# systemd-boot
    bootctl --path=esp install
        vi esp/loader/entries/archlinux.conf
        title   Archlinux
        linux   /vmlinuz-linux
        initrd  /amd-ucode.img
        initrd  /intel-ucode.img
        initrd  /initramfs-linux.img
        options root=PARTLABEL=arch_root rw

# GRUB
    pacman -S grub efibootmgr dosfstools os-prober mtools
    grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
    #grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

# EFISTUB
    # check hooks
    vi /etc/mkinitcpio.d/linux.preset
    # create hook to update
    vi /etc/initcpio/install/esp-update-linux
    # Initramfs
    mkinitcpio -p linux
    # Configure boot option  - use script
    efibootmgr --disk /dev/sdX --part Y --create --label "Arch Linux" \
    --loader /vmlinuz-linux --unicode 'root=PARTUUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX rw initrd=\initramfs-linux.img' --verbose

# reboot
exit

#------------------------------------------------------------------------------
# post-installation
#------------------------------------------------------------------------------

### grant root privileges
pacman -S sudo
visudo
# add line to /etc/sudoers
%wheel ALL=(ALL) ALL

### add a user
groudadd colps
useradd -m -g colps -G colps -s /bin/bash colps
usermod -a -G network power vboxusers users video storage lp wheel colps
passwd colps
# logout and logon with new user

### configure pacman
pacman -S reflector pacman-contrib
    reflector -f 10 --save /etc/pacman.d/mirrorlist
    # configure hooks
    cleanpkg.hook
    zsh.hook

### Configure AUR - Arch User Repository
pacman -S --needed git wget yajl
    git clone https://aur.archlinux.org/package-query.git
    cd package-query/
    makepkg -si
#
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
#
sudo rm -dR  package-query/

### shell
# bash
    .bash_login
    .bash_logout
    .bash_profile
    .bashrc
    /etc/bash.bash_logout
    /etc/bash.bashrc
    /etc/profile
# zsh
Pacman -S zsh \
    zsh-completions \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    zsh-doc \
    zsh-history-substring-search \
    # dotfiles
    .zlogin
    .zlogout
    .zprofile
    .zshenv
    .zshrc
    /etc/zsh/zprofile
    /etc/zsh/zshenv
    # completions
    /usr/share/zsh/plugins
    /.zsh

#------------------------------------------------------------------------------
# Install packages
#------------------------------------------------------------------------------

### developer
yay -S base-devel \
    cmake\
    python \
    python-pip \
    python-pipenv \
    tk \

### editor
# 
# vim
vim from git.
#
# sublime
yay -S sublime-text-dev

### terminal
#
# urxvt
pacman -S  rxvt-unicode \
    urxvt-perls \
    urxvt-fullscreen \
    autocutsel \
    xdotoll \
#
# alacritty
pacman -S alacritty
    #
    vim .config/alacrit

### x
pacman -S xorg \
    compton \
    xclip \
    xrandr \
    xorg-init \
    acpi \
    nitrogen \
    lxappearence \
    arc-gtk-theme \
    arc-icon-theme \
    faenza-icon-theme \
    human-icon-theme \
    papirus-icon-theme \
    flameshot \

### wm
pacman -S i3-gaps \
    i3lock \
    i3status\
    dmenu \
    xss-lock \

### login manager
#
# lightdm
pacman -S lightdm \
    lightdm-gtk-greeter \
    lightdm-settings \
    # enable
    systemctl enable lightdm.service
    #
    vi /etc/lightdm/lightdm.conf
    # configure [Seat:*] section:
    greeter-session=lightdm-gtk-greeter
    # configure greeter
    vi /etc/lightdm/lightdm-gtk-greeter.conf
#
# Slim
pacman -S slim \
    # enable
    systemctl enable slim.service
    #
    vi /etc/slim.conf

# fonts
yay -S \
    ttf-font-awesome \
    otf-font-awesome \
    awesome-terminal-fonts \
    otf-font-awesome-4 \
    ttf-ionicons \
    ttf-hack \
    ttf-inconsolata \
    ttf-iosevka \
    ttf-ms-fonts \
    # configure fonts
    sudo fc-cache -f -v

### ranger
pacman -S ranger \
    atool \
    w3m \
    highlight \
    libcaca \
    urlview \
    zathura \
    zathura-cb \
    zathura-djvu \
    zathura-pdf-poppler \
    zathura-ps \
    sxiv \
    feh \
    exiv2 \

### rofi
yay -S rofi

# e-mail
yay -S thunderbird \
    lightning \
    gContactSync \
    provider for Google Calendar \
    enigmail \
yay -S neomutt \
    muttprint \
    goobook \
    mbsync \
    msmtp \
    notmuch \
    notmuch-vim \
    urlview \
pacman -S postfix

# calcurse
yay -S calcurse

# music
yay -S mpd \
    mpc \
    ncmpcpp \
    wildmidi \

# crontab
pacman -S cronie
    crontab -e
    include "MAILTO=marcos.colpani@gmail.com"
    systemctl enable cronie.service

# bluetooth
pacman -S bluez \
    bluez-utils \
    bluez-tools \
    bluez-plugins \
    blueman \
    pulseaudio-bluetooth \
#
sudo usermod -a -G lp colps

# audio
pacman -S pulseaudio \
    pulseaudio-alsa \
    pavucontrol \

# brightness
Configure script $HOME/.scripts/brightness.sh
Configure mapping on i3 config file.

# power management
pacman -S tlp
    yay -S tlpui-git
    systemctl enable tlp.service
    systemctl enable tlp-sleep.service.
    systemctl enable NetworkManager-dispatcher.service

# system
yay -S gimp \
    bleachbit \
    rmlint \
    ncdu \
    shellcheck \
    bat \
    fzf \
    ripgrep \
    rsync \
    bind-tools \
    neofetch \
    zip \
    pkgfile-git \
    fuse \
    dia \
    xarchiver \
    pcmanfm \
    mindmaster \
    mate-calc \
    franz \
    stremio \
    firefox \
        firefox-sync \
        #
        hoxx-vpn 
        facebook container 
        https everywhere 
        vim vixen 
        archlinux wiki search 
        archlinux pac search
        archlinus aur search
    simple-scan \
    hplip \
zo    yay -S electronplayer
yay -S skype \
yay -S libreoffice

# spotify
git clone https://aur.archlinux.org/spotify.git
    cd spotify
    gpg --recv-keys 4773BD5E130D1D45
    makepkg -si
#

# Samba
pacman -S samba \
    smbclient
    systemctl enable smb nmb winbind

# pass
yay -S pass \
    passmenu \      # https://git.zx2c4.com/password-store/tree/contrib/dmenu
    pass-update \   # https://github.com/roddhjav/pass-update#readme
    pass-tail \     # https://github.com/palortoff/pass-extension-tail

# security
yay -S gpg \
    rng-tools \
    sudo systemctl enable rngd.service
    sudo systemctl start rngd.service
    ccid \
    opensc \
    pcsc-tools \
    sudo systemctl enable pcscd.service
    sudo systemctl start pcscd.service

yay -S openssh \
    nmap \
    tomb \  # https://github.com/dyne/Tomb/blob/master/INSTALL.md
    # https://files.dyne.org/tomb
    tor \   # https://www.torproject.org/
    vm Tails

# firewall
pacman -S ufw
    # Regras
    Defaults +
    [Stremio]

# dnsmasq
pacman -S dnsmasq
    sudo systemctl enable dnsmasq.service
    sudo systemctl start dnsmasq.service
    configure /etc/dnsmasq.conf

# Virtualbox
yay -S virtualbox-guest-utils				# vbox-guest
#
yay -S virtualbox							# vbox-host
    sudo VBoxManage extpack install *-extpack	# vbox-extension
    sudo systemctl enable vboxservice
    # vbox - host - setup shared folders
    Path: /home/colps/Público
    name: hostshared
    options: makepkg permanent
    # vbox - guest - setup user
    mkdir /home/colps/Hshared
    sudo usermod -a -G vboxsf colps
    sudo mount -t vboxsf -o gid=1000,uid=1000 hostshared /home/colps/Hshared
    # add to end of /etc/fstab file.
    VirtualBox Shared Folder hostshared /home/colps/Hshared vboxsf uid=1000,gid=1000 0 0

# Health
yay -S safeeyes /
xprintidle

# Maintenance
execute maintenance activities.

#------------------------------------------------------------------------------
# References

# Calcurse
# https://calcurse.org/
# https://www.youtube.com/watch?v=hvc-pHjbhdE

# mpd ncmpcpp
# https://www.youtube.com/watch?v=sZIEdI9TS2U

# zathura
# https://www.youtube.com/watch?v=V_Iz4zdyRM4

# gpg
# https://www.youtube.com/watch?v=DMGIlj7u7Eo

# sxvy
# https://www.youtube.com/watch?v=GYW9i_u5PYs

# virt-manager
# https://virt-manager.org/

