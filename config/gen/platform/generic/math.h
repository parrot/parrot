/*
 * math related stuff
 */


#ifdef __GNUC__

/* for math.h */
#  define __USE_ISOC9X 1

#  ifdef signbit
#    define Parrot_is_nzero(x) ((x) == 0.0 && signbit(x))
#  else
#    define Parrot_is_nzero(x) ((x) == copysign(0.0, -1.0))
#  endif

#else

/* TODO */

#  define Parrot_is_nzero(x) 0


#endif

#ifdef PARROT_HAS_HEADER_MATH
#  include <math.h>
#endif
