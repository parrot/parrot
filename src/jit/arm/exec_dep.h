/* Copyright (C) 2003-2008, The Perl Foundation. */

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

#ifndef PARROT_ARM_EXEC_DEP_H_GUARD
#define PARROT_ARM_EXEC_DEP_H_GUARD

#ifdef JIT_CGP

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

#else /* JIT_CGP */

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

#endif /* JIT_CGP */

void
Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

void
Parrot_exec_restart_op(Parrot_jit_info_t *jit_info, PARROT_INTERP);

/* Assign the offset of the program_code */
static void
offset_fixup(Parrot_exec_objfile_t *obj);

#endif /* PARROT_ARM_EXEC_DEP_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
