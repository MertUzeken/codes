#include <stdio.h>
#include <stdlib.h>

#define CRLF '\n'  /* Windows: CRLF '\r\n' */

int main(void) {
  char filename[128]; 
  FILE *file;
  char *ptr_filename;
  ptr_filename = filename;

/* Einlesen des Dateinamens mit scanf */
  
  printf("\nErster Versuch: Bitte Dateiname eingeben: \n");
//  scanf("%s",filename);           /* Leerzeichen bei scanf nach " hilft! */  
  printf("(1.) Dateiname ist: %s \n",filename); 
  if ((file = fopen(filename, "r")) == NULL)
    fprintf(stderr,"Kann Datei %s nicht oeffnen\n!",filename);
  else 
    printf("(1.) Datei %s erfolgreich geoeffnet!\n",filename);

/* Einlesen des Dateinamens mit getchar() */

  printf("\nZweiter Versuch: Bitte Dateiname eingeben: \n");
  while ((*ptr_filename = getchar()) != CRLF)  /* sicheres Verfahren */
    ptr_filename++;
  *ptr_filename = '\0';
  
  printf("(2.) Dateiname ist: %s \n",filename); 
  if ((file = fopen(filename, "r")) == NULL)
    fprintf(stderr,"Kann Datei %s nicht oeffnen!\n",filename);
  else 
    printf("(2.) Datei %s erfolgreich geoeffnet!\n",filename);
     
/* Einlesen des Dateinamens mit gets */

  printf("\nDritter Versuch: Bitte Dateiname erneut eingeben: \n"); 
  gets(filename);                                 /* Fehler beim Aufruf ! */
  printf("(3.) Dateiname ist: %s \n",filename); 

  if ((file = fopen(filename, "r")) == NULL)
    fprintf(stderr,"Kann Datei %s nicht oeffnen!\n",filename);
  else 
    printf("(3.) Datei %s erfolgreich geoeffnet!\n",filename);
    
  return 0;
}
