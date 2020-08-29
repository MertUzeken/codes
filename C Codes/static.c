/* static.c */

#include <stdio.h>

void func1(void);

int main(void) {

 int icount = 0;

 while (icount++ <= 3)
   func1(); 		/* func1() wird 4x aufgerufen */

 return 0;
}

 void func1(void) {

 /* iTemp wird nur beim 1. Aufruf von func1()
  * mit dem Wert 1 initialisiert! Bei allen
  * folgenden Aufrufen wird hier keine
  * Zuweisung vorgenommen!
  */
  static int itemp = 1;

  printf("Wert von iTemp beim %d. Aufruf: %d\n", itemp, itemp);
  itemp++;
  
  return 0;
}
