#!/bin/bash
read -p "ur login: " username
while [ "$username" == "" ]
do
	read -p "again: " username
done
echo $username
