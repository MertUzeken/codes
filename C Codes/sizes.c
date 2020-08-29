#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){
  char *test_char_ptr = "This is just a test";
  int *test_int_ptr = (int *) malloc(16*sizeof(int));
  int i;

  for (i = 0; i<16; i++)
    test_int_ptr[i] = i;

  printf("%s\n",test_char_ptr);
  printf("Pointerlaenge von char: \t %d Byte\n", (int)sizeof test_char_ptr );
  printf("Groesse der char Variablen: \t %d Byte \n", (int)sizeof *test_char_ptr );
  printf("Pointergroesse von int: \t %d Byte\n", (int)sizeof test_int_ptr );
  printf("Groesse eines int Wertes: \t %d Byte\n", (int)sizeof *test_int_ptr );

  return 0;
}
