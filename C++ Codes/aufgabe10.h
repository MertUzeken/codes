#include <iostream>
#include <vector>



string eingabe;

cout << "Bitte wählen sie einen der folgenden Menü Punkte aus." << endl;
cout << " >> i << " << endl; // Kommt noch W.I.P
cout << " >> s <<  Für die Anzahl der belegten Felder" <<endl;
cout << " >> o << Für die Ausgabe aller belegten Felder " << endl;
cout << " >> d << Löscht das erste Element und verschiebt nachfolgende vor " <<endl;
cout << " >> q << Programm Beenden " << endl;

cin << eingabe;

int arr[9] = {0};
int anzahl;

switch case (eingabe) {

case "i" :  ; //?


case "s" : for (i = 0; i <= 10; i++) {
if (arr[i] > 0) {anzahl = anzahl + 1; cout << "Anzahl der belegten Felder :" << anzahl <<endl;}
};


case "o" : for (i = 0; i <= 10; i++){
if ( arr[i] > 0) {cout << arr[i] << endl;}
};


case "d" : Arr[0] = 0

for (i = 0; i <= 10; i++){ //i = 1 
arr[i] = arr[i+1]          // arr[i-1] = arr[i]
}



; 


case "q" : return 0; /* Fertig */


}