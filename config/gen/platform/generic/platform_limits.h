/*
 * $Id$
 * Copyright (C) 2008, Parrot Foundation.
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
#ifdef _MSC_VER
#  ifndef LLONG_MAX
#    ifdef _I64_MAX
#      define LLONG_MAX _I64_MAX
#    endif
#  endif
#  ifndef LLONG_MIN
#    ifdef _I64_MIN
#      define LLONG_MIN _I64_MIN
#    endif
#  endif
#endif

#endif /* PARROT_PLATFORM_GENERIC_PLATFORM_LIMITS_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
