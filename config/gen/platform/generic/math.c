/*
 * math stuff
 */

/*
 * return true if the Numval has a negative sign
 */
int
Parrot_signbit(double x)
{
   union {
       double d;
       int i[2];
   } u;
   u.d = x;
   return u.i[1] < 0;
}

#if NUMVAL_SIZE == 12
int
Parrot_signbit_l(long double x)
{
   union {
       long double d;
       int i[3];
   } u;
   u.d = x;
   return u.i[2] < 0;
}
#endif
