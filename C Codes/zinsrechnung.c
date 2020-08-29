/** Programm zur Berechnung der Zinsen auf eingesetztes Kapital                
    Author:  Erwin Hoffmann                                                 
    Version: 1.3 (8.10.2012)                                                   
    Input:   Kapital, Verzinsungszeit in Tage, Zinsatz in Prozent              
    Output:  Kapital am Ende (ohne Banken-Crash)                    **/
#include <stdlib.h> 
#include <stdio.h>

float kapital, zinssatz, zinsen; 
int anz_tage;
const int umrechnung = 100*365;

float zinsberechnung()     				/* Zinsberechnung */
{
  return kapital*zinssatz*anz_tage/umrechnung;
}

int main(void) 
{
  printf("Zu verzinsendes Kapital in Euro? ");  	/* Eingaben */
  scanf("%f",&kapital);
  printf("Anzahl der Tage? "); 
  scanf("%d",&anz_tage);
  printf("Zinssatz in Prozent? "); 
  scanf("%f",&zinssatz);

  zinsen = zinsberechnung(kapital,zinssatz,anz_tage);   		

  printf("\nAnfallende Zinsen: %f Euro\n\n",zinsen);	 
}
