/* array_pointer.c: Arrays in Funktionen werden wie automatische Variablen behandelt */
#include <stdio.h>
#define MAX 5

int maximum(int *,int);       /* Deklaration */

int main() {
  int i, array[MAX];
  int (*fp) (int);             /* Pointer zu einer Funktion */

  for (i = 0; i < MAX; i++) {
    printf("Eingabewert: \t");
    scanf("%d", &array[i]);
  }                             /* array ist Pointer auf array[0] */  
  printf("Maximum: \t%d \n", maximum(array, MAX)); 

  fp = maximum;                /* Adresse der Funktion 'maximum' */
  printf("Speicher-Adresse von 'maximum': %d \n", fp);
  fp = array;
  printf("Speicher-Adresse von 'array': %d \n", fp);
  return 0;
}
int maximum(int x[],int y) { /* int *x waere moeglch; aber unverbindlicher */
  int i, max = x[0];

  for (i = 0; i < y; i++) {
    printf("Wert von x[%d] = %d -- Speicher-Adresse %d\n",i,x[i],(int) &x[i]);
    if (x[i] > max) max = x[i];
  }
  return max;
}
