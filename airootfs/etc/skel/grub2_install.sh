#!/bin/bash
echo "install bootloader GRUB2..."

dmesg | grep -q "EFI v"    
if [ $? -eq 0 ]      
then
    boot_type="EFI"
  else
    boot_type="BIOS"
fi

echo "you using $boot_type. Process installation for this type"

disk_name=$(fdisk -l | awk '/Disk \/dev\/[^:]+/ {print $2}' | sed 's/://')

echo "install GRUB2..."
if [ "$boot_type" == "BIOS" ] then
    grub-install --target=$(uname -m) $disk_name
fi

if [ "$boot_type" == "EFI" ] then
    grub-install --target=x86_64-efi --efi-directory=/boot/ --bootloader-id=GRUB
fi

echo "installation sucess!"