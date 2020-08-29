/* global.c */

#include <stdio.h>

/* Deklarationen */

int k;
int l; 

void func1(void);
void func2(void);

int icount;			/* icount als globale Variable */

int main(void) {
  static int icount;	 	/* icount als lokale Variable */

  printf("main() k: %d -- %u \n", k, (unsigned int)&k);
  printf("main() l: %d -- %u \n", l, (unsigned int)&l);

  for (icount = 0; icount >= -3; icount--)
	/* kein Schleifenkörper */;

  printf("icount in main(): %d -- %u\n", icount,(unsigned int)&icount);

  func1();
  
  return 0;
}

void func1(void) {

  printf("Anfangswert von icount (global): %d\n", icount);
 
  while( icount++ < 5)
	/* kein Schleifenkörper */;
  
  func2();
}

void func2(void) {

  printf("Wert von icount (global): %d\n", icount);
}
