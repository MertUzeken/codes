#include <stdio.h>

int charclass(const char);


int main() {
  char string[80];
  int zeichen = 0;
  int leer = 0;
  int sonder = 0;
  char *in;
  int i = 0;
  
  puts("Bitte Zeichen zum Test eingeben : \n");
  gets(string);

//  in = string;
  
  while (string[i] != '\0' && string[i] != '\n') {
    printf("Eingabe Zeichen %c \n",string[i]);
    switch (charclass(string[i])) {
      case 1: zeichen++; break;
      case 2: leer++; break;
      case 3: sonder++; break;
    }
    i++;
  }    
  
  printf("%i, %i, %i \n", zeichen, leer, sonder); 
  
  
  return;
} 

int charclass(const char s) {
  const char *sonder = "!§$%&/()=?`´*+'#-_:.;,><";
  
  if (s >= 'a' && s <= 'z' ) return 1;
  if (s >= 'A' && s <= 'Z' ) return 1;
  if (s == ' ' || s == '\t') return 2;
  if (s >= '0' && s <= '9' ) return 5;
  
  if (s == '"') return 3;
  while (*sonder++ != '\0') 
    if (s == *sonder) return 3;  

  return 0;
}