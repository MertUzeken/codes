#include <stdio.h>
#include <stdlib.h> /* Deklaration: void *calloc(size_t num, size_t size); */
#include <string.h>

int main() {
  unsigned int num;
  int *pointer;
  
  puts("Fuer wie viele 'int' Werte ist Platz zu schaffen ? Eingabe: \t");
  scanf("%d", &num);
  
  if ((pointer = (int *)calloc(num, sizeof(int))) != NULL)
    printf("Speicherallokierung erfolgreich! Startadresse: 0x%x\n", (unsigned int)pointer);
  else
    puts("Speicherallokierung hat versagt! \n");
  
  return 0;
}
