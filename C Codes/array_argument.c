/* array_arg.c */
#include <stdio.h>
#define MAX 10

int maximum(int *, int);

int main() {
  int i;
  int array[MAX];
 
  for (i = 0; i < MAX; i++) {
    printf("Eingabewert: \t");
    scanf("%d", &array[i]);
  }                             /* array ist Pointer auf array[0] */  
  printf("Maximum: \t%d\n", maximum(array, MAX));                      
}

int maximum(int x[], int y) { /* int *x waere moeglch; aber unverbindlicher */
  int i, max = x[0];

  for (i = 0; i < y; i++) 
    if (x[i] > max) max = x[i];
 
  return max;
}
