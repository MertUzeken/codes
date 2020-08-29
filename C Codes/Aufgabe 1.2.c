/* aufg1-2.c */
/* Berechnung des Volumens eines Zylinders */

#include <stdlib.h>
#include <stdio.h>
#include "mathkonst.h"
/*#define M_PI 3.14159265358979323846 */

int main(void)
{
  const float pi=M_PI;
  float volumen, radius, hoehe;

  printf("Berechnung des Volumens eines Zylinders:\n");
  printf("Radius ? "); scanf("%f",&radius);
  printf("Hoehe ?  "); scanf("%f",&hoehe);
  
  /* Berechnung */
  volumen=radius*radius*hoehe*pi;

  /* Ausgabe des Ergebnisses */
  printf("Volumen = %.6f\n",volumen);
//  system("pause");
}
