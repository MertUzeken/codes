#!/bin/bash

# Aufgabe: Entwickeln Sie einen Simulator für das Konzept der Buddy-Speicherverwaltung. Dieser soll einen Speicher mit einer bestimmten Größe und Konfiguration darstellen und die Zuweisung von Prozessen bzw. Freigabe von Prozessen korrekt simulieren und demonstrieren. Die Größe des Speichers soll der Benutzer (mit sinnvollen Einschränkungen!) frei festlegen können.

#Written by Thi Minh Nguyet Nguyen & Yuliya Paulouskaya
#Fachbereich 2, Fach: Betriebssysteme und Rechnernetze
#Dozent: Prof. Dr. Christian Baun
#Script follows here:

#Die Funktion sucht den Index von einem Wert aus einer Liste
function getIndex () {
	local value=$1
	for i in ${!list[@]}
	do
		if [[ ${list[$i]} = $value ]]; then return $i; fi
	done
	return 255
}

#Die Funktion wandelt Integer in String um d.h. 0 wird an den Anfang der Integerzahl eingefügt bis ihre Länge 4 ist, Rückwert: String id
function generateID() {
	value=$1
	length=${#value}
	while [[ $length -lt 4 ]]
	do
		value="0${value}"
		((length++))
	done
	fullID=$value
}

#Die Funktion wandelt String in Integer um d.h alle 0 am Anfang des Strings wird gelöscht, Rückwert: Integer parseIntID
function parseInt () {
	local id=$1
	i=0
	while [[ $i -lt 4 ]]
	do
		#substring von BuddyID nehmen
		prefix=`expr substr $id 1 1`
		if [[ $prefix = "0" ]]
		then
			id=${id:1}
		fi
		#i vergrößt sich um 1
		((i++))
	done
	parseIntID=$id
}

#Die Funktion sucht das erste Bit von einem Buddy, das prüft, ob das Buddy schon zugewiesen wurde (1) oder nicht (0)
function getBusyBit () {
	local buddy=$1
	return ${buddy:0:1}
}

#Die Funktion sucht die BuddyID von einem Buddy d.h. vier nächsten Ziffern, Rückwert: String buddyID
function getBuddyID () {
	local buddy=$1
	buddyID=${buddy:1:4}
}

#Die Funktion sucht die Buddygröße d.h. die letzten Ziffern, Rückwert: String buddySize
function getBuddySize () {
	local buddy=$1
	buddySize=${buddy:5}
}

#Die Funktion findet den Index vom einem Prozess entsprechende Buddy heraus
function getHole () {
	processSize=$1
	result=0
	value=10000
	for (( i=${#list[@]} - 1; i>=0; i-- ))
	do
		getBuddySize ${list[$i]}
		getBusyBit ${list[$i]}
		#sucht das kleinste Buddy in der Liste, das nicht besetzt ist und dessen Größe größer als oder gleich die Prozessgröße ist 
		if [[ $buddySize -ge $processSize && $? -ne 1 ]]  #$? -ne 1 prüft ob EXIT STATUS unsuccessful ist.
		then
			if [[ $buddySize -lt $value ]]   #1. buddySize:100 value:1000
			then
				value=$buddySize
				result=$i  					 #1. i: 0
			fi
		fi
	done
	if [[ $value = 10000 ]]
	then
		result=255
	fi
	return $result
}

#Die Funktion unterteilt die freien Speicher in Buddies um einen Prozess zuzuweisen und fügt sie zur Liste hinzu
function assignProcess () {
	processSize=$1
	getHole $processSize
	i=$?
	#Meldung wenn kein dem Prozess entsprechender Speicher frei ist
	if [[ $i = 255 ]]
	then
		echo "Kein entsprechendes Buddy!!"
		return 0
	fi
	fullBuddy=${list[$i]}		#1. FullBuddy: 0
	getBuddyID $FullBuddy 		#1. 
	getBuddySize $fullBuddy
	declare -a newlist			#newlist enthält die neu unterteilten Buddies

	#fullBuddy wird zugewiesen wenn seine Größe kleiner als das Doppelte der Prozessgröße ist
	if [[ $buddySize -lt $(($processSize*2)) ]]
	then
		#das Prüfbit wird zu 1 gewechselt
		fullBuddy=${fullBuddy/#0/1}
		list=("${list[@]:0:$i}" "$fullBuddy" "${list[@]:$(($i + 1))}")
		occupiedList=("${occupiedList[@]}" "$buddyID")
		return 0
	fi

	#while loop unterteilt Buddy in 2 Hälften solange seine Größe noch größe als das Doppelte der Prozessgröße ist
	nextID=`expr $buddyID \* 2`
	while [[ $buddySize -ge $(($processSize*2)) ]]
	do
		generateID $nextID
		buddySize=`expr $buddySize / 2`
		newBuddy="0${fullID}${buddySize}"
		newlist=("${newlist[@]}" "$newBuddy")		#Alle neu unterteilte Buddies werden in newlist eingefügt
		nextID=$(( ($nextID + 1) * 2 ))				#BuddyID von jedem neu unterteilten Buddy
		fullBuddy=$newBuddy
	done
	nextID=`expr $nextID / 2`			#BuddyID vom zuzuweisenden Buddy
	generateID $nextID
	newBuddy="1${fullID}${buddySize}"				#Das Prüfbit ist 1 denn das Buddy wird zugewiesen
	newlist=("${newlist[@]}" "$newBuddy")			#Das zuzuweisende Buddy wird in newlist eingefügt
	list=(${list[@]:0:$i} ${newlist[@]:0} ${list[@]:$(($i + 1))})			#newlist wird an die Stelle i in der Buddyliste eingefügt
	occupiedList=("${occupiedList[@]}" "$fullID")
}

#Die Funktion sucht das Buddy, das eine bestimmte BuddyID besitzt, Rückwert: String buddy
function getBuddy () {
	local id=$1
	for b in ${list[@]}
	do
		getBuddyID $b
		if [[ $buddyID = $id ]]; then buddy=$b; fi
	done
}

#Die Funktion sucht die ID des Elterns von einem Buddy, Rückwert: Integer parentID
function getParentID () {
	local id=$1
	if [[ $(($id%2)) = 0 ]]
	then
		parentID=`expr $id / 2`
	else
		id=`expr $id - 1`
		parentID=`expr $id / 2`
	fi
}

#Die Funktion sucht Geschwister von einem Buddy, das Geschwister hat gleiche Eltern und gleiche Größe wie das Buddy, besitzt jedoch eine andere BuddyID, Rückwert: String sibling
function getSibling () {
	local id=$1
	sibling="0"
	getBuddy $id; parseInt $id
	id=$parseIntID
	getParentID $id
	parentFromID=$parentID
	for b in ${list[@]}
	do
		getBuddyID $b; parseInt $buddyID
		buddyID=$parseIntID
		getParentID $buddyID
		if [[ $parentID = $parentFromID && $buddyID -ne $id ]]
		then
			sibling=$b
		fi
	done
}

#Die Funktion gibt einen Speicher frei
function releaseBuddy () {
	local id=$1
	getBuddy $id
	getSibling $id
	getIndex $buddy
	pos=$?
	getBusyBit $sibling
	#Wenn in der Liste das Buddy gleicher Größe weder existiert noch frei ist, wird das Prüfbit des freigegebenen Buddy zu 0 gewechselt
	if [[ $sibling = "0" || $? = 1 ]]
	then
		buddy=${buddy/#1/0}
		list=("${list[@]:0:$pos}" "$buddy" "${list[@]:$(($pos + 1))}")
		return 0
	
	#Zwei Hälften gleicher Größe, die beide frei sind, lassen sich wieder zu einem größeren Block zusammenfassen
	else
		getBuddySize $sibling
		parentSize=`expr $buddySize \* 2`						#Die Größe von newBuddy ist zweifach Größe vom Buddy
		parseInt $id; getParentID $parseIntID; generateID $parentID 		#sucht die ID vom Großbuddy
		newBuddy="0${fullID}${parentSize}"						#Das Prüfbit vom Großbuddy ist 0
		#Das Buddy und sein Geschwister werden beide entfernt und newBuddy wird in die Liste eingefügt
		getIndex $sibling
		posSibling=$?
		if [[ $posSibling -gt $pos ]]
		then
			unset list[$posSibling]
			list=("${list[@]:0:$pos}" "$newBuddy" "${list[@]:$(($pos + 1))}")
		else
			unset list[$pos]
			list=("${list[@]:0:$posSibling}" "$newBuddy" "${list[@]:$(($posSibling + 1))}")
		fi
		#Rekursion mit ID des newBuddy
		getBuddyID $newBuddy; releaseBuddy $buddyID
	fi
}

#Die Main-Funktion:
PS3="$(tput setaf 6)Bitte wählen Sie aus: $(tput sgr0)"
buddyID="0"
buddySize="0"
fullID="0"
parseIntID=0
buddy="0"
parentID=0
sibling="0"
echo "$(tput smul)$(tput bold)$(tput setaf 1)Hallo! Hier ist ein Simulator für Buddy-Speicherverwaltung von Thi Minh Nguyet Nguyen und Yuliya Paulouskaya.$(tput sgr0)"

#Hauptspeichergröße feststellen:
echo -e "$(tput setaf 3)Wie groß ist der Hauptspeicher?\nHinweis: Speicher ist eine Zweierpotenz.$(tput sgr0)"
read memory						#Eingabe der Hauptspeichergröße
echo "$(tput setaf 6)Der Hauptspeicher ist ${memory}kB groß."
memory="00001$memory"

declare -a list=($memory)		#Liste der Buddies erstellen
echo "${list[0]}"
declare -a occupiedList			#Liste, die nur die zugewiesenen Buddies enthält, erstellen

#Das Programm fährt nach der select-Schleife fort bis sich User auswählt, das zu beenden
echo "$(tput setaf 3)Was möchten Sie machen?"
select choice in 'Prozess zuweisen' 'Speicher freigeben' 'Programm beenden'
do
	echo "$(tput setaf 6)Ihre Auswahl war: $choice"
	#Anfang der ersten Auswahl d.h. Zuweisung der Prozessen
	if [ "$choice" = "Prozess zuweisen" ]
	then
		#Prozessgröße eingeben
		echo "$(tput setaf 3)Wie groß ist das Prozess?$(tput sgr0)"
		read processSize
		assignProcess $processSize				#assignProcess Funktionsaufruf
		echo "$(tput bold)$(tput setaf 2)Buddies: ${list[@]}"		#Ausgabe aller Elemente der Buddyliste nach der Zuweisung
		echo "Zugewiesene Prozesse: ${occupiedList[@]}"				#Ausgabe aller Elemente der besetzte Speicherliste nach der Zuweisung
		echo "$(tput smul)$(tput setaf 1)Zuweisung fertig!$(tput sgr0)"
		lLen= #Gib mir die länge der Liste.
		for (( w=0; w<=  )) #gib mir die ganze liste aus.
		echo -e "$(tput setaf 3)Was möchten Sie machen?\n1) Prozess zuweisen\n2) Speicher freigeben\n3) Programm beenden"
	fi		#Beenden der ersten Auswahl

	#Anfang der zweiten Auswahl d.h. Freigabe des Speichers
	if [ "$choice" = "Speicher freigeben" ]
	then
		#Auswahl des Prozess, welcher sich beenden lässt
		echo "$(tput setaf 3)Welcher Prozess lässt sich beenden?"
		select process in ${occupiedList[@]}		#gibt aus, welche Speicherteile besetzt sind
		do
			releaseBuddy $process				#releaseBuddy Funktionsaufruf
			echo "$(tput bold)$(tput setaf 2)Buddies: ${list[@]}"	#Ausgabe aller Elemente der Buddyliste nach der Freigabe
			for i in ${!occupiedList[@]}
			do
				if [[ ${occupiedList[$i]} = $process ]]; then unset occupiedList[$i]; fi
			done
			echo "Zugewiesene Prozesse: ${occupiedList[@]}"			#Ausgabe aller Elemente der besetzte Speicherliste nach der Freigabe
			break
		done
		echo "$(tput smul)$(tput setaf 1)Freigabe fertig!$(tput sgr0)"
		echo -e "$(tput setaf 3)Was möchten Sie machen?\n1) Prozess zuweisen\n2) Speicher freigeben\n3) Programm beenden"
	fi		#Beenden der zweiten Auswahl
      
	#Anfang der dritten Auswahl d.h. Beenden des Programms
	if [ "$choice" = "Programm beenden" ]
	then
		echo "$(tput smul)$(tput bold)$(tput setaf 1)Programm beendet. Tschüss!!$(tput sgr0)"
		break
	fi		#Beenden der dritten Auswahl
done
