#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define SIZE 100

float stdev(float mean, float sxin, int n) 
{
  float std = 0;
  float var;

  var = sxin - n*mean*mean;
  std = sqrt(var/(n-1));

  return std;
}

int main(int argv, char **argc) 
{
  float x[SIZE];
  float x2[SIZE];
  float input;
  float mean;
  float sum;
  float sum2;
  int i;

  puts("Eingabe der Input Werte:\n");
  for (i = 0; i < SIZE; i++) {
   scanf("%f",&input);
   if (input == -1.) break;
   x[i] = input;
   x2[i] = input*input;
   sum += input;
   sum2 += x2[i];
  }

  mean=sum/i;
  printf("Mean %f +- %f (%d) \n",mean,stdev(mean,sum2,i),i);

  exit(0);
}
