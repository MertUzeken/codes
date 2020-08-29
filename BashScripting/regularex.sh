#!/usr/local/bin/bash
#set -xv

#Ok this is what happens:
#Through parameter substitution we get whether if its a number or not.
#First telling bash that starting from left end --->##
#The preceding item will be matched zero or more times (*) with Character Class [^0-9] which goes through range 0-9
#and checks if $var not equal [0/1/2/...]* for ]*<-- all in Class.
#When matched the expression turns  TRUE; for number. 
#When ^ (!=)  the expression turns  FALSE; for no number
#Explanation not checked so maybe contains incorrect syntax explanation.

read op

echo "${op##*}"

if [ ${op##*[^0-9]*} ];
then
	echo "It's a number"
else
	echo "This is not a number"
fi
