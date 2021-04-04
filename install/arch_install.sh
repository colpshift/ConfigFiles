#------------------------------------------------------------------------------
# Pre-installation
#------------------------------------------------------------------------------

## set the keyboard layout
loadkeys br-abnt2

## verify the boot mode, check the efi directory
ls /sys/firmware/

## test teh internet
ip link
ping -c 3 archlinux.org

## update the system clock
timedatectl set-ntp true

## create partitions EFI with GPT - rename PARTLABEL
gdisk /edv/sda

/mnt/boot     /dev/sda1	ef00	EFI System Partition  /boot/efi # 500 MB
/mnt          /dev/sda2	8304 	arch_root             /         # 70 GB
swap	      /dev/sda3	8200	arch_swap	                # 4 GB
/mnt/home     /dev/sda4	8302	arch_home             /home     # remainder

## format partition
mkfs.fat -F32	    /dev/sda1 # efi
mkfs.ext4           /dev/sda2 # root
mkswap              /dev/sda3 # swap
swapon              /dev/sda3 # swap
mkfs.ext4           /dev/sda4 # home

## mount partition
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot/efi
mount /dev/sda4 /mnt/home

#------------------------------------------------------------------------------
# installation
#------------------------------------------------------------------------------

# install arch linux
pacstrap /mnt 
        /base 
        /linux
        /linux-firmware
        /linux-headers
        /intel-ucode
        /nvim
        /NetworkManager
        /dhcpcd

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
  127.0.0.1	  localhost
  ::1		  localhost
  127.0.1.1       colpsnoteasus   colpsnoteasus  colpsnoteasus

# enable network
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
    grub-mkconfig -o /boot/grub/grub.cfg

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
  wheel ALL=(ALL) ALL

### add a user
groudadd colps
useradd -m -g colps -G colps -s /bin/bash colps
usermod -a -G network power users video storage lp wheel colps
passwd colps
# logout and logon with new user

### configure dash
paru -S dash
paru -S checkbashisms
ln -sfT dash /usr/bin/sh
configure dash.hook on /etc/pacman.d/hooks

### configure pacman
pacman -S reflector \
  pacman-contrib \
  reflector -f 10 --save /etc/pacman.d/mirrorlist
  # configure hooks
  cleanpkg.hook
  zsh.hook

### Configure AUR - Arch User Repository
### paru replace paru
pacman -S --needed git wget yajl
  git clone https://aur.archlinux.org/package-query.git
  cd package-query/
  makepkg -si
  #
  git clone https://aur.archlinux.org/paru.git
  cd paru
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
paru -S base-devel \
    cmake\
    python \
    python-pip \
    python-pipenv \
    tk \

### editor
#
# vim
pacman - S neovim \
    vplug \
#
# vscode
paru -S Visual Studio Code Insider

### terminal
#
# urxvt
pacman -S  rxvt-unicode \
    urxvt-perls \
    urxvt-fullscreen \
    autocutsel \
    paru -S urxvt-resize-font-git \
    #
    vim $HOME/.Xresources

#
# kitty
pacman -S kitty

### touchpad
pacman -S libinput \
    xf86-input-libinput \
    #
    sudo gpasswd -a colps input

### x
pacman -S xorg \
    xclip \
    xrandr \
    arandr \
    xorg-init \
    acpi \
    lxappearence \
    arc-gtk-theme \
    arc-icon-theme \
    human-icon-theme \
    papirus-icon-theme \
    flameshot \

### wm
pacman -S i3-gaps \
    i3lock \
    i3status\
    dmenu \
    xss-lock \

pacman -S bspwm

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
#
# lxdm
    # enable
    systemctl enable lxdm.service
    #
    nvim /etc/lxdm/lxdm.conf

# fonts
paru -S \
    ttf-font-awesome \
    otf-font-awesome \
    awesome-terminal-fonts \
    otf-font-awesome-4 \
    ttf-ionicons \
    ttf-ms-fonts \
    nerdfonts \
    # configure fonts
    sudo fc-cache -f -v

# Notify
cp rg.freedesktop.Notifications.service /usr/share/dbus-1/services
    pacman -S dunst /
    notification-daemon /
    # enable
    nvim $HOME/.config/dunst

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
    pdfjs \
    sxiv \
    feh \
    exiv2 \

### rofi
paru -S rofi \

# e-mail
paru -S thunderbird \
    lightning \
    gContactSync \
    provider for Google Calendar \
    enigmail \
    deepdark theme\
paru -S neomutt \
    muttprint \
    goobook \
    mbsync \
    msmtp \
    notmuch \
    notmuch-vim \
    urlview \
pacman -S postfix

# calcurse
paru -S calcurse

# music
paru -S mpd \
    mpc \
    ncmpcpp \
    wildmidi \
    clerk \
    audacious

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
    paru -S tlpui-git
    systemctl enable tlp.service
    systemctl enable tlp-sleep.service.
    systemctl enable NetworkManager-dispatcher.service

# system
paru -S gimp \
    bleachbit \
    rmlint \
    ncdu \
    shellcheck \
    rsync \
    bind-tools \
    neofetch \
    zip \
    pkgfile-git \
    fuse \
    dia \
    xarchiver \
    pcmanfm \
    mate-calc \
    bashtop \
    brave \
        bitwarden
        Print edit we
        vimium
        joplin
    simple-scan \
    hplip \
    todoist-appimage \
    paru -S electronplayer \
        skype \
        mindmaster \
        masterpdfeditor-free \
        telegram-desktop \
        stremio \
        youtube to mp3 \

# fzf
paru -S fzf \
    the_silver_searcher           # ag

# rust apps replacements
cargo install du-dust             # du
paru -S bat                       # cat
paru -S ripgrep                   # grep
paru -S fd / apt fd-find          # find
https://the.exa.website/ - exa    # ls
https://github.com/dalance/procs  # ps

# rust apps 
https://starship.rs/                # Starship Prompt
https://github.com/XAMPPRocky/tokei # languages statistics

# Samba
pacman -S samba \
    smbclient
    systemctl enable smb nmb winbind

# warsaw
paru -S jdk \
    jre \
    warsaw \
    sudo systemctl enable warsaw
    sudo systemctl start warsaw
    firefox https://diagnostico.gasantifraud.com/

# pass
paru -S pass \
    passmenu \      # https://git.zx2c4.com/password-store/tree/contrib/dmenu
    pass-update \   # https://github.com/roddhjav/pass-update#readme
    pass-tail \     # https://github.com/palortoff/pass-extension-tail

# security
paru -S gpg \
    rng-tools \
    sudo systemctl enable rngd.service
    sudo systemctl start rngd.service
    ccid \
    opensc \
    pcsc-tools \
    sudo systemctl enable pcscd.service
    sudo systemctl start pcscd.service
    tor - ./start-tor-browser.desktop --register-app

paru -S openssh \
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
    chattr -i /etc/resolv.conf

# KVM
paru -S qemu /
      virt-manager /
      ebtables /
      sudo usermod -G libvirt -a colps

# Virtualbox
paru -S virtualbox-guest-utils				# vbox-guest
#
paru -S virtualbox							# vbox-host
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
paru -S safeeyes /
xprintidle

# Maintenance
execute maintenance activities.

# systemd stop, disable and mask
avahi-daemon.service
ModemManger.service
unistall apport

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
