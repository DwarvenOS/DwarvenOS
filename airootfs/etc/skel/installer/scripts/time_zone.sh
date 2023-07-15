#!/bin/bash

read -p "Write your timezone region (r for regions list): " region

while [ "$region" == "r" ]
do
	echo $(ls /usr/share/zoneinfo/)
	read -p "Write your timezone region (r for regions list): " region
done

read -p "Write your timezone city (c for city list): " city

while [ "$city" == "c" ]
do
	echo $(ls /usr/share/zoneinfo/$(region))
	read -p "Write your timezone city (c for city list): " city
done

ln -sf /usr/share/zoneinfo/$(region)/$(city) /etc/localtime

hwclock --systohc
	
