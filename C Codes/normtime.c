#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  char *year = 0;
  char *month = 0;
  char *day = 0;
  char *hour = 0;
  char *min = 0;
  char *sec = 0;
  char *date, *time;

  if (argc < 2) {
    fprintf(stderr,"Eingabeformat: MM/DD/YYY hh:mm:ss \n");
    return 1;
  }

  date = argv[1];

  while (*date++ != '\0') {
    if (*date == '/' && !month) { 
      month = argv[1]; 
      *date = '\0';
      day = ++date;
//      flag = 1;
    }
    if (*date == '/') { 
      *date = '\0';
      year = ++date;
    }
  }    

  printf ("Tag %i - Monat %i - Jahr %i \n",atoi(day),atoi(month),atoi(year));

   int i;    
   time = argv[2];

   for (i = 0; i < strlen(time); ++i) {
     printf("i = %i \n",i);
     if (time[i] == ':') {

     }
   }


}
