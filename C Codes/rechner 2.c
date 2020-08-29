#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
 int i;
 int j;

 #define MINARG 4
 
  if (argc < MINARG) {
    printf("Anzahl der Argumente muss mindestens betragen: %i\n",MINARG-1);
    return -1;
  }

  i = atoi(argv[2]);
  j = atoi(argv[3]);


  switch ((int)*argv[1]) {
   case '+': printf(" = %i\n",i+j); break;
   case '-': printf(" = %i\n",i-j); break;
   case '*': printf(" = %i\n",i*j); break;
   case '/': printf(" = %i\n",i/j); break;
   default: printf("Bitte Operation spezifizieren: '+-*/' \n");
  }
  
return 0; }
