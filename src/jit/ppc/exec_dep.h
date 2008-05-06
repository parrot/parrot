/* Copyright (C) 2003-2008, The Perl Foundation.  */

/*
 * exec_dep.h
 *
 * SVN Info
 *    $Id$
 * Overview:
 *    PPC dependent functions to emit an executable.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#include "jit.h"
#include "jit_emit.h"

#ifndef PARROT_PPC_EXEC_DEP_H_GUARD
#define PARROT_PPC_EXEC_DEP_H_GUARD

/* HEADERIZER BEGIN: src/exec_dep.c */

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

void
Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

void
Parrot_exec_restart_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

void
offset_fixup(Parrot_exec_objfile_t *obj);

/* HEADERIZER END: src/exec_dep.c */

#endif /* PARROT_PPC_EXEC_DEP_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
