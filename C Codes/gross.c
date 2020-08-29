#include <stdio.h>

int i = 2147483600;
  
int main(void) {

 int j;

 START:
 printf("Zahl j: %i \n\n", j);  
 if ( (j = ++i)  > 0 ) {
   i++;
   printf("Zahl i: %i \n\n", i);  
   goto START;
 }
 else
   printf("Zahl zu gross !\n");
}
