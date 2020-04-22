#!/bin/sh

# Before starting, set BIOS configuration:
# * storage controller: AHCI vs RAID
# * maybe add UEFI entry with usb key

# Load french keyboard layout
loadkeys fr

# Stop the zfs-zed service
systemctl stop zfs-zed

# Force unload zfs kernel modules
lsmod | grep zfs | cut -d' ' -f1 | xargs rmmod -f

# Now add the following to /etc/nixos/configuration.nix
# and connect to internet
#
#   boot.supportedFilesystems = [ "zfs" ];
#   boot.zfs.enableUnstable = true;
#

# and rebuild
nixos-rebuild switch
modprobe zfs

# Partition disk
parted --script /dev/nvme0n1 -- \
    mklabel gpt \
    mkpart esp fat32 1MiB 512MiB \
    mkpart primary 512MiB 100% \
    set 1 boot on

# Create the zfs pool
zpool create -f \
    -O atime=off \
    -O normalization=formD \
    -O xattr=sa \
    -O acltype=posixacl \
    -o ashift=12 \
    -O encryption=aes-256-gcm \
    -O keyformat=passphrase \
    -O mountpoint=none \
    -R /mnt \
    rpool \
    /dev/nvme0n1p2

# /nix and swap will be under rpool/local, and won't be snapshoted
zfs create \
    -o com.sun:auto-snapshot=false \
    -o mountpoint=none \
    rpool/local
zfs create \
    -o compression=lz4 \
    -o com.sun:auto-snapshot=true \
    -o mountpoint=none \
    rpool/safe

# Create the swap partition
zfs create \
    -V 4G \
    -b $(getconf PAGESIZE) \
    -o compression=zle \
    -o logbias=throughput \
    -o sync=always \
    -o primarycache=metadata \
    -o secondarycache=none \
    rpool/local/swap
mkswap -f /dev/zvol/rpool/local/swap
swapon /dev/zvol/rpool/local/swap

# Create the root partition
zfs create \
    -o mountpoint=legacy \
    rpool/safe/root
mount -t zfs rpool/safe/root /mnt

# Create the /nix partition
zfs create \
    -o compression=lz4 \
    -o mountpoint=legacy \
    rpool/local/nix
mkdir -p /mnt/nix
mount -t zfs rpool/local/nix /mnt/nix

# Create the /home partition
zfs create \
    -o mountpoint=legacy \
    rpool/safe/home
mkdir -p /mnt/home
mount -t zfs rpool/safe/home /mnt/home

# Create the /boot partition
mkfs.fat -F 32 -n BOOT /dev/nvme0n1p1
mkdir -p /mnt/boot
mount -t vfat /dev/disk/by-label/BOOT /mnt/boot

# Generate nixos config for /mnt
nixos-generate-config --root /mnt

# Copy configuration/* to /mnt/etc/nixos/

# Install NixOS
nixos-install

# Set foo user password
nixos-enter
passwd foo

# Cleanup & reboot
umount /mnt/{home,nix,boot}
umount /mnt
swapoff -a
zpool export -a
reboot

# Upgrade
nix-channel --update
sudo nixos-rebuild switch --upgrade

# Copy users/foo/config.nix to ~foo/.config/nixpkgs
cp -r users/foo ~/.config/nixpkgs

# Install user programs
nix-env -iA nixos.myPackages

# Cleanup
sudo nix-collect-garbarge -d
