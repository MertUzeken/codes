/* Zuordnung von Noten zu Punkten
   Punkte         Note
    0 - 39         5
   40 - 50         4
   51 - 60         3
   61 - 70         2
   71 - 80         1 */

/* 2-3-3-noten-a.c: Notenberechnung */

#include <stdlib.h>
#include <stdio.h>

int main(void)
{
  int punkte;
  /* Eingabeaufforderung fuer die Punktezahl */
  printf("Punktezahl? ");

  /* Eingabe der Punktezahl */
  scanf("%d",&punkte);

  /* Abfrage der Punktebereiche der Noten */
  if (punkte <= 39)
  {
    printf("Note 5\n\n");
  }
  else
  {
    if (punkte <= 50)
    {
      printf("Note 4\n\n");
    }
    else
    {
      if (punkte <= 60)
      {
        printf("Note 3\n\n");
      }
      else
      {
        if (punkte <= 70)
        {
          printf("Note 2\n\n");
        }
        else
        {
          if (punkte <= 80)
          {
            printf("Note 1\n\n");
          }
          else
          {
            printf("Fehler!\n\n");
          }
        }
      }
    }
  }
  
  return 0;
}

