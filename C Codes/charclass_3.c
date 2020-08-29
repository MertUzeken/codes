#include <stdio.h>
int charclass(const char);          /* Prototyp */

int main() {
  char string[80];
  int i = 0;
  int zeichen, sonder, leer;        /* Platz sparen fuer Ausgabe */
  zeichen = sonder = leer = 0;

  puts("Bitte Zeichen zum Test eingeben : \n");
  gets(string);
  
  printf("Eingebene Zeichenkette lautet %s \n",string);

  while (string[i] != '\0' && i <= 80) { 
    switch (charclass(string[i])) {
      case 1: case 2: zeichen++; break;
      case 4: leer++; break;
      case 5: sonder++; break;
    }
    i++;
  }
  printf("%i, %i, %i \n", zeichen, leer, sonder); 
  return 0;
} 

int charclass(const char s) {
  const char *sonder = "!%&/()=?*+'#-_:.;,><";  /* Zeichen werden nicht veraendert */
  
  if (s >= 'a' && s <= 'z' ) return 1;
  if (s >= 'A' && s <= 'Z' ) return 2;
  if (s >= '0' && s <= '9' ) return 3;
  if (s == ' ' || s == '\t') return 4;
 
  if (s == '"') return 5;
  while (*sonder++ != '\0')       /* { } koennen entfallen */
    if (s == *sonder) return 5;  
  return 0; }