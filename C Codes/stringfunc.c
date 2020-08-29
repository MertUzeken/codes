/* Gib Element-Nr des Buchstaben im Array *s, 
   wo als erster Zeichen c steht           
   NULL falls Zeichen nicht vorhanden */
    
int str_chr(s,c) 
const char *s;
char c; 
{
 int i = 0;

  while ( (*s++ != c) != '\0')
    i++;
    
  return ++i;
}

/* String-Laenge */

int str_len(s) 
const char *s;
{
  int i = 0;
  
  while (*s++ != '\0')
    i++;
    
  return i;
}

/* Gib Element-Nr des Buchstaben im Array *s, 
   wo Zeichen c als letztes steht           
   NULL falls Zeichen nicht vorhanden */


int str_rchr(s,c) 
const char *s;
char c; 
{
  int i; 
  
  for (i = str_len(s)-1; i > 0; i--)
     if (s[i] == c) return ++i;
    
  return 0;
}

/* Fuegt string *s an *t an */

char *str_cat(char *t, const char *s)
{
  int i,j;
  for (i = 0; t[i] != '\0'; i++)
    ;
  for (j = 0; s[j] != '\0'; j++)
    t[i+j] = s[j];
    
  t[i+j] = '\0';
   
  return t;
}
