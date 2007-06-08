/*
 * Copyright (C) 2007, The Perl Foundation
 * $Id$
 */

#pragma once
#ifndef PARROT_IMCC_H_GUARD
#define PARROT_IMCC_H_GUARD

PARROT_API int imcc_initialize(Interp *interp);
PARROT_API char * parseflags(Interp *interp, int *argc, char **argv[]);
PARROT_API int imcc_run(Interp *interp, const char *sourcefile, int argc, char * argv[]);

#endif /* PARROT_IMCC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
