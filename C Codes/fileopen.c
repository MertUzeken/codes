#include <stdio.h>
#include <stdlib.h>

int main(const int argc, const char **argv) {
  FILE *fp;
  const char *filename;
  const char *mode;
  
  if (argc <= 2) { 
    printf("Bitte Dateiname und Modus eingeben! \n");
    return -1;
  }
  filename = argv[1];
  mode = argv[2];
    
  printf("Oeffne Datei %s mit Modus %s\n", filename, mode);
  
  if ((fp = fopen(filename, mode)) != NULL) {
    printf("Datei %s erfolreich geoeffnet !\n", filename);
    printf("File pointer ist: %o \n", (int)fp);
  }
  else
    fprintf(stderr,"Konnte Datei %s im Mode %s nicht oeffnen \n", filename, mode);
    
  fclose(fp);  /* Schliesse Datei */
     
  return 0;
}
