#!/bin/bash

read -p "Write locale (l for list): " locale

while [ "$locale" == "l" ]
do
	cat /etc/locale.gen
	read -p "Write locale without # (like en_US.UTF-8 UTF-8): " locale
done

$(locale) | tee -a /etc/locale.gen

locale-gen

echo "LANG=${locale%' *'}" | tee -a /etc/locale.conf
