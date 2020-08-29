/* 4-3-2-test.c
   Test zur Parameteruebergabe by reference */

#include <stdlib.h>
#include <stdio.h>
// #include "Diverses.h"

/* globale Variable */
int i, j;

/* Definition der Funktion */
void add_mult(int zahl) {
  i = i + zahl;
  j = j * zahl;
  return;
}

/* Hauptprogramm */
int main(void) {
  int z=7;
  
  i = 2; j = 2;
  
  printf("Alte Werte:  i=%d  j=%d\n\n",i,j);
  add_mult(z);
  printf("Neue Werte:  i=%d  j=%d\n\n",i,j);

  return 0;
}
