/*
 * math related stuff
 */


#ifdef __GNUC__

#  define __USE_ISOC9X 1
/* for math.h */

#  define Parrot_is_nzero(x) ((x) == 0.0 && signbit(x))

#else

/* TODO */

#  define Parrot_is_nzero(x) 0


#endif

#ifdef PARROT_HAS_HEADER_MATH
#  include <math.h>
#endif
