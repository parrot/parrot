/*
 * $Id$
 * Copyright (C) 2009, Parrot Foundation.
 */

#ifndef PARROT_PLATFORM_GENERIC_PLATFORM_LIMITS_GUARD
#define PARROT_PLATFORM_GENERIC_PLATFORM_LIMITS_GUARD

/*
 * Define the values for PARROT_INTVAL_MAX and PARROT_INTVAL_MIN
 * in platforms that does no have limits.h or gives wrong values.
 * The generic versions assumes limits.h availability.
 */

/* LLONG_MAX doesn't appear to be provided for some compilers of Win64, so
   try to define them here. */
#include "parrot/has_header.h"
#if PARROT_HAS_HEADER_LIMITS
#  include <limits.h>
#endif

#ifdef _MSC_VER
#  ifndef LLONG_MAX
#    define LLONG_MAX _I64_MAX
#  endif
#  ifndef LLONG_MIN
#    define LLONG_MIN _I64_MIN
#  endif
#endif

#endif /* PARROT_PLATFORM_GENERIC_PLATFORM_LIMITS_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
