#!/usr/locale/bin/bash
#set -xv

words="Ok but this is the last time"
read -a sentence <<< $words		#Read pre-defined sentence according to default IFS-settings.
echo ""
echo ${sentence[@]}			#Same as the one below, both do mass expansion and give out the whole array.
echo ${sentence[*]}			#Same as the one above, ... .
echo ${sentence[@]:1:4}			#Expands all from offset to number.
#echo ${sentence[@]:1:4}			#Exüamds all from offset to number.

echo ""
echo ""

#for elem in "${sentence[@]}"; do echo "$elem"; done #Quoting the "$array" will result in a vertical output with @
for elem in "${sentence[*]}"; do echo "$elem"; done #Quoting the "$array" will result in a horizontal out with glob(*)

echo "the word ${sentence[2]} has ${#sentence[2]} letters."
echo "the sentence ${sentence[@]} has ${#sentence[@]} words."
#echo "the sentence ${sentence[*]} has ${#sentence[*]} words."
echo "There are ${!sentence[@]} indexes in this Array" 
