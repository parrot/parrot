/*
 * $Id$
 * Copyright (C) 2004-2008, Parrot Foundation.
 */

#ifndef PARROT_PLATFORM_WIN32_STAT_H_GUARD
#define PARROT_PLATFORM_WIN32_STAT_H_GUARD

#ifndef S_IFMT
#  ifdef _S_IFMT
#    define S_IFMT _S_IFMT
#  else
#    define S_IFMT 0170000
#  endif
#endif

#ifndef S_IFBLK
#  define S_IFBLK 0060000
#endif

#ifndef S_ISBLK
#  define S_ISBLK(m) (((m) & S_IFMT) == S_IFBLK)
#endif

#ifndef S_ISCHR
#  define S_ISCHR(m) (((m) & S_IFMT) == S_IFCHR)
#endif

#ifndef S_ISDIR
#  define S_ISDIR(m) (((m) & S_IFMT) == S_IFDIR)
#endif

#ifndef S_ISREG
#  define S_ISREG(m) (((m) & S_IFMT) == S_IFREG)
#endif

#endif /* PARROT_PLATFORM_WIN32_STAT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
