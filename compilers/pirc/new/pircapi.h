/*
 * $Id$
 * Copyright (C) 2009, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRCAPI_H_GUARD
#define PARROT_PIR_PIRCAPI_H_GUARD

#include <stdio.h>

FILE * open_file(char const * const filename, char const * const mode);

void parse_string(PARROT_INTERP, char *pirstring, int flags, int pasminput, unsigned macro_size);

void parse_file(PARROT_INTERP, int flexdebug, FILE *infile, char * const filename, int flags,
                int thr_id, unsigned macro_size, char * const outputfile);

#endif /* PARROT_PIR_PIRCAPI_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
