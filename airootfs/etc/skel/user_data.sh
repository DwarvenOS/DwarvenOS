#!/bin/bash
# Dwarven OS installation script
# hello message
# permit checker
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# colors for pretty print
BIRed='\033[1;91m'
BIBrown='\033[1;33m'
Color_remove='\033[0m'
installe="[installer]:"
echo -e "
${BIBrown}
 ######                                            #######  #####  
 #     # #    #   ##   #####  #    # ###### #    # #     # #     # 
 #     # #    #  #  #  #    # #    # #      ##   # #     # #       
 #     # #    # #    # #    # #    # #####  # #  # #     #  #####  
 #     # # ## # ###### #####  #    # #      #  # # #     #       # 
 #     # ##  ## #    # #   #   #  #  #      #   ## #     # #     # 
 ######  #    # #    # #    #   ##   ###### #    # #######  #####  
                                                                   
                                                                   ${Color_remove}"
echo "${installe} Welcome in simple system installation path, brave miner!"

#
# internet connection check
ping -c 1 google.com &> /dev/null
if [ $? -ne 0 ]; then
  echo -e "${BIRed}Error: networks connection failure.${Color_remove}"
  echo "Just connect this using desktop."
  exit 1
fi

# uefi or bios
dmesg | grep -q "EFI v"    
if [ $? -eq 0 ]      
then
    boot_type="EFI"
  else
    boot_type="BIOS"
fi

#echo $boot_type


# get data about installation
#username
read -p "${installe} Type your username: " username_data
while [[ "$username_data" == "" ]] ; do echo "username must contain only letters, numbers, underscores and without capitals and can't be empty!" ; read -p "Type username again: " username_data ; done
username=$(echo "$username_data" | tr '[:upper:]' '[:lower:]')
echo "your username: $username"

#password
read -p "${installe} Type your password: " password
while [ $password == "" ] ; do read -p "password cannot be empty. type password again: " password ; done

#hostname
echo "${installe} Type your computer name (default:  "$HOSTNAME")"
read hostname_data
if [ $hostname_data == "" ]
then
    hostname_data=$HOSTNAME
fi
echo ""
#

echo "$username $password $hostname_data"

#process installation




