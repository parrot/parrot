/*
 * Copyright (C) 2007, The Perl Foundation
 * $Id$
 */

#if !defined(PARROT_IMCC_H_GUARD)
#define PARROT_IMCC_H_GUARD

int imcc_initialize(Interp *interp);
char * parseflags(Interp *interp, int *argc, char **argv[]);
int imcc_run(Interp *interp, const char *sourcefile, int argc, char * argv[]);

#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
