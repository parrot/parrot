/*
 * math stuff
 */

/*
 * return true if the Numval has a negative sign
 */
#if DOUBLE_SIZE == 2 * INT_SIZE
int
Parrot_signbit(double x)
{
   union {
       double d;
       int i[2];
   } u;
   u.d = x;
#if PARROT_BIGENDIAN
   return u.i[0] < 0;
#else
   return u.i[1] < 0;
#endif
}
#endif

#if NUMVAL_SIZE == 12 && DOUBLE_SIZE == 3 * INT_SIZE && PARROT_LITTLE_ENDIAN
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
