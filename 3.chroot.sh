#!/usr/bin/env sh
set -ue

reflector --verbose -c CN --protocol https --sort rate --latest 5 --download-timeout 5 --thread 5 > /etc/pacman.d/mirrorlist
pacstrap -K /mnt base base-devel linux-zen linux-zen-headers linux-firmware lvm2 networkmanager vim man btrfs-progs bash-completion
genfstab -U /mnt >>/mnt/etc/fstab
cat /mnt/etc/fstab

sudo chown f:f ../arch-auto-install-with-btrfs-lvm -R
cp -rf ../arch-auto-install-with-btrfs-lvm /mnt/root
arch-chroot /mnt
