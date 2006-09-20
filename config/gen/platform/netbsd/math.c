# $Id$

/*
 * math stuff
 */

/*
 * force atan2() to use IEEE behavior
 */

#include <math.h>

_LIB_VERSION_TYPE _LIB_VERSION = _IEEE_;

/*
 * return true if the Numval has a negative sign.
 * This is mostly for handling the -0.0 case.
 *
 * Parrot_signbit is exported because PerlNum.set_number_native() uses it.
 * XXX: This is probably not a good reason.
 */
#if DOUBLE_SIZE == 2 * INT_SIZE
PARROT_API extern int
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

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
