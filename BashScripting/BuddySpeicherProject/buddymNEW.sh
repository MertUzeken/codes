!/bin/bash

startprocess(){
	echo "Wieviel Speicherplatz benötigt ihr Prozess?"
	read reqm
	echo "Berechne benötigter Speicherplatz..";sleep .5
	getExponential $reqm
	trigger=0
	if checkSpace
    then
		while [ $trigger -eq 0 ]
		do
			findBlock reqm
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

endprocess(){
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
	parID=0
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
			echo "blocknumber: $blockNumber"
			let indexparent=avaitable[$indexCache]
			checkBuddy1="$(cut -d";" -f1 <<< ${parenttable[$indexCache]})" #erster buddy wird initialisiert mit der Zahl vor dem Semicolon 
			checkBuddy2="$(cut -d";" -f2 <<< ${parenttable[$indexCache]})" #zweiter buddy wird initialisiert mit der Zahl nach dem Semicolon 
			echo "checkbud1: $checkBuddy1"
			echo "checkbud2: $checkBuddy2"

			#Zwei If-Abfragen, falls ein Buddy den Wert von blockNumber angenommen hat, wird eins dieser ausgeführt.
		
			if [[ $checkBuddy1 -eq $blockNumber ]] 
			then
			let parID=${avaitable[$indexCache]}
			let wantedNumber=checkBuddy2
			let fusiontrigger=1
			echo "trigger1"
			elif [[ $checkBuddy2 -eq $blockNumber ]]
			then
				let parID=${avaitable[$indexCache]}
				let wantedNumber=checkBuddy1
				let fusiontrigger=1
				echo "trigger2"
			fi
			#sobald fusiontrigger den Wert 1 annimmt, springen wir in die kommende if-Abfrage
			if [ $fusiontrigger -eq 1 ]
			then
				#initialieren zwei Variablen um nach dem Methodenaufruf getIndex sehen zu können, ob der Index gefunden werden konnte
				let controlindex=$TotalMemorySize+1
				let index_getIndex=$TotalMemorySize+1
				echo "Inhalt der wantedNumber: $wantedNumber"
				echo "Inhalt der Avaitable:  ${avaitable[@]}"
				getIndex "$wantedNumber" "${avaitable[@]}"
				echo "Inhalt index_getIndex nach getIndex: $index_getIndex"

				if [ $index_getIndex -ne $controlindex ]
				then
					unset parenttable[$index_getIndex]
					unset avaitable[$index_getIndex] 
					deleteAvai
					unset avaitable[$indexCache] 
					deleteAvai
					avaitable+=( "$parID" )
					unset buddytable[$checkBuddy1]
					unset buddytable[$checkBuddy2]
					echo "Fusion erfolgreich"
					return
				fi
			fi
			let counter=$counter+1
		fi
		let indexCache=$indexCache+1	
	done
	echo "Kein freier Buddy verfügbar"
	false
	
}

findBlock(){
	let length=${#avaitable[@]}-1
		for ((j=0; j<=$length; j++)) #Schleife um alle Elemente in der Verfügbarkeitstabelle abzulaufen
		do
			if [ "${buddytable[${avaitable[$j]}]}" -eq $reqm ] #Wenn Speicheranforderungen mit dem Speicherblock übereinstimmen
			then
				echo "Passender Speicherblock gefunden." 
				let nearestBlockID=avaitable[$j]
				echo $nearestBlockID
				let temp=0
				return
			elif [ $j -eq $length ]
			then
				echo "Kein passender Block gefunden! Suche den nächstgrößeren Block. . .";sleep .5
				difference=${buddytable[${avaitable[0]}]}
				
				cache=0
				for ((k=0; k<=$length; k++)) #Schleife um alle Elemente in der Verfügbarkeitstabelle abzulaufen.
							   #Ziel: den kleinsten Block finden, der trotzdem größer ist als der angeforderte Speicher
				do
					let cache=${buddytable[${avaitable[$k]}]}-$reqm
					#if [ $onetime -eq 0 ] #einmaliges Ereignis um einen Referenzwert zu haben für die zukünftigen Vergleiche im Laufe der Schleife
					#then
					#	let difference=$cache
					#	let oneTime=1
					#	echo $oneTime
					#	echo $nearestBlockID $difference $cache						
					if [ $cache -lt $difference ] #Vergleich, ob die Zahl im Cache kleiner ist als die Zahl, die aktuell am Kleinsten ist.
					then
						let difference=$cache
						let nearestBlockID=$k
					fi
					if [ $k -eq $length ]
					then
						#echo "difference lautet : $difference"
						echo "BlockID: $nearestBlockID   Avaitablewert: ${avaitable[$nearestBlockID]} "
						echo "Gefundener nächstgrößerer Speicherblock: ${buddytable[${avaitable[$nearestBlockID]}]}"
						let temp=1
						return
					fi
				done
			fi
		done
}

reserveBlock(){

	getIndex "$nearestBlockID" "${avaitable[@]}"
	echo " nearestBlock $nearestBlockID"
	echo "avaitable"
	let length=${#avaitable[@]}-1
        for ((i=0; i<=length;i++))
	do
		echo "index: $i wert: ${buddytable[${avaitable[i]}]}"
	done
	let currentBID=avaitable[$index_getIndex]
	unset avaitable[$index_getIndex] #
	deleteAvai
	echo "process 0 mit BID: $currentBID"
	processtable+=( "$currentBID" ) #falscher Wert!!
	echo "avaitable nach reservierung"
	let length=${#avaitable[@]}-1
        for ((i=0; i<=length;i++))
	do
		echo "index: $i wert: ${buddytable[${avaitable[i]}]}"
	done
	echo "processtable"
	let length=${#processtable[@]}-1
        for ((i=0; i<=length;i++))
	do
		echo "index: $i wert: ${buddytable[${processtable[i]}]}"
	done
	echo "Speicherblock wurde erfolgreich reserviert";sleep .5
}

divideBlock(){
	let tmpsize=${buddytable[${avaitable[$nearestBlockID]}]}/2
	#buddy1
	buddytable+=( "$tmpsize" )
	let tmpbuddyID1=${#buddytable[@]}-1
	avaitable+=( "$tmpbuddyID1" )
	#buddy2
	buddytable+=( "$tmpsize" )
	let tmpbuddyID2=${#buddytable[@]}-1
	avaitable+=( "$tmpbuddyID2" )

	#Eintrag im parenttable
	siblingstring="${tmpbuddyID1};${tmpbuddyID2}"
	parenttable[${avaitable[$nearestBlockID]}]=$siblingstring

	getIndex "$nearestBlockID" "${avaitable[@]}"
	unset avaitable[$index_getIndex] #
	deleteAvai
	
	echo "avaitable: 	${avaitable[@]}  |"
	echo "buddytable: 	${buddytable[@]} |"
	echo "parenttable"
    counter=0
	indexCache=0
	while [ $counter -lt ${#parenttable[@]} ] #Schleife, die solange andauert, wie die Anzahl der Elemente in avaitable
	do
		if [ -z "${parenttable[$indexCache]}" ] #wenn inhalt NULL
        then
			#echo "Hier passiert nichts" 					#DEBUG
			true;
		else
			let cacheIndex=avaitable[$i]
			echo "index: $indexCache wert: ${parenttable[$indexCache]}"
			let counter=$counter+1
		fi
		let indexCache=$indexCache+1
	done

}

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

getIndex(){
	value="$1"
	shift
	cacheArr=("$@")
	#echo "getIndex wird ausgeführt"					#DEBUG
	#echo "Inhalt cacheArr:  ${cacheArr[@]}"			#DEBUG
	#for i in "${!cacheArr[@]}"
	for((i=0; i<${#cacheArr[@]};i++)) #Kurze info: bin mir wegen der ${#cacheArr[@]} nicht sicher ob fehler auslösen später. das sollten wir im augen behalten
	do
		cache=${cacheArr[i]}
   		if [ "$cache" = "$value" ]
		then
			#echo "INSIDE LOOP" 						#DEBUG Inside LOOP
			let index_getIndex=$i
   		fi
	done
}

checkSpace(){
	if [ $reqm -gt $TotalMemorySize ]
    then
        echo "Prozessanforderungen sind zu hoch!"
        false
    else
		for ((i=0; i<${#avaitable[@]};i++))
        do
            BlockID=${avaitable[$i]}
            size=${buddytable[$BlockID]}
                if [ $size -ge $reqm ]
                then
                echo "Speicherplatz ist vorhanden"
                return 
                fi
        done
		echo "Kein Speicherplatz mehr für diese Größe vorhanden"
        false
    fi	
}

deleteAllProcess(){
	unset processtable
	unset parenttable
	unset buddytable
	unset avaitable
	buddytable+=( "$TotalMemorySize" )
	avaitable+=( "0" )
	echo "Alle Prozesse wurden gelöscht"
}

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
	while [ $reqm -gt $exp ]; do
		let exp=exp*2
	done
	let reqm=exp
	echo "Der Prozess reserviert: $reqm KB Speicher"
}

#-----------Main-----------
#arrays 
declare -a processtable
declare -a buddytable
declare -a parenttable #index=parent wert=siblingpaar
declare -a avaitable #availabilitytable
#variablen
reqm=0
temp=0
nearestBlockID=0
index_getIndex=0
#echo "Bitte geben sie ihre Speichergröße ein, beachten sie das es eine Zweierpotenz sein muss."
#read TotalMemorySize
#-----------Setup----------
TotalMemorySize=1024

buddytable+=( "$TotalMemorySize" )
avaitable+=( "0" )

PS3='Bitte wählen Sie aus [Zahl] : '
options=("Prozess starten" "Prozess beenden" "Alle Prozesse beenden" "Verfügbare Speichergröße" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"Prozess starten")
		startprocess;sleep 2
		showMenu
            ;;
        "Prozess beenden")
        endprocess;sleep 2
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
