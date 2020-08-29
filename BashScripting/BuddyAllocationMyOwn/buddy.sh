#!/usr/local/bin/bash
#-----Occupation Table-----
insertBranch(){
	getUsedMemory
	#Initialization
	if [[ $? -eq 1 ]]; then
		echo "Speicher Voll, bitte räumen sie den Speicher Frei und versuchen sie es erneut."; break;
	else
		getExponential RequestMemory
		SearchFreeBlock
	fi	
}
deleteBranch(){
	true;}
setBusyBit(){
	#Wenn der BusyBit des Child gesetzt wird, soll auch der BusyBit des Parents 1 gesetzt werden.
	ParentID="${occupationtable[$j]:1:1}" 			 	 #ParentID --->goto "parents" index, hole BusyBit. (ParentID == BranchID)
	ParentBB="${occupationtable[$ParentID]:0:1}" 		 #ParentBusyBit

	#echo "${occupationtable[$j]}, Child"			}
	#echo "${occupationtable[$ParentID]}, Parent"	}  	 #DEBUG
	#echo "ParentID: $ParentID, ParentBB: $ParentBB"}
	if [[ $ParentBB -eq 0 ]]; then
		occupationtable[$ParentID]="1${occupationtable[$ParentID]:1}"
	fi
	occupationtable[$j]=1${occupationtable[$j]:1}
	echo "BusyBit wurde gesetzt"  						 #DEBUG
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
SearchFreeBlock(){
	oTL=${#occupationtable[@]} 							 #OccupationTableLength
	#Sucht nach Block in selber größe, wenn nicht vorhanden, fügt er neuen Block ein.
	for ((j=1;j<=$oTL;j++)); do
		BlockSize=${occupationtable[$j]:2} 					 #GetSize xxKB | nach dem 2ten Zeichen.
		echo "$Exponential == $BlockSize ?"
		if [[ BlockSize -eq Exponential ]]; then 
			echo "Passender Speicherblock wurde gefunden, BusyBit wird überprüft" #Prüf das BusyBit, falls = 0 teile den Block zum Prozess zu.
			getBusyBit
			if [[ $? -eq 0 ]]; then
				processtable+=("$j") #Notiere BranchID in ProcessTable. Könnte oder müsste eventuell ausgelagert werden in createProcess
				setBusyBit
				return 0
				break
			else
				echo "BusyBit 1, Speicherblock Belegt!."
				#nach einigen versuchen trigger erneut createBlock
				#createBlock braucht eine Abfrage die schaut ob ein nächst größerer Block mit BusyBit = 0 (frei) 
				#Um den dann eventuell zu zerteilen. (New Branch.)
				#Derzeit erstellt createBlock nur einen Branch.

				#Nachtrag:createBlock braucht definitiv mehrere Abfragen z.b: eine die auch schaut das der speicher nich voll ist bevor
				#er anfängt nicht vorhandene Blöcke zu erstellen oder zerteilen.
				#return 1
				createBlock
			fi
		fi
	done
	createBlock
}
createBlock(){

}
getExponential(){
	Exponential=$1
	while ! [[ $((exp**i)) -ge $((Exponential)) ]]; do 			 #Solange exponent nicht >= Exponential(RequestMemory), erhöhe counter i+=1
		i+=1											 		 #Kann man auch mit For Loop lösen, aber hab mir dabei warscheinlich schon was gedacht ...
		if [[ $((exp**i)) -ge $((Exponential)) ]]; then			 #Wenn exponent größer als Exponential(RequestMemory), schreibe in Exponential(neuerwert).
			Exponential=$((exp**i))
			echo "Benötigter Speicherblock $Exponential KB";sleep .5
			i=1
			break
		fi
	done
}
getUsedMemory(){
	pTL=${#processtable[@]}								 #ProcessTableLenght
	for((w=1;w<=pTL-1;w++));do counter+=${occupationtable[${processtable[$w]}]:2};done #Zäht die durch Prozesse belegten Speicherblöcke zusammen
	#echo "$counter == $TotalMemorySize  ???" 			 #DEBUG
	echo "Belegter Speicher durch Prozesse: $counter KB von ${TotalMemorySize##00}."
	echo "$((${TotalMemorySize##00}-$counter)) KB Speicher Frei"
	if [[ $counter -eq TotalMemorySize ]]; then
		w=1
		counter=0
		return 1
	else
		w=1
		counter=0 
		return 0
	fi
}
#-----------Main-----------
declare -a processtable
declare -a occupationtable
declare -i exp=2
declare -i i=1
declare -i counter=0
Exponential=0
BlockSize=0
#echo "Bitte geben sie ihre Speichergröße ein, beachten sie das es eine Zweierpotenz sein muss."
#read TotalMemorySize
#-----------Setup----------
TotalMemorySize=1024									 #DEBUG

processtable+=("-")
#processtable+=("1")

occupationtable+=("-")   								 #Erstes Feld soll leer bleiben, Platzhalter.
occupationtable+=("00$TotalMemorySize") 					 #MemTotalSize
#occupationtable+=("11512")
#occupationtable+=("11512")
#occupationtable+=("02256")
echo "${occupationtable[1]:2} Total Memory Size."
choice=5
oTL=${#occupationtable[@]}
BlockSize=${occupationtable[$oTL-1]:2}
newBlockPair=$((BlockSize/2))
echo "Größe der neuen Blockpärchen: $newBlockPair KB";sleep .5
for ((i=1; i<=2; i++)); do ParentIndex=$((oTL-1)); occupationtable+=("0$ParentIndex$newBlockPair"); done
oTL=${#occupationtable[@]}

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
			read RequestMemory
			insertBranch RequestMemory
			clear;;
		2)
			echo "Welchen Prozess möchten sie beenden?";;
		3)
			echo "Alle Prozesse werden beendet und der Speicher freigegeben . . .";;
		4)
			for ((p=0; p<=6; p++));do  echo "Prozess: $p, BranchID: ${processtable[$p]}"; done
			for ((o=0; o<=10; o++));do  echo "Speicherblock BranchID: $o, BusyBit: ${occupationtable[$o]:0:1}, ParentID:${occupationtable[$o]:1:1}, Blockgröße: ${occupationtable[$o]:2 }"; done;;
	esac
done