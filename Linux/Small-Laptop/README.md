# Installing

## Arch Linux

```bash
# Set keyboard layout and font
loadkeys de_CH-latin1
setfont ter-712n

# Setup WiFi (https://wiki.archlinux.org/title/Iwd#iwctl)
iwctl
station wlan0 scan
station wlan0 get-networks
station wlan0 connect SSID
ping archlinux.org

# Update clock
timedatectl

# Partitioning (https://wiki.archlinux.de/title/Fdisk)
fdisk -l
fdisk /dev/sda
# o -> MBR partition table
# n, +4G, t, 82 -> swap partition
# n -> primary partition, default size
# a -> bootable
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

# Select mirrors
nano /etc/pacman.d/mirrorlist
# add on top:
# https://archlinux.org/mirrorlist/?country=CH&protocol=https&ip_version=4
# Server = https://mirror.init7.net/archlinux/$repo/os/$arch
# Server = https://pkg.adfinis-on-exoscale.ch/archlinux/$repo/os/$arch
pacman -Syyu

# Install base system
pacstrap -K /mnt base base-devel linux linux-firmware dhcpcd iwd wpa_supplicant wireless_tools nano curl intel-ucode man-db man-pages texinfo e2fsprogs

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

# Set timezone
ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc

# Localization
nano /etc/locale.gen
# uncomment de_CH.UTF-8 UTF-8, en_US.UTF-8
locale-gen
echo LANG=de_CH.UTF-8 > /etc/locale.conf
echo KEYMAP=de_CH-latin1 > /etc/vconsole.conf

# Network configuration
echo Small-Laptop > /etc/hostname

# Set root password
passwd

# Install bootloader
# https://wiki.archlinux.org/title/Arch_boot_process#Boot_loader
# https://wiki.archlinux.org/title/GRUB#Generate_the_main_configuration_file
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

exit
umount /mnt
reboot
```
