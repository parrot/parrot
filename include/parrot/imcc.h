/*
 * Copyright (C) 2007-2010, Parrot Foundation.
 * $Id$
 */

#ifndef PARROT_IMCC_H_GUARD
#define PARROT_IMCC_H_GUARD

PARROT_EXPORT void imcc_start_handling_flags(PARROT_INTERP);
PARROT_EXPORT int imcc_handle_flag(PARROT_INTERP, struct longopt_opt_info *opt, Parrot_Run_core_t *core);
PARROT_EXPORT int imcc_run(PARROT_INTERP, const char *sourcefile, int argc, const char **argv);

#endif /* PARROT_IMCC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
