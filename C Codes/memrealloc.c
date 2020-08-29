#include <stdio.h>
#include <stdlib.h> /* Deklaration: void *realloc(void *ptr, site_t size); */
#include <string.h>
#include "stringfun.h"

int main() {
  unsigned int num;
  int *pointer;
  char buffer[80];
  char *info;
  
  puts("Geben Sie einen Text ein und schliessen Sie mit Return ab: \t");
  fgets(buffer,80,stdin);
  buffer[str_len(buffer)-1] = 0; /* Newline muss weg ! */

  if ( (pointer = realloc(NULL,str_len(buffer+1))) != NULL) { /* '\0' muss hinzu ! */
    printf("Speicherallokierung erfolgreich! Startadresse: 0x%x\n", (unsigned int)pointer);
    str_cpy(pointer, buffer); 
    puts(pointer);
  }
  else
    puts("Speicherallokierung hat versagt! \n");

  puts("Geben Sie eine weiter Textzeile ein und schliessen Sie mit Return ab: \t");
  fgets(buffer,80,stdin);
  buffer[str_len(buffer)-1] = 0; /* Newline muss weg ! */

  if ((pointer = realloc(pointer,str_len(buffer+1))) != NULL) { /* '\0' muss hinzu ! */
    printf("Speicherallokierung erfolgreich! Startadresse: 0x%x\n", (unsigned int)pointer);
    str_cat(pointer,buffer);
  }
  else
    puts("Speicherallokierung hat versagt! \n");
 
  puts(pointer);

  return 0;
}
