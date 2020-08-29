#include <stdio.h>

/* Deklaration */

int addition(int,int);

float division(float,float);

/* Hauptprogramm */

int main(void) {
  int a, b, summe;
  float c, d, quotient;
  char s, t;
 
  printf("Addition zweier ganzer Zahlen: \n");
  printf("Erste Zahl: \t");
  scanf("%d",&a);
  printf("Zweite Zahl: \t");
  scanf("%d",&b);

  summe = addition(a,b);
  printf("Ergebnis:\t %d \n\n", summe);

  printf("Division zweier Gleitkomma-Zahlen: \n");
  printf("Erste Zahl: \t");
  scanf("%f",&c);
  printf("Zweite Zahl: \t");
  scanf("%f",&d);

  quotient = division(c,d);
  printf("Ergebnis:\t%f \n", quotient);

  return;
}

/* Definitionen */

int addition(int a,int b) {
  int c;

  c = a + b;
  return c;
}

float division(float a,float b) {
  float q;

  if (b != 0.0) 
    q = a / b;
  else
    q = 0.0;
  return q;
}