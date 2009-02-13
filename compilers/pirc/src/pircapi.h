/*
 * $Id$
 * Copyright (C) 2009, Parrot Foundation.
 */

#ifndef PARROT_PIR_PIRCAPI_H_GUARD
#define PARROT_PIR_PIRCAPI_H_GUARD

#include <stdio.h>

FILE * open_file(char const * const filename, char const * const mode);

void parse_string(PARROT_INTERP, char *pirstring, int flags, int pasminput, unsigned macro_size);

void parse_file(PARROT_INTERP, int flexdebug, FILE *infile, char * const filename, int flags,
                int thr_id, unsigned macro_size, char * const outputfile);



PackFile_ByteCode *pirc_compile_file(PARROT_INTERP, const char *filename, STRING **error_message);

#endif /* PARROT_PIR_PIRCAPI_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
