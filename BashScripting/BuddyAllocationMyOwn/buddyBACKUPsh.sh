#!/usr/local/bin/bash
#-----Occupation Table-----
insertBranch(){
	echo "benötigter Speicherblock wird berechnet . . .";sleep .5
	getExponential reqmem
	getBlock
	if [[ $? -eq 1 ]]; then								 #Wenn getBlock 1 liefert, kein Block in der gesuchten größe, createBlock wird ausgeführt.
		createBlock
		if [[ $? -eq 0 ]]; then							 #Wenn createBlock 1 liefer, kein Platz mehr im Speicher. Brech ab.
		getBlock
		else
			echo "createBlock Fehlgeschlagen"
		fi
	fi
	return
}
deleteBranch(){
	true;}
setBusyBit(){
	#Wenn der BusyBit des Child gesetzt wird, soll auch der BusyBit des Parents 1 gesetzt werden.
	ParentID="${occupationtable[$j]:1:1}" 			 	 #ParentID --->goto "parents" index, hole BusyBit. (ParentID == BranchID)
	ParentBB="${occupationtable[$ParentID]:0:1}" 		 #ParentBusyBit

	#echo "${occupationtable[$j]}, Child"					}
	#echo "${occupationtable[$ParentID]}, Parent"			}  #DEBUG
	#echo "ParentID: $ParentID, ParentBB: $ParentBB"		}
	if [[ $ParentBB -eq 0 ]]; then
		occupationtable[$ParentID]="1${occupationtable[$ParentID]:1}"
	fi
	occupationtable[$j]=1${occupationtable[$j]:1}
}
getBusyBit(){
	#echo "BusyBit: ${occupationtable[$j]:0:1}"			 #DEBUG
	return "${occupationtable[$j]:0:1}"

}  					 #da sowieso 0 oder 1 passts.
getParentID(){
	true;}
getSiblingID(){
	true;}
#------Process Table-------
delProcess(){
	true;}
createProcess(){										 #Get und Set Tree kann in die Prozessgenerierung zusammengefasst werden.
	echo "createProcess wird ausgeführt"				 #DEBUG
	insertBranch
	echo "Prozessgenerierung abgeschlossen"
	ProcessIndex+=$((${#occupationtable[@]}-1))
	echo "ProzessID: $ProcessIndex}"
}
#------Logic---------
getBlock(){
	oTL=${#occupationtable[@]} 							 #OccupationTableLength
	#Sucht nach Block in selber größe, wenn nicht vorhanden, fügt er neuen Block ein.
	j=1													 # ? Muss eventuell raus aus der Funktion oder rein in die Schleife, vergessen  ... 
	for ((;j<=$oTL;j++)); do
		tmp=${occupationtable[$j]:2} 					 #GetSize xxKB | nach dem 2ten Zeichen.  
		if [[ val -eq tmp ]]; then   #1. val: 512 | tmp: 1024 #### 2. val: 512 | tmp: 512
			echo "Passender Speicherblock wurde gefunden, BusyBit wird überprüft" #Prüf das BusyBit, falls = 0 teile den Block zum Prozess zu.
			getBusyBit
			if [[ $? -eq 0 ]]; then
				processtable+=("$j") #Notiere BranchID in ProcessTable. Könnte oder müsste eventuell ausgelagert werden in createProcess
				setBusyBit
				break
			else
				echo " "
			fi
		fi
	done
	return 1
}
createBlock(){
	pTL=${#processtable[@]}								 #ProcessTableLenght
	for((w=1;w<=pTL;w++));do counter+=${occupationtable[${processtable[$w]}]:2};done #Zäht die durch Prozesse belegten Speicherblöcke zusammen
	echo "Belegter Speicher durch Prozesse: $counter KB"
	TotalSize=${occupationtable[1]:2}
	if [[ $counter -eq TotalSize ]]; then
		echo "Speicher Voll, bitte räumen sie den Speicher Frei"
		return 1
	else
		tmp=${occupationtable[$oTL-1]:2}
		if ! [[ val -eq tmp ]]; then
			echo "Kein Speicherblock in gleicher größe vorhanden!";sleep .5	
			echo "Speicherblock wird erstellt"	;sleep .5 #Generiert BranchID(INDEX OccuT.), Set BusyBit, ParentID, Size.
			newBlockPair=$((tmp/2))
			echo "Größe der neuen Blockpärchen: $newBlockPair KB";sleep .5
			for ((i=1; i<=2; i++)); do ParentIndex=$((oTL-1)); occupationtable+=("0$ParentIndex$newBlockPair"); done
			oTL=${#occupationtable[@]}
			#for ((a=0; a<=$oTL; a++));do echo "$a: ${occupationtable[$a]}"; done #DEBUG
		fi
	fi
	counter=0											 #Reset Counter, Ansonsten wird er beim nächsten mal drauf addieren.
}
getExponential(){
	val=$1
	while ! [[ $((exp**i)) -ge $((val)) ]]; do 			 #Solange exponent nicht >= val(reqmem), erhöhe counter i+=1
		i+=1											 #Kann man auch mit For Loop lösen, aber hab mir dabei warscheinlich schon was gedacht ...
		if [[ $((exp**i)) -ge $((val)) ]]; then			 #Wenn exponent größer als val(reqmem), schreibe in val(neuerwert).
			val=$((exp**i))
			echo "Benötigter Speicherblock $val KB";sleep .5
			break
		fi
	done
}

#-----------Main-----------
declare -a processtable
declare -a occupationtable
declare -i exp=2
declare -i i=1
declare -i counter=0
val=0
tmp=0
#echo "Bitte geben sie ihre Speichergröße ein, beachten sie das es eine Zweierpotenz sein muss."
#read TotalMemorySize
#-----------Setup----------
TotalMemorySize=001024									 #DEBUG
processtable+=("-")	
occupationtable+=("-")   								 #Erstes Feld soll leer bleiben, Platzhalter.
occupationtable+=("$TotalMemorySize") 					 #MemTotalSize
echo "${occupationtable[1]:2} Total Memory Size."
choice=5
while ! [[ choice -eq 0 ]]; do
	echo "Bitte wählen sie aus:"
	echo ""
	echo "0. Beenden"
	echo "1. Prozess Starten"
	echo "2. Speicher Freigeben"
	echo "3. Alles Freigeben"
	echo "4. Alle Prozesse und Speichertabelle anzeigen"
	read choice

	case "$choice" in
		1)
			echo "Prozess wird gestartet bitte geben sie an wie viel Speicher benötigt wird"
			read reqmem
			insertBranch reqmem
			#sleep 4									 #DEBUG
			val=""
			tmp=""
			i=1
			clear
			;;
		2)
			echo "Welchen Prozess möchten sie beenden?";;
		3)
			echo "Alle Prozesse werden beendet und der Speicher freigegeben . . .";;
		4)
			for ((p=0; p<=5; p++));do  echo "Prozess: $p, BranchID: ${processtable[$p]}"; done
			for ((o=0; o<=5; o++));do  echo "Speicherblock BranchID: $o, BusyBit: ${occupationtable[$o]:0:1}, ParentID:${occupationtable[$o]:1:1}, Blockgröße: ${occupationtable[$o]:2 }"; done;;
	esac
done