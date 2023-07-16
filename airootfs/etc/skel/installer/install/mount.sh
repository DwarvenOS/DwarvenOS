#!/bin/bash

read -p "Write your root partition (/dev/sdX): " p_root
mount --mkdir $(p_root) /mnt/dwarf

read -p "Write your boot partition (/dev/sdX): " p_boot
mount -mkdir $(p_boot) /mnt/dwarf/boot

read -p "Write your swap partition (/dev/sdX): " p_swap
swapon $(p_swap)

genfstab -U /mnt/dwarf >> /mnt/dwarf/etc/fstab
