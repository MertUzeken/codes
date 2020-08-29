#!/usr/local/bin/bash

#buddy=356781024
#echo "${buddy}"
#echo "${buddy:5}"
#echo "${buddy:0:1}"
#echo "${buddy:1:4}"

buddySize=1024
processSize=1023

echo "$?"

if [[ $buddySize -ge $processSize ]]
then
	echo "Shit happens over here bruh"
else
	echo "FML"
fi
