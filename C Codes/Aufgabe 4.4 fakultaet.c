/* 4-4-fakultaet.c
   Berechnung der Fakultaet einer natuerlichen Zahl <= 20 mittels
   (a) iterativer Funktion
   (b) rekursiver Funktion  */

#include <stdlib.h>
#include <stdio.h>


// #include "Diverses.h"

/* Funktion zur iterativen Berechnung der Fakultaet */
unsigned long long fakultaet_iterativ (int n) {
  unsigned long long erg=1ULL;
  int k;
  
  for (k = 2; k <= n; k++) 
	erg=erg*k;
  return erg;
}

/* Funktion zur rekursiven Berechnung der Fakultaet */
unsigned long long fakultaet_rekursiv (int n) {
  if (n<2) return 1;
  else return n*fakultaet_rekursiv(n-1);
}

/* Hauptprogramm */
int main(void) {
  int r, zahl;   /* Zahl, fuer die die Fakultaet berechnetz werden soll */
  char antwort;  /* Variable fuer die Ablaufsteuerung */
  
  for (;;) {
    printf("\nGib Zahl zur Berechnung der Fakultaet ein!"); 
    printf("\nZulaessiger Bereich ist 0 bis 99, sonst Programmende: ");
    r=scanf("%d",&zahl); /* INCLR */
    if (r<1 || zahl<0 || zahl>99) break;
    printf("Ergebnis iterativ = ");
    printf("%lld",fakultaet_iterativ(zahl));
    printf(" und rekursiv = ");
    //printf("%lld",fakultaet_rekursiv(zahl));
    printf("%lld",fakultaet_rekursiv(zahl)); printf("\n");
    //print_ulonglong(fakultaet_rekursiv(20)); printf("\n");
    //print_ulonglong(fakultaet_rekursiv(21)); printf("\n");
  }
  return 0;
}

