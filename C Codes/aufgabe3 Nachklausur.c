#include <stdio.h>
#include <stdlib.h>

struct time {
  int  hour;
  int min;
  float sec;
  int since; /* millisecs */
};
  

int main(const int argc, const char **argv) 
{
  struct time reftime;
  struct time newtime;
   
  puts("Angabe der Referzenzeit (hh:mm:ss.mmm): \n");
  scanf("%d:%d:%f",&reftime.hour,&reftime.min,&reftime.sec);

  reftime.since = reftime.hour*3600. + reftime.min+60. + reftime.sec;

//  printf("ref: %d \n",reftime.since);

  puts("Angabe der Vergleichszeit (hh:mm:ss.mmm): \n");
  scanf("%d:%d:%f",&newtime.hour,&newtime.min,&newtime.sec);

  newtime.since = newtime.hour*3600. + newtime.min+60. + newtime.sec;

  /* keine extra punkte */

  printf("Die Differenz der Zeitangaben betraegt %d Millisekunden; also %d Stunden, %d Minuten und %.3f Sekunden \n",
    newtime.since - reftime.since, newtime.hour - reftime.hour, newtime.min - reftime.min, newtime.sec - reftime.sec);     
  return 0;
}
