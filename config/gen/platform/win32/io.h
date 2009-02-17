/*
 * $Id$
 * Copyright (C) 2004-2008, Parrot Foundation.
 */

#ifndef PARROT_PLATFORM_WIN32_IO_H_GUARD
#define PARROT_PLATFORM_WIN32_IO_H_GUARD

#define DEFAULT_OPEN_MODE 0

typedef void* Parrot_WIN32_HANDLE;
typedef HUGEINTVAL Parrot_OFF_T;

#ifndef S_ISREG
#  define S_ISREG(m) (((m) & S_IFMT) == S_IFREG)
#endif

#endif /* PARROT_PLATFORM_WIN32_IO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
