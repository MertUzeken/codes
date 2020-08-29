#!/usr/local/bin/bash


declare -a availabletable

availabletable+=("1:1024")
availabletable+=("0:512")
availabletable+=("0:512")
availabletable+=("0:256")
availabletable+=("0:256")
availabletable+=("0:128")
availabletable+=("0:128")

tbllen=${#availabletable[@]}

totalsize=("1024")


getFreeMemory(){
######################################## 	#Alle freien Blöcke selbe größe    ###################################

	for((i=0; i<=tbllen-1;i++));do
	checkBB="$(cut -d":" -f1 <<< ${availabletable[i]})"
	size="$(cut -d":" -f2 <<< ${availabletable[i]})"

	#Nur same size and BB = 0
	if [[ checkBB -eq 0 ]];then
		if [[ size -eq reqmem ]];then
			echo "Freier Speicherblöcke in der selben größe: Index: $i  ${availabletable[i]}"
		fi
	fi
	done
######################################## 	#Alle freien Blöcke     ##############################################

	for((p=0;p<=tbllen-1;p++));do
		checkBB="$(cut -d":" -f1 <<< ${availabletable[p]})"
		size="$(cut -d":" -f2 <<< ${availabletable[p]})"


			#Alle freien Blöcke
		if [[ checkBB -eq 0 ]];then
			echo "Freie Speicherblöcke: Index: $p  ${availabletable[p]}"
		fi
	done
}

read reqmem
if [[ reqmem -gt totalsize ]];then
	echo "zu viel speicher angefordert, es sind nur $totalsize KB vorhanden."
else
	getFreeMemory	
fi
