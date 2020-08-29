#!/usr/local/bin/bash


#Setup 1

declare -a processtable
declare -a occupationtable

TotalSize=0:0:1024
oTL=${#occupationtable[@]}
result=0
Exponential=256
i=0
ParentINDEX=0
processtable+=("-")
BlockSize=0
														occupationtable+=("$TotalSize")
#
										occupationtable+=("1:0:512")	occupationtable+=("2:0:512")
#
#						occupationtable+=("3:0:256") occupationtable+=("4:1:256")

#		occupationtable+=("7:0:128") occupationtable+=("8:0:128")
#
#	occupationtable+=("15:0:64") occupationtable+=("16:0:64")


DisplayMemory(){
	oTL=${#occupationtable[@]}
	for ((p=0;p<=oTL-1;p++));do
		FindParent
	done
}

FindParent(){
	GetInfo 1 ${occupationtable[p]}
	OwnIndex=$result
	ParentINDEX=$(((OwnIndex-1)/2))
	echo "${occupationtable[p]}  ParentID: $ParentINDEX"
}

GetInfo(){
	#Function to cut out the needed parts of the string. 
	#Get Info:  #1 = Index #2 = BusyBit #3 = Size
	option=$1
	field=$2
	case "$option" in
		1)
			result="$(cut -d":" -f1 <<< ${field})";;
		2)
			result="$(cut -d":" -f2 <<< ${field})";;
		3)
			result="$(cut -d":" -f3 <<< ${field})";;
	esac
}

SetBB(){
	GetInfo 1 ${occupationtable[i]}
	temp=$result
	GetInfo 3 ${occupationtable[i]}
	occupationtable[i]="$temp:1:$result"
}

SearchFreeBlock(){
	#Search for Block of xx Size, first LEFT then RIGHT
	#If both occupied, search for next higher and generate from that.
	SearchBlockSameSize
	if [[ $? -eq 1 ]]; then
		SearchNextHigherBlock
	fi
}

SearchNextHigherBlock(){

	#Die Loop funktioniert nicht und gibt nix aus
	#sie sollte das nächst höhere exponential finden und dann splitten.
	#Wenns keine gibt dann den wiederrum nächst höheren.
	blockSearchState=1
	while [[ blockSearchState -eq 1 ]]
		NextHigher=$((Exponential*2))
		for ((z=0;z<=oTL-1;z++));do
			GetInfo 3 ${occupationtable[z]}
			BlockSize=$result
			echo "NextHigher: $NextHigher = Blocksize: $Blocksize ?"
			if [[ NextHigher -eq Blocksize ]];then 					#Is there a nextHigher block?
				GetInfo 2 ${occupationtable[z]}
				if [[ $result -eq 0 ]];then							#Is it occupied?
					echo "split"
				else
					echo "continue"
				fi
			else
				echo "No NextHigher Block available"
			fi
		done
		NextHigher=$((nextHigher*2))
	done
}

SearchBlockSameSize(){
	for ((i=0; i<=oTL-1;i++));do
		GetInfo 3 ${occupationtable[i]}  	#GetSize
		BlockSize=$result
		if [[ Exponential -eq BlockSize ]];then
			GetInfo 2 ${occupationtable[i]}
			if [[ result -eq 0 ]];then		#Get BB
				SetBB
				echo "BusyBit set to 1"
				return 0
				break
			else
				echo "Block is already allocated"
			fi
		else
			echo "No Block in that size available"
		fi
	done
	return 1
}

SplitBlock(){
	BlockSize=$1
	oTL=${#occupationtable[@]}
	ChildBlockSize=$((BlockSize/2))
	LeftChildID=$((i*2+1))
	RightChildID=$((i*2+2))
	echo "LEFT: $LeftChildID   RIGHT: $RightChildID CHILDSIZE: $ChildBlockSize"
	occupationtable+=("${LeftChildID}:0:$ChildBlockSize")
	occupationtable+=("${RightChildID}:0:$ChildBlockSize")
	oTL=${#occupationtable[@]}
}

SearchFreeBlock



