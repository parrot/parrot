/* Copyright (C) 2003-2008, Parrot Foundation. */

/*
 * exec_dep.h
 *
 * SVN Info
 *    $Id$
 * Overview:
 *    ARM dependent functions to emit an executable.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.8.12
 * Notes:
 * References:
 */

#include "jit.h"
#include "jit_emit.h"

#ifndef PARROT_ARM_EXEC_DEP_H_GUARD
#define PARROT_ARM_EXEC_DEP_H_GUARD

/* HEADERIZER BEGIN: src/exec_dep.c */

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

void
Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

void
Parrot_exec_restart_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

/* Assign the offset of the program_code */
void
offset_fixup(Parrot_exec_objfile_t *obj);

/* HEADERIZER END: src/exec_dep.c */

#endif /* PARROT_ARM_EXEC_DEP_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
