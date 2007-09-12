/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

#ifndef PARROT_PLATFORM_WIN32_STRING_H_GUARD
#define PARROT_PLATFORM_WIN32_STRING_H_GUARD

#include <string.h>

#ifdef _MSC_VER
#  if _MSC_VER >= 1400
#    define strdup _strdup
#  endif
#endif

#endif /* PARROT_PLATFORM_WIN32_STRING_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
