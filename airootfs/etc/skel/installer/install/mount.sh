#!/bin/bash
mkdir /mnt/dwarf

read -p "Write your root partition (/dev/sdX): " p_root
mount $p_root /mnt/dwarf

read -p "Write your boot partition (/dev/sdX): " p_boot
mount $p_boot /mnt/dwarf/boot

read -p "Write your swap partition (/dev/sdX): " p_swap
mkswap $p_swap
swapon $p_swap

genfstab -U /mnt/dwarf >> /mnt/dwarf/etc/fstab
