/* 3-7-zeiger-test.c
   Tests mit Zeigern */

#include <stdlib.h>
#include <stdio.h>

int main(void)
{
  int *ii;
  double f1=1.5, f2=2.5, *ptr_f;
  char *text;

  printf("%lf\n",f1);
  ptr_f = &f1;
  /*ii = ptrf;   /* Warnung beim Compilieren! */
  printf("%p\n",ptr_f);
  
  printf("%f\n",f2);
  f2 = *ptr_f;
  printf("%f\n",f2);

  f2 = 2.5;
  printf("\n\n%p  %lf", ptr_f-1, *(ptr_f-1));
  printf("\n\n%p  %lf", ptr_f, *ptr_f);
  printf("\n\n%p  %lf", ptr_f+1, *(ptr_f+1));
  printf("\n\n%p  %lf", ptr_f+2, *(ptr_f+2));
 
  printf("\n");
}
