#!/bin/bash

startProcess(){
	echo "Wieviel Speicherplatz benötigt ihr Prozess?"
	read requiredSpace
	echo "Berechne benötigten Speicherplatz..";sleep .5
	getExponential $requiredSpace
	trigger=0
	if checkSpace
    then
		while [ $trigger -eq 0 ]
		do
			findBlock $requiredSpace
			if [ $temp -eq 0 ]
			then
				reserveBlock $nearestBlockID
				let trigger=1
			else
				divideBlock $nearestBlockID
			fi
		done
	fi	
}

endProcess(){
	echo "Wählen Sie den zu beendenden Prozess aus! [Zahl]"
	echo "Prozessliste:"
	for ((i=0; i<${#processtable[@]};i++))
    do
        echo "$i) Speichergröße: ${buddytable[${processtable[$i]}]}"
    done
	read processNumber
	blockNumber=${processtable[$processNumber]}
	unset processtable[$processNumber]
	avaitable+=( "$blockNumber" )
	echo "Der Prozess wurde entfernt"
	fusion $blockNumber
}

fusion(){
	blockNumber="$1" #übergebener Wert an die methode wird lokal gespeichert
	wantedNumber=0
	fusiontrigger=0
	counter=0
	indexCache=0
	while [ $counter -lt ${#parenttable[@]} ] #Schleife, die solange andauert, wie die Anzahl der Elemente in avaitable
	do
		if [ -z "${parenttable[$indexCache]}" ] #wenn inhalt NULL
        then
			true;
			#echo "Hier passiert nichts"
		else
			checkBuddy1="$(cut -d";" -f1 <<< ${parenttable[$indexCache]})" #erster buddy wird initialisiert mit der Zahl vor dem Semicolon 
			checkBuddy2="$(cut -d";" -f2 <<< ${parenttable[$indexCache]})" #zweiter buddy wird initialisiert mit der Zahl nach dem Semicolon 
			#Zwei If-Abfragen, falls ein Buddy den Wert von blockNumber angenommen hat, wird eins dieser ausgeführt.
			if [[ $checkBuddy1 -eq $blockNumber ]] 
			then
				let wantedNumber=checkBuddy2
				let fusiontrigger=1
			elif [[ $checkBuddy2 -eq $blockNumber ]]
			then
				let wantedNumber=checkBuddy1
				let fusiontrigger=1
			fi
			if [ $fusiontrigger -eq 1 ]
			then
				#initialieren zwei Variablen um nach dem Methodenaufruf getIndex sehen zu können, ob der Index gefunden werden konnte
				let controlindex=$memorySize+1
				let index_getIndex=$memorySize+1
				getIndex "$wantedNumber" "${avaitable[@]}"
				if [ $index_getIndex -ne $controlindex ]
				then
					unset parenttable[$indexCache]
					deleteAvai
					getIndex "$blockNumber" "${avaitable[@]}"
					deleteAvai
					avaitable+=( "$indexCache" )
					unset buddytable[$checkBuddy1]
					unset buddytable[$checkBuddy2]
					echo "Fusion erfolgreich"
					fusion $indexCache
				fi
			fi
			let counter=$counter+1
		fi
		let indexCache=$indexCache+1	
	done
	echo "Buddy belegt"
	false
	
}

findBlock(){
	let length=${#avaitable[@]}-1
	for ((j=0; j<=$length; j++)) #Schleife um alle Elemente in der Verfügbarkeitstabelle abzulaufen
	do
		if [ "${buddytable[${avaitable[$j]}]}" -eq $requiredSpace ] #Wenn Speicheranforderungen mit dem Speicherblock übereinstimmen
		then
			echo "Passenden Speicherblock gefunden." 
			let nearestBlockID=avaitable[$j]
			let temp=0
			return
		elif [ $j -eq $length ]
		then
			difference=${buddytable[${avaitable[0]}]}	
			cache=0
			for ((k=0; k<=$length; k++)) #Ziel: den kleinsten Block finden, der trotzdem größer ist als der angeforderte Speicher
			do
				let cache=${buddytable[${avaitable[$k]}]}-$requiredSpace				
				if [ $cache -lt $difference ] #Vergleich, ob die Zahl im Cache kleiner ist als die Zahl, die aktuell am Kleinsten ist.
				then
					let difference=$cache
					let nearestBlockID=avaitable[$k]
				fi
				if [ $k -eq $length ]
				then
					let temp=1
					return
				fi
			done
		fi
	done
}

reserveBlock(){
	getIndex "$nearestBlockID" "${avaitable[@]}"
	unset avaitable[$index_getIndex]
	deleteAvai
	processtable+=( "$nearestBlockID" ) 
	echo "Speicherblock wurde erfolgreich reserviert";sleep .5
}

divideBlock(){
	let tmpsize=${buddytable[$nearestBlockID]}/2
	#buddy1
	buddytable+=( "$tmpsize" )
	let tmpbuddyID1=${#buddytable[@]}-1
	avaitable+=( "$tmpbuddyID1" )
	#buddy2
	buddytable+=( "$tmpsize" )
	let tmpbuddyID2=${#buddytable[@]}-1
	avaitable+=( "$tmpbuddyID2" )
	#Eintrag im parenttable
	siblingString="${tmpbuddyID1};${tmpbuddyID2}"
	parenttable[$nearestBlockID]=$siblingString
	let index_getIndex=$nearestBlockID
	deleteAvai
}

getIndex(){
	value="$1"
	shift
	cacheArr=("$@")
	for((i=0; i<${#cacheArr[@]};i++))
	do
		cache=${cacheArr[i]}
   		if [ "$cache" = "$value" ]
		then
			let index_getIndex=$i
			return
   		fi
	done
	false
}
#----------Löschfunktionen-----------
deleteAvai(){
	unset avaitable[$index_getIndex]
	declare -a cacheArr
	for ((i=0;i<${#avaitable[@]};i++))
	do
        	if [ $i -lt $index_getIndex ]
        	then
                	cacheArr[$i]=${avaitable[i]}
        	else
                	cacheArr[$i]=${avaitable[i+1]}
        	fi
	done
	unset avaitable
	avaitable=("${cacheArr[@]}")
}

deleteAllProcess(){
	unset processtable
	unset parenttable
	unset buddytable
	unset avaitable
	buddytable+=( "$memorySize" )
	avaitable+=( "0" )
	echo "Alle Prozesse wurden gelöscht"
}
#----------Kontrollfunktionen-----------
checkSpace(){
	if [ $requiredSpace -gt $memorySize ]
    then
        echo "Prozessanforderungen sind zu hoch!"
    else
		for ((i=0; i<${#avaitable[@]};i++))
        do
            BlockID=${avaitable[$i]}
            size=${buddytable[$BlockID]}
                if [ "$size" -ge "$requiredSpace" ]
                then
                echo "Speicherplatz ist vorhanden"
                return 
                fi
        done
		echo "Kein Speicherplatz mehr für diese Größe vorhanden"
        false
    fi	
}
#----------Präsentierfunktionen-----------
showAvailableBlocks(){
	echo -e "\n\nVerfügbare Speicherblöcke:\n"
        for ((i=0; i<${#avaitable[@]};i++))
	do
		echo "Index: $i Speichergröße: ${buddytable[${avaitable[i]}]}"
	done
}

showMenu(){
	echo ""
	echo ""
	for ((i=0; i<${#options[@]};i++))
        do
			let counter=$i+1
            echo "$counter) ${options[i]}"
        done
	echo ""
}
#----------Rechner-----------
getExponential(){
	exp=1
	while [ $requiredSpace -gt $exp ]; do
		let exp=exp*2
	done
	let requiredSpace=exp
	echo "Der Prozess reserviert: $requiredSpace KB Speicher"
}
#-----------Main-----------
#arrays 
declare -a processtable
declare -a buddytable
declare -a parenttable #index=parent wert=siblingpaar
declare -a avaitable #availabilitytable
#variablen
requiredSpace=0
temp=0
nearestBlockID=0
index_getIndex=0
#-----------Setup----------
memorySize=1024

buddytable+=( "$memorySize" )
avaitable+=( "0" )

PS3='Bitte wählen Sie aus [Zahl] : '
options=("Prozess starten" "Prozess beenden" "Alle Prozesse beenden" "Verfügbare Speichergröße" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"Prozess starten")
		startProcess;sleep 2
		showMenu
            ;;
        "Prozess beenden")
        endProcess;sleep 2
		showMenu
            ;;
        "Alle Prozesse beenden")
		deleteAllProcess;sleep 2
        showMenu
            ;;
		"Verfügbare Speichergröße")
		showAvailableBlocks;sleep 2
        showMenu
            ;;
        "Quit")
        	break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
