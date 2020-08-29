#!/usr/local/bin/bash
#set -xv

declare -i smth
read smth
echo "Ihre eingabe lautet $smth"

if [ $smth -ne 0 ]
then 
	echo "$smth is not equal to 0"
else
	echo "$smth is equal to 0"
fi
