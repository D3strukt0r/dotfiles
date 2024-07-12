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

# Partitioning
fdisk -l
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

# Select mirrors
nano /etc/pacman.d/mirrorlist
# add on top:
# Server = https://mirror.init7.net/archlinux/$repo/os/$arch
# Server = https://pkg.adfinis-on-exoscale.ch/archlinux/$repo/os/$arch
pacman -Syyu

# Install base system
pacstrap -K /mnt base linux linux-firmware
```
