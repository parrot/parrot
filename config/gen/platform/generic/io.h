/*
 * $Id$
 * Copyright (C) 2004-2008, The Perl Foundation.
 */

#ifndef PARROT_PLATFORM_GENERIC_IO_H_GUARD
#define PARROT_PLATFORM_GENERIC_IO_H_GUARD
/*
 * I/O:
 */

#define DEFAULT_OPEN_MODE S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
#ifndef S_ISREG
#  define S_ISREG(m) (((m) & S_IFMT) == S_IFREG)
#endif

#endif /* PARROT_PLATFORM_GENERIC_IO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
