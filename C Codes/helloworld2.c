#include <stdio.h>

int main(void) {

  int i;
  float k;
  int *j;
  
  printf("Hello World ! %f \n", k);

  for (i = 0; i < 10; i++) {
    j = &i;
    printf("Eine Zahl: %i -- %i --%i  \n", i,(int)&i,(int)*j);
  }

  return 0;
}
