#include <stdio.h>
#include <stdlib.h>

#define CRLF '\n' 
#define EOL '\0'

int main(const int argc, const char **argv) 
{
  FILE *fp;
  const char *filename;
  const char *filemode = "r"; 
  char ch;
  int i;
  int counter[16] = {0};
  char xchars[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};

  if (argc <= 1) {
    fprintf(stderr,"Please provide file name !\n");
    return -1;
  }
  filename = argv[1];
  
  if ((fp = fopen(filename, filemode)) != NULL) {
    printf("Open file %s \n", filename);
 
    while (((ch = fgetc(fp)) != EOF))
	  	switch(ch) {
		  	case '0': counter[0]++; break;
			  case '1': counter[1]++; break;
			  case '2': counter[2]++; break;
			  case '3': counter[3]++; break;
			  case '4': counter[4]++; break;
			  case '5': counter[5]++; break;
			  case '6': counter[6]++; break;
			  case '7': counter[7]++; break;
			  case '8': counter[8]++; break;
			  case '9': counter[9]++; break;
			  case 'a': counter[10]++; break;
			  case 'b': counter[11]++; break;
			  case 'c': counter[12]++; break;
			  case 'd': counter[13]++; break;
			  case 'e': counter[14]++; break;
			  case 'f': counter[15]++; break;
			  default: break;
      }
    fclose(fp); 
	
  	for (i = 0; i < 16; i++)
	    printf("Frequency of '%c': %d  \n",xchars[i],counter[i]);
 } else
  printf("Can't open file %s \n",filename);
	

  return 0;
}
