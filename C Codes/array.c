/* array.c */
#include <stdio.h>

int main () {

/* Deklarationen */
  int i;
/* Deklaration, Definition und Initialisierung */
  const int n = 3;
  float array[n] = {1.1, 10.7, -0.8};

  for (i = 0; i < n; i++)
    printf("Array Element von 'array[%i]' = %f\n",i,array[i]);
  
  return 0;
}