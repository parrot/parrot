#include <stdio.h>


int main()
{
  int I1 = 1;
  int I2 = 50000;
  int I3;
  int I4;
  int I5;
  int I6 = 0;
  int I7;
  printf("N primes up to ");
  printf("%d", I2);
  printf(" is: ");

 REDO:
  I3 = 2;
  I4 = I1 / 2;
 LOOP:
  I5 = I1 % I3;
  if (I5) {goto OK;}
  goto NEXT;
 OK:
  I3++;
  if (I3 <= I4) {goto LOOP;}
    I6++;
    I7 = I1;
 NEXT:
  I1++;
  if (I1 <= I2) {goto REDO;}
  printf("%d\n", I6);
  printf("last is: %d\n", I7);
}
