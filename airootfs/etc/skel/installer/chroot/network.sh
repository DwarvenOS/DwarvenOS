#!/bin/bash
# hostname | network
read -p "what name of machine do you want?" hostname
echo "$hostname" | tee /etc/hostname
