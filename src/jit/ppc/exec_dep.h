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
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void offset_fixup(Parrot_exec_objfile_t *obj);
void Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
        __attribute__nonnull__(2);

void Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
        __attribute__nonnull__(2);

void Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
        __attribute__nonnull__(2);

void Parrot_exec_restart_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_offset_fixup __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_Parrot_exec_cpcf_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_exec_normal_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_exec_normal_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_exec_restart_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/exec_dep.c */

#endif /* PARROT_PPC_EXEC_DEP_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
