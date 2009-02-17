/*
 * $Id$
 * Copyright (C) 2004-2007, Parrot Foundation.
 */

#ifndef PARROT_PLATFORM_GENERIC_MATH_H_GUARD
#define PARROT_PLATFORM_GENERIC_MATH_H_GUARD
/*
 * math related stuff
 */


#ifdef PARROT_HAS_HEADER_MATH
#  include <math.h>
#endif

#ifndef signbit
#  if NUMVAL_SIZE == 8
#    define signbit(x) Parrot_signbit(x)
#  else

#    define signbit(x) Parrot_signbit_l(x)

#  endif

#endif

#define Parrot_is_nzero(x) ((x) == 0.0 && signbit(x))

#endif /* PARROT_PLATFORM_GENERIC_MATH_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
