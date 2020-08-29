#include <stdlib.h> 
#include <stdio.h> 
#include <string.h>

int main( void ) {
  int c;
  char s[100]; 
  int i, j;

  printf("Zeichenkette eingeben? "); 
  scanf("%s",s);
  printf("\nUrspruengliche Zeichenkette : %s\n",s);

  for (i = 0, j = strlen(s)-1; i < j; i++, j--) {
    while (i) {
      printf("Der Charakter for %d ist %c \n",i,s[i]);
    };
       c = s[i];
    s[i] = s[j];
    s[j] = c;
  }

  printf("\nGespiegelte Zeichenkette : %s\n",s);
  return 0;
}
