/*
 * math related stuff
 */


#ifdef PARROT_HAS_HEADER_MATH
#  include <math.h>
#endif

#  ifndef signbit
#    if NUMVAL_SIZE == 8
#      define signbit(x) Parrot_signbit(x)
#    else

#      define signbit(x) Parrot_signbit_l(x)

#    endif

#
#  endif

#define Parrot_is_nzero(x) ((x) == 0.0 && signbit(x))
