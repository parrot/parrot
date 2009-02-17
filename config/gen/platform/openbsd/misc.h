/*
 * $Id$
 * Copyright (C) 2004-2007, Parrot Foundation.
 */

#ifndef PARROT_PLATFORM_OPENBSD_MISC_H_GUARD
#define PARROT_PLATFORM_OPENBSD_MISC_H_GUARD
/*
** Miscellaneous:
*/

#include <sys/exec.h>

#ifdef NATIVE_EXEC_ELF
#  define PARROT_OPENBSD_ELF
#endif

#endif /* PARROT_PLATFORM_OPENBSD_MISC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
