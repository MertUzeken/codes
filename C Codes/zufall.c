#include <stdio.h>

unsigned long int next = 1;
  
int rand(void) {    /* Berechne Zufallszahl zwischen 1 .... 32767 */
   
  next = next * 1103515245 + 12345;
  return (unsigned int)(next/65536) % 32768;  
}
int main(void) {

 int i;

 for (i=0; i< 49; i++) 
   printf("Zufallszahl: %i \n\n", rand());  
}
